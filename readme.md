## Alpha Diversity Analysis

This repository contains the raw data necesary used for the analysis of different alpha diversity metrics.

### Sample processing

All sample processing was done using QIIME2 https://qiime2.org/ on an anaconda virtual enviroment. 
Each dataset was downloaded from the SRA using sra-tools https://github.com/ncbi/sra-tools. Raw sample data is not shared through this repository due to their size, however the accession numbers are available within each dataset's folder (./datasets/xx_dataset_alias/SraRunTable.txt or similar)

Each dataset was processed following QIIME2's best practices. All the commands used for sample processing can be found the /pipeline_scripts directory.

### Alpha diversity data and visualization

All alpha diversity metrics were caluclated using QIIME2's diversity module. All metrics for each dataset were aggreted on a table called datasets/dataset-name/alpha-out_dataset-name.tsv. This data was later combined with each dataset's metadata.

The alpha diversity metrics for all samples and their metadata were later combined as alpha_aggregated.tsv.

Exploration of data and vizualizations were carried out on different jupyter notebooks. Package requirements are on requirements.txt.

To run the notebooks you can perform the following steps:
    Build a python virtual enviroment
    > python -m venv venv/

    Activate the python virtual enviroment
    > source venv/bin/activate

    Install requirments
    > pip install -r requirements.txt

    Select your virtual enviroment as your kernel for the notebooks and run each cell in sequential order.


These steps may vary depending on your platform, check https://docs.python.org/es/3/library/venv.html for more information