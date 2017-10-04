#######################
# William Wetzel
# MIT License
# 8086 
#######################

# The counties for the year 2007 in the law_enforcement employment data were entered by hand
# To propagate counties to the rest of the data this script was used
# Some hand cleaning was conducted where I had to standardize department naming conventions - doing it by hand was faster than writing a script

import pandas as pd
import numpy as np

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