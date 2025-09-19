### Assembly (metaSPAdes single-sample)

metaspades.py \
    -1 sample_clean_dehost.1.fq.gz \
    -2 sample_clean_dehost.2.fq.gz \
    --only-assembler \
    -t 80 \
    -o sample-metaspades/

### Assembly (MEGAHIT co-assembly)

conda activate megahit

megahit \
    -1 region_clean_1.fastq.gz \
    -2 region_clean_2.fastq.gz \
    -t 24 \
    --min-contig-len 100 \
    --presets meta-sensitive \
    --prune-depth 1 \
    -o region-megahit/
