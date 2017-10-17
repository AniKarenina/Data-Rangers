import pandas as pd 
import numpy as np 


def county_and_agency_crime(crime):
	df = pd.read_csv('County_and_agency_based_crime.csv')
	
	# removes columns before year 2007 and drop the Agency column

	colums_to_remove = [1,2,3,4,5,6,7,8]
	df.drop(df.columns[colums_to_remove], axis=1, inplace=True)
	columns_to_group = [0]

	#Group by the crime by eah County
	df_grouped_by_county = df.groupby('County').sum()
	print(df_grouped_by_county)

	#write the cleaned data to the 'County_and_agency_based_crime.csv'
	df_grouped_by_county.to_csv('County_and_agency_based_crime.csv')


# formats the raw csv in a way so that it can be compiled with the other csv

def county_population_cleaning(population):

	#used sublime regex to remove the spaces and replace it with '_'
	#used (?<!p)\h+ and replace with '_'
	
	df1 = pd.read_csv('County_population.csv')

	# Replaces the '_County' string from all the County values in order to have consistency through the data being handled and used

	df1['County'].replace('_County','',regex=True, inplace=True)

	# Replaces the '_' with an empty string

	df1['County'].replace('_',' ', regex=True, inplace=True)


	# Writes the data to the 'County_population.csv'
	df1.to_csv('County_population.csv')

# Calling the two data cleaning function

county_and_agency_crime('~/python_Datacleaning/County_and_agency_based_crime.csv')
county_population_cleaning('~/python_Datacleaning/County_population.csv')







