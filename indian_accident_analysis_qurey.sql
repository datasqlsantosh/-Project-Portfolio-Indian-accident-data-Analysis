--Certainly! Below are some SQL queries based on your provided table. 
--These queries cover a range of analyses including selecting data, calculating ratios, and ordering results
use [Indian Accident_DB]

go


SELECT * FROM SYS.tables

SELECT * FROM Cause_wise_accident
SELECT * FROM Drunk_cases
SELECT * FROM Area_and_Population_India
SELECT * FROM two_wheeler_Victims
SELECT * FROM Mode_accident
SELECT * FROM two_wheeler_Victims
SELECT * FROM Time_of_Occurrence
SELECT * FROM StateUTCityPlace_deaths_2017
SELECT * FROM StateUTCityandPlace2018
SELECT * FROM StateUTCityPlaceof_2019
SELECT * FROM Road_accidents_place_of_occurence

--Select All Data for Andhra Pradesh (STA1):

SELECT *
FROM Area_and_Population_India
WHERE State_Id = 'STA1';


--Calculate the Ratio of Females per 1,000 Males:**


SELECT State_Id, [State/UT], "Females per 1,000 Males"
FROM Area_and_Population_India
WHERE State_Id = 'STA1';


--Calculate Persons per Sq. Kilometre for States with Population > 80 million:**


SELECT State_Id, [State/UT], Population, [Persons per Sq# Kilometre]
FROM Area_and_Population_India
WHERE Population > 80000000;

--Order States by Percentage of Literacy - Male (Descending):**


SELECT State_Id, [State/UT], "Percentage of Literacy - Male"
FROM Area_and_Population_India
ORDER BY "Percentage of Literacy - Male" DESC;


--Calculate Average Percentage Increase 2001-2011:**


SELECT AVG("Percentage increase 2001-2011") AS Avg_Percentage_Increase
FROM Area_and_Population_India;



--Select All Data for Cause Dangerous or Careless Driving//Over-taking/etc.:**


SELECT *
FROM Cause_wise_accident
WHERE Cause_ID = 'CAU1';

--Calculate the Ratio of Persons Injured - Female to Total Persons Injured:**


SELECT Cause_ID, Cause, "Persons_Injured_Female", "Persons Injured - Total",
       CAST("Persons_Injured_Female" AS FLOAT) / "Persons Injured - Total" AS Female_to_Total_Ratio
FROM Cause_wise_accident
WHERE Cause_ID = 'CAU1';

---Calculate Percentage of Cases for Cause Dangerous or Careless Driving//Over-taking/:**


SELECT Cause_ID, Cause, "No_of_Cases", "Percentage_Share_Cases"
FROM Cause_wise_accident
WHERE Cause_ID = 'CAU1';


--Identify the Cause with the Highest Number of Deaths:**


SELECT top 1 Cause_ID, Cause, persons_died_male + persons_died_female as "Persons Died - Total"
FROM Cause_wise_accident
ORDER BY "Persons Died - Total" DESC



--Calculate Average Percentage Share of Cases:**


SELECT AVG(Percentage_Share_Cases) AS Avg_Percentage_Share_Cases
FROM Cause_wise_accident;


--Certainly! Below are some SQL queries based on your provided table:

--Select All Data for Andhra Pradesh :**

SELECT *
FROM Drunk_cases
WHERE State_Id = 'STA1';


--Calculate the Total Number of Road Accidents for Andhra Pradesh in 2017:**


SELECT State_Id, "State_UT_wise",
       "Drunken_Driving_Consumption_2017" AS Accidents_2017
FROM Drunk_cases
WHERE State_Id = 'STA1';


--Identify the State with the Lowest Number of Road Accidents in 2019:**


SELECT Top 1 State_Id, "State_UT_wise",
       "Drunken_Driving_Consumption_2019" AS Accidents_2019
FROM Drunk_cases
ORDER BY "Drunken_Driving_Consumption_2019" ASC


--Calculate the Total Number of Road Accidents Across All States in 2018:**


SELECT SUM("Drunken_Driving_Consumption_2018") AS Total_Accidents_2018
FROM Drunk_cases;


--Calculate the Average Number of Road Accidents Across All States for Each Year:**

SELECT AVG("Drunken_Driving_Consumption_2017") AS Avg_Accidents_2017,
       AVG("Drunken_Driving_Consumption_2018") AS Avg_Accidents_2018,
       AVG("Drunken_Driving_Consumption_2019") AS Avg_Accidents_2019
FROM Drunk_cases;


--Select All Data for Mode of Transport Truck/Lorry :**


SELECT *
FROM Mode_accident
WHERE Mode_of_Transport_Id = 'MOT1';


--Calculate the Total Persons Died for Mode of Transport MOT1 in 2017:**


SELECT Mode_of_Transport_Id, "Mode_of_Transport", "Total_Persons_Died"
FROM Mode_accident
WHERE Mode_of_Transport_Id = 'MOT1' AND Year = 2017;


--Identify the Mode of Transport with the Lowest Number of Deaths:**


SELECT Top 1 Mode_of_Transport_Id, "Mode_of_Transport", "Total_Persons_Died"
FROM Mode_accident
ORDER BY "Total_Persons_Died" ASC


--Calculate the Total Number of Deaths Across All Modes of Transport in 2017:**


SELECT SUM("Total_Persons_Died") AS Total_Deaths_2017
FROM Mode_accident
WHERE Year = 2017;


--Calculate the Average Number of Deaths Across All Modes of Transport for Each Year:**

SELECT Year,
       AVG("Total_Persons_Died") AS Avg_Deaths
FROM Mode_accident
GROUP BY Year;

--Calculate the Total Number of Persons Died for Each Mode of Transport

SELECT Mode_of_Transport_Id, Mode_of_Transport, SUM(Total_Persons_Died) AS Total_Died
FROM Mode_accident
GROUP BY Mode_of_Transport_Id, Mode_of_Transport;

--Find the Mode of Transport with the Highest Number of Deaths in a Specific Year:

SELECT Top 1 Mode_of_Transport_Id, Mode_of_Transport, Total_Persons_Died, Year
FROM Mode_accident
ORDER BY Total_Persons_Died DESC

--Calculate the Total Number of Deaths Across All Modes of Transport for Each Year:

SELECT Year, SUM(Total_Persons_Died) AS Total_Deaths
FROM Mode_accident
GROUP BY Year;

--Identify the Mode of Transport with the Lowest Number of Deaths in a Specific Year:

SELECT Top 1 Mode_of_Transport_Id, Mode_of_Transport, Total_Persons_Died, Year
FROM Mode_accident
ORDER BY Total_Persons_Died ASC



--Select All Data for State STA1:**


SELECT *
FROM two_wheeler_Victims
WHERE State_id = 'STA1';


--Calculate the Total Two-Wheeler Victims for ANDHRA PRADESH in 2019:**

SELECT State_id, "State_UT_City", "Two_Wheeler_Victims"
FROM two_wheeler_Victims
WHERE State_id = 'STA1' AND Year = 2019;


--Identify the State/UT/City with the Highest Number of Two-Wheeler Victims:**

SELECT Top 1 State_id, "State_UT_City", "Two_Wheeler_Victims"
FROM two_wheeler_Victims
ORDER BY "Two_Wheeler_Victims" DESC


--Calculate the Total Number of Two-Wheeler Victims Across All States in 2019:**


SELECT SUM("Two_Wheeler_Victims") AS Total_Victims_2019
FROM two_wheeler_Victims
WHERE Year = 2019;


--Calculate the Average Number of Two-Wheeler Victims Across All States for Each Year:**


SELECT Year,
       AVG("two_wheeler_Victims") AS Avg_Victims
FROM two_wheeler_Victims
GROUP BY Year;



--Select All Data for Near School/College/Educational Institution:**


SELECT *
FROM Road_accidents_place_of_occurence
WHERE Cause = 'Near School/College/Educational Institution';


--Calculate the Ratio of Persons Injured - Female to Total Persons Injured:**


SELECT Cause, "Persons_Injured_Female", "Persons Injured_Total",
       CAST("Persons_Injured_Female" AS FLOAT) / "Persons Injured_Total" AS Female_to_Total_Ratio
FROM Road_accidents_place_of_occurence
WHERE Cause = 'Near School/College/Educational Institution';



--Calculate Percentage of Cases for Near School/College/Educational Institution:**

SELECT Cause, "No_of_Cases", "Percentage_Share_Cases"
FROM Road_accidents_place_of_occurence
WHERE Cause = 'Near School/College/Educational Institution';



--Identify the Cause with the Highest Number of Deaths:**


SELECT TOP 1 Cause, persons_injured_male + persons_injured_female AS "Persons_Died_Total"
FROM Road_accidents_place_of_occurence
ORDER BY "Persons_Died_Total" DESC


--Calculate Average Percentage Share of Cases:**

SELECT AVG(Percentage_Share_Cases) AS Avg_Percentage_Share_Cases
FROM Road_accidents_place_of_occurence;


--Select All Data for Andhra Pradesh (STA1):**


SELECT *
FROM Drunk_cases
WHERE State_Id = 'STA1';


--Calculate the Total Drunken Driving Consumption Across Years for Andhra Pradesh:**


SELECT State_Id, State_UT_wise,
       Drunken_Driving_Consumption_2017 + Drunken_Driving_Consumption_2018 + Drunken_Driving_Consumption_2019 AS Total_Drunken_Driving_Consumption
FROM Drunk_cases
WHERE State_Id = 'STA1';


--Calculate the Density of Persons per Square Kilometer for Andhra Pradesh:**


SELECT State_Id, State/UT, Population, "Area in sq# Km#",
       Population / "Area in sq# Km#" AS Population_Density
FROM Drunk_cases
WHERE State_Id = 'STA1';


SELECT t1.Category AS Category1, 
       t1.[State_UT_City] AS State1,
       t1.State_UT_City,
       t1.Two_Wheeler_Victims,
       t1.Year,
       t2.[State/UT],
       t2.[Area in sq# Km#],
       t2.Population,
       t2.[Percentage increase 2001-2011],
       t2.[Females per 1,000 Males],
       t2.[Persons per Sq# Kilometre],
       t2.[Percentage of Literacy - Female],
       t2.[Percentage of Literacy - Male],
       t3.State_UT_wise,
       t3.Drunken_Driving_Consumption_2017,
       t3.Drunken_Driving_Consumption_2018,
       t3.Drunken_Driving_Consumption_2019
FROM two_wheeler_Victims t1
JOIN Area_and_Population_India t2 ON t1.State_id = t2.State_Id
JOIN Drunk_cases t3 ON t1.State_id = t3.State_Id;

SELECT * FROM Drunk_cases
SELECT * FROM Area_and_Population_India
SELECT * FROM two_wheeler_Victims

