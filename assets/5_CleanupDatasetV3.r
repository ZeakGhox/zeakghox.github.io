##### Additional Data Cleanup, create v4 of Dataset

# Imputed values for:
#   EmploymentRatio (47 missing of 186 observations) - average of previous and next values 
#   InequalityIndex (66 missing of 186 observations) - average of previous and next values 
#   NaturalDisasters (11 missing of 186 observations) - assumed 0 disasters for missing values

# produced new dataset (dfv4)

> library(Hmisc)

Attaching package: ‘Hmisc’

The following objects are masked from ‘package:base’:

    format.pval, units

> library(readr)
> df <- read_csv("MSDS696/Datasets/dfv4.csv")
Rows: 186 Columns: 13                                                                                                               
── Column specification ──────────────────────────────────────────────────────────────────────────────────────────────────────────────
Delimiter: ","
dbl (13): EmploymentRatio, GDP, InequalityIndex, AnnualInflation, AnnualGHGEmissions, NaturalDisasters, Died, DiedPer100K, DiedCan...

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> View(df)

# view dataframe structure
> str(df)
spc_tbl_ [186 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ EmploymentRatio     : num [1:186] 56.1 56.1 56.1 55.8 55.8 55.4 55.5 55.5 55.5 55.5 ...
 $ GDP                 : num [1:186] 4.06e+10 1.30e+10 5.42e+11 4.10e+10 1.42e+10 ...
 $ InequalityIndex     : num [1:186] 0.376 0.376 0.376 0.376 0.376 ...
 $ AnnualInflation     : num [1:186] 1.36 4.93 1.46 1.02 1.61 ...
 $ AnnualGHGEmissions  : num [1:186] 5.00e+08 2.22e+08 3.70e+09 4.92e+08 2.02e+08 ...
 $ NaturalDisasters    : num [1:186] 0 0 2 1 1 2 1 1 3 0 ...
 $ Died                : num [1:186] 139693 402545 1711982 140985 388857 ...
 $ DiedPer100K         : num [1:186] 784 1066 955 773 998 ...
 $ DiedCancer          : num [1:186] 23181 12516 267627 23650 12864 ...
 $ DiedCancerPer100K   : num [1:186] 130.1 33.1 149.2 129.7 33 ...
 $ DiedLowerResp       : num [1:186] 6030 61812 67973 5696 58586 ...
 $ DiedLowerRespPer100K: num [1:186] 33.8 163.6 37.9 31.2 150.4 ...
 $ LifeExpectancy      : num [1:186] 71 55 69.8 71.2 55.8 ...
 - attr(*, "spec")=
  .. cols(
  ..   EmploymentRatio = col_double(),
  ..   GDP = col_double(),
  ..   InequalityIndex = col_double(),
  ..   AnnualInflation = col_double(),
  ..   AnnualGHGEmissions = col_double(),
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

# view first few records -- note no missing values as with previous dataframe versions
> head(df)
# A tibble: 6 × 13
  EmploymentRatio           GDP InequalityIndex AnnualInflation AnnualGHGEmissions NaturalDisasters    Died DiedPer100K DiedCancer
            <dbl>         <dbl>           <dbl>           <dbl>              <dbl>            <dbl>   <dbl>       <dbl>      <dbl>
1            56.1  40563768947.           0.376            1.36          499794780                0  139693        784.      23181
2            56.1  13040000000            0.376            4.93          222010990                0  402545       1066.      12516
3            56.1 541988586207.           0.376            1.46         3704502300                2 1711982        955.     267627
4            55.8  41038192838.           0.376            1.02          492325980                1  140985        773.      23650
5            55.8  14160000000            0.376            1.61          202288910                1  388857        998.      12864
6            55.4 561940310345.           0.376            1.07         3641309000                2 1701522        930.     273502
# ℹ 4 more variables: DiedCancerPer100K <dbl>, DiedLowerResp <dbl>, DiedLowerRespPer100K <dbl>, LifeExpectancy <dbl>

# view last few records -- note no missing values as with previous dataframe versions
> tail(df)
# A tibble: 6 × 13
  EmploymentRatio     GDP InequalityIndex AnnualInflation AnnualGHGEmissions NaturalDisasters    Died DiedPer100K DiedCancer
            <dbl>   <dbl>           <dbl>           <dbl>              <dbl>            <dbl>   <dbl>       <dbl>      <dbl>
1            58.1 1.66e12           0.431           0.717          756597400                2  308412        817.      81223
2            53.1 1.12e12           0.446           3.40           862767300                8 1069958        830.      88954
3            56.8 2.13e13           0.397           1.23          5630234000               23 3383729       1022.     602372
4            60.5 2.01e12           0.397           3.40           768046000                3  311640        819.      82822
5            56.5 1.31e12           0.397           5.69           899521860                9 1098301        843.      87979
6            58.4 2.36e13           0.398           4.70          5961865700               29 3464231       1041.     605243
# ℹ 4 more variables: DiedCancerPer100K <dbl>, DiedLowerResp <dbl>, DiedLowerRespPer100K <dbl>, LifeExpectancy <dbl>

# view summary statistics
> summary(df)
 EmploymentRatio      GDP            InequalityIndex  AnnualInflation    AnnualGHGEmissions  NaturalDisasters      Died        
 Min.   :53.05   Min.   :1.304e+10   Min.   :0.3102   Min.   : -0.3555   Min.   :1.917e+08   Min.   : 0.000   Min.   : 139693  
 1st Qu.:57.14   1st Qu.:2.199e+11   1st Qu.:0.3465   1st Qu.:  2.1410   1st Qu.:6.317e+08   1st Qu.: 2.000   1st Qu.: 231403  
 Median :58.43   Median :8.118e+11   Median :0.3703   Median :  3.6503   Median :7.944e+08   Median : 3.000   Median : 440632  
 Mean   :59.01   Mean   :3.056e+12   Mean   :0.3775   Mean   :  8.7495   Mean   :2.390e+09   Mean   : 7.468   Mean   : 976548  
 3rd Qu.:61.24   3rd Qu.:1.867e+12   3rd Qu.:0.3974   3rd Qu.:  6.1662   3rd Qu.:5.594e+09   3rd Qu.: 8.750   3rd Qu.:1927726  
 Max.   :64.40   Max.   :2.359e+13   Max.   :0.5342   Max.   :131.8274   Max.   :7.035e+09   Max.   :36.000   Max.   :3464231  
  DiedPer100K       DiedCancer     DiedCancerPer100K DiedLowerResp   DiedLowerRespPer100K LifeExpectancy 
 Min.   : 439.7   Min.   : 12516   Min.   : 32.76    Min.   : 4146   Min.   : 10.89       Min.   :55.02  
 1st Qu.: 701.4   1st Qu.: 37644   1st Qu.: 59.32    1st Qu.: 6735   1st Qu.: 18.28       1st Qu.:70.95  
 Median : 743.7   Median : 66804   Median :163.31    Median :24156   Median : 25.05       Median :74.30  
 Mean   : 746.2   Mean   :188927   Mean   :137.67    Mean   :35011   Mean   : 35.32       Mean   :73.38  
 3rd Qu.: 865.3   3rd Qu.:364388   3rd Qu.:194.63    3rd Qu.:59477   3rd Qu.: 31.45       3rd Qu.:77.53  
 Max.   :1065.7   Max.   :605243   Max.   :217.56    Max.   :92323   Max.   :165.41       Max.   :82.66  

# confirm 0 missing observations and review number of distinct observations
> describe(df)
df 

 13  Variables      186  Observations
--------------------------------------------------------------------------------------------------------------------------------------
EmploymentRatio 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     186        0      145        1    59.01    2.741    55.62    56.15    57.14    58.43    61.24    62.59    63.00 

lowest : 53.052 55.4   55.5   55.6   55.7  , highest: 63.663 63.844 64.06  64.253 64.396
--------------------------------------------------------------------------------------------------------------------------------------
GDP 
        n   missing  distinct      Info      Mean       Gmd       .05       .10       .25       .50       .75       .90       .95 
      186         0       186         1 3.056e+12 4.428e+12 3.324e+10 5.496e+10 2.199e+11 8.118e+11 1.867e+12 1.119e+13 1.609e+13 

lowest : 1.304000e+10 1.416000e+10 1.520000e+10 1.696000e+10 2.008000e+10, highest: 1.961210e+13 2.065652e+13 2.132295e+13 2.152140e+13 2.359403e+13
--------------------------------------------------------------------------------------------------------------------------------------
InequalityIndex 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     186        0      159        1   0.3775  0.04948   0.3180   0.3314   0.3465   0.3703   0.3974   0.4230   0.5001 

lowest : 0.310191 0.312011 0.313089 0.313718 0.31513 , highest: 0.51974  0.523112 0.532845 0.534204 0.534226
--------------------------------------------------------------------------------------------------------------------------------------
AnnualInflation 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     186        0      186        1    8.749    11.24    1.064    1.394    2.141    3.650    6.166   17.021   28.782 

lowest : -0.355546 0.118627  0.165563  0.299467  0.594055 , highest: 65.4488   86.2333   101.875   114.162   131.827  
--------------------------------------------------------------------------------------------------------------------------------------
AnnualGHGEmissions 
        n   missing  distinct      Info      Mean       Gmd       .05       .10       .25       .50       .75       .90       .95 
      186         0       186         1  2.39e+09 2.541e+09 2.260e+08 3.934e+08 6.317e+08 7.944e+08 5.594e+09 6.300e+09 6.794e+09 

lowest :  191680590  192060780  197755870  198572300  202288910, highest: 6936557000 6985552400 7009083400 7011058000 7035077600
--------------------------------------------------------------------------------------------------------------------------------------
NaturalDisasters 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     186        0       34    0.988    7.468    8.602     0.00     1.00     2.00     3.00     8.75    23.00    28.75 

lowest :  0  1  2  3  4, highest: 30 31 32 33 36
--------------------------------------------------------------------------------------------------------------------------------------
Died 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     186        0      186        1   976548   972521   154848   168181   231403   440632  1927726  2420160  2536324 

lowest :  139693  140985  143699  145850  147367, highest: 2813503 2839205 2854838 3383729 3464231
--------------------------------------------------------------------------------------------------------------------------------------
DiedPer100K 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     186        0      186        1    746.2    174.1    465.5    489.1    701.4    743.7    865.3    939.9    954.7 

lowest : 439.693 442.536 450.097 451.303 455.404, highest: 995.681 997.938 1022.27 1040.57 1065.73
--------------------------------------------------------------------------------------------------------------------------------------
DiedCancer 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     186        0      186        1   188927   213513    17447    23816    37644    66804   364388   555395   581166 

lowest :  12516  12864  13168  14136  14933, highest: 599136 599302 599623 602372 605243
--------------------------------------------------------------------------------------------------------------------------------------
DiedCancerPer100K 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     186        0      186        1    137.7    73.33    35.15    38.53    59.32   163.31   194.63   207.94   212.51 

lowest : 32.76   32.9059 33.0133 33.1358 33.4865, highest: 215.205 216.067 217.366 217.368 217.564
--------------------------------------------------------------------------------------------------------------------------------------
DiedLowerResp 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     186        0      185        1    35011    30225     5195     5588     6735    24156    59477    69430    78444 

lowest :  4146  4304  4656  4822  4872, highest: 83482 83676 84213 86914 92323
--------------------------------------------------------------------------------------------------------------------------------------
DiedLowerRespPer100K 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     186        0      186        1    35.32    26.82    14.97    15.85    18.28    25.05    31.45    64.65   135.85 

lowest : 10.8911 12.66   13.8215 14.2106 14.3175, highest: 152.031 162.81  163.646 165.058 165.41 
--------------------------------------------------------------------------------------------------------------------------------------
LifeExpectancy 
       n  missing distinct     Info     Mean      Gmd      .05      .10      .25      .50      .75      .90      .95 
     186        0      186        1    73.38    6.381    60.36    63.98    70.95    74.30    77.53    79.65    81.67 

lowest : 55.0168 55.8315 56.5985 57.3102 57.947 , highest: 82.0434 82.0471 82.0508 82.3628 82.6565
--------------------------------------------------------------------------------------------------------------------------------------