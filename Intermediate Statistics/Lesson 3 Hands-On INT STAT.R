# Load Libraries
# dplyr and gmodels packages loaded

# Does the term of the loan influence loan status? If so, how? The p-value is 0, which makes it significant. It is less than 0.05. The expected values are greater than 5. While only three have std residual's. Therefore the loan influence somewhat has an influence on loan status
# Independent Chi-Square. the two frequencies are unrelated

CrossTable(loans$term, loans$loan_status, chisq = TRUE, expected = TRUE, sresid = TRUE, format = "SPSS")

loans %>% group_by(loan_status) %>% summarise(count=n())

# Part 2 How has the ability to own a home changed after 2009?

loans$DateR <- as.Date(paste(loans$Date), "%m/%d/%Y")
library("gmodels")
library("tidyr")

loans$DateR <- as.Date(paste(loans$Date), "%m/%d/%Y")

loans1 <- separate(loans, DateR, c("Year", "Month", "Day"), sep="-")

loans1$YearR <- NA
loans1$YearR[loans1$Year <= 2009] <- 0
loans1$YearR[loans1$Year > 2009] <- 1

loans1$RentvOwn <- NA
loans1$RentvOwn[loans1$home_ownership == "RENT"] <- 0
loans1$RentvOwn[loans1$home_ownership == "OWN"] <- 1

loans1 %>% group_by(RentvOwn) %>% summarise(count=n())

prop.test(x = 1, n = 21957, p = 0.5, alternative = "two.sided", correct = FALSE)

CrossTable(loans1$RentvOwn, loans1$YearR, fisher=TRUE, chisq.test(t, correct = FALSE), mcnemar = TRUE, expected = TRUE, sresid=TRUE, format="SPSS") 

