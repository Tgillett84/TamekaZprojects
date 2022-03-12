# Load libraries

library("rcompanion")
library("IDPmisc")

# of trips Fall
plotNormalHistogram(Seattle_ParksnRec$NumTripsFall)
Seattle_ParksnRec$NumTripsFallSQRT <- sqrt(Seattle_ParksnRec$NumTripsFall)
plotNormalHistogram(Seattle_ParksnRec$NumTripsFallSQRT)

# of participants Fall
plotNormalHistogram(Seattle_ParksnRec$'Fall NumPartFall')

# of trips per Year
plotNormalHistogram(Seattle_ParksnRec$NumTripsYear)
Seattle_ParksnRec$NumTripsYearSQRT <- sqrt(Seattle_ParksnRec$NumTripsYear)
plotNormalHistogram(Seattle_ParksnRec$NumTripsYearSQRT)

# participants per Year
plotNormalHistogram(Seattle_ParksnRec$NumPartPerYear)
Seattle_ParksnRec$NumPartPerYearSQRT <- sqrt(Seattle_ParksnRec$NumPartPerYear)
plotNormalHistogram(Seattle_ParksnRec$NumPartPerYearSQRT)

Seattle_ParksnRec$NumPartPerYearSQ <- Seattle_ParksnRec$NumPartPerYear * Seattle_ParksnRec$NumPartPerYear
plotNormalHistogram(Seattle_ParksnRec$NumPartPerYearSQ)

Seattle_ParksnRec$NumPartPerYearBltCUBE <- Seattle_ParksnRec$NumPartPerYearBlt ^3
plotNormalHistogram(Seattle_ParksnRec$NumPartPerYearBltCUBE)

# increase/decrease of prior year
plotNormalHistogram(Seattle_ParksnRec$IncDecPriorYear)
Seattle_ParksnRec$IncDecPriorYearSQRT <- sqrt(Seattle_ParksnRec$IncDecPriorYear)
plotNormalHistogram(Seattle_ParksnRec$IncDecPriorYearSQRT)

# Average # people per trip
plotNormalHistogram((Seattle_ParksnRec$AVGNumPeoplePerTrip))
Seattle_ParksnRec$AVGNumPeoplePerTripSQRT <- sqrt(Seattle_ParksnRec$AVGNumPeoplePerTrip)
plotNormalHistogram(Seattle_ParksnRec$AVGNumPeoplePerTripSQRT)

Seattle_ParksnRec$AVGNumPeoplePerTripLOG <- log(Seattle_ParksnRec$AVGNumPeoplePerTrip)

Seattle_ParksnRec2 <- NaRV.omit(Seattle_ParksnRec)
plotNormalHistogram(Seattle_ParksnRec2$AVGNumPeoplePerTripLOG)
plotNormalHistogram(Seattle_ParksnRec2$AVGNumPeoplePerTrip)

Seattle_ParksnRec2$AVGNumPeoplePerTrip.SG.TotalSQ <- Seattle_ParksnRec2$AVGNumPeoplePerTrip.SG.TotalSQ * Seattle_ParksnRec2$AVGNumPeoplePerTrip.SG.TotalSQ

plotNormalHistogram((Seattle_ParksnRec2$AVGNumPeoplePerTrip.SG.Total))
