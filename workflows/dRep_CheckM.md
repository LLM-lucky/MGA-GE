### Bin Dereplication and Quality Check

# dRep
conda activate drep

# Strain-level (ANI ≥ 99%)
dRep dereplicate dRep_0.99_result1 \
    -p 24 --ignoreGenomeQuality \
    -pa 0.95 -sa 0.99 -cm larger \
    -g All_mucosa_digesta_fa/*fa

# Species-level (ANI ≥ 95%)
dRep dereplicate dRep_0.95_result \
    -p 24 --ignoreGenomeQuality \
    -pa 0.9 -sa 0.95 -cm larger \
    -g All_mucosa_digesta_fa/*fa


# CheckM
conda activate metawrap-env

checkm lineage_wf output_recluster_bins/ checkm_result \
    -x fa -t 40 --pplacer_threads 4 \
    --tab_table -f checkm.summary
