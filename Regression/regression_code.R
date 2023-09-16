
# Multiple Linear Regression

# y = a + b1.x1 + b2.x2 + b3.x3 + ....

# Problem: Create linear model to represent
# size (length) of fish as a function of
# age (days) and temperature of water (degree C)

# Linear model:

# Length = b1*age + b2*temperature

# Data: Helmut Spaeth,Mathematical Algorithms 
# for Linear Regression (1991)



# Read data ----
fish <- read.csv("fish.csv")


# Perform regression using lm() ----

reg <- lm(length ~ age + temp + 0, data = fish)

# Check summary of regression ----
# (1) Estimated coefficients
# (2) Adjusted R-squared
# (3) t-test for each coefficient
# (4) ANOVA

summary(reg)

# confidence interval for each coefficient ----

confint(reg)



