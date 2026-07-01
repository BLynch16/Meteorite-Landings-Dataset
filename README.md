# Meteorite-Landings-Dataset

## Overview
This project analyzes NASA's Meteorite Landings dataset by cleaning and transforming the raw data in SQL, then building a series of 
Tableau visualizations and an interactive dashboard to explore meteorite mass, classification type, and global distribution.

## Interactive Dashboard
[**View the Tableau dashboard**](https://bit.ly/meteorite-dashboard)

<img width="1382" height="751" alt="Image" src="https://github.com/user-attachments/assets/52b9b153-39ef-4927-819f-8aea2f733a12" />

## Data
- **Source:** data.gov
- **Size:** 45,716 records
- **Variables:** name, id, nametype, recclass, mass (g), fall, year, reclat, reclong, GeoLocation

## Data Cleaning & Transformation Steps (SQL)
1) Handled missing values by replacing empty strings with NULL.
2) Searched for duplicate values.
3) Checked for erroneous data values.
4) Verified spelling was consistent and correct.
5) Built a new column based on the size of the meteorite.

## Data Visualizations and Dashboard
1) Bar Chart
   - Meteorite mass by classification type.
   - Top 10 most common meteorite classifications.
   - Top 5 largest meteorites by mass with a legend showing the classification type of each.
   - Number of meteorites per year group showing the average mass in grams of each.
2) Pie Chart
   - Showing the meteorite size distribution (Uknown, Big, or Small) based on the newly added column.
3) Map
   - All meteorites shown as circles that are colored by meteorite size and are sized based on their mass in grams.
   - A heat map to represent the frequency of data points within certain locations.
4) Line Chart
   - Two lines representing the meteorite size showing the meteorite mass over time of each.
5) Dashboard
   - Contains the pie chart of the meteorite size distribution, the bar chart for the top 10 most common meteorite classifications,         and the circle map.
   - Includes interactive elements such as dropdown menus for year groups, meteorite size, and fall. Using these filters dynamically        changes each data visualization in the dashboard.
   - Shows two pictures of the two largest (by mass) meteorites and a few sentences describing the history of each.

## Key Findings
1) 97.16% of the meteorites are small.
2) The average mass of all the meteorites is 13,284 grams or roughly 29 pounds.
3) There was around 25x more meteorites from [1951 - 2000] than [1900 - 1950].
