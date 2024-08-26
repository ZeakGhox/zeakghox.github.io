##### Feature reduction, finalized dataframe

# Based on the correlation plot, Died and Died from Cancer were highly correlated with Annual GHG Emissions, 0.97 and 0.98, respectively
# Died and DiedCancer were deleted because of the high correlation
# DiedLowerResp was deleted as it was felt that this data was implicit in LifeExpectancy
# The decision was made to also delete DiedPer100K, DiedCancerPer100K, DiedLowerRespPer100K given the difference in measurement scale from the remaining variables.

> library(caret)
Loading required package: ggplot2

> cor(df)
                     EmploymentRatio        GDP InequalityIndex AnnualInflation AnnualGHGEmissions NaturalDisasters       Died
EmploymentRatio           1.00000000  0.3500114     -0.11543184      0.03434114          0.3368910        0.4608457  0.2280883
GDP                       0.35001144  1.0000000      0.24251218     -0.18556876          0.7403862        0.8250995  0.8040534
InequalityIndex          -0.11543184  0.2425122      1.00000000     -0.02942307          0.1484554        0.3000769  0.2366777
AnnualInflation           0.03434114 -0.1855688     -0.02942307      1.00000000         -0.2100211       -0.1486141 -0.1804255
AnnualGHGEmissions        0.33689099  0.7403862      0.14845536     -0.21002110          1.0000000        0.7694264  0.9658883
NaturalDisasters          0.46084573  0.8250995      0.30007688     -0.14861412          0.7694264        1.0000000  0.7931881
Died                      0.22808829  0.8040534      0.23667767     -0.18042546          0.9658883        0.7931881  1.0000000
DiedPer100K              -0.03765492  0.3348596     -0.26328535     -0.38921782          0.5486079        0.2394359  0.5453577
DiedCancer                0.36294408  0.8354201      0.18720822     -0.21891952          0.9839261        0.8355241  0.9762767
DiedCancerPer100K         0.52289774  0.3950184     -0.33987517     -0.40947877          0.5242090        0.3367447  0.3803180
DiedLowerResp             0.03577994  0.4200323      0.17894581     -0.08156310          0.6947751        0.5385825  0.7554321
DiedLowerRespPer100K     -0.33828411 -0.2416500     -0.09612767      0.01343379         -0.2637171       -0.2458962 -0.1804483
LifeExpectancy            0.55705550  0.3850246     -0.05755127     -0.27640718          0.2923933        0.3357806  0.1911763
                     DiedPer100K DiedCancer DiedCancerPer100K DiedLowerResp DiedLowerRespPer100K LifeExpectancy
EmploymentRatio      -0.03765492  0.3629441        0.52289774    0.03577994          -0.33828411     0.55705550
GDP                   0.33485958  0.8354201        0.39501837    0.42003232          -0.24165004     0.38502464
InequalityIndex      -0.26328535  0.1872082       -0.33987517    0.17894581          -0.09612767    -0.05755127
AnnualInflation      -0.38921782 -0.2189195       -0.40947877   -0.08156310           0.01343379    -0.27640718
AnnualGHGEmissions    0.54860793  0.9839261        0.52420896    0.69477505          -0.26371708     0.29239333
NaturalDisasters      0.23943588  0.8355241        0.33674468    0.53858248          -0.24589616     0.33578061
Died                  0.54535767  0.9762767        0.38031797    0.75543213          -0.18044828     0.19117635
DiedPer100K           1.00000000  0.5203978        0.43510176    0.63685341           0.38165089    -0.14647390
DiedCancer            0.52039777  1.0000000        0.51833848    0.67591941          -0.26752853     0.33231959
DiedCancerPer100K     0.43510176  0.5183385        1.00000000   -0.03559878          -0.52470830     0.78207278
DiedLowerResp         0.63685341  0.6759194       -0.03559878    1.00000000           0.42319136    -0.37896994
DiedLowerRespPer100K  0.38165089 -0.2675285       -0.52470830    0.42319136           1.00000000    -0.83990509
LifeExpectancy       -0.14647390  0.3323196        0.78207278   -0.37896994          -0.83990509     1.00000000

> library(corrplot)
corrplot 0.94 loaded

> corrplot(cor(df),method="number")

> dfv2 <- df[,-c(7:12)]

> View(dfv2)

