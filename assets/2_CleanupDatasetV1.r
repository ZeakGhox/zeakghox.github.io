##### Additional Data Cleanup, create v2 of Dataset

# clean-up data
# remove years 1900 - 1950 due to lack of data
# output dataframe to use as starting point
> write.table(df,file="MSDS696/Datasets/df.csv",sep=",",na="",row.names = FALSE)

# remove rows in Excel
# renamed "Gini Coefficient" column to "Inequality Index"
# removed spaces and standardized header row
# clear workspace and load updated dataset
> library(readr)
> df <- read_csv("MSDS696/Datasets/dfv2.csv", 
+     col_types = cols(SeriesName = col_character()))
> View(df) 
