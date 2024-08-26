---
layout: home
title: Main
---
![Life Expectancy and the Impact of Economic and Environmental Factors](/assets/FinalPresentationThumbnail.jpg)

# Overview

* This project seeks to understand the relationship that economic impacts and environmental factors have on global health issues. Machine learning models will be employed to analyze the impacts of economic and environmental shifts.

The final presentation for the project can be viewed [here](https://youtu.be/szbSGTKThKg).


# Process and Methodology

## Load individual datasets and consolidate them into single project dataset ([R Code](/assets/1_LoadDatasets.r))([Dataset v1](/assets/df.csv))

* Original datasets needed to be transposed and have columns aligned
* Data was reduced from representing countries around the world to just Canada, Mexico, and the United States, this was done to ease processing requirements
* Variable data was created using the following categories/sub-categories...
* Environmental
	* Greenhouse Gas Emissions ([Annual Greenhouse Gas Emissions by World Region](https://ourworldindata.org/co2-and-greenhouse-gas-emissions), 1850 to 2022 from Our World in Data)
	* PM2.5 Air Pollution ([Exposure to PM2.5 Air Pollution vs. GDP per Capital, 2019](https://ourworldindata.org/outdoor-air-pollution) from Our World in Data)
	* Natural Disasters ([All Natural Disasters 1900-2021 / EOSDIS](https://www.kaggle.com/datasets/brsdincer/all-natural-disasters-19002021-eosdis?resource=download) from Kaggle) 
* Economic
	* GDP (Gross Domestic Product) ([Gross Domestic Product](https://databank.worldbank.org/home) from The World Bank’s World Development Indicators)
	* Employment Rate ([Employment to Population Ratio](https://databank.worldbank.org/home) from The World Bank’s World Development Indicators)
	* Inequality Index ([National Gini Coefficient](https://databank.worldbank.org/home) measures from The World Bank’s World Development Indicators)
	* Inflation ([Annual Inflation](https://databank.worldbank.org/home) measure from The World Bank’s World Development Indicators)
* Health
	* Cancer Deaths ([Malignant Neoplasms](https://platform.who.int/mortality/themes/theme-details/topics/topic-details/MDB/malignant-neoplasms) from the WHO Mortality Database)
	* Lower Respiratory Infection Deaths ([Lower Respiratory Infections](https://platform.who.int/mortality/themes/theme-details/topics/indicator-groups/indicator-group-details/MDB/lower-respiratory-infections) from the WHO Mortality Database)
	* Deaths from all Causes ([All Causes of Death](https://platform.who.int/mortality/themes/theme-details/MDB/all-causes) from the WHO Mortality Database)
	* Life Expectancy at Birth ([Life Expectancy at Birth, In a Given Year](https://ourworldindata.org/life-expectancy) from Our World in Data)

## Clean-up initial dataset and create updated, version 2, dataset ([R Code](/assets/2_CleanupDatasetV1_.r))([Dataset v2](/assets/dfv2.csv))

* Remove years 1900 - 1950 due to an overwhelming lack of data across variables
    * Microsoft Excel was used to update dataset
* Renamed “Gini Coefficient” to “Inequality Index” to make the name more easily understood
* Removed spaces and standardized the header row

## View summary statistics for dataset ver. 2 ([R Code](/assets/3_SummaryStatisticsDatasetV2.r))

* There are still quite a few missing observations and extraneous columns in the dataset

## Clean-up dataset ver. 2, and create updated, version 3, dataset ([R Code](/assets/4_CleanupDatasetV2_.r))([Dataset v3](/assets/dfv3.csv))

* Reduced the dataset to 51 years, eliminated periods outside of 1960 - 2021
* Deleted CountryName and SeriesName columns to have an all numeric dataset
* Deleted the AnnualPM2.5Exposure column because more than 80% of the observations were blank

## View summary statistics for dataset ver. 3 ([R Code](/assets/5_CleanupDatasetV3_.r))

* Greatly reduced the number of missing observations

## Perform feature reduction and finalize an updated, version 4, dataset ([R Code](/assets/6_FinalizedDatasetV4.r))([Dataset v4](/assets/dfv4.csv))

* Imputed values for EmploymentRatio, InequalityIndex, and NaturalDisasters. EmploymentRatio and InequalityIndex were filled using and average of the previous and next values, NaturalDisasters was filled substituting 0 in place of missing values
* Based on the correlation plot of variables, Died and Died from Cancer were highly correlated with Annual Greenhouse Gas Emissions, 0.97 and 0.98, respectively. These columns were deleted as a result
* The variable DiedLowerResp was deleted as it was felt to be implicit in LifeExpectancy
* Additional variables DiedPer100K, DiedCancerPer100K, and DiedLowerRespPer100K were deleted due to the difference in measurement scale with the remaining variables

![Correlation Plot](/assets/correlation_plot.jpeg)

## Run the Random Forest algorithm by training and modeling the dataset ver 4 ([R Code](/assets/7_RunRandomForest.r))

* The model was partitioned into 50/50 training and testing data frames
* LifeExpectancy was used as the dependent variable. Given that this variable was numeric the Random Forest algorithm assumed Regression rather than Classification

## Results and Findings

* The correlation between the predicted Life Expectancy and the test cases is 0.96, meaning that the model is highly accurate in its predictions.

![Prediction vs Test Correlation](/assets/predicted_results_plot.jpeg)

* Any given prediction of the model can be expected to be incorrect by about 1 year. The mean absolute error (MAE) is 1.00
* The lowest MAE was found when the model sampled 4 random variables at each split in a tree 
* Annual Greenhouse Gas Emissions has the greatest impact on Life Expectancy, followed by GDP, and the Inequality Index (Gini Coefficient)

![Variable Importance](/assets/Variable_Importance.jpeg)



