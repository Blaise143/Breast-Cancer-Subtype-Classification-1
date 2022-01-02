# Breast-Cancer-Subtype-Classification

This repo is built to classify TCGA (The Cancer Genome Atlas) breast cancer subtypes using machine learning approaches.

## Data

The TCGA breast cancer expression data can be downloaded using this command:

```shell
curl https://gdc-hub.s3.us-east-1.amazonaws.com/download/TCGA-BRCA.htseq_fpkm.tsv.gz --output TCGA-BRCA.htseq_fpkm.tsv.gz
```

On Linux and macOS, the gz file can be decompressed using gzip:

```shell
gzip -d TCGA-BRCA.htseq_fpkm.tsv.gz
```

Unit of this data set is log2(fpkm+1). For more information about this data, you can refer to: https://xenabrowser.net/datapages/?dataset=TCGA-BRCA.htseq_fpkm.tsv&host=https%3A%2F%2Fgdc.xenahubs.net&removeHub=https%3A%2F%2Fxena.treehouse.gi.ucsc.edu%3A443

The subtype information for this breast cancer cohort can be downloaded from:
https://www.cbioportal.org/study/clinicalData?id=brca_tcga_pan_can_atlas_2018

The filtered clinical data downloaded from above can be found in the data folder.
