#!/bin/bash                                                                                                                            

#SBATCH --job-name=RAxML
#SBATCH --mail-user=YOUREMAIL@gmail.com
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT
#SBATCH --output=/work/$USER/ddRAD-seq_workshop/job_logs/%x-%j.log
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=40G
#SBATCH --time=12:00:00

#load environment
module purge
module load Anaconda3
source activate /global/apps/raxml_8.2.9

cd /work/$USER/ddRAD-seq_workshop/data/Exercises_4-8/RAxML/

# 10 bootstraps


raxmlHPC -f a -m GTRCAT -p 12345 -x 12345 -# 5 -s  /work/$USER/ddRAD-seq_workshop/data/Exercises_4-8/RAxML/Lflav.phy ­­asc­corr=lewis -n bootstrapped 
raxmlHPC -m GTRCAT -p 12345 -f b -t RAxML_bestTree.bootstrapped -z RAxML_bootstrap.bootstrapped -n FINAL_bootstrapped.tre

# move output files to outputs directory
mv /work/$USER/ddRAD-seq_workshop/data/Exercises_4-8/RAxML/RAxML*.* /work/$USER/ddRAD-seq_workshop/outputs/Exercise_7/