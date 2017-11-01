######################################
### Created by Chaitra Venkatesan ###
### Released under the MIT license ###
### 8086 R Script Deliverable ###
### 11-1-17###
######################################

###################
### Preparation ###
###################

setwd("c://Users/Nisha/Desktop/Data cleaning/")
library(rpart)

d <- read.csv("test.csv")
View(d)

d$Crime_Total <- as.factor(d$Crime_Total)
str(d)
summary(d)


### Decision Tree ###
fit <- rpart(d$Crime_Total ~ Month_Year+NE_Unemployment_Rate+S_P_500_Price_Change+S_P_500_Percent_Gain_or_Loss+Crime_Unknown+
               Crime_Criminal_Homicide+Crime_Death_by_Negligence+Crime_Forcible_Rape+Crime_Robbery+Crime_Larceny+Crime_Aggravated_Assault+
               Crime_Burglary+Crime_Motor_Vehicle_Theft+Crime_Simple_Assault+Crime_Arson+Crime_Embezzlement+Crime_Forgery_and_Counterfeiting+
               Crime_Fraud+Crime_Vandalism+Crime_Weapons+Crime_Stolen_Property+Crime_Prostitution+Crime_Drug_Abuse_Violations+
               Crime_Gambling+Crime_Sex_Offenses+Crime_Offense_Against_Family_and_Children+Crime_Driving_Under_the_Influence+
               Crime_Liquor_Laws+Crime_Disorderly_Conduct+Crime_Vagrancy+Crime_All_Other_Offenses+Crime_Curfew+Crime_Runaway
             ,data=d)

# plot tree 
plot(fit, uniform=TRUE, 
     main="Classification Tree for Eye Corr")
text(fit, use.n=TRUE, all=TRUE, cex=.7)

##### Correlation test ##################
# there is correlation between the Crime curfew and the unemployment rate with a p value=0.7022 and cor=0.03526128
res <- cor.test(d$Crime_Curfew, d$NE_Unemployment_Rate, method = "pearson")
res

# there is correlation between the S&P Price change and the Crime_Forcible_Rape with a correlation of 0.08178156 and a p value=0.3745
cor.test(d$Month_Year, d$Crime_Forcible_Rape)

# An average of 129.783 sex offences were reported on a monthly basis from 2007-2016
mean(d$Crime_Sex_Offenses)

# The maximum number of forcible rape crimes reported in NE on a monthly basis is 60.
max(d$Crime_Forcible_Rape)

# The minimum number of forcible rape crimes reported in NE on a monthly basis is 6.
min (d$Crime_Forcible_Rape)

plot(d$Month_Year ,d$Crime_Forcible_Rape, col ="Red", xlab='month_year', ylab='rape committed', main='Crimes reported on a monthly basis in NE')

# Correlation between the unemployment rate and the total crimes committed is p=0.343
cor.test(d$NE_Unemployment_Rate, d$dd)
boxplot(d$NE_Unemployment_Rate, d$dd, col='Blue', xlab='Unempoyment Rate', ylab='Total Crimes')
hist(d$NE_Unemployment_Rate, d$dd, breaks = 15)
hist(d$NE_Unemployment_Rate)
plot(d$Crime_Burglary+d$Crime_Criminal_Homicide+d$Crime_Death_by_Negligence, d$dd, col='blue', xlab='Crime total', ylab='Range')

# Highest number of crimes were reported in the year 2007 with a total of 8759.
max(d$dd)
summary(d$dd)
#Calculatiing the standard deviation for the total crimes
sd(d$dd)

# Getting the total crimes for years with an unemployment rate greater than 3.9
d[d$NE_Unemployment_Rate>3.9, c("dd", "Month_Year")]


# Calculating the min, max, mean and sd of the crimes resulting from the consumption of alcohol
min(d$Crime_Driving_Under_the_Influence)
max(d$Crime_Driving_Under_the_Influence)
mean(d$Crime_Driving_Under_the_Influence)
sd(d$Crime_Driving_Under_the_Influence)
plot(min(d$Crime_Driving_Under_the_Influence),max(d$Crime_Driving_Under_the_Influence), xlab='min number of crimes driving under the influence', ylab='max number of crimes driving under the influence')


#Influence of NE unemployment rate on the crimes committed under the influnce
mean(d$Crime_Driving_Under_the_Influence)
d[d$Crime_Driving_Under_the_Influence<892 & d$NE_Unemployment_Rate<3, c("Crime_Driving_Under_the_Influence", "Month_Year")]

str(d)
#Impact of S&P Percent gain/loss on the total number of crimes committed in NE along with the crime range
mean(d$S_P_500_Percent_Gain_or_Loss)
d[d$S_P_500_Percent_Gain_or_Loss<0.465, c("Month_Year", "Crime_Total", "dd", "NE_Unemployment_Rate")]

subset(d,S_P_500_Percent_Gain_or_Loss<0.465 & NE_Unemployment_Rate<3, select = c("Month_Year", "dd", "Crime_Total"))

##### Regression test ##################

m1<-lm(d$Crime_Curfew~NE_Unemployment_Rate+Crime_Vagrancy,data=d)
summary(m1)

par(mfrow=c(2,2))
plot(m1)
### Analysis of the variance table ####
anova(m1)

