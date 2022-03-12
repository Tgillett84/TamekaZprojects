# Load Packages

library("mvnormtest")
library("car")
library("IDPmisc")

# How does gender (sex) influence some of the heart attack predictors like resting blood pressure (trestbps) and cholesterol (chol)?

# IV/CV -- sex
# 2 DV/CONTINUOUS V -- trestbps, chol

str(heartAttacks$trestbps)
str(heartAttacks$chol)

heartAttacks$trestbps <- as.numeric(heartAttacks$trestbps)
heartAttacks$chol <- as.numeric(heartAttacks$chol)
heartAttacks$sex <- as.numeric(heartAttacks$sex)

# both are numeric

keep <- c("trestbps", "chol")
heartAttacks1 <- heartAttacks[keep]

heartAttacks2 <- heartAttacks1[1:5000,]

# make into matrix

heartAttacks3 <- as.matrix(heartAttacks2)

mshapiro.test(t(heartAttacks3))

leveneTest(trestbps ~ sex, data=heartAttacks)
#this dependent variable DOES NOT violate this assumptiom

leveneTest(chol ~ sex, data=heartAttacks) 
#this dependent variable VIOLATES this assumptiom

cor.test(heartAttacks$trestbps, heartAttacks$chol, method="pearson", use="complete.obs")

MANOVA <- manova(cbind(trestbps, chol()) ~ sex, data = heartAttacks)
summary(MANOVA)

summary.aov(MANOVA, test = "wilks") 


