# Meteorite-Landings-Dataset

## Overview
This project analyzes NASA's Meteorite Landings dataset by cleaning and transforming the raw data in SQL, then building a series of 
Tableau visualizations and an interactive dashboard to explore meteorite mass, classification type, and global distribution.

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

