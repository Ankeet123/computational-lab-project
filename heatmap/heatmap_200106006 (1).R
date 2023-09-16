# 1. Heatmap

#read data file 
exp.data <- read.csv("exp.csv", row.names = 1, header = TRUE)

#create data matrix
d <- data.matrix(exp.data, rownames.force = TRUE)

heatmap(d[6:15, 1:10], Colv = NA, scale = "column", xlab = "Samples",
        ylab = "Gene probes", margins = c(6, 8))
