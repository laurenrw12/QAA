#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --time=1-0

/usr/bin/time -v fastqc -o trimmed_fastqc_output \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_8_R1_P.fastq.gz \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_8_R2_P.fastq.gz

/usr/bin/time -v fastqc -o trimmed_fastqc_output \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_22_R1_P.fastq.gz \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/trimmomatic_output/out_22_R2_P.fastq.gz