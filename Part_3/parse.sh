#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH -c 8
#SBATCH --time=0-3

/usr/bin/time -v /projects/bgmp/lwil/bioinfo/Bi621/PS/ps8-laurenrw12/parse.py \
-f /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/alignreads_output/8_Aligned.out.sam

/usr/bin/time -v /projects/bgmp/lwil/bioinfo/Bi621/PS/ps8-laurenrw12/parse.py \
-f /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/alignreads_output/22_Aligned.out.sam