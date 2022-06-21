# Estimating genetic diversity and population information from short read (ddRAD-seq) type data

Date & time: June 20-21 2022 (09:00-15:00)

Location: German Centre for Integrative Biodiversity Research (iDiv), Puschstrasse 4, 04103, Leipzig. Room: Beehive (Ground floor)

Teachers: [Chris Barratt](https://cd-barratt.github.io/) & [Laura Mendez Cuellar](https://www.idiv.de/en/profile/1062.html), sDiv and Evolution and Adaptation (iDiv)

[Course summary](https://www.idiv.de/en/ydiv/graduate-school/courses-and-events/estimating-genetic-diversity-and-population-information-from-short-read-ddrad-seq-type-data.html) | 
[Course website](https://cd-barratt.github.io/ddRAD-seq_workshop/)
All powerpoint slides available [here](https://github.com/cd-barratt/ddRAD-seq_workshop/tree/main/talks)

\

### Schedule 
Day 1 (20th June): 09:00 - 15:00  

* Brief introductions and research topics of course leaders and course participants (2-3 mins each)

* Introductory lecture on population genomics and ddRAD-seq and which kinds of questions can be answered with these data

* Hands on session for downloading publicly available genomic data (e.g. from the European Nucleotide Archive) - using [*Myotis escalerai*](https://www.eurobats.org/about_eurobats/protected_bat_species/myotis_escalerai) data (a European bat species)

* Stacks 2 lecture (main processing steps)

* Hands on session for each of the major processing steps required for the Stacks pipeline (process_radtags, denovo_map) - using [*Hyphaene coriacea*](https://www.palmpedia.net/wiki/Hyphaene_coriacea) data (an African  palm)

\

Day 2 (21st June): 09:00 - 15:00 

Hands on sessions to analyse population structure, phylogeny and genetic diversity - using [*Leptopelis flavomaculatus*](https://amphibiaweb.org/species/3649) data (an African treefrog):

* Admixture (pop structure)

* sNMF (pop structure)

* DAPC (pop structure)

* RAxML (phylogenetic relationships)

* F-stats (FST, genetic diversity)

\ 
\

### Before the course, please:

* Bring your own computer and know how to use it

* Ensure you have working access to the UFZ EVE cluster and have a basic understanding of the job queuing system (i.e. how to submit jobs)

* Also an interface for file transfer would be useful - e.g. FileZilla, CyberDuck - see [here](https://portal.idiv.de/nextcloud/index.php/s/oyP3FSFfwnKwiy9)

* Install [R](https://cran.r-project.org/bin/) (at least version 4) and [Rstudio](https://www.rstudio.com/products/rstudio/download/#download) on your computer
* Read the course literature (see below)

\

Please [contact us](mailto:c.d.barratt@gmail.com, mailto:laura.mendezcue@gmail.com) if you have any questions!

\
\

### Objectives
1.	Understand best practices on planning and executing a population genomics project based on ddRAD-seq (short read) type data 

2.  Learn how to download genomic sequence data from the European Nucleotide Archive

3.	Familiarise yourself with the Stacks 2 bioinformatic pipeline to process raw reads 

4.	Be able to generate your own output files after Stacks processing for downstream analyses of population structure, phylogeny and genetic diversity

5.  Run analyses to perform (Admixture, sNMF, DAPC, RAxML, F-statistics), understand what you've done and how to interpret the outputs

\
\

### Background

The reduction in costs for genomic data generation has reduced drastically in recent years. This cost reduction has led to the large-scale adoption of ddRAD-seq as a method for denovo Single Nucleotide Polymorphism (SNP) discovery in non-model organisms, where thousands of molecular markers can be used to answer ecological, evolutionary and conservation questions that were previously not possible to answer.

In this course you'll learn how to plan a ddRAD-seq style project effectively, learn the data types, how to analyse them and what the outputs mean. There's also the chance to analyse your own data (if you already have it) and earn an extra 0.5 ECTS.

\
\


### Literature 

Andrews et al 2016. [Harnessing the power of RADseq for ecological and evolutionary genomics](https://www.nature.com/articles/nrg.2015.28)

Rochette et al. 2019. [Stacks 2: Analytical methods for paired-end sequencing improve RADseq-based population genomics](https://onlinelibrary.wiley.com/doi/abs/10.1111/mec.15253)

Paris et al. 2017. [Lost in parameter space: a road map for stacks](https://besjournals.onlinelibrary.wiley.com/doi/10.1111/2041-210X.12775)

Rochette and Catchen 2017. [Deriving genotypes from RAD-seq short-read data using Stacks](https://www.nature.com/articles/nprot.2017.123)

Cerca et al. 2021. [Removing the bad apples: A simple bioinformatic method to improve loci-recovery in de novo RADseq data for non-model organisms](https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/2041-210X.13562)

\
\

### Datasets

Barratt et al. 2018. [Vanishing refuge? Testing the forest refuge hypothesis in coastal East Africa using genome-wide sequence data for seven amphibians](https://onlinelibrary.wiley.com/doi/full/10.1111/mec.14862)

Razgour et al. 2019. [Considering adaptive genetic variation in climate change vulnerability assessment reduces species range loss projections](https://www.pnas.org/doi/10.1073/pnas.1820663116)

Mendez et al. (in prep)

