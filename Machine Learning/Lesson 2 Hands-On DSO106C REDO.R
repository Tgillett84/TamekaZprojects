# Load libraries

library("caret")
library("magrittr")
library("dplyr")
library("tidyr")
library("lmtest")
library("popbio")
library("e1071")

minerals$GoldYN<-NA
minerals$GoldYN[minerals$Gold]=='[0,0']<-0
minerals$GoldYN[minerals$Gold]=='[1,1']<-1

colnames(minerals)[1] <- "Antimony"
colnames(minerals)[0] <- "Gold"


Reviews <- NaRV.omit(minerals)

mylogit <- glm(HelpfulYN~overall, data=Reviews, family = "binomial")

minerals$GoldR <- NA
minerals$GoldR[Gold$0,1==0] <- 0
minerals$GoldR[Gold$0,1==1] <- 1

mylogit <- glm(GoldR ~ Gold.Count, data=minerals, family="binomial")

mylogit = glm(Gold ~ Antimony, data = minerals, family = binomial)
summary(mylogit)


probabilities <- predict(mylogit, type = "response")
minerals$Predicted <- ifelse(probabilities > .5, "pos", "neg")

minearls2 <- minerals
minearls2$prediction <- round(probabilities)
table(minearls2$prediction, minearls2$Gold)


minerals$GoldR <- NA
minerals$GoldR[Reviews$Predicted == 'pos'] <- 1
minerals$GoldR[Reviews$Predicted == 'neg'] <- 0

Reviews$PredictedR <- as.factor(Reviews$PredictedR)
Reviews$GoldR <- as.factor(Reviews$GoldYN)

conf_matrix <- caret::confusionMatrix(Reviews$GoldR, Reviews$GoldYN)
conf_matrix

minerals$Predicted= as.factor(minerals$Predicted)
minerals$Gold <- as.factor(minerals$Gold)

CM <- caret::confusionMatrix(minerals$Predicted, minerals$Gold)
CM


Reviews1 <- Reviews %>% dplyr::select_if(is,numeric)
predictors <- colnames(Reviews1)

Reviews2 <- Reviews1 %>%
  mutate(logit=log(probabilities/(1-probabilities))) %>%
  gather(key= "predictors", value="predictor.value", -logit)

ggplot(Reviews2, aes(logit, predictor.value)) +
  geom_point(size=.5, alpha=.5) +
  geom_smooth(method="loess") +
  theme_bw() +
  facet_wrap(~predictors, scales="free_y")

# all numeric already
minerals1 <- minerals %>% dplyr::select_if(is.numeric)

predictors = colnames(minerals1)

minerals1 <- minerals1 %>% mutate(logit=log(probabilities/(1-probabilities))) %>% gather(key="predictors", value="predictor.value", -logit)

ggplot(minerals1, aes(logit, predictor.value))+
  geom_point(size=.5, alpha=.5)+
  geom_smooth(method="loess")+
  theme_bw()+
  facet_wrap(~predictors, scales="free_y")


plot(mylogit$residuals)

dwtest(mylogit, alternative = "two.sided")

infl <- influence.measures(mylogit)
summary(infl)

logi.hist.plot(Reviews$overall, Reviews$GoldYN, boxp=False, type="hist", col="gray")





