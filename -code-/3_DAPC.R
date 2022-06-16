rm(list=ls(all=TRUE))

setwd('/Users/cb76kecu/Desktop/Workshop_with_Laura/L_flavomaculatus/Outputs/DAPC/')

#install.packages(adegenet)
library(adegenet)
library(LEA)


data <- read.fstat('/Users/cb76kecu/Desktop/Workshop_with_Laura/L_flavomaculatus/Outputs/DAPC/Lflavomaculatus.dat')

length(indNames(data)) # number of individuals
grp <- find.clusters(data, max.n.clust=10, n.pca=59, choose.n.clust = FALSE, criterion = "min") # the last 3 arguments here have automated this, highly recommended to remove these and do it interactively in R by looking at the resulting plots
# the last 3 arguments here have automated this, highly recommended to remove these and do it interactively in R by looking at the resulting plots
# Advice:
# number of PCs to retain - here say (number of individuals - 1 to maximise the information initially)
# number of clusters - here select a sensible lowest BIC. In our case we automatically select 4 (min) because the elbow is very clear, in other datasets this my not be the case...


head(grp$Kstat, 10) # BIC scores per k
grp$stat # Best k based on BIC
head(grp$grp, 59) # Group membership (based on your defined number of clusters)
grp$size # Group size per k cluster

# now do the DAPC
dapc1 <- dapc(data, grp$grp) # try 5 (top of curve), 3 eigenvalues
# same as above, this is usually interactive - the last 2 arguments here have automated this, highly recommended to remove these and do it interactively in R by looking at the resulting plots
# Advice:
# number of PCs to retain - now we can be more selective, pick a number where the initial curve of the plot starts to slow (in our case 4 or 5)
# number of discriminant functions to retain - always more than one - general rule is to take anything which is quite a lot higher than 0, so in this case say 3. If our eigenvalues here showed two big bars and then a very small one we would take 2. More details on how to interpret and select are found here: https://adegenet.r-forge.r-project.org/files/tutorial-dapc.pdfmyCol <- c("blue","turquoise","lightblue", "darkblue")

png("./Lflavomaculatus_DAPC.png",width=500,height=500)
scatter(dapc1, scree.da=FALSE, scree.pca=FALSE, bg="white", pch=20, cell=0, cstar=0, col=myCol, solid=1, cex=1.5, clab=0, leg=FALSE, txt.leg=paste("Cluster",1:4))
dev.off()


