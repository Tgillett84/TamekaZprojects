# Part I: Backwards Elimination

head(iq)

FitAll = lm(Test1 ~ ., data = iq)
summary(FitAll)

step(FitAll, direction = 'backward')

# Which model is the best? Why? lm(formula = Test1 ~ Test2 + Test4 + IQ, data = iq) because there is a none on top and it cannot be worked on any further.

fitsome = lm(Test1 ~ Test2 + Test4 + IQ, data = iq)
summary(fitsome)

# From the best model, what is the adjusted R2 value and what does it mean? 98% of this model is taken into account
# From the best model, how does each variable influence IQ? Only 2% of this model is random error

# Part II: Compare Stepwise Regression Types

head(stepwiseRegression)

stepwiseRegression1 <- stepwiseRegression[,2:13]

# backwward 

FitAll2 = lm(X1 ~ ., data = stepwiseRegression1)
summary(FitAll2)

step(FitAll2, direction = "backward")

# Forward Selection

fitStart2 = lm(X1 ~1, data = stepwiseRegression1)
summary(fitStart2)

# Hybrid

step(fitStart2, direction = "both", scope = formula(FitAll2))

# Interpreting the Final Model

Final <- lm(formula = X1 ~ X10 + X2, data = stepwiseRegression1)
summary(Final)





