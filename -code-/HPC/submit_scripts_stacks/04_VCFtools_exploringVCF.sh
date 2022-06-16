#!/bin/bash

#SBATCH -J vcftools
#SBATCH --mail-user=YOUREMAIL@gmail.com
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT 
#SBATCH --output=/work/%u/%x-%j.out
#SBATCH --error=/work/%u/%x-%j.err  
#SBATCH --mem-per-cpu=4G
#SBATCH -t 12:00:00

# Paths and filenames for this analysis

WORK_DIR="/work/%u/ddRAD-seq_workshop"

out_dir="$WORK_DIR/outputs/Exercise_3/stacks.denovo/VCFtools"
cd "$WORK_DIR" || exit 
mkdir "$out_dir"
vcf_dir="$WORK_DIR/outputs/Exercise_3/stacks.denovo/populations.snps.vcf"
log_file="$out_dir"/vcftools_summary.oe

## Load modules and activate software

module load foss/2019b VCFtools/0.1.16


# VCFtools - vcftools is a suite of functions for use on genetic variation data in the form of VCF and BCF files. 
#The tools provided will be used mainly to summarize data, run calculations on data, filter out data, and convert data into other useful file formats.
# SYNOPSIS:
# vcftools [ --vcf FILE | --gzvcf FILE | --bcf FILE] [ --out OUTPUT PREFIX ] [ FILTERING OPTIONS ] [ OUTPUT OPTIONS ]

# Run VCFtools to calculate some basic stats from out vcf files per species 

cd "$out_dir" 
	vcftools --vcf "$vcf_dir" --freq2 --out "./freq2" --max-alleles 2 &> "$log_file"
	vcftools --vcf "$vcf_dir" --depth --out "./ind_depth" &> "$log_file" 
	vcftools --vcf "$vcf_dir" --site-mean-depth --out "./mean_depth_site" &> "$log_file"
	vcftools --vcf "$vcf_dir" --site-quality --out "./site_quality" &> "$log_file"
	vcftools --vcf "$vcf_dir" --missing-indv --out "./missing_ind" &> "$log_file"
	vcftools --vcf "$vcf_dir" --missing-site --out "./missing_ind" &> "$log_file"
	vcftools --vcf "$vcf_dir" --het --out "./het" &> "$log_file"	
