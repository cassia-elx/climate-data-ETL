# climate-data-my-cities
Web scraping and cleaning of climate data from 2002-2022 of four cities from my life and family: Elche, Spain; Adelaide, Australia; Helsinki, Finland and Ottawa, Canada.

The purpose was to prepare this data for visualisations in Tableau. [You can view this project on my Tableau Public profile.](https://public.tableau.com/views/ClimateComparisonAdelaideElcheHelsinkiOttawa/Wind-time?:language=en-US&:display_count=n&:origin=viz_share_link)

Libraries used:
- Pandas
- Selenium
- datetime

Data was obtained by web scraping historic climate data from [Weather Underground.](https://www.wunderground.com/)

The file web_scraping.ipynb contains the code used to extract the data.

The file limpieza.ipynb contains the code used to subsequently reorganise the data into dataframes, convert units from imperial to metric and Farenheit to Celsius, and compile the data into one file.