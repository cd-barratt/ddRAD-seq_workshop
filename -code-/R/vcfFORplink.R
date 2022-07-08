

rm(list=ls())

############# Script to prepare vcf file for PLINK - Walter Durka and Laura Mendez ############

setwd("C:/Users/lm79geda/Dropbox/Dropbox/Work/Teaching/ddRAD - Stacks2/outputs/Exercise_3/stacks.denovo")

library(vcfR)
library(adegenet)

vcf <- read.vcfR("populations.singleSNP.r075.m5.maf005.het07/filtered.m5-100_miss0.50_2alleles.recode.p.snps.vcf")


new.file<-"PLINK/plink.vcf.gz"

vcf@fix[,1]<-paste("contig_",vcf@fix[,1],sep="")

write.vcf(vcf, file = new.file, mask = FALSE, APPEND = FALSE)
