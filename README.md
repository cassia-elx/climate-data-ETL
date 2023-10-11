# climate-data-ETL
Web scraping and cleaning of climate data from 2002-2022 of four cities from my life and family: Elche, Spain; Adelaide, Australia; Helsinki, Finland and Ottawa, Canada.

The purpose was to prepare this data for visualisations in Tableau. [You can view this project on my Tableau Public profile.](https://public.tableau.com/views/ClimateComparisonAdelaideElcheHelsinkiOttawa/Wind-time?:language=en-US&:display_count=n&:origin=viz_share_link)

Libraries used:
- Pandas
- Selenium
- datetime
- json
- time
- warnings

Data was obtained by web scraping historic climate data from [Weather Underground.](https://www.wunderground.com/)

The file extract.ipynb contains the code used to scrape the data.

The file transform.ipynb contains the code used to subsequently reorganise the data into dataframes, convert units from imperial to metric and Farenheit to Celsius, and compile the data into one csv file.

The file eda.ipynb contains the code used to perform a basic exploration of the data and further transformations, such as the removal of outliers, based on errors discovered during this exploration.

The file load.ipynb contains the code used to create a relational database in MySQL and load the data into four tables in this database.
