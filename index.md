---
layout: home
---
Life Expectancy and the Impact of Economic and Environmental Factors

# Overview

* This project seeks to understand the relationship that economic impacts and environmental factors have on global health issues. Machine learning models will be employed to analyze the impacts of economic and environmental shifts.

# Process and Methodology

## Load individual datasets and consolidate them into single project dataset

* Environmental
    * Greenhouse Gas Emissions
    * PM2.5 Air Pollution
    * Natural Disasters 
* Economic
    * GDP (Gross Domestic Product)
    * Employment Rate
    * Inequality Index
    * Inflation
* Health
    * Cancer Deaths
    * Lower Respiratory Infection Deaths
    * Deaths from all Causes
    * Life Expectancy at Birth

## Clean-up initial dataset and create updated, version 2, dataset

* Remove years 1900 - 1950 due to an overwhelming lack of data across variables
    * Microsoft Excel was used to update dataset
* Renamed “Gini Coefficient” to “Inequality Index” to make the name more easily understood
* Removed spaces and standardized the header row

## View summary statistics for dataset ver. 2

* There are still quite a few missing observations and extraneous columns in the dataset

## Clean-up dataset ver. 2, and create updated, version 3, dataset

* Reduced the dataset to 51 years, eliminated periods outside of 1960 - 2021
* Deleted CountryName and SeriesName columns to have an all numeric dataset
* Deleted the AnnualPM2.5Exposure column because more than 80% of the observations were blank

## View summary statistics for dataset ver. 3

* Greatly reduced the number of missing observations

## Perform feature reduction and finalize an updated, version 4, dataset

* Imputed values for EmploymentRatio, InequalityIndex, and NaturalDisasters. EmploymentRatio and InequalityIndex were filled using and average of the previous and next values, NaturalDisasters was filled substituting 0 in place of missing values
* Based on the correlation plot of variables, Died and Died from Cancer were highly correlated with Annual Greenhouse Gas Emissions, 0.97 and 0.98, respectively. These columns were deleted as a result
* The variable DiedLowerResp was deleted as it was felt to be implicit in LifeExpectancy
* Additional variables DiedPer100K, DiedCancerPer100K, and DiedLowerRespPer100K were deleted due to the difference in measurement scale with the remaining variables

## Run the Random Forest algorithm by training and modeling the dataset ver 4

* The model was partitioned into 50/50 training and testing data frames
* LifeExpectancy was used as the dependent variable. Given that this variable was numeric the Random Forest algorithm assumed Regression rather than Classification
## 1. **and Findings**
* The correlation between the predicted Life Expectancy and the test cases is 0.96, meaning that the model is highly accurate in its predictions.
* Any given prediction of the model can be expected to be incorrect by about 1 year. The mean absolute error (MAE) is 1.00
* The lowest MAE was found when the model sampled 4 random variables at each split in a tree 
* Annual Greenhouse Gas Emissions has the greatest impact on Life Expectancy, followed by GDP, and the Inequality Index (Gini Coefficient)
 
