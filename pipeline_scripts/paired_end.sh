#!/bin/bash

### Single end
qiime demux summarize \
--i-data paired_end_demux.qza \
--o-visualization demux.qzv


### DEBLUR 
qiime quality-filter q-score \
 --i-demux paired_end_demux.qza \
 --o-filtered-sequences demux-filtered.qza \
 --o-filter-stats demux-filter-stats.qza

qiime metadata tabulate \
  --m-input-file demux-filter-stats.qza \
  --o-visualization demux-filter-stats.qzv
  
qiime deblur denoise-16S \
 --i-demultiplexed-seqs demux-filtered.qza \
 --p-left-trim-len 20 \
 --p-trim-length 120 \
 --p-jobs-to-start 8 \
 --o-representative-sequences rep-seqs.qza \
 --o-table table.qza \
 --p-sample-stats \
 --o-stats deblur-stats.qza 
 
qiime deblur visualize-stats \
  --i-deblur-stats deblur-stats.qza \
  --o-visualization deblur-stats.qzv

qiime feature-table summarize \
  --i-table table.qza \
  --o-visualization table.qzv 

## MEtadata

qiime tools export \
  --input-path table.qzv \
  --output-path table
  
qiime feature-table tabulate-seqs \
  --i-data rep-seqs.qza \
  --o-visualization rep-seqs.qzv

mv ./table/*.png ../
mv ./table/sample-frequency-detail.csv ./
mv ./table/feature-frequency-detail.csv ./
rm -rf table

#Taxonomia

qiime feature-classifier classify-consensus-vsearch \
--i-query rep-seqs.qza \
--i-reference-reads /media/mauro/WorkENV/Tesis/silva/silva-138-99-seqs.qza \
--i-reference-taxonomy /media/mauro/WorkENV/Tesis/silva/silva-138-99-tax.qza \
--o-classification taxonomy.qza \
--p-threads 8
  
qiime taxa barplot \
  --i-table table.qza \
  --i-taxonomy taxonomy.qza \
  --m-metadata-file ../sample-metadata.tsv \
  --o-visualization taxa-bar-plots.qzv
 
qiime tools export \
  --input-path taxa-bar-plots.qzv \
  --output-path taxa-bar-plots

qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences rep-seqs.qza \
  --o-alignment aligned-rep-seqs.qza \
  --o-masked-alignment masked-aligned-rep-seqs.qza \
  --o-tree unrooted-tree.qza \
  --o-rooted-tree rooted-tree.qza

qiime diversity alpha-phylogenetic \
  --i-table table.qza \
  --i-phylogeny rooted-tree.qza \
  --p-metric faith_pd \
  --o-alpha-diversity faith_pd_vector.qza  

cp ../../../herramientas/* ../
cd ..
bash alpha.sh


