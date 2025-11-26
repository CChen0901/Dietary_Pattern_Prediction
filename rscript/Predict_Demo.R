# Load necessary packages
install.packages(c("readr", "randomForest"))
library(readr)
library(randomForest)

# Import model for prediction
model <- readRDS("../model/Prediction_Model.rds")

# Use the sample information we provide
# @details
# Each food choice was collected from questionnaire and has two levles ("y"="yes","n"="no")
# The food groups are as following:
# primary carbohydrate intake (defined as consumed at least twice daily, including refined grains, whole grains, tubers, and processed carbohydrates),
# primary protein intake (defined as consumed four or more days per week, including dairy products, eggs and poultry, red meat, seafood, and soy products)
# and taste preferences (defined as frequently consumed, including sweet, smoked, salty, oily, spicy, bitter, and sour foods). 
# Responses were coded into 16 binary variables: RefinedGrains, WholeGrains, Tubers, ProcessedCarbs, Dairy, Egg-Poultry, RedMeat, Seafood, Soy, 
# SweetFoods, SmokedFoods, SaltyFoods, OilyFoods, SpicyFoods, BitterFoods, and SourFoods.
sample_data <- read_csv("../data/mock.csv")

# Predict
prediction_results <- predict(model, sample_data)

# Create a mapping table to convert DP1, DP2, and DP3 back to specific dietary pattern names
level_mapping <- c(
  "DP1" = "Chinese-adapted Mediterranean Diet",
  "DP2" = "conventional Chinese Urban Diet",
  "DP3" = "Chinese-adapted Western Diet"
)

# Map the predicted results back to specific dietary pattern names
prediction_results_full_name <- level_mapping[prediction_results]
# For specific explanations of dietary patterns, please refer to the readme
print(prediction_results_full_name)
