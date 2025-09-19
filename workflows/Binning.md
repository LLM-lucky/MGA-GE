### Binning (BAM + SemiBin)

# Step 1: generate BAM
conda activate metawrap-env

bwa index sample.contig.ok.fa

bwa mem -v 1 -t 80 sample.contig.ok.fa \
    sample.clean_1.fastq.gz sample.clean_2.fastq.gz > sample.clean.sam

samtools sort -T tmp-samtools -@ 80 -O BAM \
    -o sample.clean.bam sample.clean.sam

rm sample.clean.sam


# Step 2: SemiBin single-sample binning
conda activate SemiBin   # or: conda activate SemiBin1.5.1

SemiBin single_easy_bin \
    -i sample.contig.ok.fa \
    -b sample.clean.bam \
    -o sample.semibin.out \
    -t 24


# Step 3: SemiBin co-binning by region (multiple BAMs)
conda activate SemiBin   # or: conda activate SemiBin1.5.1

SemiBin single_easy_bin \
    -i region.contig.ok.fa \
    -b region1.clean.bam region2.clean.bam region3.clean.bam region4.clean.bam \
       region5.clean.bam region6.clean.bam region7.clean.bam region8.clean.bam \
       region9.clean.bam region10.clean.bam region11.clean.bam region12.clean.bam \
    -o region.semibin.out \
    -t 100
