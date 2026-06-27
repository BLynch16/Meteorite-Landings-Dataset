-- Replace all empty strings with NULL.
UPDATE Meteorite_Landings SET mass_in_grams=NULL WHERE mass_in_grams='';
UPDATE Meteorite_Landings SET year=NULL WHERE year='';
UPDATE Meteorite_Landings SET reclat=NULL WHERE reclat='';
UPDATE Meteorite_Landings SET reclong=NULL WHERE reclong='';
UPDATE Meteorite_Landings SET GeoLocation=NULL WHERE GeoLocation='';

/* Note: only 131 out of 45,716 records of meteorites had an unknown mass. 
This is only about 0.3% of the data, which is why I decided not to 
impute the average. Doing this for such a small fraction isn't worth 
introducing artifical data into the dataset. */

------------------------------------------------------------------------

-- Find duplicate meteorite names.
SELECT name, COUNT(*) 
FROM Meteorite_Landings 
GROUP BY name 
HAVING COUNT(*) > 1;

------------------------------------------------------------------------

-- Find duplicate id numbers.
SELECT id, COUNT(*) 
FROM Meteorite_Landings 
GROUP BY id 
HAVING COUNT(*) > 1;

------------------------------------------------------------------------

-- Check for unrealistic years.
SELECT name, year
FROM Meteorite_Landings
WHERE year < 0 OR year > 2026;

------------------------------------------------------------------------

-- Fix incorrect year for meteorite.
UPDATE Meteorite_Landings
SET year = 2010 -- Year was set to 2101.
WHERE name = 'Northwest Africa 7701'

------------------------------------------------------------------------

-- Mass should never be zero or negative.
SELECT name, mass_in_grams
FROM Meteorite_Landings
WHERE mass_in_grams <= 0;

------------------------------------------------------------------------

-- Fix meteorite mass.
UPDATE Meteorite_Landings
SET mass_in_grams = NULL
WHERE mass_in_grams = 0;

------------------------------------------------------------------------

-- Latitude must be between -90 and 90 and Longitude must be between -180 and 180.
SELECT name, reclat, reclong
FROM Meteorite_Landings
WHERE (reclat < -90 OR reclat > 90)
OR (reclong < -180 OR reclong > 180);

------------------------------------------------------------------------

-- Set Meridiani Planum meteorite coordinates to NULL since it was discovered on Mars
-- by NASA's Mars Exploration Rover Opportunity in January 2005. Fun fact: it was the
-- very first meteorite ever discovered on another planet.
-- reclat: -1.94617
-- reclong: 354.47333
UPDATE Meteorite_Landings
SET reclat = NULL, reclong = NULL, GeoLocation = NULL
WHERE name = 'Meridiani Planum';

------------------------------------------------------------------------

-- See all unique values in fall column.
SELECT DISTINCT fall FROM Meteorite_Landings;

------------------------------------------------------------------------

-- See all unique values in nametype column.
SELECT DISTINCT nametype FROM Meteorite_Landings;

------------------------------------------------------------------------

-- Add a new column to the table.
ALTER TABLE Meteorite_Landings ADD COLUMN meteorite_size TEXT;

------------------------------------------------------------------------

-- Categorize meteorites as big or small based on average mass.
UPDATE Meteorite_Landings
SET meteorite_size = 
CASE
    WHEN mass_in_grams < (
        SELECT AVG(mass_in_grams) FROM Meteorite_Landings) THEN 'Small'
    WHEN mass_in_grams > (
        SELECT AVG(mass_in_grams) FROM Meteorite_Landings) THEN 'Big'
    ELSE 'Unknown'
END;
