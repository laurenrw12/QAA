#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH -c 8
#SBATCH --time=0-3

/usr/bin/time -v htseq-count --stranded=yes \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/alignreads_output/8_Aligned.out.sam \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/Mus_musculus.GRCm39.112.gtf > 8_htseq_count_stranded.out

/usr/bin/time -v htseq-count --stranded=yes \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/alignreads_output/22_Aligned.out.sam \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/Mus_musculus.GRCm39.112.gtf > 22_htseq_count_stranded.out

/usr/bin/time -v htseq-count --stranded=reverse \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/alignreads_output/8_Aligned.out.sam \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/Mus_musculus.GRCm39.112.gtf > 8_htseq_count_rev_stranded.out

/usr/bin/time -v htseq-count --stranded=reverse \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/alignreads_output/22_Aligned.out.sam \
/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/Mus_musculus.GRCm39.112.gtf > 22_htseq_count_rev_stranded.out
