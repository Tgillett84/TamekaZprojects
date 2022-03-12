# Load Libraries

library("ggplot2")

quadPlot <- ggplot(nonlinear, aes(x = X1, y=Y1)) + geom_point() + stat_smooth(method = "lm", formula = y ~x + I(x^2), size =1)
quadPlot

quadPlot1 <- ggplot(nonlinear, aes(x = X1, y = Y1)) + geom_point() + 
  stat_smooth(method = "lm", formula = y ~ x + I(x^2), size = 1)
quadPlot1

quadPlot2 <- ggplot(nonlinear, aes(x = X2, y=Y2)) + geom_point() + stat_smooth(method = "lm", formula = y ~x + I(x^2), size =1)
quadPlot2

X1q <- nonlinear$X1^2

quadModel <- lm(nonlinear$Y1~non$X1+X1q)
quadModel <- lm(nonlinear$Y1~nonlinear$X1+X1q)
summary(quadModel)

exMod <- lm(log(nonlinear$Y1)~nonlinear$X1)
summary(exMod)

