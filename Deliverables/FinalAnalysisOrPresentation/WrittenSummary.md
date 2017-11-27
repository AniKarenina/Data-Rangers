## Data Rangers
### Crime in Nebraska Written Summary
### ISQA-8086
Shivani Singh Parihar  
Chaitra Venkatesan  
William Wetzel

#### Project Audience

Our research and presentation is targeted towards a professional audience who focuses on crime and law enforcement topics in the state of NE. Law enforcement, public defenders, public affairs non-profits, and federal crime researchers, are examples of audiences our findings would target. Generally, this was achieved by focusing our research questions on actionable findings that could be of interest to the aforementioned parties. Research questions:  

1. How does the population level of a county impact the type of crimes committed?
2. How do police staffing levels impact overall crime rates?
3. How do the types and amounts of crime committed change over the course of a year by unemployment?  

Knowing how to best deploy community and public resources against crime likely varies region by region. Our findings would serve to inform decisions made by organizations operating in these areas.  

#### Source Data and Processing

##### Description

The impetus for this project was discovering the [Nebraska Crime Commission](http://www.nebraska.gov) (NCC), and the aggregated annual crime data they published for the state of Nebraska. Using their reports, we formulated our research questions and began organizing our data. All three data sets were scraped from NCC website PDFs using Tabula, and combined into csv files, for years 2007-2016. This year range was selected for two reasons. We felt it was sufficient to answer our research questions, and NCC had gaps in their published data between 2002 and 2007. Despite an email to the NCC webmaster, we were unable to obtain these years for 2 data sets.  

Ancillary data sources were added to the csv files scraped from NCC. These were found on an ad hoc basis, from publically available data sources. Data cleaning tasks were divided among team members, each choosing their desired approach. Python, R, and Excel were utilized - the largest challenge involved adding additional data sources to the scraped data, and pivoting our tables to be in the desired format. See our knitted HTML document for full data cleaning documentation.  

##### Citations

"Law Enforcement Employment in Nebraska Series." 2017, ncc.nebraska.gov/stat-reports#Crime_in_Nebraska_Series. Accessed 1 Oct. 2017.

"Crime in Nebraska Series." 2017, ncc.nebraska.gov/stat-reports#Crime_in_Nebraska_Series. Accessed 1 Oct. 2017.

"Arrest Data Query" 2017, http://www.nebraska.gov/crime\_commission/arrest/arrest.cgi. Accessed 18 Sept. 2017.

"Offence Data Query", http://www.nebraska.gov/crime_commission/arrest/offense.cgi

"S&P 500 Historical Prices by Month" 2017, http://www.multpl.com/s-p-500-historical-prices/table/by-month. Accessed 1 Oct. 2017.  

"Nebraska Unemployment Statistics" 2017, https://data.bls.gov/timeseries/LASST310000000000003. Accessed 12 Oct. 2017.  

"Nebraska Counties by Population" 2017, https://www.nebraska-demographics.com/counties_by_population. Accessed 3 Oct. 2017.



##### Data Licensing

All Nebraska data analyzed in this report falls under a U.S. Government Works license, meaning &quot;...there is generally no copyright restriction on reproduction, derivative works, distribution, performance, or display of a government work.&quot; ( [https://www.usa.gov/government-works](https://www.usa.gov/government-works))

No licensing information was provided for the S&amp;P 500 data obtained from [http://www.multpl.com/](http://www.multpl.com/), their site only states &quot;Information is provided &#39;as is&#39; and solely for informational purposes, not for trading purposes or advice, and may be delayed.&quot;.

The Nebraska unemployment data in this report is fetched from Bureau of Labor Statistics ( [https://data.bls.gov/pdq/SurveyOutputServlet](https://data.bls.gov/pdq/SurveyOutputServlet)) and according to their website policy, the public has a right to access the Bureau&#39;s information and can also request access to federal agency records and obtain information.

The offence data statistics was obtained from the Nebraska government database ( [http://www.nebraska.gov/crime\_commission/arrest/offense.cgi](http://www.nebraska.gov/crime_commission/arrest/offense.cgi)) and according to their information use policy, the public can access, copy or download the material available on their website.

#### Plots  
Police Staffing  
![Police Staffing Image]
(/images/soStaffingNe.png)

