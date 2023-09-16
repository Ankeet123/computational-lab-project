train <- read.csv("spider_train.csv")
View(train)
plot(train$size, train$spider, xlab = "Size", ylab = "Spider", pch = 1, cex = 2, col = "red")

logit.size <- glm(spider ~ size, data = train, family = "binomial")

summary(logit.size)

# smaller the AIC, better the data

av = seq(0, 1.0, 0.01)

size.data <- data.frame(av)
names(size.data) <- "size"

#predict values of probability
pv <- predict(logit.size, size.data, type = 'response')

lines(av, pv, col = "blue", lwd = 2)

test <- read.csv('spider_test.csv')
p.test <- predict(logit.size, test, type = 'response')

c.test <- ifelse(p.test > 0.7, 1, 0)

# Create confusion matrix

tab.test <- table(Predicted = c.test, Actual = test$spider)

print(tab.test)

# Sensitivity/ Recall / Hit rate/ True positive rate
# sn = TP/(TP + FN)

sn.test <- tab.test[2,2]/sum(tab.test[ ,2])

print(sn.test)

# Specificity/Selectivity/True Negative Rate:
# Sp = TN/(TN + FP)

sp.test <- tab.test[1,1]/sum(tab.test[ ,1])

print(sp.test)

library(ggplot2)

data <- data.frame(
  probability = c(0.3, 0.5, 0.7),
  sensitivity = c(0.8571429, 0.8571429, 0.4285714)
)

ggplot(data, aes(x = probability, y = sensitivity)) +
  geom_bar(stat = "identity", fill = "steelblue", width = 0.1) +
  labs(x = "Probability", y = "Sensitivity")



