# Load libraries

library("rcompanion")
library("IDPmisc")

# Plot Histograms from continuous variables
plotNormalHistogram(cruise_ship$YearBlt)
plotNormalHistogram(cruise_ship$Tonnage)
plotNormalHistogram(cruise_ship$passngrs)
plotNormalHistogram(cruise_ship$Length)
plotNormalHistogram(cruise_ship$Cabins)
plotNormalHistogram(cruise_ship$Crew)
plotNormalHistogram(cruise_ship$PassSpcR)
plotNormalHistogram(cruise_ship$outcab)

# Try Squaring

cruise_ship$TonnageSQRT <- sqrt(cruise_ship$Tonnage)
cruise_ship$passngrsSQRT <- sqrt(cruise_ship$passngrs)
cruise_ship$CabinsSQRT <- sqrt(cruise_ship$Cabins)
cruise_ship$CrewSQRT <- sqrt(cruise_ship$Crew)
cruise_ship$PassSpcRSQRT <- sqrt(cruise_ship$PassSpcR)
cruise_ship$outcabSQRT <- sqrt(cruise_ship$outcab)

# Third test

plotNormalHistogram(cruise_ship$TonnageSQRT)
plotNormalHistogram(cruise_ship$passngrsSQRT)
plotNormalHistogram(cruise_ship$CabinsSQRT)
plotNormalHistogram(cruise_ship$CrewSQRT)
plotNormalHistogram(cruise_ship$PassSpcRSQRT)
plotNormalHistogram(cruise_ship$outcabSQRT)

# TrBltSQ step

cruise_ship$YearBltSQ <- cruise_ship$YearBlt * cruise_ship$YearBlt
cruise_ship$LengthSQ <- cruise_ship$Length * cruise_ship$Length

# Test the histo again

plotNormalHistogram(cruise_ship$YearBltSQ)
plotNormalHistogram(cruise_ship$LengthSQ)


cruise_ship$YearBltCUBE <- cruise_ship$YearBlt ^3

plotNormalHistogram(cruise_ship$YearBltCUBE)

# still looks positively skewed instead of normal. 