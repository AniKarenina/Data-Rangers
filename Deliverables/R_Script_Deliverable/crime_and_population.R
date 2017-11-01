# set the working dir
setwd('/Users/shivanisingh/Data-Rangers/Deliverables/R_Script_Deliverable')

# Read the CSV
crime_and_population <- read.csv("County_crime_and_population_combined.csv")

# Changing the columns names of the CSV
colnames(crime_and_population) <- c("ID", "County Name", "Crime in 2007", "Crime in 2008", "Crime in 2009", "Crime in 2010", "Crime in 2011", "Crime in 2012", "Crime in 2013", "Crime in 2014", "Crime in 2015", "Crime in 2016", "Total no. of crimes", "Total Population")

# Checking for no null values or complete values in the table
nulls_present <- complete.cases(crime_and_population)

nulls_present

#output --
# [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
# [17] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
# [33] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
# [49] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
# [65] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
# [81] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE

# The output shows there are no null values in the dataset

# Number of counties in Nebraska
length(unique(crime_and_population$`County Name`))

# Output
#[1] 92

#Sum of Number of crimes for a particular year in all the counties
sum(crime_and_population$`Crime in 2010`)

#Output
#[1] 69011

# Calculate Total crime to population ratio
county_total_population <- c(crime_and_population$`Total Population`) 
total_county_crime <- c(crime_and_population$`Total no. of crimes`)
county_name <- c(crime_and_population$`County Name`)
df1 <- data.frame(county_name, total_county_crime, county_total_population)
df1$crime_to_population <- with(df1, total_county_crime/county_total_population)

# View few records of the ratio for crime to population

# total_crime county_population crime_to_population
# 1       27536             31684          0.86908219
# 2         630              6329          0.09954179
# 3           7               469          0.01492537
# 4           9               798          0.01127820
# 5           7               484          0.01446281
# 6         232              5332          0.04351088

# find out the county which has maximum number of total crimes in 2007 - 2016
crime_and_population[which(crime_and_population$`Total no. of crimes` == max(crime_and_population$`Total no. of crimes`)),]

#output --
# ID County Name Crime in 2007 Crime in 2008 Crime in 2009 Crime in 2010
# 28 28     Douglas         29965         27903         26894         25506
# Crime in 2011 Crime in 2012 Crime in 2013 Crime in 2014 Crime in 2015 Crime in 2016
# 28         27174         27674         27412         27599         25310         27625
# Total no. of crimes Total Population
# 28              513069           554995

# Find patterns amongst data
pairs(~crime_and_population$`Crime in 2014`+crime_and_population$`Crime in 2015`+crime_and_population$`Crime in 2016`+
        crime_and_population$`Total no. of crimes`+crime_and_population$`Total Population`, labels = c("crime in 2014", "crime in 2015", "crime in 2016", "total population"))


# Corelation between Total population and Total Number of Crimes in counties
cor(crime_and_population$`Total no. of crimes`,
    crime_and_population$`Total Population`)
#Output --
#[1] 0.9878336

# plotting a regression line for total population and total crime 
# for a subset of data and for the entire data

# for subset --
library("ggpubr")
crime_subset <- head(crime_and_population, 10)

colnames(crime_subset) <- c("ID", "County Name", "Crime in 2007", "Crime in 2008",
                            "Crime in 2009", "Crime in 2010", "Crime in 2011", "Crime in 2012",
                            "Crime in 2013", "Crime in 2014", "Crime in 2015", "Crime in 2016",
                            "Total_crimes", "Total_population")

#plotting a regression line to show the pattern/relation between the population and crime
ggscatter(crime_subset, x = "Total_population", y = "Total_crimes",
          add = "reg.line", conf.int = TRUE, cor.coef = TRUE,
          cor.method = "pearson", xlab = "Total Population of County", ylab = "Total Number of Crimes")

#plotting a linear regression for the entire dataset using ggscatter
crime_and_population_reg <- crime_and_population

colnames(crime_and_population_reg) <- c("ID", "County Name", "Crime in 2007", "Crime in 2008", "Crime in 2009", "Crime in 2010", "Crime in 2011", "Crime in 2012", "Crime in 2013", "Crime in 2014", "Crime in 2015", "Crime in 2016", "Total_crimes", "Total_population")

ggscatter(crime_and_population_reg, x = "Total_population", y = "Total_crimes",
          add = "reg.line", conf.int = TRUE, cor.coef = TRUE,
          cor.method = "pearson", xlab = "Total Population of County", ylab = "Total Number of Crimes")


# The regression line shows that the relationship between the two variable that is the 
# population of a county and the total number of crime is linear

# Conducting the pearson correlation test
res <- cor.test(crime_and_population_reg$Total_population,
                crime_and_population_reg$Total_crimes, method = "pearson")
res

# Output --

# Pearson's product-moment correlation
# 
# data:  crime_and_population_reg$Total_population and crime_and_population_reg$Total_crimes
# t = 60.261, df = 90, p-value < 2.2e-16
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
# 0.9816237 0.9919535
# sample estimates:
# cor 
# 0.9878336 

# In the result above
    ## t is the t-test statistic value (t = 60.261),
    ## df is the degree of freedom (df = 90),
    ## p-value is the significance level of the t-test(p-value < 2.2e-16)
    ## conf.int is the confidene interval of the correlation coefficient at 95% (conf.int = [0.9816237, 0.9919535])
    ## sample estimates is the correlation coefficient that comes to (Cor.coeff = 0.9878336)


# Time series analysis
    ## This time series analysis is for Adam County, taking in account data from 2007 to 2016,
    ## time series analysis is done starting year 2017

crime_data_Adam_county <- crime_and_population[1,]
drops <- c("ID", "County Name", "Total no. of Crimes", "Total Population")
crime_data_Adam_county <- crime_data_Adam_county[, !names(crime_data_Adam_county) %in% drops]

Crime_Adam_without_header <- c(crime_data_Adam_county, header = FALSE)
data_time_series <- ts(Crime_Adam_without_header, frequency=1, start= c(2017,1))
plot.ts(data_time_series)

# Like the above Time series for Adam county the time series analysis can be done for other counties too



