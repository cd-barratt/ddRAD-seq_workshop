#!/bin/bash

#SBATCH -J PLINK
#SBATCH --mail-user=YOUREMAIL@gmail.com
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT 
#SBATCH --output=/work/%u/%x-%j.out
#SBATCH --error=/work/%u/%x-%j.err  
#SBATCH --mem-per-cpu=4G
#SBATCH -t 02:00:00

# Paths and filenames for this analysis

WORK_DIR="/work/%u/ddRAD-seq_workshop/outputs/Exercise_3/stacks.denovo"

out_dir="$WORK_DIR/PLINK"
vcf_dir="$WORK_DIR"/PLINK/plink.vcf.gz
log_file="$out_dir"/plink.oe

## Load modules and activate software

module load Anaconda3
source activate /data/Popgen/programs/plink-1.90


# PLINK - free open-source toolset to perform a range of basic, large-scale analyses in a computationally efficient manner.
# The focus of PLINK is purely on analysis of genotype/phenotype data
# NOTE that in the vcf file, "chromosomes" (=contig) must not be numeric, e.g. "41", but non-numeric "contig_41"

# Run PLINK to sort chromosomes 

plink --vcf "$vcf_dir" --make-bed --allow-extra-chr --out "$out_dir/plink_sorted" 

cd "$out_dir" || exit
mkdir results


## Run PLINK to create a .bed file from a vcf file for subsequent analysis with ADMIXTURE which cannot handle chromosome names and therefore we overwrite the first column names with zeroes
plink --bfile "$out_dir/plink_sorted" --het --hardy --make-bed --out "$out_dir/results/output" --allow-extra-chr --recode 12
awk '{$1=0;print}' "$out_dir/results/output.bim" > "$out_dir/results/output.bim.tmp"
mv "$out_dir/results/output.bim.tmp" "$out_dir/results/output.bim"