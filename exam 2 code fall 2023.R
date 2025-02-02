##Pepsi

# A 2^2 factorial design was executed to observe the effects of operating pressure and % carbonation
# on fill height of a Pepsi bottle
# Factor levels are coded


library(dplyr)
library(car)
library(effectsize)

data=pepsi

data$carbonation=as.factor(data$carbonation)
data$pressure=as.factor(data$pressure)

####################
#Analysis of 2x2 factorial with n=3 replications

model1=aov(fill_height~carbonation*pressure, data=data)
summary(model1)

TukeyHSD(model1, conf.level=.95)

##Effect sizes 
omega_squared(model1)

####################
#Analysis of 2x2 factorial treating replication as a blocking variable
model2=aov(fill_height~carbonation+pressure+carbonation*pressure+block, data=data)
summary(model2)

#####################
#sample means and sd
means=data %>%
  group_by(carbonation, pressure) %>%
  summarise(mean=mean(fill_height), sd=sd(fill_height))

means

#####################
#Boxplots for outliers
boxplot(fill_height~carbonation+pressure, data=data)


#####################
#residual analysis for model 1

#Versus fits plot
plot(predict(model1), resid(model1))

#Shapiro-Wilk test for normality of residuals
shapiro.test(resid(model1))  



