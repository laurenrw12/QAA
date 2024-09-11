#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --time=1-0

/usr/bin/time -v cutadapt \
-a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
-A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/cutadapt_output/out_8_R1.fastq.gz \
-p /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/cutadapt_output/out_8_R2.fastq.gz \
/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz \
/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz

/usr/bin/time -v cutadapt \
-a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
-A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/cutadapt_output/out_22_R1.fastq.gz \
-p /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/cutadapt_output/out_22_R2.fastq.gz \
/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R1_001.fastq.gz \
/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R2_001.fastq.gz