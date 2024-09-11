#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --time=1-0

conda activate QAA

/usr/bin/time -v /projects/bgmp/lwil/bioinfo/Bi622/Demultiplex/Assignment-the-first/meandist.py \
-f /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz \
-l 101 \
-o /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_1/meandist_output/meandist_8_2F_fox_S7_L008_R1_001

/usr/bin/time -v /projects/bgmp/lwil/bioinfo/Bi622/Demultiplex/Assignment-the-first/meandist.py \
-f /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz \
-l 101 \
-o /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_1/meandist_output/meandist_8_2F_fox_S7_L008_R2_001

/usr/bin/time -v /projects/bgmp/lwil/bioinfo/Bi622/Demultiplex/Assignment-the-first/meandist.py \
-f /projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R1_001.fastq.gz \
-l 101 \
-o /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_1/meandist_output/meandist_22_3H_both_S16_L008_R1_001

/usr/bin/time -v /projects/bgmp/lwil/bioinfo/Bi622/Demultiplex/Assignment-the-first/meandist.py \
-f /projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R2_001.fastq.gz \
-l 101 \
-o /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_1/meandist_output/meandist_22_3H_both_S16_L008_R2_001