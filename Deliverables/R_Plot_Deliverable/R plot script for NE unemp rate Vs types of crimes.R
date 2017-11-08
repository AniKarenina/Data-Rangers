######################################
### Created by Chaitra Venkatesan ###
### Released under the MIT license ###
### 8086 R Plot Deliverable ###
### 11-6-17###
### Impact of the unemployment rate in Nebarska on the types of crimes committed ####
######################################
### Preparation ###
###################

setwd("c://Users/Nisha/Desktop/Data cleaning/")

d <- read.csv("test.csv")
View(d)
mean(d$NE_Unemployment_Rate)
### Relation between the unemeployment rate in Nebraska and the homicide crimes committed
cor.test(d$NE_Unemployment_Rate, d$Crime_Criminal_Homicide)
plot(d$NE_Unemployment_Rate, d$Crime_Criminal_Homicide, type='h', main="Rel btwn NE unemp and homicide crime",col="red", xlab="NE Unemployment Rate", ylab="Criminal Homicide Crime", col.lab="blue", cex=2, cex.lab=0.85)


### Relation between the unemeployment rate in Nebraska and crimes caused due to negligence
cor.test(d$NE_Unemployment_Rate, d$Crime_Death_by_Negligence)
plot(d$NE_Unemployment_Rate, d$Crime_Death_by_Negligence, type='h', main="Rel btwn NE unemp rate and crimes due to negligence",col="Red", xlab="NE Unemployment Rate", ylab="Death by Negligence Crimes", col.lab="blue", cex=2, cex.lab=0.85)

### Relation between the unemeployment rate in Nebraska and the rapes committed
cor.test(d$NE_Unemployment_Rate, d$Crime_Forcible_Rape)
plot(d$NE_Unemployment_Rate, d$Crime_Forcible_Rape, type='h', main="Rel btwn NE unemp and forcible rapes",col="red", xlab="NE Unemployment Rate", ylab="Forcible Rape Crimes", col.lab="blue", cex=2, cex.lab=0.85)

### Relation between the unemeployment rate in Nebraska and the crimes resulting from robbery
cor.test(d$NE_Unemployment_Rate, d$Crime_Robbery)
plot(d$NE_Unemployment_Rate, d$Crime_Robbery, type='h', main="Rel btwn NE unemp_rate and crimes_robbery ",col="red", xlab="NE Unemployment Rate", ylab="Crimes Robbery ", col.lab="blue", cex=2, cex.lab=0.85)

### Relation between the unemeployment rate in Nebraska and the crimes resulting from assault
cor.test(d$NE_Unemployment_Rate, d$Crime_Aggravated_Assault)
plot(d$NE_Unemployment_Rate, d$Crime_Aggravated_Assault, type='h', main="Rel btwn NE unemp_rate and aggravated assault ",col="red", xlab="NE Unemployment Rate", ylab="Aggravated Assault Crimes ", col.lab="blue", cex=2, cex.lab=0.85)
### p-value=0.887 and thus a correlation exists between the unemployment rate and the crimes resulting from aggravated assault

### Relation between the unemeployment rate in Nebraska and the crimes resulting from burglary
cor.test(d$NE_Unemployment_Rate, d$Crime_Burglary)
plot(d$NE_Unemployment_Rate, d$Crime_Burglary, type='h', main="Rel btwn NE unemp_rate and burglary",col="red", xlab="NE Unemployment Rate", ylab="Burglary Crimes ", col.lab="blue", cex=2, cex.lab=0.85)

### Relation between the unemeployment rate in Nebraska and the crimes resulting from larceny
cor.test(d$NE_Unemployment_Rate, d$Crime_Larceny)
plot(d$NE_Unemployment_Rate, d$Crime_Larceny, type='h', main="Rel btwn NE unemp_rate and larceny",col="red", xlab="NE Unemployment Rate", ylab="Larceny Crimes ", col.lab="blue", cex=2, cex.lab=0.85)

### Relation between the unemeployment rate in Nebraska and the crimes resulting from motor vehicle theft
cor.test(d$NE_Unemployment_Rate, d$Crime_Motor_Vehicle_Theft)
plot(d$NE_Unemployment_Rate, d$Crime_Motor_Vehicle_Theft, type='h', main="Rel btwn NE unemp_rate and motor vehicle theft",col="red", xlab="NE Unemployment Rate", ylab="Motor Vehicle Theft Crimes ", col.lab="blue", cex=2, cex.lab=0.85, axes=FALSE)
box()

### Relation between the unemeployment rate in Nebraska and the crimes resulting from simple assault
cor.test(d$NE_Unemployment_Rate, d$Crime_Simple_Assault)
plot(d$NE_Unemployment_Rate, d$Crime_Simple_Assault, type='h', main="Rel btwn NE unemp_rate and simple assault",col="red", xlab="NE Unemployment Rate", ylab="Simple Assault Crimes ", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and the crimes resulting from arson
cor.test(d$NE_Unemployment_Rate, d$Crime_Arson)
plot(d$NE_Unemployment_Rate, d$Crime_Arson, type='h', main="Rel btwn NE unemp_rate and arson crimes",col="red", xlab="NE Unemployment Rate", ylab="Arson Crimes ", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and the crimes resulting from forgery
cor.test(d$NE_Unemployment_Rate, d$Crime_Forgery_and_Counterfeiting)
plot(d$NE_Unemployment_Rate, d$Crime_Forgery_and_Counterfeiting, type='h', main="Rel btwn NE unemp_rate and forgery crimes",col="red", xlab="NE Unemployment Rate", ylab="Forgery Crimes ", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and the crimes resulting from fraudulency
cor.test(d$NE_Unemployment_Rate, d$Crime_Fraud)
plot(d$NE_Unemployment_Rate, d$Crime_Fraud, type='p', main="Rel btwn NE unemp_rate and fraudulent crimes ",col="red", xlab="NE Unemployment Rate", ylab="Fraudulent Crimes ", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and the crimes resulting from embezzlement
cor.test(d$NE_Unemployment_Rate, d$Crime_Embezzlement)
plot(d$NE_Unemployment_Rate, d$Crime_Embezzlement, type='h', main="Rel btwn NE unemp_rate and embezzlement crimes ",col="red", xlab="NE Unemployment Rate", ylab="Embezzlement Crimes ", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and the crimes resulting from stolen property
cor.test(d$NE_Unemployment_Rate, d$Crime_Stolen_Property)
plot(d$NE_Unemployment_Rate, d$Crime_Stolen_Property, type='h', main="Rel btwn NE unemp_rate and stolen property related crimes ",col="red", xlab="NE Unemployment Rate", ylab="Stolen Property Crimes ", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and the crimes resulting from vandalism
cor.test(d$NE_Unemployment_Rate, d$Crime_Vandalism)
plot(d$NE_Unemployment_Rate, d$d$Crime_Vandalism, type='h', main="Rel btwn NE unemp_rate and vandalism ",col="red", xlab="NE Unemployment Rate", ylab="Vandalism Crimes", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and the crimes resulting from weapons
cor.test(d$NE_Unemployment_Rate, d$Crime_Weapons)
plot(d$NE_Unemployment_Rate, d$Crime_Weapons, type='h', main="Rel btwn NE unemp_rate and weapons ",col="red", xlab="NE Unemployment Rate", ylab="Weapons Crimes", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and prostitution
cor.test(d$NE_Unemployment_Rate, d$Crime_Prostitution)
plot(d$NE_Unemployment_Rate, d$Crime_Prostitution, type='h', main="Rel btwn NE unemp_rate and prostitution ",col="red", xlab="NE Unemployment Rate", ylab="Prostitution Crimes", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and sex offences
cor.test(d$NE_Unemployment_Rate, d$Crime_Sex_Offenses)
plot(d$NE_Unemployment_Rate, d$Crime_Sex_Offenses, type='h', main="Rel btwn NE unemp_rate and sex offences ",col="red", xlab="NE Unemployment Rate", ylab="Sex Offence Crimes", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and drug abuse related crimes
cor.test(d$NE_Unemployment_Rate, d$Crime_Drug_Abuse_Violations)
plot(d$NE_Unemployment_Rate, d$Crime_Drug_Abuse_Violations, type='h', main="Rel btwn NE unemp_rate and drug abuse violation ",col="red", xlab="NE Unemployment Rate", ylab="Drug Abuse Violation Crimes", col.lab="blue", cex=3, cex.lab=0.90)
### p-value=0.8093, thus there exists a correlation between the unemployment rate and drug abuse related crimes.

### Relation between the unemeployment rate in Nebraska and gambling
cor.test(d$NE_Unemployment_Rate, d$Crime_Gambling)
plot(d$NE_Unemployment_Rate, d$Crime_Gambling, type='h', main="Rel btwn NE unemp_rate and gambling ",col="red", xlab="NE Unemployment Rate", ylab="Gambling Crimes", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and family, children offences
cor.test(d$NE_Unemployment_Rate, d$Crime_Offense_Against_Family_and_Children)
plot(d$NE_Unemployment_Rate, d$Crime_Offense_Against_Family_and_Children, type='h', main="Rel btwn NE unemp_rate and family, children offences ",col="red", xlab="NE Unemployment Rate", ylab="Family and Children Offence Crimes", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and driving under the influence
cor.test(d$NE_Unemployment_Rate, d$Crime_Driving_Under_the_Influence)
plot(d$NE_Unemployment_Rate, d$Crime_Driving_Under_the_Influence, type='h', main="Rel btwn NE unemp_rate and driving under the influence ",col="red", xlab="NE Unemployment Rate", ylab="Driving under the influnce Crimes", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and liquor laws
cor.test(d$NE_Unemployment_Rate, d$Crime_Liquor_Laws)
plot(d$NE_Unemployment_Rate, d$Crime_Liquor_Laws, type='h', main="Rel btwn NE unemp_rate and liquor laws ",col="red", xlab="NE Unemployment Rate", ylab="Liquor laws related Crimes", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and curfew related crimes
cor.test(d$NE_Unemployment_Rate, d$Crime_Curfew)
plot(d$NE_Unemployment_Rate, d$Crime_Curfew, type='h', main="Rel btwn NE unemp_rate and curfew ",col="red", xlab="NE Unemployment Rate", ylab="Cufew related Crimes", col.lab="blue", cex=3, cex.lab=0.90)
### p-value=0.7022, thus there exists a correlation between the unemployment rate and the curfew crimes.

### Relation between the unemeployment rate in Nebraska and runaway
cor.test(d$NE_Unemployment_Rate, d$Crime_Runaway)
plot(d$NE_Unemployment_Rate, d$Crime_Runaway, type='h', main="Rel btwn NE unemp_rate and runaway ",col="red", xlab="NE Unemployment Rate", ylab="Runaway related Crimes", col.lab="blue", cex=3, cex.lab=0.90)

### Relation between the unemeployment rate in Nebraska and dd (total crimes)
cor.test(d$NE_Unemployment_Rate, d$dd)
plot(d$NE_Unemployment_Rate, d$dd, type='h', main="Rel btwn NE unemp_rate and total crimes ",col="red", xlab="NE Unemployment Rate", ylab="Total Crimes", col.lab="blue", cex=3, cex.lab=0.90)

### From the above analysis, it is observed that the unemployment rate in NE affects/influences the crimes resulting from assault, drug abuse related crimes and curfew related crimes. ###



