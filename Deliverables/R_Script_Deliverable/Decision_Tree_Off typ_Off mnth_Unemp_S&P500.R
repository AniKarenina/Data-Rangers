######################################
### Created by Chaitra Venkatesan         ###
### Released under the MIT license ###
### 8086 R Script Deliverable      ###
### 11-1-17                        ###
######################################

###################
### Preparation ###
###################

setwd("c://Users/Nisha/Desktop/Data cleaning/")

library(rpart)

d <- read.csv("test.csv")

d$Crime_Total <- as.factor(d$Crime_Total)
str(d)

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