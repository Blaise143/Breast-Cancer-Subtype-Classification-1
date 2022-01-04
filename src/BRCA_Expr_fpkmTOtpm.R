# In this script the units of the expression file is changed from FPKM to TPM to allow cross sample comparisons

# Read input file
expr_br <- read.delim('../data/TCGA-BRCA.htseq_fpkm.tsv', header = T, sep = '\t', check.names = F, stringsAsFactors = F)

# Assign gene ids to row names
row.names(expr_br) <- expr_br$Ensembl_ID

# Remove the gene ids column
expr_br <- expr_br[,-1]

# Check if all columns are numeric
col_is_num <- unlist(lapply(expr_br, is.numeric))
print("Number of non-numeric columns:")
print(length(col_is_num[col_is_num == FALSE]))

# Since all the columns are numeric can move to next steps!

# Convert the dataframe to matrix
expr_br_mat <- as.matrix(expr_br)

# Convert log2(fpkm + 1) to fpkm
expr_br_fpkm <- (2**expr_br_mat) - 1

# Convert fpkm to tpm (based the formula in https://haroldpimentel.wordpress.com/2014/05/08/what-the-fpkm-a-review-rna-seq-expression-units/)
fpkmToTpmFunc <- function(clmn){
  clmn_sum <- sum(clmn)
  clmn_tpm <- (clmn/clmn_sum) * 10e6
}

expr_br_tpm <- apply(expr_br_fpkm, 2, fpkmToTpmFunc)

# Add the gene id column back at the beginning of the dataframe
expr_br_tpm <- cbind(Ensembl_ID = row.names(expr_br_tpm), expr_br_tpm)

# Write the tpm matrix in data directory
write.table(expr_br_tpm, file = "../data/TCGA_BRCA_tpm.tsv", quote = F, sep = "\t", row.names = F, col.names = T)
