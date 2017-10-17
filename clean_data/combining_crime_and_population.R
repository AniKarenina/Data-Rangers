# Set the working directory to where you have your CSVs placed

setwd('/Users/shivanisingh/python_Datacleaning')

# Create a dataframe by reading the CSVs
t1 = read.csv('County_and_agency_based_crime.csv')
t2 = read.csv('County_population.csv')

# The next line creates a new column 'Population' in table t1 which is 'County_and_agency_based_crime.csv' and populates it with the 'Population'
# column of table t2 which is 'County_population.csv'.
# It maps the value for each column by matching the counties in both the table(it takes 'County' column as a key and matches the value)
t1$Population <- t2$Population[match(t1$County, t2$County)]

# The below line writes the merged CSV to County_crime_and_population_combined.csv
write.csv(t1, 'County_crime_and_population_combined.csv')
