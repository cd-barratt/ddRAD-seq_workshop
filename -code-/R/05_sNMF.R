rm(list=ls(all=TRUE))

# Read in ped file, convert to .geno format needed by LEA package for sNMF
library(LEA)

data = read.table("/Users/cb76kecu/Desktop/ddRAD-seq_workshop/data/Exercises_4-8/sNMF/Lflav.ped")
output = ped2geno("/Users/cb76kecu/Desktop/ddRAD-seq_workshop/data/Exercises_4-8/sNMF/Lflav.ped")
geno <- read.geno("/Users/cb76kecu/Desktop/ddRAD-seq_workshop/data/Exercises_4-8/sNMF/Lflav.geno")
  
# Run snmf to look at structure
k_range <- 1:10
geno.snmf <- snmf(("/Users/cb76kecu/Desktop/ddRAD-seq_workshop/data/Exercises_4-8/sNMF/Lflav.geno"),
    K = k_range, entropy = T, ploidy = 2, rep = 5, project = "new")
      
# plot CV scores
sumpr2 <- summary(geno.snmf)$crossEntropy
sumpr <- sumpr2[2, ]

par(mar = c(2, 2, 2, 2))
png(filename = "/Users/cb76kecu/Desktop/ddRAD-seq_workshop/outputs/Exercise_5/sNMF_Results_CV_scores.png",
    type = "quartz", height = 8, width = 8, units = "in", res = 300)
plot(sumpr, lty = 2, lwd = 1.5, col = "black", pch = 19, cex = 0.5, xlab = "k clusters",
    ylab = "CV score", main = "Cross validation scores across k (sNMF)")
lines(sumpr, lwd = 2, col = "steelblue2")
dev.off()

# Choose K with lowest mean cross entropy
K <- c(1:10)[which.min(sumpr2[2, ])]  # K=4
# Get the cross-entropy of each run for K
ce <- cross.entropy(geno.snmf, K = K)
# Select the run with the lowest cross-entropy
best <- which.min(ce)
best
  
# Population assignment based on Q values (needed later for BayEnv2). Simply assigns ind to pop with highest Q
Q_vals <- Q(geno.snmf, K = K, run = best)
sample_names <- data[, 2]
pop_assignment <- as.data.frame(cbind(sample_names, Q_vals))

ord = pop_assignment[order(pop_assignment$V4, pop_assignment$V1, pop_assignment$V2,
    pop_assignment$V3), ]
rownames(ord) <- ord$sample_names
ord <- ord[, 2:5]

par(mar = c(10, 4, 1, 1))
bp = barplot(t(as.matrix(ord)), space = (0.04), col = c("blue", "turquoise", "darkblue",
    "lightblue"), xlab = "", ylab = "Ancestry", border = 1, las = 2, cex.names = 0.9)

# match ord_labels to the pop_assignment
# match ord_labels to the pop_assignment
ord_labels <- read.csv("/Users/cb76kecu/Desktop/ddRAD-seq_workshop/data/Exercises_4-8/sNMF/ord_labels_sNMF.csv")
ord_labels_sample_name_only <- as.data.frame(ord_labels)
colnames(ord_labels_sample_name_only) <- "sample_name_only"
ord_labels_sample_name_only <- substr(ord_labels_sample_name_only$sample_name_only,
    1, 5)
ord_labels_sample_name_only <- as.data.frame(ord_labels_sample_name_only)
ord_labels <- cbind(ord_labels, ord_labels_sample_name_only)

# now sort pop_assignment based on order in ord_labels$sample_name_only

sorted_pop_assignment <- pop_assignment[order(match(pop_assignment[, 1], ord_labels_sample_name_only[,
    1])), ]
row.names(sorted_pop_assignment) <- sorted_pop_assignment$sample_names
sorted_pop_assignment <- sorted_pop_assignment[, 2:5]

# plot the sNMF barplot for comparison with Admixture
bp = barplot(t(as.matrix(sorted_pop_assignment)), space = (0.04), col = c("blue",
    "lightblue", "turquoise", "darkblue"), xlab = "", ylab = "Ancestry", border = 1,
    las = 2, cex.names = 0.9)

# save
png(filename = "/Users/cb76kecu/Desktop/ddRAD-seq_workshop/outputs/Exercise_5/sNMF_Results_Barplot.png",
    type = "quartz", height = 8, width = 30, units = "in", res = 300)
bp = barplot(t(as.matrix(sorted_pop_assignment)), space = (0.04), col = c("blue",
    "lightblue", "turquoise", "darkblue"), xlab = "", ylab = "Ancestry", border = 1,
    las = 2, cex.names = 0.9)
dev.off()




 