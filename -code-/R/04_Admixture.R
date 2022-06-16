rm(list=ls(all=TRUE))

results <- read.delim("/Users/cb76kecu/Desktop/ddRAD-seq_workshop/outputs/Exercise_4/RESULTS_Leptopelis_flavomaculatus_admixture_clean.txt",
    sep = " ", header = FALSE)
    
# plot CV scores
par(mar = c(2, 2, 2, 2))
png(filename = "/Users/cb76kecu/Desktop/ddRAD-seq_workshop/outputs/Exercise_4/Admixture_Results_CV_scores.png",
    type = "quartz", height = 8, width = 8, units = "in", res = 300)
plot(results, pch = 19, col = "black", cex = 0.25, xlab = "k clusters", ylab = "CV score",
    main = "Cross validation scores across k (Admixture")
lines(results, lty = 1, lwd = 1.5, col = "steelblue2")
dev.off()

# plot bars
tbl = read.table("/Users/cb76kecu/Desktop/ddRAD-seq_workshop/outputs/Exercise_4/Lflav.4.Q")
ord = tbl[order(tbl$V1, tbl$V3, tbl$V2, tbl$V4), ]
png(filename = "/Users/cb76kecu/Desktop/ddRAD-seq_workshop/outputs/Exercise_4/Admixture_Results_Barplot.png",
    type = "quartz", height = 8, width = 30, units = "in", res = 300)
labels <- read.csv("/Users/cb76kecu/Desktop/ddRAD-seq_workshop/data/Exercises_4-8/Admixture/pop_labels.csv",
    header = FALSE)
labels <- data.frame(labels[, 1])
ord_with_labels <- data.frame(ord[, 1:4], row.names = labels[, 1])
par(mar = c(20, 4, 1, 1))
bp = barplot(t(as.matrix(ord_with_labels)), space = (0.04), col = c("blue", "turquoise",
    "darkblue", "lightblue"), xlab = "", ylab = "Ancestry", border = 1, las = 2,
    cex.names = 0.9)
dev.off()

# label order for export to sNMF
ord_labels <- row.names(ord_with_labels)
ord_labels <- as.data.frame(ord_labels)
write.csv(ord_labels, '../sNMF/ord_labels_sNMF.csv', row.names=FALSE)


