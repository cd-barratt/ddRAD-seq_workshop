

rm(list=ls())


################################    Script to plot results for parameter optimization   ##################################################################

## Following Paris et al. 2017

setwd("C:/Users/lm79geda/Dropbox/Dropbox/Work/Teaching/ddRAD - Stacks2/outputs/Exercise_3")

library(ggplot2)

#save.image("optimization_plots.RData")
#load("optimization_plots.RData")

count <- 1
files <- list.files(path = "results.test.denovo", pattern="*_snp_distribution.tsv", full.names = T)
for (i in files[1:9]){
  table <- read.delim(i, skip=1, header=T)
  table$n_loci_percent<- table$n_loci/sum(table$n_loci)
  table$m<- count
  write.table(table, "results.test.denovo/distributions.tsv", append=T, row.names=F, col.names = F)
  snp_count <- data.frame("M"= count, "n_snps"=sum(table$n_loci))
  write.table(snp_count, "results.test.denovo/total_count.tsv", append=T, row.names=F, col.names = F)
  count <- count + 1
}


## Total number of SNPs per M
snp_count<-read.delim("results.test.denovo/total_count.tsv", sep=" ", header=F)
names(snp_count)<-c("M", "n_snps")
snp_count$M<-as.factor(snp_count$M)
ggplot(data=snp_count, aes(x=M, y=n_snps)) +
  geom_point() + theme_classic() + scale_y_continuous(limits = c(0, 26000))

## Histogram of number of SNPs per locus
snp_table<-read.delim("results.test.denovo/distributions.tsv", sep=" ", header=F)
names(snp_table)<- c("n_snps","n_loci", "n_loci_percent", "M") 
snp_table$n_loci_percent<-snp_table$n_loci_percent*100
snp_table$n_snps<-ifelse(snp_table$n_snps < 9, snp_table$n_snps, "9 +")
snp_table$n_snps<-as.factor(snp_table$n_snps)
snp_table$M<-as.factor(snp_table$M)

ggplot(data = snp_table) + 
  geom_col(aes(x=n_snps, y=n_loci_percent, fill=M), position="dodge") + theme_classic()


## Polymorphic loci per M
poly_loci <- read.delim("results.test.denovo/all.polymorphicLOCI_summary.tsv", sep=" ", header=F)
poly_loci$M <- snp_count$M
colnames(poly_loci)[1] <- "n_polymorphic_loci"

ggplot(data=poly_loci, aes(x=M, y=n_polymorphic_loci)) +
  geom_point() + theme_classic() + scale_y_continuous(limits = c(0, 70000))


## Difference in polymorphic loci among Ms

M1.M2 <- (poly_loci$n_polymorphic_loci[2])-(poly_loci$n_polymorphic_loci[1])
M2.M3 <- (poly_loci$n_polymorphic_loci[3])-(poly_loci$n_polymorphic_loci[2])
M3.M4 <- (poly_loci$n_polymorphic_loci[4])-(poly_loci$n_polymorphic_loci[3])
M4.M5 <- (poly_loci$n_polymorphic_loci[5])-(poly_loci$n_polymorphic_loci[4])
M5.M6 <- (poly_loci$n_polymorphic_loci[6])-(poly_loci$n_polymorphic_loci[5])
M6.M7 <- (poly_loci$n_polymorphic_loci[7])-(poly_loci$n_polymorphic_loci[6])
M7.M8 <- (poly_loci$n_polymorphic_loci[8])-(poly_loci$n_polymorphic_loci[7])
M8.M9 <- (poly_loci$n_polymorphic_loci[9])-(poly_loci$n_polymorphic_loci[8])
