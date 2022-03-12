
# Flip the dataset
energy1 <- t(energy)

#Name the Columns
class(energy1)

#Turn into a data frame
energy2 <- as.data.frame(energy1)

class(energy2)

#Change column names
names(energy2) <- gsub("V", "Year", names(energy2))

view(energy2)

#Reverse it back to the other format
t()

