######################################
### Created by Will Wetzel         ###
### Released under the MIT license ###
### 8086 R Script Deliverable      ###
### 11-8-17                        ###
######################################

setwd('/Users/WillieWetz/Documents/GitHub/Data-Rangers/Deliverables/R Plots Deliverable')

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
lawCrimeMapping <- merge(lawCrimeTest, postalCodes, by = "county", type = "inner")
# Remove state column
colnames(lawCrimeMapping)
lawCrimeMapping <- lawCrimeMapping[,-19]
# Create columns with required mapping names
lawCrimeMapping$region <- lawCrimeMapping$Zip.Code
lawCrimeMapping$value <- lawCrimeMapping$total_crime

library(choroplethr)
library(choroplethrMaps)

df_mapping <- lawCrimeMapping[,c("year", "region", "value")]
df_mapping <- df_mapping[df_mapping$year == 2010,]
library(dplyr)

df_mapping <- aggregate(df_mapping, by=list(region=df_mapping$region), FUN = sum)
county_choropleth(df_mapping,
                  title = "2012 County Population Estimates",
                  legend = "Population", num_colors = 1)


# test <- merge(lawCrimeTest, postalCodes, by = "county", type = "inner")



nrow(test)

lawCrimeTest <- lawCrime

lawCrimeTest$county_zip <- postalCodes$Zip.Code[lawCrimeTest$county == postalCodes$State.Abbreviation,]

nrow(lawCrime)

### One apporoach
# install.packages("maps")
# require(maps)
# m <- map("county", "Nebraska")


### tutorial


# install.packages(c("choroplethr", "choroplethrMaps"))
library(choroplethr)
library(choroplethrMaps)

data(df_pop_county)

county_choropleth(df_pop_county,
                  title = "2012 County Population Estimates",
                  legend = "Population", num_colors = 1)



