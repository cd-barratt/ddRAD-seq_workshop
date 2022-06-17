#!/bin/bash                                                                                                                            

#SBATCH --job-name=Admixture
#SBATCH --mail-user=christopher_david.barratt@uni-leipzig.de
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT
#SBATCH --output=/work/$USER/ddRAD-seq_workshop/job_logs/%x-%j.log
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=15G
#SBATCH --time=2:00:00

 
#load environment
module purge
module load Anaconda3
source activate /global/apps/plink_1.90


# Converting ped and map files to bed format for Admixture
plink --file /work/$USER/ddRAD-seq_workshop/data/Exercises_4-8/Admixture/Lflav --make-bed --recode --out /work/$USER/ddRAD-seq_workshop/outputs/Exercise_4/Lflav

#run admixture
cd /work/$USER/ddRAD-seq_workshop/outputs/Exercise_4/
bash
source activate /gpfs0/global/apps/admixture_1.3.0
for K in 1 2 3 4 5 6 7 8 9 10; \
do admixture --cv=10 ./Lflav.bed $K| tee log_Lflav.${K}.out; done

# grep to combine all results
grep -h CV log_Lflav*.out > ./RESULTS_Leptopelis_flavomaculatus_admixture.txt

#sed to clean results for later analysis
sed -e 's/CV error (K=//g' ./RESULTS_Leptopelis_flavomaculatus_admixture.txt | sed 's/)://g' > ./RESULTS_Leptopelis_flavomaculatus_admixture_clean.txt

# replace all single digit numbers to begin with 0s for numerical sorting
sed -e 's/1 /01 /g' ./RESULTS_Leptopelis_flavomaculatus_admixture_clean.txt \
| sed -e 's/2 /02 /g' \
| sed -e 's/3 /03 /g' \
| sed -e 's/4 /04 /g' \
| sed -e 's/5 /05 /g' \
| sed -e 's/6 /06 /g' \
| sed -e 's/7 /07 /g' \
| sed -e 's/8 /08 /g' \
| sed -e 's/9 /09 /g'> ./tmp.txt\

# sort output file (01-10) and remove old temporary one
sort ./tmp.txt > ./RESULTS_Leptopelis_flavomaculatus_admixture_clean.txt
rm -rf ./tmp.txt