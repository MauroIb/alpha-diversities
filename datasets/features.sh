for d in */; do
    file="${d}qiime/table.qza"
    if test -f "$file"; then
        qiime tools export \
            --input-path ${file} \
            --output-path ${d}
        biom convert -i ${d}feature-table.biom -o ${d}feature-table.tsv --to-tsv
    fi
done