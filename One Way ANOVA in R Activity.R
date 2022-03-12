# Load packages

library("dplyr")
library("rcompanion")
library("car")
library("ggplot2")
library("IDPmisc")

# Video.views ~ Grade
# Test for all assumptions and correct for them if necessary
plotNormalHistogram(YouTubeChannels$`Video views`) 
YouTubeChannels$'Video views'SQRT <- sqrt(YouTubeChannels$'Video views')
YouTubeChannels$Video.viewsSQRT <- sqrt(YouTubeChannels$Video.views)
plotNormalHistogram(YouTubeChannels$Video.viewsSQRT)


# Getting error messages. Its not processing SQRT so I'll try in LOG

plotNormalHistogram(YouTubeChannels$Grade)
YouTubeChannels$GradeSQRT <- sqrt(YouTubeChannels$Grade)


# Run the appropriate ANOVA based on your assumptions
YouTubeChannels$`Video views`LOG <- log(YouTubeChannels$'Video views')

YouTubeChannels$Video.viewsLOG <- log(YouTubeChannels$Video.views)
plotNormalHistogram(YouTubeChannels$`Video views`LOG)


# Homogeneity of Variance
bartlett.test(Video.viewsSQRT ~ Grade, data=YouTubeChannels)
# Does not meet the assumption for homogeneity of variance

# Do the Test, with unequal variance
ANOVA1 <- lm(Video.viewsSQRT ~ Grade, data=YouTubeChannels)
Anova(ANOVA1, Type="II", white.adjust=TRUE)

# Do the Post Hocs with unequal variance
pairwise.t.test(YouTubeChannels$Video.viewsSQRT, YouTubeChannels$Grade, p.adjust="bonferroni", pool.sd = FALSE)

# Find means and draw conclusions
YouTubeChannelsMeans <- YouTubeChannels %>% group_by(Grade) %>% summarize(Mean = mean(Video.views))
# All grades significantly differ from all other grades in the number of views they receive, with the higher grades typically getting more views. 