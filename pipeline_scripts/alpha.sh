#!/bin/bash
mkdir ./qiime/alphas

#calculate alphas
METRICS=('shannon' 'ace' 'chao1' 'dominance' 'fisher_alpha' 'gini_index'\
 'observed_features' 'osd' 'singles' 'pielou_e' 'simpson' 'strong' 'margalef' 'mcintosh_d')
 
METRICS2=('ace' 'berger_parker_d' 'brillouin_d' 'chao1' 'dominance' 'enspie' 'fisher_alpha' 'gini_index'\
 'heip_e' 'goods_coverage' 'lladser_pe' 'menhinick' 'robbins' 'doubles' 'singles' 'observed_features' 'pielou_e' 'simpson' 'strong' 'margalef' 'mcintosh_d' 'shannon' )

for p in "${METRICS2[@]}" ; do
	qiime diversity alpha \
 	--i-table ./qiime/table.qza \
	--p-metric "$p" \
	--o-alpha-diversity "./qiime/alphas/$p.qza" 
done

#export
for filename in ./qiime/alphas/*.qza ; do
	qiime tools export \
  	--input-path "$filename" \
  	--output-path "${filename%.qza}"
done

qiime tools export \
  --input-path "./qiime/faith_pd_vector.qza" \
  --output-path "./qiime/alphas/faith_pd_vector"


#rename files
for folder in ./qiime/alphas/*/ ; do
	echo "moving $dir"
    dir=${folder%*/} 
    mv "$dir/alpha-diversity.tsv" "$dir.tsv"
    rmdir "$dir"
done
