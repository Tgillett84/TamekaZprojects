# Load libraries

library("rcompanion")
library("fastR2")
library("car")

# Remove extra rows
breakfast1 <- breakfast[1:33,]

# Reshape data
# I condensed keeps down to the sex column because I kept getting error codes and it still isn't working...

keeps <- c("Participant.Code", "Treatment Group", "Age y.", "Sex")
breakfast2 <- breakfast1[keeps]

keeps <- c("Participant.Code", "Treatment.Group", "Age..y.", "Sex", "Height..m.", "Baseline.Resting.Metabolic.Rate..kcal.d.", "Follow.Up.Resting.Metabolic.Rate..kcal.d.")
breakfast2 <- breakfast1[keeps]

# Why do I keep getting these errors?