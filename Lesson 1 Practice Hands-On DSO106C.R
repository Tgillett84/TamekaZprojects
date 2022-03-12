# lOAD IN lIBRARIES

library("car")
library("caret")
library("gvlma")
library("predictmeans")
library("e1071")
library("lmtest")

# Test for Assumptions/Linearity

scatter.smooth(x=heights$AM_Height, y=heights$PM_Height, main="AM & PM Heights")

# Creating a Linear Model
lmMod <- lm(PM_Height~AM_Height, data=heights)

# Homoscedasticity test

par(mfrow=c(2,2))
plot(lmMod)

lmtest:: bptest(lmMod)

car::ncvTest(lmMod)

distBCMod1 <- caret::BoxCoxTrans(heights$PM_Height)
print(distBCMod1)

heights1 <- cbind(heights, dist_newM=predict(distBCMod1, heights$PM_Height))

lmMod_bc2 <- lm(dist_newM~AM_Height, data=heights1)
lmtest::bptest(lmMod_bc2)

# Testing for Homogeneity of Variance

gvlma(lmMod_bc2)

# Testing for Outliers in X Space

CookD(lmMod, group=NULL, plot=TRUE, idn=3, newwd=TRUE)

# Test for leverage

lev = hat(model.matrix(lmMod))
plot(lev)

heights[lev>.2,]

car::outlierTest(lmMod)

summary(influence.measures(lmMod))

# Interpreting Output

summary(lmMod_bc2)

# Interpreting Non-Transformed Regression Output

summary(lmMod)










