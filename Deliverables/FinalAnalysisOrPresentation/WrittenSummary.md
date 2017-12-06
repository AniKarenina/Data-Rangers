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

**Crime and Population**
![Crime and Population image and Population and crime per population Image](https://github.com/Shivani-Parihar/Data-Rangers/blob/master/Deliverables/FinalAnalysisOrPresentation/images/CrimeAgainstPopulation.png)

![Crime and Population image and Population and crime per population Image1](https://github.com/Shivani-Parihar/Data-Rangers/blob/master/Deliverables/FinalAnalysisOrPresentation/images/CrimePerPopHighPopulation.png)

The two plot above show quite a different picture as the first one takes into account the Population and the Total Crime but the other one show the relation between Population and crime/population ratio. The First graph shows something obvious where the more people the higher the number of crime. But when the graph is plotted taking crime per population in account we see that most of the counties which have fairly close or similar population but the crime per population ratio varies at a fair extent. So that is what opens up the opportunity to ask or question that behavior.


**Police Staffing Geography**
![Police Staffing Image](https://raw.githubusercontent.com/Shivani-Parihar/Data-Rangers/master/Deliverables/FinalAnalysisOrPresentation/images/soStaffingNe.png)  
This plot showcases two interesting facts about police staffing throughout the state of NE. The best ratio of police to public exists in two of the largest counties, Sarpy and Douglas. When we compare the ratio of sworn officers to crime rates, we find there is little (0.09 Pearson) correlation between the two. This map also showcases that the majority of counties lack a police department, and officers in the middle of the state must travel north and south to provide coverage to residents. While data was not available detailing how police resources are spread across counties, it would be an interesting next step to obtain this information through interviews.  

**Police Staffing vs Crime Rate**  
![Police Staffing vs Crime](https://raw.githubusercontent.com/Shivani-Parihar/Data-Rangers/master/Deliverables/FinalAnalysisOrPresentation/images/policeCrime.png)  
This chart shows that the relationship between police hiring rates and the overall crime rate are not related. While this is not a regression, by visually comparing the red crime trend line with the purple total officers trend - they have no relationship. When we check using Pearson Correlation, we find there is a 0.09912 correlation between total officer hiring rates and regional crime rate.

** Vandalism Incidents Vs Unemployment rate
![Vandalism incidents Vs Unemployment rate](https://github.com/Shivani-Parihar/Data-Rangers/blob/master/Deliverables/FinalAnalysisOrPresentation/images/vandalism_unem.png)

This graph shows the relationship between the unemployment rate and vandalism crimes committed across the state of Nebaska on a yearly basis. The regression line displays the average number of crimes committed for a given unemployment rate.

#### Findings

See our knitted HTML document for complete code and visualization.

##### How does the population level of a county impact the type of crimes committed?

Our main finding shows the result that there is a direct correlation between the total number of crime and population of the county. If looked at the graph a linear regression line can be drawn. But we also found out that there was a very different plot when for a group of counties when we took the crime per population into account as it showed us that many counties with similar population has very different ratio of crime to population. For instance Holt and Red Willow county have almost similar population but the Red willow county's crime per population ration is much higher than Holt's; which is very interesting as it gives us opportunity to read into this deviant pattern

##### How do police staffing levels impact overall crime rates?  

Our main finding relating to this research question is that additional data and analysis is required to sufficiently answer this question. Using data provided by the NCC, we have determined there is no meaningful relationship between police staffing levels, hiring rates, or population covered by a given department and crime rate. We have learned that urban areas have more crime per person than rural areas across the entire state.

Rural areas typically have lower officer to population ratios than cities, yet still have significantly lower crime rates. Any given year, the counties with the highest crime rates fall within the top 20% of counties by population. This leads us to conclude that there is a population level of around 20,000 in the state of NE, where a county becomes "urbanized" for lack of a better term and is likely to encounter higher crime rates. Deploying more officers in this scenario is not showing to impact crime rates. Nebraska law enforcement will need to adopt additional strategies to combat crime in the states more populous areas.


##### How do the types and amounts of crime committed change over the course of a year by unemployment?

The unemployment data in Nebraska is collected from 2007-2016 along with the types of crimes committed in those paticular years. Our main focus was to idcentify if there exists a relationship between the type of crime committed and the unemployment rate. If a relationship is identified, it would tell that a particular type of crime is committed more frequently because of the unemployment rate in Nebraska.

From our analysis, it was identified that out of all the crimes committed in Nebraska as listed by the Nebraska Crime Commission, the frequency of crimes committed due to drving under influence and vandalism crimes were influenced by the unemployment rate. Thus, we can say that unemeployment rate is one among the many reasons for the incidence of such crimes.



Word Count: 1000
