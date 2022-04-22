##Load Libraries

library("dplyr")
library("rcompanion")
library("car")

##Does the average price of avocados differ between Albany
##Houston, and Seattle? Need AveragePrice and region

head(avocados)

##How many regions?

table(avocados$region)

avo1 <- na.omit(avocados %>% filter(region %in% c("Albany", "Houston", "Seattle"))) # nolint
table(avo1$region)

avo1$AveragePrice <- as.numeric(avo1$AveragePrice) # nolint

##Determine Distribution

plotNormalHistogram(avo1$AveragePrice)

##Only slightly postively skewed will try SQRT

avo1$AveragePriceSQRT <- sqrt(avo1$AveragePrice) # nolint
plotNormalHistogram(avo1$AveragePriceSQRT)

avo1$AveragePriceLOG <- log(avo1$AveragePrice) # nolint
plotNormalHistogram(avo1$AveragePriceLOG)

##Log looks the best but SQRT is less drastic a change

##Test

bartlett.test(AveragePriceSQRT ~ region, data=avo1) # nolint

## P significant  # nolint
fligner.test(AveragePriceSQRT ~ region, data=avo1) # nolint

##P still significant

ANOVA <- lm(AveragePriceSQRT ~ region, data=avo1) # nolint
Anova(ANOVA, Type="II", white.adjust=TRUE) # nolint

##The P value is significant so we can assume region does affect price of avocados # nolint

pairwise.t.test(avo1$AveragePriceSQRT, avo1$region, p.adjust = "bonferroni", pool.sd = FALSE) # nolint

avo1Means = avo1 %>% group_by(region) %>% summarize(Mean = mean(AveragePrice)) # nolint
avo1Means

##The price does vary by region. Albany has an Avg Price of 1.56, Houston 1.05
## and Seattle 1.44