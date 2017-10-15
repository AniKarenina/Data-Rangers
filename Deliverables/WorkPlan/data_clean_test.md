Word to Markdown Converter
Results of converting "Markdown Data Rangers Data Cleaning Doc"
Markdown
Data Rangers

8086 Data Cleaning Documentation

October 18, 2017

Shivani Singh Parihar

Chaitra Venkatesan

Will Wetzel

**Licensing Information:**

This research and associated files, code, and reports are distributed under Copyright 2017, Data Rangers, using an MIT License ( [https://opensource.org/licenses/MIT](https://opensource.org/licenses/MIT)).

All Nebraska data analyzed in this report falls under a U.S. Government Works license, meaning &quot;...there is generally no copyright restriction on reproduction, derivative works, distribution, performance, or display of a government work.&quot; ( [https://www.usa.gov/government-works](https://www.usa.gov/government-works))

No licensing information was provided for the S&amp;P 500 data obtained from [http://www.multpl.com/](http://www.multpl.com/), their site only states &quot;Information is provided &#39;as is&#39; and solely for informational purposes, not for trading purposes or advice, and may be delayed.&quot;.

Shivani &amp; Chaitra please add licensing info for any data you used.

**Research Questions:**

All research questions concern the years 2007-2016 in the State of Nebraska.

1. **1.** How does a county&#39;s population level impact the types of crimes committed?
2. **2.** How do police staffing levels impact overall Nebraska crime rates?
3. **3.** What trends in the types and amount of crimes committed can be observed?

**Data Description:**

**General Methodology**

This project started when it was discovered the State of Nebraska provides open data querying for numerous government agencies.  Among them, the Nebraska Crime Commission (NCC) collects information about arrests, police staffing levels, and geographic crime trends.  Through the NCC site (https://ncc.nebraska.gov/stat-reports#Crime\_in\_Nebraska\_Series), we were able to access aggregated data about crime rates going back to 2007.  To complement this data, additional tables were scraped from queries executed on the NCC Arrest Data Query page ( [http://www.nebraska.gov/crime\_commission/arrest/arrest.cgi](http://www.nebraska.gov/crime_commission/arrest/arrest.cgi)).

Within the Arrest Data Query page, there were many options of queries to run.  We decided to first define our research questions outlined above, and then scrape the data most helpful to our analysis. Each team member was assigned a question to find, clean, and combine appropriate data for. We will now look at each of these raw data sources in more detail.

**Raw Data Sources:**

**Law Enforcement Employment in Nebraska Series, 2016-2007**

Citation:

&quot;Law Enforcement Employment in Nebraska Series.&quot; 2017, ncc.nebraska.gov/stat-reports#Crime\_in\_Nebraska\_Series. Accessed 1 Oct. 2017.

Description:

This data is available as a series of PDFs for the years 2016 to 2001.  We are limiting the scope of our research from 2016-2007.  Each PDF is 9 pages long, and features data on the full-time, part-time, and understaffing status for each department, for both sworn officer and civilian employees.  The main section of each report is an 80 row, 14 column, 2 page table, detailing the aforementioned statistics for each Nebraska police agency.

There are additional derived tables from this main section, organizing the statistics by cities above and below 5,000 population, and which agencies are state agencies. We chose to analyze the table found on page 4 of the report, agencies who serve cities of above 5,000 people. This data will be combined with crime data for the counties by year, to understand how agency staffing impacts crime levels within the counties they patrol.  A sample list of header names would be:

- **●●** Department
- **●●** Full- Time Employees
  - **○○** Sworn Officers
    - **■■** Male
    - **■■** Female
  - **○○** Civilians
    - **■■** Male
    - **■■** Female
- **●●** Part-Time Employees
  - **○○** Sworn Officers
  - **○○** Civilians
- **●●** Understaffing
  - **○○** Sworn
    - **■■** Full-Time
    - **■■** Part-Time
  - **○○** Civilian
    - **■■** Full-Time
    - **■■** Part-Time
- **●●** Population Covered
- **●●** Officers Per 1,000 Population

Metadata:

As this is a published report and not a table in a database, all row and column titles were clear to understand. There is a textual description at the top of the report detailing where the information was collected from and how to interpret the results.  At the end of the report, contracting information for each agency is provided. Google can be used to discover more information about specific agencies.

Remediation Needed:

The overarching challenge was converting the data from PDF to an analysis ready format. Once we identified the portion of the report we decided to scrape, further interrogation reveals columns where every value is 0, leading to questions of whether it should be included, and quadruple row header names would be present in our final table. Department names varied across years, and departments were created and disbanded, but the table remained in the same shape.

**Crime in Nebraska Series, 2016-2007**

Citation:

&quot;Crime in Nebraska Series.&quot; 2017, ncc.nebraska.gov/stat-reports#Crime\_in\_Nebraska\_Series. Accessed 1 Oct. 2017.

Description:

This data is available as a series of PDFs for the years 2016 to 2001.  We are limiting the scope of our research from 2016-2007.  Each PDF is 5 pages long, featuring the following table titles of aggregated crime information for the year.:

- **●●** Crime Index Offenses, comparing current to previous year
- **●●** Percent Change - Crime Index Offenses, January thru December, 2015 - 2016 by Population Groups
- **●●** Total Arrest Trends, 2015 - 2016
- **●●** A REVIEW OF HATE CRIMES IN NEBRASKA

If you were to scrape all the data from each PDF, multiple data frames totaling an estimated 100 rows and 25 columns would be created.  The reports are created by the NCC in order to give an interested party a general overview of crime within the state, and how it compared to crime from the previous year.  This data will be combined with other sources to answer research questions 1 &amp; 3.  We identified the table &quot;Percent Change - Crime Index Offenses January thru December, 2015 - 2016 by Population Groups&quot; as the most relevant to our research questions.

Metadata:

As this is a published report and not a table in a database, all row and column titles were clear to understand. There is a textual description at the top of the report detailing where the information was collected from and how to interpret the results. Throughout the report descriptions of tables and footnotes are provided.  Additionally, reading about NCC provided context to how and why the data was collected.

Remediation Needed:

The years 2007-2017 needed to be scraped and combined into a single table. The table we chose to scrape included data the from past year, this would lead to duplicate entries in our final table.  It also included derived statistics, such as percent change, and crime category totals.  The format of the table in the report would have triple header column names, and double row indexes, these would be an additional pain point when scripting with the data.

**Offense Type by Age Group &amp; Offense Type by Year**

Citation:

&quot;Arrest Data Query&quot; 2017, http://www.nebraska.gov/crime\_commission/arrest/arrest.cgi. Accessed 18 Sept. 2017.

Description:

Using the Arrest Data Query database provided by the NCC, we ran 2 queries to obtain the above datasets.  The queries run on a full relation database we can not guess the size of.  Each result generated from a query returned a 30 x 15 table, the axis names of which are contained in the names of the data sources.  Their database engine only allows you to select 2 axis categories with which to execute queries, it does not allow for SQL querying.

Metadata:

The Nebraska Open Data project comes directly from the NE Governor&#39;s office.  There is a lot of information about State operations, but nothing directly addressing the Open Data initiative ( [http://www.nebraska.gov/government/open-data/](http://www.nebraska.gov/government/open-data/)).  On Arrest Data Query page, a paragraph details the database provided, and how to use it.

Remediation Needed:

As we were able to directly copy paste the values from the in-browser table generated from our query into Excel, no data cleaning was needed.  All column names were clear, and no nulls were present.  Any alterations would be aesthetic only.

**S&amp;P 500 Monthly Price**

Citation:

&quot;S&amp;P 500 Historical Prices by Month&quot; 2017, http://www.multpl.com/s-p-500-historical-prices/table/by-month. Accessed 1 Oct. 2017.

Description:

This data was contained in a 1752 x 2 table listing the price of the S&amp;P 500 on the 1st of the month, for each year going back to 1871. The site appears to be maintained by a stock enthusiast, possibly to drive ad traffic to the site.

Metadata:

N/A

Remediation Needed:

As we were able to directly copy paste the values from the in-browser table into Excel, no data cleaning was needed.  All column names were clear, and no nulls were present.  Any alterations would be aesthetic only.

**Unemployment Data**

Chaitra please Fill Out

Citation:

Description:

Metadata:

Remediation Needed:

**County Population**

Shivani please Fill Out

Citation:

Description:

Metadata:

Remediation Needed:

**Data Cleaning Steps:**

Organized by research question and author:

1. **1.**** How does a county&#39;s population level impact the types of crimes committed? - Shivani Singh Parihar**

1. **2.**** How do police staffing levels impact overall Nebraska crime rates? - Will Wetzel**

###########################################################################

### Law Enforcement Employment and Crime by Agency Cleaning and Merging ###

###########################################################################

# Documented by William Wetzel

####################

### General Info ###

####################

Manual cleaning steps are detailed in &quot;Cleaning Steps&quot;

All python script cleaning procedures were completed in:

python 3.6.1

pandas 0.20.1

numpy 1.12.1

Scripts can be run in R with rPython.  You will still need to open the python file to select which function you are going to run, and specify file locations on your machine if needed.  The script is meant to be run as it was developed, one function at a time.  Even if running the script in R, you will need to manipulate the python code to point to the correct csv files, and to access the desired functions.

######################

### Cleaning Steps ###

######################

\*\*\*All functions referenced for data cleaning can be found in &quot;law\_enforcement\_data\_cleaning.py&quot;\*\*\*

1. Data was scraped from the &quot;Law Enforcement Employment in Nebraska Series&quot; for the years 2016 through 2007 - (https://ncc.nebraska.gov/stat-reports#Crime\_in\_Nebraska\_Series)

    Only one table from each pdf was scraped, it was decided the statistics for &quot;Cities Above 5,000 Population&quot; would be the most relevant to our research.  An example of this table is found on page 4 of the 2016 employment data.

    Tabula (http://tabula.technology/) was used to convert each pdf table into a csv, which were then manually combined into a single cvs using excel using copy and paste functions.  After the first year of data was scraped, a new column at the leftmost position was inserted named &quot;year&quot;, when a year of data was pasted into the combined table, the corresponding year was entered in the year column for all departments.  Now &quot;year&quot; and &quot;department&quot; created a composite primary key for the table.

Once all years of data had been scraped and combined, column titles were changed to reflect those detailed in &quot;dataDict\_lawStaff\_vs\_Crime.txt&quot;, each column name was essentially created into an abbreviation.

Data Checkpoint: raw\_combined\_data\_law\_enforcement\_2007-2017.csv

2. To complete our analysis, it was necessary to include the county in which each department is located.  A new column for county was added in the combined dataset using excel, it was inserted as the third column after &quot;department&quot;.  For the year 2007, counties were researched and input by hand for each department.  I would type the department name into google, find the county, and enter it with the corresponding department in 2007.

3. It was discovered during this time, department names had different formats for each dataset year.  For example, in 2007 department would &quot;Omaha P.D&quot; and in 2014 it would be &quot;OMAHA PD&quot;.  To standardize department names, names were manually replaced in excel with copy paste by using the 2007 department naming convention for all years.  It was ensured that for each year, the number of departments and their order were identical prior to copy pasting.

Data Checkpoint: law\_enforcement\_2007-2017\_department\_names\_matching.csv

4. Now that all department names for each year matched, the function &quot;law\_enforcement\_county\_copier&quot; from &quot;law\_enforcement\_data\_cleaning.py&quot; was used to copy department counties to all departments.

Data Checkpoint: &quot;law\_enforcement\_2007-2017\_counties.csv&quot;

5. The function &quot;period\_remover&quot; from &quot;law\_enforcement\_data\_cleaning.py&quot; was used to turn department names from &quot;… P.D.&quot; to &quot;… PD&quot;

Data Checkpoint: law\_enforcement\_2007-2017\_pd.csv

6. The function &quot;department\_merger&quot; was used to first identify departments from &quot;law\_enforcement\_2007-2017\_counties.csv&quot; which did not have crime statistics in &quot;All\_Crimes\_by\_Year\_and\_Agency.csv&quot;, data cleaning steps were included to rectify 2 missing names.

Then the crime data was merged by agency or department with the law\_enforcement\_employment data.

Final Cleaned Data: lawStaff\_vs\_Crime.csv

1. **3.**** What trends in the types and amount of crimes committed can be observed? - Chaitra Venkatesan**
Rendered
Data Rangers

8086 Data Cleaning Documentation

October 18, 2017

Shivani Singh Parihar

Chaitra Venkatesan

Will Wetzel

Licensing Information:

This research and associated files, code, and reports are distributed under Copyright 2017, Data Rangers, using an MIT License ( https://opensource.org/licenses/MIT).

All Nebraska data analyzed in this report falls under a U.S. Government Works license, meaning "...there is generally no copyright restriction on reproduction, derivative works, distribution, performance, or display of a government work." ( https://www.usa.gov/government-works)

No licensing information was provided for the S&P 500 data obtained from http://www.multpl.com/, their site only states "Information is provided 'as is' and solely for informational purposes, not for trading purposes or advice, and may be delayed.".

Shivani & Chaitra please add licensing info for any data you used.

Research Questions:

All research questions concern the years 2007-2016 in the State of Nebraska.

1. How does a county's population level impact the types of crimes committed?
2. How do police staffing levels impact overall Nebraska crime rates?
3. What trends in the types and amount of crimes committed can be observed?
Data Description:

General Methodology

This project started when it was discovered the State of Nebraska provides open data querying for numerous government agencies. Among them, the Nebraska Crime Commission (NCC) collects information about arrests, police staffing levels, and geographic crime trends. Through the NCC site (https://ncc.nebraska.gov/stat-reports#Crime\_in\_Nebraska\_Series), we were able to access aggregated data about crime rates going back to 2007. To complement this data, additional tables were scraped from queries executed on the NCC Arrest Data Query page ( http://www.nebraska.gov/crime_commission/arrest/arrest.cgi).

Within the Arrest Data Query page, there were many options of queries to run. We decided to first define our research questions outlined above, and then scrape the data most helpful to our analysis. Each team member was assigned a question to find, clean, and combine appropriate data for. We will now look at each of these raw data sources in more detail.

Raw Data Sources:

Law Enforcement Employment in Nebraska Series, 2016-2007

Citation:

"Law Enforcement Employment in Nebraska Series." 2017, ncc.nebraska.gov/stat-reports#Crime_in_Nebraska_Series. Accessed 1 Oct. 2017.

Description:

This data is available as a series of PDFs for the years 2016 to 2001. We are limiting the scope of our research from 2016-2007. Each PDF is 9 pages long, and features data on the full-time, part-time, and understaffing status for each department, for both sworn officer and civilian employees. The main section of each report is an 80 row, 14 column, 2 page table, detailing the aforementioned statistics for each Nebraska police agency.

There are additional derived tables from this main section, organizing the statistics by cities above and below 5,000 population, and which agencies are state agencies. We chose to analyze the table found on page 4 of the report, agencies who serve cities of above 5,000 people. This data will be combined with crime data for the counties by year, to understand how agency staffing impacts crime levels within the counties they patrol. A sample list of header names would be:

●● Department
●● Full- Time Employees
○○ Sworn Officers
■■ Male
■■ Female
○○ Civilians
■■ Male
■■ Female
●● Part-Time Employees
○○ Sworn Officers
○○ Civilians
●● Understaffing
○○ Sworn
■■ Full-Time
■■ Part-Time
○○ Civilian
■■ Full-Time
■■ Part-Time
●● Population Covered
●● Officers Per 1,000 Population
Metadata:

As this is a published report and not a table in a database, all row and column titles were clear to understand. There is a textual description at the top of the report detailing where the information was collected from and how to interpret the results. At the end of the report, contracting information for each agency is provided. Google can be used to discover more information about specific agencies.

Remediation Needed:

The overarching challenge was converting the data from PDF to an analysis ready format. Once we identified the portion of the report we decided to scrape, further interrogation reveals columns where every value is 0, leading to questions of whether it should be included, and quadruple row header names would be present in our final table. Department names varied across years, and departments were created and disbanded, but the table remained in the same shape.

Crime in Nebraska Series, 2016-2007

Citation:

"Crime in Nebraska Series." 2017, ncc.nebraska.gov/stat-reports#Crime_in_Nebraska_Series. Accessed 1 Oct. 2017.

Description:

This data is available as a series of PDFs for the years 2016 to 2001. We are limiting the scope of our research from 2016-2007. Each PDF is 5 pages long, featuring the following table titles of aggregated crime information for the year.:

●● Crime Index Offenses, comparing current to previous year
●● Percent Change - Crime Index Offenses, January thru December, 2015 - 2016 by Population Groups
●● Total Arrest Trends, 2015 - 2016
●● A REVIEW OF HATE CRIMES IN NEBRASKA
If you were to scrape all the data from each PDF, multiple data frames totaling an estimated 100 rows and 25 columns would be created. The reports are created by the NCC in order to give an interested party a general overview of crime within the state, and how it compared to crime from the previous year. This data will be combined with other sources to answer research questions 1 & 3. We identified the table "Percent Change - Crime Index Offenses January thru December, 2015 - 2016 by Population Groups" as the most relevant to our research questions.

Metadata:

As this is a published report and not a table in a database, all row and column titles were clear to understand. There is a textual description at the top of the report detailing where the information was collected from and how to interpret the results. Throughout the report descriptions of tables and footnotes are provided. Additionally, reading about NCC provided context to how and why the data was collected.

Remediation Needed:

The years 2007-2017 needed to be scraped and combined into a single table. The table we chose to scrape included data the from past year, this would lead to duplicate entries in our final table. It also included derived statistics, such as percent change, and crime category totals. The format of the table in the report would have triple header column names, and double row indexes, these would be an additional pain point when scripting with the data.

Offense Type by Age Group & Offense Type by Year

Citation:

"Arrest Data Query" 2017, http://www.nebraska.gov/crime\_commission/arrest/arrest.cgi. Accessed 18 Sept. 2017.

Description:

Using the Arrest Data Query database provided by the NCC, we ran 2 queries to obtain the above datasets. The queries run on a full relation database we can not guess the size of. Each result generated from a query returned a 30 x 15 table, the axis names of which are contained in the names of the data sources. Their database engine only allows you to select 2 axis categories with which to execute queries, it does not allow for SQL querying.

Metadata:

The Nebraska Open Data project comes directly from the NE Governor's office. There is a lot of information about State operations, but nothing directly addressing the Open Data initiative ( http://www.nebraska.gov/government/open-data/). On Arrest Data Query page, a paragraph details the database provided, and how to use it.

Remediation Needed:

As we were able to directly copy paste the values from the in-browser table generated from our query into Excel, no data cleaning was needed. All column names were clear, and no nulls were present. Any alterations would be aesthetic only.

S&P 500 Monthly Price

Citation:

"S&P 500 Historical Prices by Month" 2017, http://www.multpl.com/s-p-500-historical-prices/table/by-month. Accessed 1 Oct. 2017.

Description:

This data was contained in a 1752 x 2 table listing the price of the S&P 500 on the 1st of the month, for each year going back to 1871. The site appears to be maintained by a stock enthusiast, possibly to drive ad traffic to the site.

Metadata:

N/A

Remediation Needed:

As we were able to directly copy paste the values from the in-browser table into Excel, no data cleaning was needed. All column names were clear, and no nulls were present. Any alterations would be aesthetic only.

Unemployment Data

Chaitra please Fill Out

Citation:

Description:

Metadata:

Remediation Needed:

County Population

Shivani please Fill Out

Citation:

Description:

Metadata:

Remediation Needed:

Data Cleaning Steps:

Organized by research question and author:

1.** How does a county's population level impact the types of crimes committed? - Shivani Singh Parihar**

2.** How do police staffing levels impact overall Nebraska crime rates? - Will Wetzel**

###########################################################################

Law Enforcement Employment and Crime by Agency Cleaning and Merging
###########################################################################

Documented by William Wetzel
####################

General Info
####################

Manual cleaning steps are detailed in "Cleaning Steps"

All python script cleaning procedures were completed in:

python 3.6.1

pandas 0.20.1

numpy 1.12.1

Scripts can be run in R with rPython. You will still need to open the python file to select which function you are going to run, and specify file locations on your machine if needed. The script is meant to be run as it was developed, one function at a time. Even if running the script in R, you will need to manipulate the python code to point to the correct csv files, and to access the desired functions.

######################

Cleaning Steps
######################

***All functions referenced for data cleaning can be found in "law_enforcement_data_cleaning.py"***

Data was scraped from the "Law Enforcement Employment in Nebraska Series" for the years 2016 through 2007 - (https://ncc.nebraska.gov/stat-reports#Crime\_in\_Nebraska\_Series)

Only one table from each pdf was scraped, it was decided the statistics for "Cities Above 5,000 Population" would be the most relevant to our research. An example of this table is found on page 4 of the 2016 employment data.

Tabula (http://tabula.technology/) was used to convert each pdf table into a csv, which were then manually combined into a single cvs using excel using copy and paste functions. After the first year of data was scraped, a new column at the leftmost position was inserted named "year", when a year of data was pasted into the combined table, the corresponding year was entered in the year column for all departments. Now "year" and "department" created a composite primary key for the table.

Once all years of data had been scraped and combined, column titles were changed to reflect those detailed in "dataDict_lawStaff_vs_Crime.txt", each column name was essentially created into an abbreviation.

Data Checkpoint: raw_combined_data_law_enforcement_2007-2017.csv

To complete our analysis, it was necessary to include the county in which each department is located. A new column for county was added in the combined dataset using excel, it was inserted as the third column after "department". For the year 2007, counties were researched and input by hand for each department. I would type the department name into google, find the county, and enter it with the corresponding department in 2007.

It was discovered during this time, department names had different formats for each dataset year. For example, in 2007 department would "Omaha P.D" and in 2014 it would be "OMAHA PD". To standardize department names, names were manually replaced in excel with copy paste by using the 2007 department naming convention for all years. It was ensured that for each year, the number of departments and their order were identical prior to copy pasting.

Data Checkpoint: law_enforcement_2007-2017_department_names_matching.csv

Now that all department names for each year matched, the function "law_enforcement_county_copier" from "law_enforcement_data_cleaning.py" was used to copy department counties to all departments.
Data Checkpoint: "law_enforcement_2007-2017_counties.csv"

The function "period_remover" from "law_enforcement_data_cleaning.py" was used to turn department names from "… P.D." to "… PD"
Data Checkpoint: law_enforcement_2007-2017_pd.csv

The function "department_merger" was used to first identify departments from "law_enforcement_2007-2017_counties.csv" which did not have crime statistics in "All_Crimes_by_Year_and_Agency.csv", data cleaning steps were included to rectify 2 missing names.
Then the crime data was merged by agency or department with the law_enforcement_employment data.

Final Cleaned Data: lawStaff_vs_Crime.csv

3.** What trends in the types and amount of crimes committed can be observed? - Chaitra Venkatesan**
Copy to clipboard
Want to convert another document?

@benbalter | source | feedback
