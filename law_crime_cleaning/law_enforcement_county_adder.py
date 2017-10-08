#######################
### William Wetzel  ###
### MIT License     ###
### 8086            ###
#######################

import pandas as pd
import numpy as np

#####################################
### law_enforcement_county_copier ###
#####################################

# Used to propagate counties for each department throughout the dataset
def law_enforcement_county_copier():
    df = pd.read_csv('law_enforcement_2007-2017.csv')

    nRows = df.shape[0]

    counties = {}

    for row in range(nRows):
        if  pd.notnull(df.loc[row, 'county']):
            counties[df.loc[row, 'department']] = df.loc[row, 'county']

    for row in range(nRows):
        if df.loc[row, 'department'] in counties:
            df.loc[row, 'county'] = counties[df.loc[row, 'department']]

    df.to_csv('law_enforcement_COUNTIES_2007-2017.csv', index=False)
    
######################
### period_remover ###
######################

# Used to turn "P.D." to "PD"
def period_remover(csv):
    df = pd.read_csv(csv)

    nRows = df.shape[0]

    df['department'] = df['department'].str.replace('.', '')
    df.to_csv('law_enforcement_2007-2017_pd.csv', index=False)
    

###########################
### department_merger ###
###########################

# Used to find departments present in "law_enforcement_2007-2017.csv" but not "All_Crimes_by_Year_and_Agency.csv"
# Used to merge department crime data by year with employment statistics by year
def department_merger(law, crime):
    
    dfLaw = pd.read_csv(law)
    dfCrime = pd.read_table(crime, skiprows=[1,2])
    
    # Making a few missing department names match
    dfCrime['Agency'] = dfCrime['Agency'].str.replace('.', '')
    dfCrime['Agency'] = dfCrime['Agency'].str.replace('South Sioux City PD', 'So Sioux City PD')
    dfCrime['Agency'] = dfCrime['Agency'].str.replace('La Vista PD', 'LaVista PD')

    # Checking if all departments between the 2 csvs match
    departmentResults = dfLaw['department'].isin(dfCrime['Agency'])
    
    unmatchedDepartments = []
    for row in range(departmentResults.size):
        if departmentResults[row] == False:
            unmatchedDepartments.append(dfLaw.loc[row, 'department'])    
    # Get unique names of departments which don't match        
    unmatchedDepartments = set(unmatchedDepartments)
        
    # Merging the 2 dataframes on department and year
    lawCrimeMerged = dfLaw
    years = ['2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016']
    
    # Initialize a new column for total crime
    lawCrimeMerged['total_crime'] = np.nan
    # For each 
    for row in range(lawCrimeMerged.shape[0]):
        tempDataFrame = (dfCrime.loc[dfCrime['Agency'] == lawCrimeMerged.loc[row, 'department']])
        for year in years:
            number = int(tempDataFrame[year])
            index = lawCrimeMerged.index[(lawCrimeMerged['department'] == lawCrimeMerged.loc[row, 'department']) & (lawCrimeMerged['year'] == int(year))].tolist()
            lawCrimeMerged.loc[index, 'total_crime'] = number            

    lawCrimeMerged.to_csv('lawCrimeMerged.csv', index=False)


# Run individual functions here

#law_enforcement_county_copier():   
#period_remover('law_enforcement_2007-2017.csv')
#department_merger('law_enforcement_2007-2017.csv', 'All_Crimes_by_Year_and_Agency.txt')


