# QAA Lab Notebook 

File assignments: 
`/projects/bgmp/shared/Bi623/QAA_data_assignments.txt`  

My assigned files: 
`/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz`  
`/projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz`  
`/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R1_001.fastq.gz`  
`/projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R2_001.fastq.gz`  

## Conda Environment & Installations 
### 09.05.24

- created a new conda environment called `QAA` 
```
    $ srun -A bgmp -p bgmp --time=0-3 --pty bash  
    $ conda create -n "QAA"
```
- installed `FastQC`, `cutadapt`, `Trimmomatic`, `star`, `numpy`, `matplotlib`, and `htseq`
```
    $ conda install FastQC  
    $ fastqc --version #should be 0.12.1 

    $ conda install cutadapt 
    $ cutadapt --version #should be 4.9  

    $ conda install Trimmomatic  
    $ trimmomatic -version #should be 0.39  

    $ conda install star  

    $ conda install numpy  

    $ conda install matplotlib  

    $ conda install htseq  
```

## Part 1 – Read quality score distributions
### 09.05.24

- ran `fastqc` on my assigned files using `fastqc.sh` in [fastqc.sh](/projects/bgmp/lwil/bioinfo/Bi623/QAA/fastqc.sh) script
    - produced plots of the per-base quality score distributions for R1 and R2 reads
    - produced plots of the per-base N content, which ARE consistent with the quality score plots (low quality near beginning of read)

- ran my quality score plotting script from your Demultiplexing assignment in Bi622 using [meandist.sh](/projects/bgmp/lwil/bioinfo/Bi623/QAA/meandist.sh) script 

### 09.07.24

>IN [REPORT](./QAA_report.pdf): 
>Describe how the `FastQC` quality score distribution plots compare to your own. If different, propose an explanation. Also, does the runtime differ? Mem/CPU usage? If so, why? Comment on the overall data quality of your two libraries. Go beyond per-base qscore distributions. Make and justify a recommendation on whether these data are of high enough quality to use for further analysis.

## Part 2 – Adaptor trimming comparison
### 09.07.24

R1 Adapter: `AGATCGGAAGAGCACACGTCTGAACTCCAGTCA`
R2 Adapter: `AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT`

SANITY CHECK: The R1 files should have the R1 adapter, but not the R2 adapter. 
`zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz | grep "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" | wc -l`  
`161695`  

`zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R1_001.fastq.gz | grep "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" | wc -l`  
`7563`  

`zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R1_001.fastq.gz | grep "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" | wc -l`  
`0`  

`zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R1_001.fastq.gz | grep "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" | wc -l`  
`0`  

SANITY CHECK: The R2 files should have the R2 adapter, but not the R1 adapter. 
`zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz | grep "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" | wc -l`  
`164539`  

`zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R2_001.fastq.gz | grep "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" | wc -l`  
`7848`  

`zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/8_2F_fox_S7_L008_R2_001.fastq.gz | grep "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" | wc -l`  
`0`  

`zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/22_3H_both_S16_L008_R2_001.fastq.gz | grep "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" | wc -l`  
`0`  

- trimmed adapter sequences from your assigned files using `cutadapt` in [meandist.sh](/projects/bgmp/lwil/bioinfo/Bi623/QAA/meandist.sh) script 
    - Default settings for paired-end reads:  
        `cutadapt -a ADAPT1 -A ADAPT2 [options] -o out1.fastq -p out2.fastq in1.fastq in2.fastq`  

> >IN [REPORT](./QAA_report.pdf): 
> What proportion of reads (both R1 and R2) were trimmed?
>
>8_2F_fox_S7_L008:
>Total read pairs processed:         36,482,601
>  Read 1 with adapter:               2,145,600 (5.9%)
>  Read 2 with adapter:               2,403,490 (6.6%)
>
>22_3H_both_S16_L008: 
>Total read pairs processed:          4,050,899
>  Read 1 with adapter:                 153,089 (3.8%)
>  Read 2 with adapter:                 186,534 (4.6%)

AFTER RUNNING CUTADAPT SANITY CHECK:
`zcat /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/cutadapt_output/out_8_R1.fastq.gz | grep "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" | wc -l`  
`0`  

`zcat /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/cutadapt_output/out_22_R1.fastq.gz | grep "AGATCGGAAGAGCACACGTCTGAACTCCAGTCA" | wc -l`  
`0`  

`zcat /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/cutadapt_output/out_8_R2.fastq.gz| grep "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" | wc -l`  
`0`  

`zcat /projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_2/cutadapt_output/out_22_R2.fastq.gz| grep "AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT" | wc -l`  
`0`  

- quality trim your reads using `trimmomatic` in  [trimmomatic.sh](/projects/bgmp/lwil/bioinfo/Bi623/QAA/trimmomatic.sh)
    - Default settings for paired-end reads:
        trimmomatic PE input_forward.fq.gz input_reverse.fq.gz output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:36
    - Ran with these specifications
        - LEADING: quality of 3
        - TRAILING: quality of 3
        - SLIDING WINDOW: window size of 5 and required quality of 15
        - MINLENGTH: 35 bases

>IN [REPORT](./QAA_report.pdf): 
>Plot the trimmed read length distributions for both R1 and R2 reads (on the same plot - yes, you will have to use Python or R to plot this. See ICA4 from Bi621). You can produce 2 different plots for your 2 different RNA-seq samples. There are a number of ways you could possibly do this. One useful thing your plot should show, for example, is whether R1s are trimmed more extensively than R2s, or vice versa. Comment on whether you expect R1s and R2s to be adapter-trimmed at different rates and why.

- CHALLENGE! ran `fastqc` on my trimmed data using `fastqc.sh` in [trimmed_fastqc.sh](/projects/bgmp/lwil/bioinfo/Bi623/QAA/trimmed_fastqc.sh) script

>IN [REPORT](./QAA_report.pdf): 
>Comment on differences you observe between the trimmed and untrimmed data. Include any figures needed to support your conclusions.

## Part 3 – Alignment and strand-specificity
### 09.07.24

- found publicly available mouse genome fasta files (Ensemble release 112): 
  - [Mus_musculus.GRCm39.dna.primary_assembly.fa](/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/Mus_musculus.GRCm39.dna.primary_assembly.fa)
  - [Mus_musculus.GRCm39.112.gtf](/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/Mus_musculus.GRCm39.112.gtf)

- generated an alignment database from them using `STAR` in [makedb.sh](/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/makedb.sh)
  - directory name should include: the name of the assembly (e.g. “Mus_musculus.GRCm39.dna”), the release of Ensembl (e.g. “ens112”), and the version of STAR (e.g. “STAR_2.7.11b”)

- aligned the reads to your mouse genomic database using a splice-aware aligner (used the settings specified in PS8 from Bi621) in [alignreads.sh](/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/alignreads.sh)

- reported the number of mapped and unmapped reads from each of your 2 sam files using your script from Bi621 PS8 in [parse.sh](/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/parse.sh)

- counted reads that map to features using `htseq-count` in [htseq_count.sh](/projects/bgmp/lwil/bioinfo/Bi623/QAA/Part_3/htseq_count.sh)
   - ran htseq-count twice: once with `--stranded=yes` and again with `--stranded=reverse`
   - Default settings: htseq-count [-s {yes,no,reverse}] samfilenames featuresfilename


### SAM FILE from `8_2F_fox_S7_L008_R1_001.fa` and `8_2F_fox_S7_L008_R2_001.fa`
#### My Parse Script
Mapped Reads:  67,070,894
Unmapped Reads:  2,511,420
Percent of reads mapped: 67,070,894 / 69,582,314 = 0.9639072078 = 96.39%

Command: `cat <FILENAME> | grep "^ENS" | awk -F'\t' '{sum += $2}END{ printf "Sum of 3rd field: %D Total number of lines: %d\n", sum, NR }'`
Number of reads mapped, fw: 1,205,384
Number of reads mapped, rv: 28,037,914

Command: `cat <FILENAME> | awk -F'\t' '{sum += $2}END{ printf "Sum of 3rd field: %D Total number of lines: %d\n", sum, NR }'`
Total reads, fw: 34,791,157
Total reads, rv: 34,791,157

Percent of reads mapped, fw: 1,205,384 / 34,791,157 = 0.0346462752 = 3.46%
Percent of reads mapped, rv: 28,037,914 / 34,791,157 = 0.80589196846 = 80.59%

### SAM FILE from `22_3H_both_S16_L008_R1_001.fa` and `22_3H_both_S16_L008_R2_001.fa`
#### My Parse Script
Mapped Reads:  7,677,917
Unmapped Reads:  124,337
Percent of reads mapped: 7,677,917 / 7,802,254 = 0.98406396408 = 98.41%

Command: `cat <FILENAME> | grep "^ENS" | awk -F'\t' '{sum += $2}END{ printf "Sum of 3rd field: %D Total number of lines: %d\n", sum, NR }'`
Number of reads mapped, fw: 144,728
Number of reads mapped, rv: 3,393,906

Command: `cat <FILENAME> | awk -F'\t' '{sum += $2}END{ printf "Sum of 3rd field: %D Total number of lines: %d\n", sum, NR }'`
Total reads, fw: 3,901,127 
Total reads, rv: 3,901,127 

Percent of reads mapped, fw: 144,728 / 3,901,127 = 0.03709902292 = 3.71%
Percent of reads mapped, rv: 3,393,906 / 3,901,127 = 0.86998090551 = 87.00%

>IN [REPORT](./QAA_report.pdf): 
>Demonstrate convincingly whether or not the data are from "strand-specific" RNA-Seq libraries. Include any comands/scripts used. Briefly describe your evidence, using quantitative statements (e.g. "I propose that these data are/are not strand-specific, because X% of the reads are y, as opposed to z.").

# To turn in your work for this assignment

## Upload your:
- [ ] lab notebook,
- [ ] Talapas batch script/code, 
- [ ] FastQC plots, 
- [ ] counts files generated from htseq-count (in a folder would be nice),
- [ ] pdf report (see below), 
- [ ] and any additional plots, code, or code output to GitHub.

## You should create a pdf file (using Rmarkdown) with a high-level report including:
- [ ] all requested plots
- [ ] answers to questions
- [ ] mapped/unmapped read counts from PS8 script (in a nicely formatted table)
    
The three parts of the assignment should be clearly labeled. Be sure to title and write a descriptive figure caption for each image/graph/table you present. 

The file should be named `QAA_report.pdf`, and it should be a the top level of your repo AND submitted to Canvas.
- [ ] all requested plots
- [ ] answers to questions
- [ ] mapped/unmapped read counts from PS8 script (in a nicely formatted table)
    

