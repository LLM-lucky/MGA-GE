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
    -b sample1.clean.bam sample2.clean.bam sample3.clean.bam sample4.clean.bam \
       sample5.clean.bam sample6.clean.bam sample7.clean.bam sample8.clean.bam \
       sample9.clean.bam sample10.clean.bam sample11.clean.bam sample12.clean.bam \
    -o region.semibin.out \
    -t 100
