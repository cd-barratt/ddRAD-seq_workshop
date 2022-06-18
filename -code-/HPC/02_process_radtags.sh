#!/bin/bash                                                                                                                            

#SBATCH --job-name=process_radtags
#SBATCH --mail-user=YOUREMAIL@gmail.com
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT
#SBATCH --output=/work/$USER/ddRAD-seq_workshop/job_logs/%x-%j.log
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=8G
#SBATCH --time=12:00:00
 

## Load modules and activate software


module purge
module load Anaconda3
source activate /gpfs0/global/apps/stacks_2.61

# process_radtags - take raw data from sequencer and output sequences per individual using barcodes and restriction enzyme information
# -p = file path of raw data from sequencer 
# -o = output file path of where you want your individual data to go 
# -b = barcode identifier (one file showing all barcodes for each individual) 
# --inline_inline: barcode is inline with sequence, occurs on single and paired-end read.
# --renz_1 = restriction enzyme used
# --renz_2 = restriction enzyme used
# -c,--clean = clean data, remove any read with an uncalled base.
# -q,--quality = discard reads with low quality scores.
# --filter_illumina = discard reads that have been marked by Illumina's chastity/purity filter as failing.
# -s = set the score limit. If the average score within the sliding window drops below this value, the read is discarded (default 10).i
# -i = input file type, either 'fastq', 'gzfastq' (gzipped fastq), 'bam', or 'bustard' (default: guess, or gzfastq if unable to).
# -y = output type, either 'fastq', 'gzfastq', 'fasta', or 'gzfasta' (default: match input type).
# -t = truncate final read length to this value.


process_radtags -1 /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/raw/BAT_01_NoIndex_L008_R1_001.fastq.gz -2 /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/raw/BAT_01_NoIndex_L008_R2_001.fastq.gz -o /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/demultiplexed/ -b /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/barcodes/barcodes_1 --inline_inline --renz_1 sbfI --renz_2 nlaIII -c -q -E phred33 -i gzfastq -y gzfastq --filter_illumina -s 20 -t 90 

# You can try it yourself now for barcodes_2, barcodes_3 etc.
# try changing the restriction enzyme
# try changing s and t parameters
# see what happens when getting the inline-inline wrong..

#process_radtags -1 /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/raw/BAT_02_NoIndex_L005_R1_001.fastq.gz -2 /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/raw/BAT_02_NoIndex_L005_R2_001.fastq.gz -o /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/demultiplexed/ -b /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/barcodes/barcodes_2 --inline_inline --renz_1 sbfI --renz_2 nlaIII -c -q -E phred33 -i gzfastq -y gzfastq --filter_illumina -s 20 -t 90 
#process_radtags -1 /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/raw/BAT_03_NoIndex_L004_R1_001.fastq.gz -2 /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/raw/BAT_03_NoIndex_L004_R2_001.fastq.gz -o /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/demultiplexed/ -b /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/barcodes/barcodes_3 --inline_inline --renz_1 sbfI --renz_2 nlaIII -c -q -E phred33 -i gzfastq -y gzfastq --filter_illumina -s 20 -t 90 
#process_radtags -1 /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/raw/BAT_04_NoIndex_L005_R1_001.fastq.gz -2 /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/raw/BAT_04_NoIndex_L005_R2_001.fastq.gz -o /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/demultiplexed/ -b /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/barcodes/barcodes_4 --inline_inline --renz_1 sbfI --renz_2 nlaIII -c -q -E phred33 -i gzfastq -y gzfastq --filter_illumina -s 20 -t 90 
#process_radtags -1 /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/raw/BAT_05_NoIndex_L006_R1_001.fastq.gz -2 /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/raw/BAT_05_NoIndex_L006_R2_001.fastq.gz -o /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/demultiplexed/ -b /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/barcodes/barcodes_5 --inline_inline --renz_1 sbfI --renz_2 nlaIII -c -q -E phred33 -i gzfastq -y gzfastq --filter_illumina -s 20 -t 90 


