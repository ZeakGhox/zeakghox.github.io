##### Train and Model the Dataset

# partition the dataframe into training and testing sets for use with the random forest model
> trainingSet <- createDataPartition(dfv2$LifeExpectancy,list=FALSE)
> View(trainingSet)

> dfv2Training <-dfv2[trainingSet,]
> dfv2Testing <- dfv2[-trainingSet,]

> library(Metrics)

Attaching package: ‘Metrics’

The following objects are masked from ‘package:caret’:

    precision, recall

> library(caret)

> library(randomForest)
randomForest 4.7-1.1
Type rfNews() to see new features/changes/bug fixes.

Attaching package: ‘randomForest’

The following object is masked from ‘package:ggplot2’:

    margin

# for reproducibility
> set.seed(13)

# train the model using LifeExpectancy as the dependent variable. Because this data is numeric the Random Forest algorithm will assume a Regression method
> model_lifex <- train(LifeExpectancy ~ ., data = dfv2Training, method = "rf", prox=TRUE, importance = TRUE)

# display most important variables to the model
> varImp(model_lifex)
rf variable importance

                   Overall
AnnualGHGEmissions  100.00
GDP                  20.31
InequalityIndex      16.13
EmploymentRatio      13.71
AnnualInflation      11.18
NaturalDisasters      0.00

> plot(varImp(model_lifex))

> pred_lifex <- predict(model_lifex,dfv2Testing)

# the higher the correlation the better the model's prediction
> cor(pred_lifex,dfv2Testing$LifeExpectancy)
[1] 0.9644618

> summary(dfv2Testing$LifeExpectancy)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  55.02   71.03   74.28   73.84   77.33   82.36 

> summary(pred_lifex)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  58.90   72.59   74.31   74.17   77.26   81.33 

# Mean Absolute Error - any given prediction will be incorrect by about 1 year
> mae(dfv2Testing$LifeExpectancy,pred_lifex)
[1] 1.002396

> plot(dfv2Testing$LifeExpectancy,pred_lifex)

# mtry 4 was selected because it has the lowest MAE
> model_lifex
Random Forest 

94 samples
 6 predictor

No pre-processing
Resampling: Bootstrapped (25 reps) 
Summary of sample sizes: 94, 94, 94, 94, 94, 94, ... 
Resampling results across tuning parameters:

  mtry  RMSE      Rsquared   MAE     
  2     1.755441  0.9320762  1.288147
  4     1.733921  0.9238749  1.162944
  6     1.846748  0.9089008  1.213753

RMSE was used to select the optimal model using the smallest value.
The final value used for the model was mtry = 4.

