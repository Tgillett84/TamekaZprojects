# Load packages

library("dplyr")
library("rcompanion")
library("car")
library("ggplot2")
library("IDPmisc")

plotNormalHistogram(avocados$`AveragePrice`) 

plotNormalHistogram(avocados$region) 

avocados$AveragePriceSQRT <- sqrt(avocados$AveragePrice)

plotNormalHistogram(avocados$AveragePriceSQRT) 

# This histogram has a beautiful bell curve. I dont know if its my scoliosis or not, but maybe it has a positive correlation...I'll check with LOG

avocados$AveragePriceLOG <- log(avocados$AveragePrice)
plotNormalHistogram((avocados$AveragePriceLOG))

# Homogeneity of Var.
bartlett.test(AveragePriceSQRT ~ region, data=avocados)
# The P-value is under 0.05 so it is homogeneity. If it were over then we would continue with the ANOVA test

pairwise.t.test(avocados$AveragePriceSQRT, avocados$region, p.adjust="bonferroni", pool.sd = FALSE)
# There is absolutely no data here. The region has nothing to do with the price of avocado's. Who would have known lol

avocadosMeans <- avocados %>% group_by(AveragePrice) %>% summarize(Mean = mean(region(20)))


