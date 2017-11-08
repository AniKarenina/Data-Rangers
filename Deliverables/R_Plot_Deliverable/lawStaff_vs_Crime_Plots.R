######################################
### Created by Will Wetzel         ###
### Released under the MIT license ###
### 8086 R Script Deliverable      ###
### 11-8-17                        ###
######################################

setwd('/Users/WillieWetz/Documents/GitHub/Data-Rangers/Deliverables/R_Plot_Deliverable')

###################
### Preparation ###
###################
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

# Create a total full time officer column,
# combining male and female records
lawCrime$total_so <- (lawCrime$ft_so_m + lawCrime$ft_so_f)
# Same for full time civilians
lawCrime$total_c <- lawCrime$ft_c_m + lawCrime$ft_c_f

################
### Map Prep ###
################

# Mapping county zip codes to names
postalCodes <- read.csv('us_postal_codes.csv')
colnames(postalCodes)[5] <- "county"
names(postalCodes)

# Just keep zip codes and county names, and states
postalCodes <- postalCodes[,c(-2,-4,-6,-7,-8)]
names(postalCodes)

# All county names match - whoo hoo!
lawCrime$county %in% postalCodes$county[postalCodes$State == 'Nebraska']
# Rows in dataset matching counties in lawCrime and located in NE
indexes <- which(postalCodes$State == 'Nebraska' & postalCodes$county %in% lawCrime$county) #& ])
# Keep only matching rows in the zipcode file
postalCodes <- postalCodes[indexes,]
# Keep only one zip for each County
postalCodes <- postalCodes[!duplicated(postalCodes$county),]
nrow(postalCodes)
# Double check each county still has a match
lawCrime$county %in% postalCodes$county[postalCodes$State == 'Nebraska']

# Create a new dataframe merging LawCrime with county zip codes
lawCrimeMapping <- merge(lawCrime, postalCodes, by = "county", type = "inner")
# Remove state and department columns
colnames(lawCrimeMapping)
lawCrimeMapping <- lawCrimeMapping[,-c(21, 3)]


#!!!!! Map only 2016 data !!!!!#
lawCrimeMapping <- lawCrimeMapping[lawCrimeMapping$year == 2016,]
colnames(lawCrimeMapping)
str(lawCrimeMapping)
# Aggregate a number of columns in the event you want to map different things
lawCrimeMapping <- aggregate(lawCrimeMapping[,c(3,4,5,6,7,8,9,10,12,13,14,17,18)], 
                             by=list(county=lawCrimeMapping$county), 
                             FUN=sum)
# Calling mapping libraries
library(readxl)
library(dplyr)
library(choroplethr)
library(choroplethrMaps)
library(ggplot2)
library(maps)
# Assigning a "region" to each county, 
# "region" is a ggplot specific mapping address
data(county.map)
# Keep Nebraska data only
county.map <- filter(county.map, STATE == 31)
# Keep only one region code per county name
county.map <- county.map[!duplicated(county.map$NAME),]
# Join by county name
lawCrimeMapping <- left_join(lawCrimeMapping, county.map, by = c("county" = "NAME"))
# value is a required mapping column name
colnames(lawCrimeMapping)[13] <- "value"
# Plotting by number of full time officers
county_mapSo <- county_choropleth(lawCrimeMapping, legend = "Number of Sworn Officers, 2016", 
                                state_zoom = "nebraska", num_colors=6)
# We can see there are many counties not officially covered by any police department
county_mapSo

# Plotting by population covered
popCovered <- lawCrimeMapping[,c("region", "pop_covered")]
colnames(popCovered)[2] <- "value"
county_mapPop <- county_choropleth(popCovered, legend = "Pop Covered by County Departments, 2016", 
                                state_zoom = "nebraska", num_colors=6)
# We can only imagine how departments share coverage of counties they are not based in
county_mapPop

# Plotting by SO per 1000
SoPer1000 <- lawCrimeMapping[,c("region", "so_per_1000")]
colnames(SoPer1000)[2] <- "value"
county_SoPer1000 <- county_choropleth(SoPer1000, legend = "Number of Sworn Officers Per 1000, 2016", 
                                   state_zoom = "nebraska", num_colors=6)
# It makes sense the central part of the state, being the most spread out,
# has the lowest ratio
county_SoPer1000

###################
### Basic Plots ###
###################

# Create a crime per population covered ratio column
lawCrime$crime_per_pop_covered <- lawCrime$total_crime / lawCrime$pop_covered

# Just looking at 2016
lawCrime2016 <- lawCrime[lawCrime$year == 2016,]
options(scipen=999)
# Evidently there are rural communities with crime rates,
# similiar to that of Omaha and Lincoln
plot(lawCrime2016$pop_covered, lawCrime2016$crime_per_pop_covered,
     main = "Comparing Department Population Covered to Crime Rate",
     xlab = "Population Covered", ylab = "Crime Rate Per 1000",
     xlim = c(0,500000))
colnames(lawCrime2016)

# Hiring trends by officer gender
soHires <- aggregate(lawCrime[,c(4,5)],
                   by=list(year=lawCrime$year),
                   FUN=sum)
plot(soHires$year, 
     soHires$ft_so_m,
     main = "Male SO Staffing Trends",
     xlab = "Year",
     ylab = "# NE Male Officers")

plot(soHires$year, 
     soHires$ft_so_f,
     main = "Female SO Staffing Trends",
     xlab = "Year",
     ylab = "# NE Female Officers")














#### FAILURE ZONE ###

######################
### ggplot FAILURE ###
######################
library("ggcounty")
library("ggplot2")

# Define heatmap
lawCrimeMapping$brk <- cut(lawCrimeMapping$count,
                           breaks=c(0, 10, 15, 40, 45, 90, 450, 650, 850),
                           labels=c("0-9", "10-14", "15-40", "40-44","45-89", 
                                    "90-449", "450-649", "650-850"),
                           include.lowest = TRUE)

NE <- ggcounty.us()# ("Nebraska")
gg <- us$g
gg <- gg + geom_map(data=lawCrimeMapping, map=NE$map,
                    aes(map_id=FIPS, fill=brk),
                    color="white",size=0.125)
gg <- gg + scale_fill_manual(values=c("#ffffcc", "#c7e9b4", "#7fcdbb", 
                                      "#41b6c4", "#2c7fb8", "#253494", 
                                      "#ffffcc", "#c7e9b4"), 
                             name="Population")

gg

######
library("ggcounty")
data(population) # built-in US population by FIPS code data set
population$brk <- cut(population$count, 
                      breaks=c(0, 100, 1000, 10000, 100000, 1000000, 10000000), 
                      labels=c("0-99", "100-1K", "1K-10K", "10K-100K", 
                               "100K-1M", "1M-10M"),
                      include.lowest=TRUE) # define appropriate (& nicely labeled) population breaks
us <- ggcounty.us()
gg <- us$g # start the plot with our base map
gg <- gg + geom_map(data=population, map=us$map,
                    aes(map_id=FIPS, fill=brk), 
                    color="white", size=0.125) # add a new geom with our population (choropleth)
gg <- gg + scale_fill_manual(values=c("#ffffcc", "#c7e9b4", "#7fcdbb", 
                                      "#41b6c4", "#2c7fb8", "#253494"), 
                             name="Population")

######
  

