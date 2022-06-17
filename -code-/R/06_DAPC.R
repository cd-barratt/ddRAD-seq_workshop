rm(list=ls(all=TRUE))

# Read in .dat file (fstat) format needed by Adegenet package for running DAPC
library(adegenet)
data <- read.fstat("/Users/cb76kecu/Desktop/ddRAD-seq_workshop/data/Exercises_4-8/DAPC/Lflav.dat")

length(indNames(data))


grp <- find.clusters(data, max.n.clust = 10, n.pca = 59, choose.n.clust = FALSE,
    criterion = "min")
# the last 3 arguments here have automated this, highly recommended to remove
# these and do it interactively in R by looking at the resulting plots Advice:
# number of PCs to retain - here say (number of individuals - 1 to maximise the
# information initially) number of clusters - here select a sensible lowest
# BIC. In our case we automatically select 4 (min) because the elbow is very
# clear, in other datasets this my not be the case...

head(grp$Kstat)  # BIC scores per k
grp$stat  # Best k based on BIC
head(grp$grp, 59)  # Group membership (based on your defined number of clusters)
grp$size  # Group size per k cluster

x <- as.data.frame(grp$Kstat)
png(filename = "/Users/cb76kecu/Desktop/ddRAD-seq_workshop/outputs/Exercise_6/DAPC_Results_BIC_scores.png",
    type = "quartz", height = 8, width = 8, units = "in", res = 300)
plot(x$`grp$Kstat`, pch = 19, col = "black", cex = 0.25, xlab = "k clusters", ylab = "Bayesian Information Criterion",
    main = "BIC across k")
lines(x$`grp$Kstat`, lty = 1, lwd = 1.5, col = "steelblue2")
dev.off()

# now do the DAPC
dapc1 <- dapc(data, grp$grp, n.pca = 5, n.da = 3)
# same as above, this is usually interactive - the last 2 arguments here have
# automated this, highly recommended to remove these and do it interactively in
# R by looking at the resulting plots Advice: number of PCs to retain - now we
# can be more selective, pick a number where the initial curve of the plot
# starts to slow (in our case 4 or 5) number of discriminant functions to
# retain - always more than one - general rule is to take anything which is
# quite a lot higher than 0, so in this case say 3. If our eigenvalues here
# showed two big bars and then a very small one we would take 2. More details
# on how to interpret and select are found here:
# https://adegenet.r-forge.r-project.org/files/tutorial-dapc.pdf

#plot
myCol <- c("blue", "turquoise", "darkblue", "lightblue")
png("/Users/cb76kecu/Desktop/ddRAD-seq_workshop/outputs/Exercise_6/DAPC_Lflavomaculatus.png",
    width = 500, height = 500)
scatter(dapc1, scree.da = TRUE, scree.pca = FALSE, bg = "white", pch = 20, cell = 2,
    cstar = 1, col = myCol, solid = 1, cex = 1.5, clab = 0, leg = TRUE, txt.leg = paste("Cluster",
        1:4))
dev.off()

