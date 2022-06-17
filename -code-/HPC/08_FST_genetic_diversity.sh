#!/bin/bash                                                                                                                            

#SBATCH --job-name=FST_genetic_diversity
#SBATCH --mail-user=christopher_david.barratt@uni-leipzig.de
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT
#SBATCH --output=/work/$USER/ddRAD-seq_workshop/job_logs/%x-%j.log
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=40G
#SBATCH --time=12:00:00

#load environment
module purge
module load Anaconda3
source activate /global/apps/stacks_2.61/

cd /work/$USER/ddRAD-seq_workshop/data/Exercises_4-8/FST_genetic_diversity/


# populations - 
# -P = working directory 
# -M = population map
# -t = max number of threads
# -m = coverage threshold
# -p = population limit threshold to include loci
# -r = individual limit threshold (per population) to include loci
# --structure --phylip = output file in structure/phylip format
# --write_random_snp = write only one random snp per locus
# --min_maf 0.05 = specify minimum minor allele frequencies to include loci

# It's 23 separate populations, so p=19 = 19/23 = only take SNPs present in 82.6% of data
populations -P /work/$USER/ddRAD-seq_workshop/data/Exercises_4-8/FST_genetic_diversity/Lflav -O /work/$USER/ddRAD-seq_workshop/data/Exercises_4-8/FST_genetic_diversity/Lflav -M /work/$USER/ddRAD-seq_workshop/data/Exercises_4-8/FST_genetic_diversity/Lflav_popmap_FST -t 1 -p 19 -r 0.5 --genepop --fstats --min-maf 0.05

# move files to outputs
mv /work/$USER/ddRAD-seq_workshop/data/Exercises_4-8/FST_genetic_diversity/Lflav/populations.* /work/$USER/ddRAD-seq_workshop/outputs/Exercise_8/