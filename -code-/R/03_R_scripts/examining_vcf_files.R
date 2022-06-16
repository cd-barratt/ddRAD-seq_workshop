rm(list=ls())


################################    Script to examining basic stats from our vcf files   ##################################################################


setwd("C:/YOURPATH/ddRAD - Stacks2/outputs/Exercise_3/stacks.denovo/VCFtools")


library(tidyverse)

## Variant mean depth
var_depth <- read_delim("mean_depth_site.ldepth.mean", delim = "\t",
                       col_names = c("chr", "pos", "mean_depth", "var_depth"), skip = 1)

summary(var_depth$mean_depth)

# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 1.50    6.50   10.50   14.81   17.00  473.00

a <- ggplot(var_depth, aes(mean_depth)) + geom_density(fill = "dodgerblue1", colour = "black", alpha = 0.3)
a + theme_light() + xlim(0, 100)

## Mean depth per individual

ind_depth <- read_delim("ind_depth.idepth", delim = "\t",
                        col_names = c("ind", "nsites", "depth"), skip = 1)


a <- ggplot(ind_depth, aes(depth)) + geom_histogram(fill = "dodgerblue1", colour = "black", alpha = 0.3)
a + theme_light()

## Missing data per individual

ind_miss  <- read_delim("missing_ind.imiss", delim = "\t",
                        col_names = c("ind", "ndata", "nfiltered", "nmiss", "fmiss"), skip = 1)

a <- ggplot(ind_miss, aes(fmiss)) + geom_histogram(fill = "dodgerblue1", colour = "black", alpha = 0.3)
a + theme_light()


mean(ind_miss$fmiss)


## Heterozygosity and inbreeding coefficient per individual

ind_het <- read_delim("het.het", delim = "\t",
                      col_names = c("ind","ho", "he", "nsites", "f"), skip = 1)


a <- ggplot(ind_het, aes(f)) + geom_histogram(fill = "dodgerblue1", colour = "black", alpha = 0.3)
a + theme_light()

