#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH -c 8
#SBATCH --time=0-3

/usr/bin/time -v STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b \
--genomeFastaFiles /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/Mus_musculus.GRCm39.dna.primary_assembly.fa \
--sjdbGTFfile /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/Mus_musculus.GRCm39.112.gtf
