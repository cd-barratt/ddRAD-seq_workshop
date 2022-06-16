#!/bin/bash

#SBATCH -J denovo_map_full
#SBATCH --mail-user=YOUREMAIL@gmail.com
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT  
#SBATCH --output=/work/%u/%x-%j.out
#SBATCH --error=/work/%u/%x-%j.err 
#SBATCH --cpus-per-task=8 
#SBATCH --mem-per-cpu=8G
#SBATCH -t 12:00:00

# Set the requested number of cores to the number of Threads your app should use
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK:-1}

# Paths and filenames for this analysis

M=YOURM

WORK_DIR="/work/%u/ddRAD-seq_workshop"
popmap="/work/%u/ddRAD-seq_workshop/data/Exercise_3/popmaps/popmap6.txt"

out_dir="$WORK_DIR/outputs/Exercise_3/stacks.denovo"
reads_dir="$WORK_DIR/data/Exercise_3/demultiplexed_data/HC6"
log_file="$out_dir"/denovo_map.oe

mkdir "$out_dir"

## Load modules and activate software

module purge
module load Anaconda3
source activate /gpfs0/global/apps/stacks_2.61


# denovo_map.pl - it will execute the Stacks pipeline by running each of the Stacks components individually: ustacks, cstacks, sstacks, tsv2bam, gstacks and populations. 
# We are doing this to select the parameters M (ustacks) and n (cstacks) which optimal value depends on the amount of genetic diversity within the species and with the quality of the raw data as well. 
# Therefore this has to be done with every species separately, with only a subset of samples from all the populations. This subset is written in the test.popmap files and therefore Stacks will only 
# run the analyses over those samples specified. We will vary M and n (M=n) from 1 to 9, and set m = 3.   

# -samples = file path to the samples (samples will be read from population map)
# --popmap = file path to the population map (<sample name><TAB><population>)
# -o = file path to write the pipeline output files
# -X = additional options for specific pipeline components, e.g. -X "populations: --min-maf 0.05". We will run populations separately afterwards
# -M = number of mismatches allowed between stacks within individuals (for ustacks)
# -n =number of mismatches allowed between stacks between individuals (for cstacks)
# -m = Minimum depth of coverage required to create a stack (default 3)
# --paired = after assembling RAD loci, assemble contigs for each locus from paired-end reads
# --rm-pcr-duplicates = remove all but one set of read pairs of the same sample that have the same insert length
# -r = minimum percentage of individuals in a population required to process a locus for that population (for populations; default: 0)
# -T = the number of threads/CPUs to use (default: 1)


# Run denovo_map on the subset of samples told by the popmap


denovo_map.pl --samples "$reads_dir" --popmap "$popmap" -o "$out_dir" -T "$SLURM_CPUS_PER_TASK" \
-M "$M" -n "$M" -m 3 --paired -X "populations: --vcf" &> "$log_file"