#!/bin/bash

#SBATCH -J vcftools_filtering
#SBATCH --mail-user=YOUREMAIL@gmail.com
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT
#SBATCH --output=/work/%u/%x-%j.out
#SBATCH --error=/work/%u/%x-%j.err  
#SBATCH --mem-per-cpu=4G
#SBATCH -t 02:00:00

# Paths and filenames for this analysis

WORK_DIR="/work/%u/ddRAD-seq_workshop"

out_dir="$WORK_DIR/outputs/Exercise_3/stacks.denovo/VCFtools"

vcf_dir="$WORK_DIR/outputs/Exercise_3/stacks.denovo/populations.snps.vcf"
log_file="$out_dir"/vcf_filtering_m5-100_miss0.25_2alleles.oe
	
## Load modules and activate software

module load foss/2019b VCFtools/0.1.16

# VCFtools - vcftools is a suite of functions for use on genetic variation data in the form of VCF and BCF files. 
#The tools provided will be used mainly to summarize data, run calculations on data, filter out data, and convert data into other useful file formats.
# SYNOPSIS:
# vcftools [ --vcf FILE | --gzvcf FILE | --bcf FILE] [ --out OUTPUT PREFIX ] [ FILTERING OPTIONS ] [ OUTPUT OPTIONS ]

# Run VCFtools to filter the data 

cd "$out_dir" 
vcftools --vcf "$vcf_dir" --remove-indels --max-missing 0.50 --min-alleles 2 --max-alleles 2 --min-meanDP 5 --max-meanDP 100 --minDP 5 --maxDP 100 --recode --out "./filtered.m5-100_miss0.50_2alleles" &> "$log_file" 	
 

