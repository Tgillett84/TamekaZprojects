# Load Libraries

library("rcompanion")
library("fastR2")
library("car")
library("dplyr")
library("IDPmisc")

Temp1_suicide1 <- Temp1_suicide[0:8]

keeps <- c("country", "year", "sex", "age", "suicides.no.", "population", "suicides.100k.pop", "country.year")
Temp1_suicide2 <- Temp1_suicide1[keeps]

Temp1_suicide3 <- Temp1_suicide2[,1:5]
Temp1_suicide3$repdat <- Temp1_suicide2$suicides.100k.pop
Temp1_suicide3$contrasts <- "TI"

Temp1_suicide4 <- Temp1_suicide2[,1:5]
Temp1_suicide4$repdat <- Temp1_suicide2$"year"
Temp1_suicide4$contrasts <- "T2"

Temp1_suicide5 <- rbind(Temp1_suicide3, Temp1_suicide4)

plotNormalHistogram(Temp1_suicide1$suicides.100k.pop)
plotNormalHistogram(Temp1_suicide1$year)
plotNormalHistogram(Temp1_suicide$generation)

leveneTest(repdat ~ suicides.100k.pop*year, data=Temp1_suicide5)

RManova3 <- aov(repdat~(suicides.100k.pop*contrasts)+Error(year/(contrasts)), Temp1_suicide5)
summary(RManova3)

