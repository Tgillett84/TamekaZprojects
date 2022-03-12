# Load Libraries

library("rcompanion")
library("fastR2")
library("car")
library("dplyr")


# There are over 40 entries so I can move forward to wrangle

breakfast1 <- breakfast[1:33,1:7]

keeps <- c("Participant.Code", "Treatment.Group", "Age..y.", "Sex", "Height..m.", "Baseline.Body.Mass..kg.", "Follow.Up.Body.Mass..kg.")
breakfast2 <- breakfast1[keeps]

breakfast3 <- breakfast2[,1:5]
breakfast3$repdat <- breakfast2$Baseline.Body.Mass..kg.
breakfast3$contrasts <- "T1"

breakfast4 <- breakfast2[,1:5]
breakfast4$repdat <- breakfast2$Follow.Up.Baseline.Body.Mass..kg.
breakfast4$contrasts <- "T2"

breakfast5 <- rbind(breakfast3, breakfast4)

plotNormalHistogram(breakfast1$Baseline.Body.Mass..kg.)
plotNormalHistogram(breakfast1$Follow.Up.Body.Mass..kg.)

leveneTest(repdat ~ Treatment.Group*contrasts, data=breakfast5)

RManova3 <- aov(repdat~(Treatment.Group*contrasts)+Error(Participant.Code/(contrasts)), breakfast5)
summary(RManova3)


