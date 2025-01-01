# TSA-Claims-SAS
prepare and analyze claims data from the Transportation Security Administration (TSA) with SAS Studio

# Exploratory Data Analysis: TSA-Claims Dataset

## Description
The case study data is in a CSV file named TSA Claims 2002 to 2017. This file was created from publicly available data from the TSA and the Federal Aviation Administration, or FAA. The TSA data has information about claims and the FAA data has information about USA airport facilities. The case study data was created by concatenating individual TSA airport claims data, removing some extra columns, and then joining the concatenated TSA claims data with the FAA airport facilities data. The TSA Claims 2002 to 2017 CSV file has 14 columns and over 220,000 rows .

This project uses SAS Studio to perform an exploratory data analysis (EDA) on the famous Titanic dataset. The objectives are to:  
- Explore passenger characteristics (age, gender, class, etc.).  
- Identify trends between variables (e.g., survival and gender).  
- Handle missing data.  

## Content
- **`studyCase01.sas`**: SAS script for data analysis and processing.  
- **`TSAClaims2002_2017.csv`**: Raw dataset (not included if protected by copyright).  
- **`TSAStudyCase_Results`**: Contains exported cleaned data and visualizations.  
- **README.md**: Project documentation.  

## Instructions
T# Final Single PDF Report

The report must answer the following questions:

1. How many date issues are in the overall data?  
   For the remaining analyses, exclude all rows with date issues.

2. How many claims per year of `Incident_Date` are in the overall data?  
   Be sure to include a plot.

3. Dynamic State Analysis:  
   A user should be able to dynamically input a specific state value and answer the following:  
   a. What are the frequency values for `Claim_Type` for the selected state?  
   b. What are the frequency values for `Claim_Site` for the selected state?  
   c. What are the frequency values for `Disposition` for the selected state?  
   d. What is the mean, minimum, maximum, and sum of `Close_Amount` for the selected state?  
      The statistics should be rounded to the nearest integer.
     
## Dataset
- **Source**: [Kaggle Titanic Dataset](https://www.kaggle.com/c/titanic/data)  
- **Key columns**:  
  - `Claim_Number`: has a number for each claim. Some claims can have duplicate claim numbers, but different information for each claim. Those claims are considered valid for this case study.
  - `Incident_Date` and `Date_Received`: have the date the incident occurred and the date the claim was filed.  
  - `Claim_Type`:  has a type of the claim, There are 14 valid claim types.  
  - `Claim_Site`:  column has where the claim occurred. There are 8 valid values for claims site.  
  - `Disposition`: has a final settlement of the claim.
  - `Close_Amount`: has a dollar amount of the settlement.
  - `Item_Category`: has a type of items in the claim. The values in this column vary by year, so we won't work with this column in this case study.
  - `Airport_Code ` and `Airport_Name `: columns have the code and the name where the incident occurred.
  - `County` , `City` , `State ` and `Statename `: columns have the location of the airport. The State column has a two letter state code and Statename has the full state name.

## Results
The analysis results include:  
1. **Visualizations**: Age histogram, bar charts for gender and survival.  
2. **Cleaned data**: Exported `titanic_clean.csv` file.  
3. **Key insights**:  
   - Women had a higher survival probability than men.  
   - First-class passengers had a greater survival rate.  

## About
This project is an example implementation of data science fundamentals using SAS Studio.



