##### Load and Consolidate Datasets

### Environmental

## Load

> library(readr)

# Greenhouse Gas Emissions
> env_ghg <- read_csv("MSDS696/Datasets/env_ghg.csv", 
+     na = "null")
Rows: 369 Columns: 4                                                                                                                
── Column specification ──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr (2): Country Name, Country Code
dbl (2): Series Name, Annual GHG Emissions

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(env_ghg)

# PM2.5 Air Pollution
> env_pm25 <- read_csv("MSDS696/Datasets/env_pm25.csv", 
+     na = "null")
Rows: 99 Columns: 4                                                                                                                 
── Column specification ──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr (2): Country Name, Country Code
dbl (2): Series Name, Annual PM2.5 Exposure

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Warning message:
One or more parsing issues, call `problems()` on your data frame for details, e.g.:
  dat <- vroom(...)
  problems(dat) 
> View(env_pm25)
> problems(env_pm25) #these are likely empty data values
# A tibble: 57 × 5
     row   col expected actual file 
   <int> <int> <chr>    <chr>  <chr>
 1    16     4 a double ""     ""   
 2    17     4 a double ""     ""   
 3    18     4 a double ""     ""   
 4    19     4 a double ""     ""   
 5    20     4 a double ""     ""   
 6    21     4 a double ""     ""   
 7    22     4 a double ""     ""   
 8    23     4 a double ""     ""   
 9    24     4 a double ""     ""   
10    25     4 a double ""     ""   
# ℹ 47 more rows
# ℹ Use `print(n = ...)` to see more rows

# Natural Disasters
> env_disasters <- read_csv("MSDS696/Datasets/env_disasters.csv", 
+     na = "null")
Rows: 244 Columns: 4                                                                                                                
── Column specification ──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr (2): Country Name, Country Code
dbl (2): Series Name, Natural Disasters

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(env_disasters)

## Merge

> env_1 <- merge(env_ghg,env_pm25,by=c("Country Name","Series Name"),all=TRUE,sort=TRUE,incomparables=NULL)
> View(env_1)
> env <- merge(env_1,env_disasters,by=c("Country Name","Series Name"),all=TRUE,sort=TRUE,incomparables=NULL)
> View(env)
# remove unneeded columns (because of how I merged the dataframes I had extra Country Code columns)
> dsEnvironment <- env[,-c(3,5,7)]
> View(dsEnvironment)
# drop unneeded dataframes
> rm(env)
> rm(env_1)
> rm(env_disasters)
> rm(env_ghg)
> rm(env_pm25)


### Economic

## Load

> library(readr)

# GDP
> econ_gdp <- read_csv("MSDS696/Datasets/econ_gdp.csv", 
+     na = "null")
Rows: 192 Columns: 4                                                                                                                
── Column specification ──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr (2): Country Name, Country Code
dbl (2): Series Name, GDP

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(econ_gdp)

# Employment Rate
> econ_employed <- read_csv("MSDS696/Datasets/econ_employed.csv", 
+     na = "null")
Rows: 192 Columns: 4                                                                                                                
── Column specification ──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr (2): Country Name, Country Code
dbl (2): Series Name, Employment Ratio

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
Warning message:
One or more parsing issues, call `problems()` on your data frame for details, e.g.:
  dat <- vroom(...)
  problems(dat) 
> View(econ_employed)

# Inequality Index
> econ_inequality <- read_csv("MSDS696/Datasets/econ_inequality.csv", 
+     na = "null")
Rows: 121 Columns: 4                                                                                                                
── Column specification ──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr (2): Country Name, Country Code
dbl (2): Series Name, Gini Coefficient

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(econ_inequality)

# Inflation
> econ_inflation <- read_csv("MSDS696/Datasets/econ_inflation.csv", 
+     na = "null")
Rows: 192 Columns: 4                                                                                                                
── Column specification ──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr (2): Country Name, Country Code
dbl (2): Series Name, Annual Inflation

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(econ_inflation)

## Merge

> econ_1 <- merge(econ_employed,econ_gdp,by=c("Country Name","Country Code","Series Name"),all=TRUE,incomparables = NULL)
> View(econ_1)
> econ_2 <- merge(econ_inequality,econ_inflation,by=c("Country Name","Country Code","Series Name"),all=TRUE,incomparables = NULL)
> View(econ_2)
> econ <- merge(econ_1,econ_2,by=c("Country Name","Country Code","Series Name"),all=TRUE,incomparables = NULL)
> View(econ)
# remove Country Code column
> dsEconomics <- econ[,-2]
> View(dsEconomics)
# drop unneeded dataframes 
> rm(econ)
> rm(econ_1)
> rm(econ_2)
> rm(econ_employed)
> rm(econ_gdp)
> rm(econ_inequality)
> rm(econ_inflation)


### Health

## Load

> library(readr)

# Cancer Deaths
> health_deaths_cancer <- read_csv("MSDS696/Datasets/health_deaths_cancer.csv", 
+     na = "null")
Rows: 212 Columns: 5                                                                                                                
── Column specification ──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr (2): Country Name, Country Code
dbl (3): Series Name, Died Cancer, Died Cancer per 100K

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(health_deaths_cancer)

# Lower Respiratory Infection Deaths
> health_deaths_lowerresp <- read_csv("MSDS696/Datasets/health_deaths_lowerresp.csv", 
+     na = "null")
Rows: 212 Columns: 5                                                                                                                
── Column specification ──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr (2): Country Name, Country Code
dbl (3): Series Name, Died Lower Resp, Died Lower Resp per 100K

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(health_deaths_lowerresp)

# Deaths from All Causes
> health_deaths <- read_csv("MSDS696/Datasets/health_deaths.csv", 
+     na = "null")
Rows: 212 Columns: 5                                                                                                                
── Column specification ──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr (2): Country Name, Country Code
dbl (3): Series Name, Died, Died per 100K

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(health_deaths)

# Life Expectancy at Birth (this will be my dependent variable)
> health_lifeexp <- read_csv("MSDS696/Datasets/health_lifeexp.csv", 
+     na = "null")
Rows: 336 Columns: 4                                                                                                                
── Column specification ──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
chr (2): Country Name, Country Code
dbl (2): Series Name, Life Expectancy

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(health_lifeexp)

## Merge

> h1 <- merge(health_deaths,health_deaths_cancer,by=c("Country Name","Country Code","Series Name"),all=TRUE,incomparables = NULL)
> View(h1)
> h2 <- merge(health_deaths_lowerresp,health_lifeexp,by=c("Country Name","Country Code","Series Name"),all=TRUE,incomparables = NULL)
> View(h2)
> health <- merge(h1,h2,by=c("Country Name","Country Code","Series Name"),all=TRUE,incomparables = NULL)
> View(health)
# Remove Country Code Column
> dsHealth <- health[,-2]
> View(dsHealth)
# drop unneeded dataframes 
> rm(h1)
> rm(h2)
> rm(health)
> rm(health_deaths)
> rm(health_deaths_cancer)
> rm(health_deaths_lowerresp)
> rm(health_lifeexp)

### Final Merge of all 3 datasets

> d1 <- merge(dsEconomics,dsEnvironment,by=c("Country Name","Series Name"),all=TRUE,incomparables = NULL)
> View(d1)
> df <- merge(d1,dsHealth,by=c("Country Name","Series Name"),all=TRUE,incomparables = NULL)
> View(df)
# drop unnecessary dataframe
> rm(d1)
