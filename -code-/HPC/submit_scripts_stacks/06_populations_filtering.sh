#!/bin/bash

#SBATCH -J populations
#SBATCH --mail-user=YOUREMAIL@gmail.com
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT   
#SBATCH --output=/work/%u/%x-%j.out
#SBATCH --error=/work/%u/%x-%j.err  
#SBATCH --cpus-per-task=4 
#SBATCH --mem-per-cpu=6G
#SBATCH -t 02:00:00

# Set the requested number of cores to the number of Threads your app should use
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK:-1}

# Paths and filenames for this analysis
 
WORK_DIR="/work/%u/ddRAD-seq_workshop"

out_dir="$WORK_DIR/outputs/Exercise_3/stacks.denovo/populations.singleSNP.r075.m5.maf005.het07"
cd "$WORK_DIR" || exit 
mkdir "$out_dir"
vcf_dir="$WORK_DIR/outputs/Exercise_3/stacks.denovo/VCFtools/filtered.m5-100_miss0.50_2alleles.recode.vcf"
popmap="/work/%u/ddRAD-seq_workshop/data/Exercise_3/popmaps/popmap6.txt"
log_file="$out_dir"/populations.oe



## Load modules and activate software

module load Anaconda3
source activate /data/Popgen/programs/stacks-2.53

# populations - it will analyze a population of individual samples computing a number of population genetics statistics 
# as well as exporting a variety of standard output formats. A population map specifying which individuals belong to which 
# population is submitted to the program and the program will then calculate population genetics statistics such as expected/observed 
# heterozygosity, π, and FIS at each nucleotide position. The populations program will compare all populations pairwise to compute FST.  
# The populations program provides strong filtering options to only include loci or variant sites that occur at certain frequencies in  
# each population or in the metapopulation.

# -P = path to the directory containing the Stacks files (the gstacks output).
# --popmap = file path to the population map (<sample name><TAB><population>)
# -O = file path to write the pipeline output files
# -p = minimum number of populations a locus must be present in to process a locus.
# -m = coverage threshold
# -r = minimum percentage of individuals in a population required to process a locus for that population.
# --min-maf = specify a minimum minor allele frequency required to process a nucleotide site at a locus (0 < min_maf < 0.5).
# --write-single-snp = restrict data analysis to only the first SNP per locus.
# --write-random-snp = restrict data analysis to one random SNP per locus.
# --fstats — enable SNP and haplotype-based F statistics.
# -T = the number of threads/CPUs to use (default: 1)

# Run populations with "-r 0.75" (loci present in 75% of samples), min-maf 0.05 (a variable site must possess a minimum allele frequency of 5% to be included) 
# --max-obs-het 0.7 (maximum level of heterozygosity a variable site can possess to be included) and writing only one single SNP (--write-single-snp).

populations -V "$vcf_dir" -O "$out_dir" --popmap "$popmap" \
-t "$SLURM_CPUS_PER_TASK" -r 0.75 --min-maf 0.05 --max-obs-het 0.7 --write-single-snp --fstats --hwe --vcf --plink --phylip --phylip-var --phylip-var-all &> "$log_file"