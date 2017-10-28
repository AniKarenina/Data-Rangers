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

# Checking for rows with nulls
# If nothings prints the data has no nulls
nulls <- complete.cases(lawCrime)
nulls
counter <- 0
for (null in nulls) {
  if (!null){
    print(paste("You have nulls at row", counter))
  }
  counter <- counter+1
}

######################
## Statewide Stats ###
######################

# An average of 1.814 sworn officers per 1,000 people in NE for 2007-2016
mean(lawCrime$so_per_1000)

### Crime rate per 1000 people ###

# Create a crime per population covered ratio column
lawCrime$crime_per_pop_covered <- lawCrime$total_crime / lawCrime$pop_covered

# There are an average of 38.88 crimes per 1000 people for 2007-2017 in NE
mean(lawCrime$crime_per_pop_covered*1000)

# Compares average crime per 1000 people by year
yearlyCrimeMeans <- c()
for (year in (unique(lawCrime$year)))
  yearlyCrimeMeans <- append(yearlyCrimeMeans, mean(lawCrime$crime_per_pop_covered[lawCrime$year == year] * 1000))
names(yearlyCrimeMeans) <- c(2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016)

plot(names(yearlyCrimeMeans), yearlyCrimeMeans, 
     main = "Crimes per 1000 People",
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
    main = "Crime sd per 1000 People",
    xlab = "Year",
    ylab = "SD of Crimes",
    ylim = c(0,25),
    pch = 20,
    col = "purple")


#########################################
### Departments by Population Covered ###
#########################################

# Split into departments which cover more than 25,000, and less than 25,000 people
lawCrimeOver25k <- lawCrime$department[lawCrime$pop_covered >= 25000 & lawCrime$year == 2016]
lawCrimeUnder25k <- lawCrime$department[lawCrime$pop_covered < 25000 & lawCrime$year == 2016]

# Split in top 2 departments by pop covered and everyone else
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
        main = "Population Covered 2016",
        xlab = "Departments",
        ylab = "# of Officers",
        col = "blue",
        ylim = c(0, 1000000))






