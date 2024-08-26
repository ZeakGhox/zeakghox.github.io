##### View Summary Statistics on Dataset v2

# dataframe structure
> str(df)
spc_tbl_ [222 × 16] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ CountryName         : chr [1:222] "Canada" "Canada" "Canada" "Canada" ...
 $ SeriesName          : chr [1:222] "1950" "1951" "1952" "1953" ...
 $ EmploymentRatio     : num [1:222] NA NA NA NA NA NA NA NA NA NA ...
 $ GDP                 : num [1:222] NA NA NA NA NA NA NA NA NA NA ...
 $ InequalityIndex     : num [1:222] NA NA NA NA NA NA NA NA NA NA ...
 $ AnnualInflation     : num [1:222] NA NA NA NA NA NA NA NA NA NA ...
 $ AnnualGHGEmissions  : num [1:222] 4.40e+08 4.53e+08 4.59e+08 4.64e+08 4.71e+08 ...
 $ AnnualPM2_5Exposure : num [1:222] NA NA NA NA NA NA NA NA NA NA ...
 $ NaturalDisasters    : num [1:222] 2 NA NA 1 1 1 NA NA NA 1 ...
 $ Died                : num [1:222] 123789 125454 125950 127381 124520 ...
 $ DiedPer100K         : num [1:222] 904 897 874 863 821 ...
 $ DiedCancer          : num [1:222] 17478 17821 18589 19120 19694 ...
 $ DiedCancerPer100K   : num [1:222] 128 127 129 130 130 ...
 $ DiedLowerResp       : num [1:222] 5670 7386 5363 5909 5040 ...
 $ DiedLowerRespPer100K: num [1:222] 41.4 52.8 37.2 40 33.2 ...
 $ LifeExpectancy      : num [1:222] 68.2 68.5 68.7 69.1 69.9 ...
 - attr(*, "spec")=
  .. cols(
  ..   CountryName = col_character(),
  ..   SeriesName = col_character(),
  ..   EmploymentRatio = col_double(),
  ..   GDP = col_double(),
  ..   InequalityIndex = col_double(),
  ..   AnnualInflation = col_double(),
  ..   AnnualGHGEmissions = col_double(),
  ..   AnnualPM2_5Exposure = col_double(),
  ..   NaturalDisasters = col_double(),
  ..   Died = col_double(),
  ..   DiedPer100K = col_double(),
  ..   DiedCancer = col_double(),
  ..   DiedCancerPer100K = col_double(),
  ..   DiedLowerResp = col_double(),
  ..   DiedLowerRespPer100K = col_double(),
  ..   LifeExpectancy = col_double()
  .. )
 - attr(*, "problems")=<externalptr> 

# view first few rows of dataframe
> head(df)
# A tibble: 6 × 16
  CountryName SeriesName EmploymentRatio   GDP InequalityIndex AnnualInflation AnnualGHGEmissions AnnualPM2_5Exposure NaturalDisasters
  <chr>       <chr>                <dbl> <dbl>           <dbl>           <dbl>              <dbl>               <dbl>            <dbl>
1 Canada      1950                    NA    NA              NA              NA          440038240                  NA                2
2 Canada      1951                    NA    NA              NA              NA          452691550                  NA               NA
3 Canada      1952                    NA    NA              NA              NA          458952600                  NA               NA
4 Canada      1953                    NA    NA              NA              NA          464475000                  NA                1
5 Canada      1954                    NA    NA              NA              NA          470986000                  NA                1
6 Canada      1955                    NA    NA              NA              NA          486844350                  NA                1
# ℹ 7 more variables: Died <dbl>, DiedPer100K <dbl>, DiedCancer <dbl>, DiedCancerPer100K <dbl>, DiedLowerResp <dbl>,
#   DiedLowerRespPer100K <dbl>, LifeExpectancy <dbl>

# view last few rows of dataframe
> tail(df)
# A tibble: 6 × 16
  CountryName   SeriesName EmploymentRatio     GDP InequalityIndex AnnualInflation AnnualGHGEmissions AnnualPM2_5Exposure
  <chr>         <chr>                <dbl>   <dbl>           <dbl>           <dbl>              <dbl>               <dbl>
1 United States 2018                  60.4 2.07e13           0.414            2.44         6277740000                7.78
2 United States 2019                  60.8 2.15e13           0.415            1.81         6195233300                7.66
3 United States 2020                  56.8 2.13e13           0.397            1.23         5630234000               NA   
4 United States 2021                  58.4 2.36e13           0.398            4.70         5961865700               NA   
5 United States 2022                  60.0 2.57e13          NA                8.00         6001570000               NA   
6 United States 2023                  60.3 2.74e13          NA                4.12                 NA               NA   
# ℹ 8 more variables: NaturalDisasters <dbl>, Died <dbl>, DiedPer100K <dbl>, DiedCancer <dbl>, DiedCancerPer100K <dbl>,
#   DiedLowerResp <dbl>, DiedLowerRespPer100K <dbl>, LifeExpectancy <dbl>

# view summary statistics
> summary(df)
 CountryName         SeriesName        EmploymentRatio      GDP            InequalityIndex  AnnualInflation    AnnualGHGEmissions 
 Length:222         Length:222         Min.   :53.05   Min.   :1.304e+10   Min.   :0.3102   Min.   : -0.3555   Min.   :1.832e+08  
 Class :character   Class :character   1st Qu.:57.61   1st Qu.:2.383e+11   1st Qu.:0.3362   1st Qu.:  2.1782   1st Qu.:5.650e+08  
 Mode  :character   Mode  :character   Median :59.32   Median :8.776e+11   Median :0.3729   Median :  3.8274   Median :7.815e+08  
                                       Mean   :59.52   Mean   :3.277e+12   Mean   :0.3839   Mean   :  8.6647   Mean   :2.261e+09  
                                       3rd Qu.:61.69   3rd Qu.:2.096e+12   3rd Qu.:0.4080   3rd Qu.:  6.4012   3rd Qu.:4.917e+09  
                                       Max.   :64.40   Max.   :2.736e+13   Max.   :0.5342   Max.   :131.8274   Max.   :7.035e+09  
                                       NA's   :77      NA's   :30          NA's   :101      NA's   :30         NA's   :3          
 AnnualPM2_5Exposure NaturalDisasters      Died          DiedPer100K       DiedCancer     DiedCancerPer100K DiedLowerResp  
 Min.   : 6.206      Min.   : 1.000   Min.   : 123789   Min.   : 439.7   Min.   :  8686   Min.   : 26.85    Min.   : 4146  
 1st Qu.: 7.684      1st Qu.: 2.000   1st Qu.: 225528   1st Qu.: 707.9   1st Qu.: 32868   1st Qu.: 59.60    1st Qu.: 6700  
 Median : 9.242      Median : 3.000   Median : 435056   Median : 788.6   Median : 65546   Median :150.98    Median :28474  
 Mean   :13.811      Mean   : 7.372   Mean   : 946812   Mean   : 771.1   Mean   :178511   Mean   :135.47    Mean   :34886  
 3rd Qu.:21.057      3rd Qu.: 8.000   3rd Qu.:1894558   3rd Qu.: 875.5   3rd Qu.:319683   3rd Qu.:192.03    3rd Qu.:59019  
 Max.   :32.681      Max.   :36.000   Max.   :3464231   Max.   :1259.7   Max.   :605243   Max.   :217.56    Max.   :92323  
 NA's   :180         NA's   :26       NA's   :10        NA's   :10       NA's   :10       NA's   :10        NA's   :10     
 DiedLowerRespPer100K LifeExpectancy 
 Min.   : 10.89       Min.   :43.97  
 1st Qu.: 18.78       1st Qu.:69.87  
 Median : 25.88       Median :73.64  
 Mean   : 38.69       Mean   :71.89  
 3rd Qu.: 33.05       3rd Qu.:76.88  
 Max.   :193.48       Max.   :82.66  
 NA's   :10           NA's   :6      

# primarily looking at the number of missing observations relative to the total observations per column
> describe(df)
df 

 16  Variables      222  Observations
--------------------------------------------------------------------------------------------------------------------------------------
CountryName 
       n  missing distinct 
     222        0        3 
                                                    
Value             Canada        Mexico United States
Frequency             74            74            74
Proportion         0.333         0.333         0.333
--------------------------------------------------------------------------------------------------------------------------------------
SeriesName 
       n  missing distinct 
     222        0       74 

lowest : 1950 1951 1952 1953 1954, highest: 2019 2020 2021 2022 2023
--------------------------------------------------------------------------------------------------------------------------------------
EmploymentRatio 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     145       77      138        1    59.52    2.729    56.20    56.69    57.61    59.32    61.69    62.71    63.20 

lowest : 53.052 55.4   55.5   55.7   56.1  , highest: 63.663 63.844 64.06  64.253 64.396
--------------------------------------------------------------------------------------------------------------------------------------
GDP 
        n   missing  distinct      Info      Mean       Gmd       .05       .10       .25       .50       .75       .90       .95 
      192        30       192         1 3.277e+12 4.766e+12 3.415e+10 5.588e+10 2.383e+11 8.776e+11 2.096e+12 1.214e+13 1.721e+13 

lowest : 1.304000e+10 1.416000e+10 1.520000e+10 1.696000e+10 2.008000e+10, highest: 2.132295e+13 2.152140e+13 2.359403e+13 2.574411e+13 2.736094e+13
--------------------------------------------------------------------------------------------------------------------------------------
InequalityIndex 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     121      101      121        1   0.3839  0.06325   0.3166   0.3266   0.3362   0.3729   0.4080   0.4891   0.5085 

lowest : 0.310191 0.312011 0.313089 0.313718 0.31513 , highest: 0.51974  0.523112 0.532845 0.534204 0.534226
--------------------------------------------------------------------------------------------------------------------------------------
AnnualInflation 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     192       30      192        1    8.665       11    1.067    1.432    2.178    3.827    6.401   16.520   28.442 

lowest : -0.355546 0.118627  0.165563  0.299467  0.594055 , highest: 65.4488   86.2333   101.875   114.162   131.827  
--------------------------------------------------------------------------------------------------------------------------------------
AnnualGHGEmissions 
        n   missing  distinct      Info      Mean       Gmd       .05       .10       .25       .50       .75       .90       .95 
      219         3       219         1 2.261e+09 2.464e+09 2.021e+08 2.620e+08 5.650e+08 7.815e+08 4.917e+09 6.210e+09 6.684e+09 

lowest :  183209890  186402610  190495630  190989740  191680590, highest: 6936557000 6985552400 7009083400 7011058000 7035077600
--------------------------------------------------------------------------------------------------------------------------------------
AnnualPM2_5Exposure 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
      42      180       42        1    13.81    8.336    7.109    7.280    7.684    9.242   21.057   23.561   30.125 

lowest : 6.20582 7.07878 7.10016 7.27503 7.2798 , highest: 23.6078 24.7174 30.4092 31.7592 32.6814
--------------------------------------------------------------------------------------------------------------------------------------
NaturalDisasters 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     196       26       33    0.984    7.372    8.186     1.00     1.00     2.00     3.00     8.00    22.50    28.25 

lowest :  1  2  3  4  5, highest: 30 31 32 33 36
--------------------------------------------------------------------------------------------------------------------------------------
Died 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     212       10      212        1   946812   950102   140503   157786   225528   435056  1894558  2396993  2491547 

lowest :  123789  124520  125454  125950  127381, highest: 2813503 2839205 2854838 3383729 3464231
--------------------------------------------------------------------------------------------------------------------------------------
DiedPer100K 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     212       10      212        1    771.1    184.6    466.9    499.4    707.9    788.6    875.5    951.8    968.5 

lowest : 439.693 442.536 450.097 451.303 455.404, highest: 1105.5  1138.93 1200.25 1205.02 1259.7 
--------------------------------------------------------------------------------------------------------------------------------------
DiedCancer 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     212       10      212        1   178511   205632    15596    19265    32868    65546   319683   552766   575695 

lowest :   8686   9826  11044  11677  11976, highest: 599136 599302 599623 602372 605243
--------------------------------------------------------------------------------------------------------------------------------------
DiedCancerPer100K 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     212       10      212        1    135.5    72.15    34.60    36.97    59.60   150.98   192.03   205.58   212.17 

lowest : 26.8496 29.4587 32.1032 32.76   32.9059, highest: 215.205 216.067 217.366 217.368 217.564
--------------------------------------------------------------------------------------------------------------------------------------
DiedLowerResp 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     212       10      210        1    34886    29898     5199     5611     6700    28474    59019    68350    77684 

lowest :  4146  4304  4656  4822  4872, highest: 83482 83676 84213 86914 92323
--------------------------------------------------------------------------------------------------------------------------------------
DiedLowerRespPer100K 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     212       10      212        1    38.69    31.13    15.05    16.01    18.78    25.88    33.05    88.86   148.90 

lowest : 10.8911 12.66   13.8215 14.2106 14.3175, highest: 165.41  174.318 192.197 193.079 193.481
--------------------------------------------------------------------------------------------------------------------------------------
LifeExpectancy 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     216        6      216        1    71.89    7.842    55.63    61.38    69.87    73.64    76.88    79.19    81.39 

lowest : 43.9656 44.8093 46.202  47.6474 49.032 , highest: 82.0434 82.0471 82.0508 82.3628 82.6565
--------------------------------------------------------------------------------------------------------------------------------------

