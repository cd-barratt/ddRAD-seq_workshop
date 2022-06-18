#!/bin/bash       
                                                                                                                     
#SBATCH --job-name=setup
#SBATCH --mail-user=christopher_david.barratt@uni-leipzig.de
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT
#SBATCH --output=/work/barratt/ddRAD-seq_workshop/job_logs/%x-%j.log
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=15G
#SBATCH --time=02:00:00

# setup

cp -r /public/ddRAD-seq_workshop /work/$USER

cd /work/barratt/ddRAD-seq_workshop
sed -i 's/$USER/barratt/g' /work/barratt/ddRAD-seq_workshop/scripts/*.*
sed -i 's/%u/barratt/g' /work/barratt/ddRAD-seq_workshop/scripts/submit_scripts_stacks/*.*
sed -i 's/YOUREMAIL@gmail.com/christopher_david.barratt@idiv.de/g' /work/barratt/ddRAD-seq_workshop/scripts/*.*
sed -i 's/YOUREMAIL@gmail.com/christopher_david.barratt@idiv.de/g' /work/barratt/ddRAD-seq_workshop/scripts/submit_scripts_stacks/*.*


# This code will make a ddRAD-seq_workshop folder inside a submit_scripts folder in your home directory (~/)
cd ~
mkdir /home/$USER/submit_scripts
mkdir /home/$USER/submit_scripts/ddRAD-seq_workshop

# This line will move scripts to your own submit_scripts directory
mv /work/$USER/ddRAD-seq_workshop/scripts /home/$USER/submit_scripts/ddRAD-seq_workshop/
