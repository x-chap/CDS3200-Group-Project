library(tidyverse)
library(caret)
set.seed(123)

locusts_clip1 <- read.csv("locusts_clip1.csv")
locusts_clip2 <- read.csv("locusts_clip2.csv")
locusts_combined <- rbind(locusts_clip1, locusts_clip2)
locusts_combined <- na.omit(locusts_combined)

index <- createDataPartition(locusts_combined$state, p = 0.75, list = FALSE)
training_data <- locusts_combined[index, ]
testing_data <- locusts_combined[-index, ]


qda_model <- train(state ~ ., data = training_data, method = "qda")
# wrong model type for regression ?
predictions <- predict(qda_model, newdata = testing_data)


confusionMatrix(qda_predictions$class, testing_data$state)
