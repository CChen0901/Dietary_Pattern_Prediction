# Dietary Pattern Prediction based on 16 simple food choices

## About

* **Author**: Chen CHEN <chenchen10@genomics.cn>

## Background

This project uses the Random Forest (RF) model for predicting dietary patterns. By loading a pre trained model and using the provided sample data for prediction, the predicted results are ultimately mapped to specific dietary pattern.

## This repository

This repository contains the model, script and sample data. Inside this repository you will find:

* _data_: This folder contains mock data to use and understand the tools developed. The mock data is ready to be analysed using the r-script. Although I can not publish raw data because it contain individual information in my study, the mock data permits running the script and understanding how the model works.
* _model_: This folder contains the model to be used.
* _rscript_: This folder contains the R script with the main functions to predict.

## Detailed process

1. Clone Repository

first of all, you should clone the project locally using Git:
```sh
git clone https://github.com/CChen0901/Dietary_Pattern_Prediction.git
```
2. Set file path

Ensure that the file structure is as shown above, especially the following points:
* The Prediction Model. rds file is located in the model/folder.
* The mock. csv data file is located in the data/folder.

3. Run R script

Go to the rscript/folder, open the predict_demo.R script, and check if the path settings in the following code are correct.
```sh
# Import the model for prediction
model <- read RDS("../model/Prediction Model.rds")
# Load sample data
sample_data <- read_csv("../data/mock.csv")
```
In this code, read RDS ("../model/Prediction Model. rds") and read_csv ("../data/mock. csv") use relative paths. This ensures that the path can be correctly resolved when the project runs on different machines.

4. Execute script

Open RStudio or R console and execute the following command:
```sh
source("scripts/predict_demo.R")
```
This will load the model and data, and output the predicted results.

5. Results explanation

Using the model, samples will be predicted as one of the following dietary patterns: the chinese-adapted Mediterranean diet, the conventional Chinese
urban diet, and the Chinese-adapted Western diet. Based on the four key food choices, they were defined as follows: the Chinese-adapted Mediterranean diet is characterized by high consumption of whole grains and tubers and low intake of salty and smoked foods, whereas the Chinese-adapted Western diet is marked by high consumption of smoked and salty foods and low intake of whole grains and tubers. The conventional Chinese urban diet shows no strong preference for the four key dietary factors.

6. Use your owner food choices
Except mock data we provide, you can use your true response to 12 food groups to determine your dietary pattern. 


## Software versions
* R 4.4.2
* randomForest 4.7-1.2 (R version supported ≥ 4.1.0)
