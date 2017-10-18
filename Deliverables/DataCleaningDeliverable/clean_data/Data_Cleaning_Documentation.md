**Data Rangers**

**8086 Data Cleaning Documentation**

**October 18, 2017**

**Shivani Singh Parihar**

**Chaitra Venkatesan**

**Will Wetzel**

**Licensing Information:**

This research and associated files, code, and reports are distributed under Copyright 2017, Data Rangers, using an MIT License ( [https://opensource.org/licenses/MIT](https://opensource.org/licenses/MIT)).

All Nebraska data analyzed in this report falls under a U.S. Government Works license, meaning &quot;...there is generally no copyright restriction on reproduction, derivative works, distribution, performance, or display of a government work.&quot; ( [https://www.usa.gov/government-works](https://www.usa.gov/government-works))

No licensing information was provided for the S&amp;P 500 data obtained from [http://www.multpl.com/](http://www.multpl.com/), their site only states &quot;Information is provided &#39;as is&#39; and solely for informational purposes, not for trading purposes or advice, and may be delayed.&quot;.

The Nebraska unemployment data in this report is fetched from Bureau of Labor Statistics ( [https://data.bls.gov/pdq/SurveyOutputServlet](https://data.bls.gov/pdq/SurveyOutputServlet)) and according to their website policy, the public has a right to access the Bureau&#39;s information and can also request access to federal agency records and obtain information.

The offence data statistics was obtained from the Nebraska government database ( [http://www.nebraska.gov/crime\_commission/arrest/offense.cgi](http://www.nebraska.gov/crime_commission/arrest/offense.cgi)) and according to their information use policy, the public can access, copy or download the material available on their website.

**Research Questions:**

All research questions concern the years 2007-2016 in the State of Nebraska.

  **1.** How does a county&#39;s population level impact the types of crimes committed?  
  **2.** How do police staffing levels impact overall Nebraska crime rates?  
  **3.** What trends in the types and amount of crimes committed can be observed?  

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

- **●** Department
- **●** Full- Time Employees
  - **○** Sworn Officers
    - **■** Male
    - **■** Female
  - **○** Civilians
    - **■** Male
    - **■** Female
- **●** Part-Time Employees
  - **○** Sworn Officers
  - **○** Civilians
- **●** Understaffing
  - **○** Sworn
    - **■** Full-Time
    - **■** Part-Time
  - **○** Civilian
    - **■** Full-Time
    - **■** Part-Time
- **●** Population Covered
- **●** Officers Per 1,000 Population

Metadata:

As this is a published report and not a table in a database, all row and column titles were clear to understand. There is a textual description at the top of the report detailing where the information was collected from and how to interpret the results.  At the end of the report, contracting information for each agency is provided. Google can be used to discover more information about specific agencies.

Remediation Needed:

The overarching challenge was converting the data from PDF to an analysis ready format. Once we identified the portion of the report we decided to scrape, further interrogation reveals columns where every value is 0, leading to questions of whether it should be included, and quadruple row header names would be present in our final table. Department names varied across years, and departments were created and disbanded, but the table remained in the same shape.

**Crime in Nebraska Series, 2016-2007**

Citation:

&quot;Crime in Nebraska Series.&quot; 2017, ncc.nebraska.gov/stat-reports#Crime\_in\_Nebraska\_Series. Accessed 1 Oct. 2017.

Description:

This data is available as a series of PDFs for the years 2016 to 2001.  We are limiting the scope of our research from 2016-2007.  Each PDF is 5 pages long, featuring the following table titles of aggregated crime information for the year.:

- **●** Crime Index Offenses, comparing current to previous year
- **●** Percent Change - Crime Index Offenses, January thru December, 2015 - 2016 by Population Groups
- **●** Total Arrest Trends, 2015 - 2016
- **●** A REVIEW OF HATE CRIMES IN NEBRASKA

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

**Offence Type by Month &amp; Offence Type by Year**

** **

Citation:

&quot;Offence Data Query&quot;, [http://www.nebraska.gov/crime\_commission/arrest/offense.cgi](http://www.nebraska.gov/crime_commission/arrest/offense.cgi)

Description:

Offence data is based on the crimes known to the law enforcement. It is based on the arrest dataset i.e. a person is arrested for what type of offence committed? The offence data is collected from the following crimes: **Homicide, rape, assault, robbery, burglary, larceny, motor vehicle theft, and arson.**

** **

Using the Offence Data Query database provided by the NCC, we ran two queries and a sub query to obtain the above datasets. Each result from the query generates 31 columns and 14 rows for a specific year.

Metadata:

The Nebraska Open Data project comes directly from the NE Governor&#39;s office.  There is a lot of information about State operations and the crime information is obtained from the Nebraska Crime Commission, but nothing directly addressing the Open Data initiative ( [http://www.nebraska.gov/government/open-data/](http://www.nebraska.gov/government/open-data/)).  On Offence Data Query page, a paragraph details the database provided, and how to use it.

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

**Unemployment Data across the state of Nebraska**

** **

Citation:

&quot;Nebraska Unemployment Statistics&quot; 2017,

[ ](https://data.bls.gov/timeseries/LASST310000000000003) [https://data.bls.gov/timeseries/LASST310000000000003. Accessed 12 Oct. 2017.](https://data.bls.gov/timeseries/LASST310000000000003)

Description:

The Nebraska unemployment statistics is obtained from the Bureau of Labor Statistics. The unemployment database can be formatted by specifying the year range and the view. For our project, I have specified the year range as 2007-2016 and the dataset generated from that query consists of 130 rows and 6 columns. The columns are describes as &#39;Year&#39;, &#39;Period&#39;, &#39;Labor force&#39;, &#39;employment&#39;, &#39;unemployment&#39;, and &#39;unemployment rate&#39;.

Metadata:

The unemployment data is obtained from the Bureau of Labor Statistics of the U.S. Department ( [https://www.bls.gov/](https://www.bls.gov/)).  There is a lot of information about the labor market activity, working conditions, price changing conditions etc. Nebraska unemployment data can be obtained from the Local Area Unemployment Statistics ( [https://www.bls.gov/lau/home.htm](https://www.bls.gov/lau/home.htm)).

Remediation Needed:

As the dataset was already available in an excel format ready to be downloaded from the in-browser, no data cleaning was needed.  All column names were clear, and no nulls were present.  Any alterations would be aesthetic only.

**County Population**

Citation:

&quot;Nebraska Counties by Population&quot; 2017,

[https://www.nebraska-demographics.com/counties\_by\_population](https://www.nebraska-demographics.com/counties_by_population). Accessed 3 Oct. 2017.

Description: This is data is from US census and is for 92 Counties ranked 1 through 92.

Metadata: NA

Remediation Needed: The data was already very pretty and could be pasted to any worksheet. Although later some cleaning was done to successfully import it to the dataframe in python scripts.

**Data Cleaning Steps:**

Organized by research question and author:

 **1. How does a county&#39;s population level impact the types of crimes committed? - Shivani Singh Parihar**

=======================================================

=== County Crime and County Population Cleaning and Merging ===

=======================================================

= Documented by Shivani Singh

====================

=== General Info ===

====================

Manual cleaning steps are detailed in &quot;Cleaning Steps&quot;

All other cleaning procedures were completed in:

python 3.6.1

pandas 0.20.1

numpy 1.12.1

R Studio

Scripts are written in R with Python. Scripts have to be in the same folder where the raw data files are in order to be executed successfully

======================

=== Cleaning Steps ===

======================

\*\*\*All functions referenced for data cleaning can be found in &quot;crime\_and\_population\_cleaning.py&quot; and the dataframe merging steps can be found in &quot;Combining\_crime\_and\_population.R&quot;\*\*\*

Data Cleaning Steps in Python

\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

1. Data was scraped from the &quot;Law Enforcement Employment in Nebraska Series&quot; for the years 2016 through 2007 - (https://ncc.nebraska.gov/stat-reports#Crime\_in\_Nebraska\_Series) and by Nebraska demographics gave population for each county - (https://www.nebraska-demographics.com/counties\_by\_population)

Data Checkpoint: County\_and\_agency\_based\_crime.csv &amp; County\_population.csv

2. The county crime had data from 2000 onwards but we are only working with data from 2007 so the data before 2007 is removed

3. The crime data had Agency data for each county and it has to be dropped as well it would have prevented us from grouping(using GROUPBY) the county crime data

4. To complete our analysis, it was necessary to include the county&#39;s population as it would help us analyze how the population affects the number of crimes in each county. And in order to acheive this the county population column from county population data was merged with crime data

5. It was discovered that few spaces in County\_population.csv has some spaces which created problems while importing the file with panda. so in order to fix that I initially used sublime text and regex to replace those problematic spaces with an underscore

6. After importing(refer step 5) I replaced the \_County with and empty string in order to make a column of common values between the two CSVs that is County\_and\_agency\_based\_crime.csv &amp; County\_population.csv

7. Still few underscores persisted with in the county names, they were removed with the same approach as in step 6 that is they were replaced by using replace function and replaced underscore with an empty string

Data merging Steps in R

\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

The data merging step between two CSV was difficult in Python as compared to R. So R was a better option to opt at this stage

1. First, set the working directory where pre-cleaned files from python scripts are located

2. Create two dataframes for two different CSVs we are dealing with that is County\_and\_agency\_based\_crime.csv &amp; County\_population.csv

3. Create a new column &quot;Population&quot; in the crime data CSV and populate it with the matching county population data from the County\_population.csv. Here the common column between both the CSV is &quot;County&quot;

Final Cleaned Data: County\_crime\_and\_population\_combined.csv

 **2. How do police staffing levels impact overall Nebraska crime rates? - Will Wetzel**

===========================================================================

=== Law Enforcement Employment and Crime by Agency Cleaning and Merging ===

===========================================================================

= Documented by William Wetzel

====================

=== General Info ===

====================

Manual cleaning steps are detailed in &quot;Cleaning Steps&quot;

All python script cleaning procedures were completed in:

python 3.6.1

pandas 0.20.1

numpy 1.12.1

Scripts can be run in R with rPython.  You will still need to open the python file to select which function you are going to run, and specify file locations on your machine if needed.  The script is meant to be run as it was developed, one function at a time.  Even if running the script in R, you will need to manipulate the python code to point to the correct csv files, and to access the desired functions.

======================

=== Cleaning Steps ===

======================

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

**3. What trends in the types and amount of crimes committed can be observed? - Chaitra Venkatesan**

===========================================================================

=== Offence Type and Offence Month by Year Cleaning and Merging ===

===========================================================================

= Documented by Chaitra Venkatesan



====================

=== General Info ===

====================

Manual cleaning steps are detailed in &quot;Cleaning Steps&quot;

======================

=== Cleaning Steps ===

======================



1.  Data was scraped from the Offence Data Query hosted on the Nebraska government website ( [http://www.nebraska.gov/crime\_commission/arrest/offense.cgi](http://www.nebraska.gov/crime_commission/arrest/offense.cgi)) for each particular year, starting from 2007 through 2016. The dataset generated was compiled for each year by having the offence type as column as months as rows.

Data Checkpoint: Offence\_Month\_Year\_NE\_2007-2016.csv

2. The offence type for offence month can be obtained from the offence data query by specifying the year in the optional field.

3. For further analysis, it was necessary to obtain the unemployment data of Nebraska from 2007-2016. This data was obtained from the Bureau of Labor Statistics by specifying the year range and the generated dataset was available to download in a csv format.  The unemployment rate plays an important role in the number of offence committed.

Data Checkpoint: NE\_Unemployment\_Rate\_2007-2016.csv

4. To complete our analysis, we wanted to assess the S&amp;P 500 (Standard &amp; Poor) price change for each particular month from 2007-2016 and its effect on the offence committed. Historical monthly S&amp;P price data was scraped from ( [http://www.multpl.com/s-p-500-historical-prices/table/by-month](https://urldefense.proofpoint.com/v2/url?u=http-3A__www.multpl.com_s-2Dp-2D500-2Dhistorical-2Dprices_table_by-2Dmonth&amp;d=DwMFaQ&amp;c=kj4KSSBt5oOaHuCCpWXkZw&amp;r=3QlgnfZB0OtTC1ww9qrZOBFg2gN5hkX7qHnyB3EpEdc&amp;m=UH8YviaGs2QMmKNRjtSqXhDcKL5O6Eg9iCIpm-zbqQ0&amp;s=Zm8f17rc63OFbjfWmMiAZa5aeb-yBmGbjMEFpKMLp0c&amp;e=)), and copied into Excel for the dates of from Jan-2016 through Dec-2007.

5. A row was inserted at the top of the table to provide header columns.  For columns 1-4 of the table on the first row, column header names were entered - &quot;Month\_Year&quot;, &quot;S&amp;P500\_price&quot;, &quot;S&amp;P500\_price\_change&quot;, &quot;S&amp;P\_500\_percent\_change&quot;.

6. In the third column, a formula to subtract the earlier month from the later month was entered to calculate the price difference from month to month; this formula was copied for each month of data.  In the fourth column a formula of (Price Change/Previous Month Price) was entered to calculate the percent change month to month; this formula was applied to each month.

7. Rounding was set to 3 decimal places for the percent change column. A date format mask of &quot;mm/dd/yy&quot; was applied to the Month\_Year column.

Data Checkpoint: S&amp;P500\_Data\_2007-2016.csv

8. The columns obtained from the Offence\_Month\_Year\_NE\_2007-2016.csv were formatted accordingly:

·         Month\_Year was date formatted with a mask of &#39;mm-yy&#39;.

·         The offence type columns were formatted as Crime\_offence name

The rows were named from Jan-07 to Dec-16 and the corresponding offence data was copied from the Offence\_Month\_Year\_NE\_2007-2016.csv and merged accordingly.

9. Three new columns were inserted after the Month\_Year column and they are &#39;NE\_Unemployment\_Rate&#39; from NE\_Unemployment\_Rate\_2007-2016.csv and &#39;S&amp;P\_500\_Price\_Change&#39;, &#39;S&amp;P\_500\_Percent\_Gain\_or Loss&#39; from S&amp;P500\_Data\_2007-2016.csv.

10. The &#39;NE\_Unemployment\_Rate&#39; data from the NE\_Unemployment\_Rate\_2007-2016.csv and the

&#39;S&amp;P\_500\_Price\_Change&#39;, &#39;S&amp;P\_500\_Percent\_Gain\_or Loss&#39; data from the S&amp;P500\_Data\_2007-2016.csv were merged in the new combined sheet accordingly.

Final Cleaned Data: Off typ\_Off mnth\_Unemp\_S&amp;P500.csv

Through this compiled dataset, we can identify multiple patterns such as the impact of unemployment rate on the crimes committed, the impact of stock price change on the crimes committed etc. across the state of Nebraska.
