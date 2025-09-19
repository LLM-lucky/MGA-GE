### Gene Abundance Profiling (CoverM)

conda activate coverm

echo coverm genome \
    -c /mnt/sdb/xiefei/project/linlimei/2023.07-GITmucosa_Geneset/01.QC/*gz \
    -d /mnt/sdb/xiefei/project/linlimei/2023.07-GITmucosa/16.Semibin2-single_cobinning/all_bin/ \
    -x fa \
    -o output_coverm.tsv \
    -t 100 \
    --min-read-percent-identity 0.95 \
    --min-read-aligned-percent 0.75 \
    --trim-min 0.10 \
    --trim-max 0.90 \
    -m tpm \
    --proper-pairs-only \
    --bam-file-cache-directory ./
