### 1. Raw Data Statistics
ls *_R1.fq.gz | perl -lne '@a=split/_/; print "$a[0]\t/path/to/00.data/$a[0]_R1.fq.gz\t/path/to/00.data/$a[0]_R2.fq.gz"' > raw.fq.lst
java -jar FastqStat.jar -i raw.fq.lst > 01.QC/rawdata.stat.main.xls


### 2. Adapter & Quality Trimming (fastp)
less raw.fq.lst | perl -lne '@a=split/\t/; print "mkdir 01.QC/$a[0]\ncd 01.QC/$a[0]\nfastp -i ../../00.data/$a[0]_R1.fq.gz -I ../../00.data/$a[0]_R2.fq.gz --detect_adapter_for_pe -w 10 -q 25 -5 -3 -l 100 -o $a[0]_clean.1.fq.gz -O $a[0]_clean.2.fq.gz"' > work1.sh


### 3. Post-fastp Statistics
ls */*_clean.1.fq.gz | perl -lne '@a=split/\//;@b=split/_/,$a[-1]; print "$b[0]\t01.QC/$b[0]/$b[0]_clean.1.fq.gz\t01.QC/$b[0]/$b[0]_clean.2.fq.gz"' > clean.fq.list
java -jar FastqStat.jar -i clean.fq.list > 01.QC/cleandata_fastp.stat.main.xls


### 4. Host Removal (BWA)
less raw.fq.lst | perl -lne '@a=split/\t/; print "cd 01.QC/$a[0]\nbwa mem -t 40 -T 30 -M ../00.ref/host.fa $a[0]_clean.1.fq.gz $a[0]_clean.2.fq.gz | awk '\''\$3!=\"*\"'\'' > $a[0].host.sam\nperl scripts/remove-host.pl $a[0].host.sam $a[0]"' > work2.sh


### 5. Final Clean Data Statistics
ls */*_clean_dehost.1.fq.gz | perl -lne '@a=split/\//;@b=split/_/,$a[-1]; print "$b[0]\t01.QC/$b[0]/$b[0]_clean_dehost.1.fq.gz\t01.QC/$b[0]/$b[0]_clean_dehost.2.fq.gz"' > clean_bwa.fq.list
java -jar FastqStat.jar -i clean_bwa.fq.list > 01.QC/cleandata_bwa.stat.main.xls


### 6. Host Contamination Summary
ls */*.host.info | perl -lne '@a=split/\//;@b=split/\./,$a[-1]; print "$b[0]\t01.QC/$b[0]/$b[0].host.info"' > host.info.lst
perl scripts/merge_host_info.pl host.info.lst > 01.QC/sample.host.stat.xls


### 7. K-mer Validation (sourmash)
sourmash sketch dna -p k=31,scaled=1000 -p k=51,scaled=1000 -o sample.sig sample_clean_dehost.1.fq.gz sample_clean_dehost.2.fq.gz
sourmash compare --containment -k 31 host.sig sample.sig --csv sample.k31.compare.csv
sourmash compare --containment -k 51 host.sig sample.sig --csv sample.k51.compare.csv
awk -F, 'NR==2{print $3}' sample.k31.compare.csv
awk -F, 'NR==2{print $3}' sample.k51.compare.csv

