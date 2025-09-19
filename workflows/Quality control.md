### 1. Raw Data Statistics
java -jar FastqStat.jar -i raw.fq.lst > rawdata.stat.main.xls

### 2. Adapter & Quality Trimming
fastp -i sample_R1.fq.gz -I sample_R2.fq.gz \
      --detect_adapter_for_pe \
      -w 10 -q 25 -5 -3 -l 100 \
      -o sample_clean.1.fq.gz -O sample_clean.2.fq.gz

### 3. Post-fastp Statistics
java -jar FastqStat.jar -i clean.fq.list > cleandata_fastp.stat.main.xls

### 4. Host Removal (BWA)
bwa mem -t 40 -T 30 -M host.fa \
    sample_clean.1.fq.gz sample_clean.2.fq.gz \
    | awk '$3!="*"' > sample.host.sam

perl remove-host.pl sample.host.sam sample

### 5. Final Clean Data Statistics
java -jar FastqStat.jar -i clean_bwa.fq.list > cleandata_bwa.stat.main.xls

### 6. Host Contamination Summary
perl merge_host_info.pl host.info.lst > sample.host.stat.xls

### 7. K-mer Validation (sourmash)
sourmash sketch dna \
    -p k=31,scaled=1000 \
    -p k=51,scaled=1000 \
    -o sample.sig \
    sample_clean_dehost.1.fq.gz sample_clean_dehost.2.fq.gz

sourmash compare --containment -k 31 host.sig sample.sig --csv sample.k31.compare.csv
sourmash compare --containment -k 51 host.sig sample.sig --csv sample.k51.compare.csv
