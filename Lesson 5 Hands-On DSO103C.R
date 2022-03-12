library("corpcor")
library("GPArotation")
library("psych")
library("IDPmisc")

# Data Wrangle columns

studentSurvey1 <- studentSurvey[, 31:42]

studentSurvey2 <- NaRV.omit(studentSurvey1)


# Absence of Multicollinearity correlations

studentSurvey2Matrix <- cor(studentSurvey2)

View(round(studentSurvey2, 2))

# Bartlett's Test

cortest.bartlett(studentSurvey2)

det(studentSurvey2Matrix)

pcModel <-principal(studentSurvey2, nfactors = 12, rotate = "none")
pcModel
plot(pcModel$values, type="b")