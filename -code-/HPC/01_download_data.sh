#!/bin/bash       
                                                                                                                     
#SBATCH --job-name=download_ENA_data
#SBATCH --mail-user=YOUREMAIL@gmail.com
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT
#SBATCH --output=/work/$USER/ddRAD-seq_workshop/job_logs/%x-%j.log
#SBATCH --cpus-per-task=1 
#SBATCH --mem-per-cpu=15G
#SBATCH --time=04:00:00

# download ENA Data

cd /work/$USER/ddRAD-seq_workshop/data/Exercises_1-2/
cd ./raw

# Myotis escalerai bat data example download == 134 inds ddRADseq Paired end sequenced data, sbfI and nlaIII enzymes. Barcodes are inline inline adapters

#https://www.ebi.ac.uk/ena/browser/text-search?query=PRJEB29086

# I've commented out all except library 2 here, try downloading different files

#wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR283/ERR2832479/BAT_01_NoIndex_L008_R1_001.fastq.bz2
#wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR283/ERR2832479/BAT_01_NoIndex_L008_R2_001.fastq.bz2
wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR283/ERR2832480/BAT_02_NoIndex_L005_R1_001.fastq.bz2
wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR283/ERR2832480/BAT_02_NoIndex_L005_R2_001.fastq.bz2
#wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR283/ERR2832481/BAT_03_NoIndex_L004_R1_001.fastq.bz2
#wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR283/ERR2832481/BAT_03_NoIndex_L004_R2_001.fastq.bz2
#wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR283/ERR2832482/BAT_04_NoIndex_L005_R1_001.fastq.bz2
#wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR283/ERR2832482/BAT_04_NoIndex_L005_R2_001.fastq.bz2
#wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR283/ERR2832483/BAT_05_NoIndex_L006_R1_001.fastq.bz2
#wget ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR283/ERR2832483/BAT_05_NoIndex_L006_R2_001.fastq.bz2

# these are bzip2ed, so need to be unzipped and then gzipped for Stacks
ml GCCcore/10.2.0
ml bzip2/1.0.8

gunzip ./*.bz2.gz
bzip2 -d ./*.bz2
gzip ./*.fastq

