######################################
### Created by Will Wetzel         ###
### Released under the MIT license ###
### 8086 R Script Deliverable      ###
### 11-1-17                        ###
######################################

###################
### Preparation ###
###################
setwd("~/Documents/GitHub/Data-Rangers/Deliverables/R_Script_Deliverable")
lawCrime <- read.csv("lawStaff_vs_Crime.csv", stringsAsFactors = FALSE)

names(lawCrime)
### Column Names ###
# "year"        "department"  "county"      "ft_so_m"     "ft_so_f"     "ft_c_m"     
# "ft_c_f"      "pt_so"       "pt_c"        "us_so_ft"    "us_so_pt"    "us_c_ft"    
# "us_c_pt"     "pop_covered" "so_per_1000" "num_res_so"  "total_crime"

# Replace null values with 0, from inconsistent data cleaning
columnsToReplace <- lawCrime[,c("us_so_ft", "us_so_pt", "num_res_so",
                                "us_c_ft", "us_c_pt")]
columnsToReplace[is.na(columnsToReplace)] <- 0
lawCrime[,c("us_so_ft", "us_so_pt", "num_res_so",
            "us_c_ft", "us_c_pt")] <- columnsToReplace

# Checking for rows with nulls,
# if nothings prints the data has no nulls
nulls <- complete.cases(lawCrime)
nulls
counter <- 0
for (null in nulls) {
  if (!null){
    print(paste("You have nulls at row", counter))
  }
  counter <- counter+1
}

# Data is 305 x 18
dim(lawCrime)
nrow(lawCrime)
ncol(lawCrime)

# Create a total full time officer column,
# combining male and female records
lawCrime$total_so <- (lawCrime$ft_so_m + lawCrime$ft_so_f)
# Same for full time civilians
lawCrime$total_c <- lawCrime$ft_c_m + lawCrime$ft_c_f


######################
## Statewide Stats ###
######################

# There are 32 departments in Nebraska
length(unique(lawCrime$department))
# Spread across 27 counties
length(unique(lawCrime$county))

# Pop Covered by department
# 0%    25%    50%    75%   100% 
# 5111   7026  10195  24490 452252 
quantile(lawCrime$pop_covered)

# Full time SO
#   0%  25%  50%  75% 100% 
#   3   14   18   38  848 
quantile(lawCrime$total_so)

# Histograms on the full set of data generally look bad
hist(lawCrime$total_so)
## ENHANCEMENT
# FIX - Checking for and removing outliers in rows
# FIX I think this needs to do it by year or something
# try doing it where you remove rows where the value is greater than,
# or less than a certain quartile, which you can get -, 
# look into IQR outlier detection
lawCrimeNoOutliers <- lawCrime
outliers <- c()
for (column in names(lawCrimeNoOutliers)) {
  if (is.numeric(lawCrimeNoOutliers[[column]])) {
    outliers <- c(boxplot.stats(lawCrimeNoOutliers[[column]]))
    cat(paste(outliers))
    # readline(prompt="Press [enter] to continue")
    lawCrimeNoOutliers <- lawCrimeNoOutliers[!lawCrimeNoOutliers[[column]] %in% outliers,]
  }
  
}
###

# Not many obvious patterns among data
pairs(~lawCrime$total_so+lawCrime$total_c+lawCrime$so_per_1000+lawCrime$crime_per_pop_covered,
      labels = c("Total SO", "Total Civ", "SO per 1000", "Crime Rate"))

# An average of 1.814 sworn officers per 1,000 people in NE for 2007-2016
mean(lawCrime$so_per_1000)

### Crime rate per 1000 people ###

# Create a crime per population covered ratio column
lawCrime$crime_per_pop_covered <- lawCrime$total_crime / lawCrime$pop_covered

# There are an average of 38.88 crimes per 1000 people for 2007-2017 in NE
boxplot(lawCrime$crime_per_pop_covered*1000, main = "Statewide Average Crime Rate per 1000 people")
mean(lawCrime$crime_per_pop_covered*1000)

# Compares average crime per 1000 people by year
yearlyCrimeMeans <- c()
for (year in (unique(lawCrime$year)))
  yearlyCrimeMeans <- append(yearlyCrimeMeans, mean(lawCrime$crime_per_pop_covered[lawCrime$year == year] * 1000))
names(yearlyCrimeMeans) <- c(2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)

plot(names(yearlyCrimeMeans), yearlyCrimeMeans, 
     main = "Crimes per 1000 People across Nebraska",
     xlab = "Year",
     ylab = "# of Crimes",
     ylim = c(0,50),
     pch = 20,
     col = "blue")

# Compares standard deviation of crime per 1000 people by year
yearlyCrimeStandardDev <- c()
for (year in (unique(lawCrime$year)))
  yearlyCrimeStandardDev <- append(yearlyCrimeStandardDev, sd(lawCrime$crime_per_pop_covered[lawCrime$year == year] * 1000))
names(yearlyCrimeStandardDev) <- c(2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)

plot(names(yearlyCrimeStandardDev), yearlyCrimeStandardDev, 
    main = "Crime sd per 1000 People across Nebraska",
    xlab = "Year",
    ylab = "SD of Crimes",
    ylim = c(0,25),
    pch = 20,
    col = "purple")

#########################################
### Departments by Population Covered ###
#########################################
# Comparing Lincoln/Omaha to all other departments

# Split in top 2 departments by pop covered and everyone else,
# looking only at 2016 data
lawCrimeOtherDeps <- lawCrime[lawCrime$year == 2016,]
lawCrimeOtherDeps <- lawCrimeOtherDeps[order(-lawCrimeOtherDeps$pop_covered),]
lawCrimeTopDeps <- lawCrimeOtherDeps[1:2,]
lawCrimeOtherDeps <- lawCrimeOtherDeps[c(-1,-2),]

# Comparing number of full-time Sworn Officers
numSo <- sum(lawCrimeTopDeps$ft_so_m, lawCrimeTopDeps$ft_so_f)
numSo <- c(numSo, sum(lawCrimeOtherDeps$ft_so_m, lawCrimeOtherDeps$ft_so_f))
names(numSo) <- c("Omaha/Lincoln PD", "All Other Deps")
barplot(numSo,
        main = "Number of Sworn Officers 2016",
        xlab = "Departments",
        ylab = "# of Officers",
        col = "blue",
        ylim = c(0,1500))

# Comparing population covered
popCovered <- sum(lawCrimeTopDeps$pop_covered)
popCovered <- c(popCovered, sum(lawCrimeOtherDeps$pop_covered))
names(popCovered) <- c("Omaha/Lincoln PD", "All Other Deps")
barplot(popCovered,
        main = "Total Population Covered 2016",
        xlab = "Departments",
        ylab = "# of Officers",
        col = "blue",
        ylim = c(0, 1000000))

### Average crime per 1000 people by locality ###
localCrime <- c(mean(lawCrimeTopDeps$crime_per_pop_covered)*1000)
localCrime <- c(localCrime, mean(lawCrimeOtherDeps$crime_per_pop_covered*1000))
names(localCrime) <- c("Omaha/Lincoln PD", "All Other Deps")
barplot(localCrime,
        main = "Average Crime rate per 1000 people 2016",
        xlab = "Departments",
        ylab = "# of Crime Incidents per 1000",
        col = "blue",
        ylim = c(0, 60))

##################################################
### Comparing urban vs rural department trends ###
##################################################
# Urban defined as pop. covered > 25,000 people

# Split into departments which cover more than 25,000, and less than 25,000 people
lawCrimeOver25k <- lawCrime[lawCrime$pop_covered >= 25000,]
lawCrimeUnder25k <- lawCrime[lawCrime$pop_covered < 25000,]

### Comparing hiring rates of civilian and sworn officers by population rates

# Create a total full time officer column,
# combining male and female records
lawCrimeOver25k$total_so <- (lawCrimeOver25k$ft_so_m + lawCrimeOver25k$ft_so_f)
lawCrimeUnder25k$total_so <- (lawCrimeUnder25k$ft_so_m + lawCrimeUnder25k$ft_so_f)
# Same for full time civilians
lawCrimeOver25k$total_c <- lawCrimeOver25k$ft_c_m + lawCrimeOver25k$ft_c_f
lawCrimeUnder25k$total_c <- lawCrimeUnder25k$ft_c_m + lawCrimeUnder25k$ft_c_f

# Getting average amount of staff for each year, 
# for both department with population coverage > and < than 25k
years <- c(2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)
annualOfficerHiresOver25k <- c()
annualCivilianHiresOver25k <- c()
annualOfficerHiresUnder25k <- c()
annualCivilianHiresUnder25k <- c()
for (year in years) {
  annualOfficerHiresOver25k <- c(annualOfficerHiresOver25k, mean(lawCrimeOver25k$total_so[lawCrimeOver25k$year == year]))
  annualCivilianHiresOver25k <- c(annualCivilianHiresOver25k, mean(lawCrimeOver25k$total_c[lawCrimeOver25k$year == year]))
  annualOfficerHiresUnder25k <- c(annualOfficerHiresUnder25k, mean(lawCrimeUnder25k$total_so[lawCrimeUnder25k$year == year]))
  annualCivilianHiresUnder25k <- c(annualCivilianHiresUnder25k, mean(lawCrimeUnder25k$total_c[lawCrimeUnder25k$year == year]))
  }

# Plotting Hiring Results
library(ggplot2)
combinedHiring <- data.frame(annualOfficerHiresOver25k,
                             annualCivilianHiresOver25k,
                             annualOfficerHiresUnder25k,
                             annualCivilianHiresUnder25k)
combinedHiring$year <- years
ggplot(data = combinedHiring, aes(x=year)) +
      geom_line(aes(y = annualOfficerHiresOver25k, colour = "Total Officer Staff Dep > 25k")) +
      geom_line(aes(y = annualCivilianHiresOver25k, colour = "Total Civilian Staff Dep > 25k")) +
      geom_line(aes(y = annualOfficerHiresUnder25k, colour = "Total Officer Staff Dep < 25k")) +
      geom_line(aes(y = annualCivilianHiresUnder25k, colour = "Total Civilian Staff Dep < 25k")) +
      ylab("Staffing Levels") + xlab("Year") + 
      ggtitle("Rural vs Urban Staffing Trends")

###########################################
### Comparing SO per 1000 to crime rate ###
###########################################

# We can see more officer density, doesn't correlate to less crime
plot(lawCrime$so_per_1000, lawCrime$crime_per_pop_covered*1000,
     main = "Comparing Officer Density and Crime Rate",
     xlab = "Sworn Officers per 1000 People",
     ylab = "Crime Incidents per 1000 People",
     abline(lm(lawCrime$so_per_1000 ~ lawCrime$crime_per_pop_covered), col = "red"))


