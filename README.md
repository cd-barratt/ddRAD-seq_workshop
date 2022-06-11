# Estimating_genetic_diversity_and_population_information_from_short_read_(ddRAD-seq)_type_data

Date & time: June 20-21 2022 (09:00-15:00)

Location: German Centre for Integrative Biodiversity Research (iDiv), Puschstrasse 4, 04103, Leipzig. Room: Beehive (Ground floor)

Teachers: Chris Barratt & Laura Mendez Cuellar, sDiv and Evolution and Adaptation (iDiv)

https://www.idiv.de/en/sdiv.html   https://www.idiv.de/en/groups-and-people/core-groups/evolution-and-adaptation.html 

Course summary: https://www.idiv.de/en/ydiv/graduate-school/courses-and-events/estimating-genetic-diversity-and-population-information-from-short-read-ddrad-seq-type-data.html
Course website: https://github.com/cd-barratt/XXX

# Detailed schedule 
Day 1 (20th June): 09:00 - 15:00  
* Brief introductions and research topics of course leaders and course participants (2-3 mins each)
* Introductory lecture on population genomics and ddRAD-seq and which kinds of questions can be answered with these data
* Hands on session for downloading publicly available genomic data (e.g. from the European Nucleotide Archive)
* Hands on session for each of the major processing steps required for the Stacks 2 pipeline (process_radtags, denovo_map)

Day 2 (21st June): 09:00 - 15:00 
Hands on sessions to analyse population structure, phylogeny and genetic diversity:
* Admixture
* sNMF
* DAPC
* RAxML

# Before the course
Please:

* Please bring your own computer and be able to use it
* Ensure you have working access to the UFZ EVE cluster and have a basic understanding of the job queuing system (i.e. how to submit jobs)
* Install [R](https://cran.r-project.org/bin/) and [Rstudio](https://www.rstudio.com/products/rstudio/download/#download) on your computer
* Read the course [literature](https://github.com/cd-barratt/XXX#literature)

* Open Rstudio and install the necessary dependencies by copying the code below into the R console and running it. 

Please do not hesitate to [contact us](mailto:c.d.barratt@gmail.com, mailto:laura.mendezcue@gmail.com) if you have any questions.


# Installation
Please run the following code (just copy it into the R console) before the course to make sure all dependencies are installed and we can start smoothly.

```
install.packages(c("countrycode", "ConR", "devtools", "ggmap", "mapproj", "maps",
                   "rgbif", "raster", "rnaturalearth", "sp", "tidyverse",
                   "viridis"))

library(devtools)

install_github(repo = "azizka/speciesgeocodeR")
install_github(repo = "azizka/sampbias")
install_github(repo = "azizka/CoordinateCleaner")

XXXXX
```


# Objectives
1.	Understand best practices on planning and executing a population genomics project based on ddRAD-seq (short read) type data 

2.  Learn how to download genomic sequence data from the European Nucleotide Archive

3.	Familiarise yourself with the Stacks 2 bioinformatics pipeline to process raw reads 

4.	Be able to generate your own output files after Stacks 2 processing for downstream analyses of population structure, phylogeny and genetic diveristy

5.  Conduct and understand several of these outputs (Admixture, sNMF, DAPC, RAxML, F-statistics)


# Background
The reduction in costs for genomic data generation has reduced drastically in recent years. This cost reduction has led to the large-scale adoption of ddRAD-seq as a method for denovo Single Nucleotide Polymorphism SNP discovery in non-model organisms, where thousands of molecular markers can be used to answer ecological, evolutionary and conservation questions.
In this course you'll learn how to plan a project effectively, learn the data types, how to analyse them and what the outputs mean


# Literature 
XXXXX
