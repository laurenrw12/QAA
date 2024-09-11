#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH -c 8
#SBATCH --time=0-3

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_8_R1_P.fastq.gz /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_8_R2_P.fastq.gz \
--genomeDir /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b \
--outFileNamePrefix 8_

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_22_R1_P.fastq.gz /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_22_R2_P.fastq.gz \
--genomeDir /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/Mus_musculus.GRCm39.dna.ens112.STAR_2.7.11b \
--outFileNamePrefix 22_
