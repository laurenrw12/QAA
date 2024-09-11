#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --time=1-0

/usr/bin/time -v trimmomatic PE \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/cutadapt_output/out_8_R1.fastq.gz \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/cutadapt_output/out_8_R2.fastq.gz \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_8_R1_P.fastq.gz \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_8_R1_U.fastq.gz \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_8_R2_P.fastq.gz \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_8_R2_U.fastq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

/usr/bin/time -v trimmomatic PE \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/cutadapt_output/out_22_R1.fastq.gz \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/cutadapt_output/out_22_R2.fastq.gz \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_22_R1_P.fastq.gz \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_22_R1_U.fastq.gz \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_22_R2_P.fastq.gz \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_22_R2_U.fastq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35