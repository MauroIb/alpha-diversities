## Alpha Diversity Analysis

This repository contains the raw data necesary used for the analysis of different alpha diversity metrics.

### Sample processing

All sample processing was done using QIIME2 https://qiime2.org/ on an anaconda virtual enviroment. Follow the instalation tutorial on their website to get started.
Each dataset was downloaded from the SRA using sra-tools https://github.com/ncbi/sra-tools. Raw sample data is not shared through this repository due to their size, however the accession numbers are available within each dataset's folder (./datasets/xx_dataset_alias/SraRunTable.txt or similar)

Each dataset was processed following QIIME2's best practices. An example of the commands used can be found the /pipeline_scripts directory.

### Alpha diversity data and visualization

All alpha diversity metrics were caluclated using QIIME2's diversity module. All metrics for each dataset were aggreted on a table called datasets/dataset-name/alpha-out_dataset-name.tsv. This data was later combined with each dataset's metadata.

The alpha diversity metrics for all samples and their metadata were later combined as alpha_aggregated.tsv.

Exploration of data and vizualizations were carried out on different jupyter notebooks. Package requirements are on requirements.txt.
