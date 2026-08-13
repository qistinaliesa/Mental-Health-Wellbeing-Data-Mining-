#Load necessary data
library(ggplot2)
library(dplyr)

#Read the survey packages


#Load Data
health.df<-read.csv("MentalHealth.csv")
#Data Cleaning
cleaned_dataset <- na.omit(health.df)
cleaned_dataset <- health.df %>%
  mutate(across(where(is.numeric), ~ifelse(is.na(.), mean(., na.rm = TRUE), .)))
cleaned_dataset <- health.df %>%
  mutate(Current.year.of.study = ifelse(
    Current.year.of.study < 1 | Current.year.of.study > 4, NA, Current.year.of.study
  ))
print(cleaned_dataset)
#Data Spilitting
set.seed(123)
cleaned_dataset <- read.csv("MentalHealth.csv")
sample_size <- 0.6 * nrow(cleaned_dataset)
sample_index <- sample(1:nrow(cleaned_dataset), sample_size)
trained_data <- cleaned_dataset[sample_index, ]  
tested_data <- cleaned_dataset[-sample_index, ] 
print(dim(trained_data))
print(dim(tested_data))
View(trained_data)
View(tested_data)

# BarPlot
#rename column
colnames(cleaned_dataset)[colnames(cleaned_dataset) == "What.are.the.main.causes.of.your.stress...Select.all.that.apply."] <- "StressCauses"
stress_cause_counts <- table(cleaned_dataset$StressCauses)#count unique values
stress_cause_df <- as.data.frame(stress_cause_counts)#data frame
# Create a bar plot
par(mar = c(5, 4, 4, 2))  # Adjust margins (bottom, left, top, right)
barplot(stress_cause_df$Freq, 
        names.arg = stress_cause_df$Var1, 
        col = "skyblue", 
        main = "Smartphone & Social Media Impact to Mental Health",
        xlab = "Stress Causes",
        ylab = "Count",
        las = 0)  # Rotate x-axis labels for readability


colnames(cleaned_dataset)[colnames(cleaned_dataset) == "Do.you.think.your.smartphone.use.or.social.media.engagement.contributes.to.your.stress.or.anxiety."] <- "StressCauses"
stress_cause_counts <- table(cleaned_dataset$StressCauses)#count unique values
stress_cause_df <- as.data.frame(stress_cause_counts)#data frame
# Create a bar plot
barplot(stress_cause_df$Freq, 
        names.arg = stress_cause_df$Var1, 
        col = "skyblue", 
        main = "Smartphone & Social Media Impact to Mental Health",
        xlab = "Stress Causes",
        ylab = "Count",
        las = 2)  # las = 2 rotates x-axis labels for readability


install.packages("e1071")
library(e1071)
# Rename the column to a simpler name
colnames(trained_data)[colnames(trained_data) == "What.are.the.main.causes.of.your.stress...Select.all.that.apply."] <- "StressCauses"
# Check the column names to confirm the change
colnames(trained_data)
nb_model <- naiveBayes(StressCauses ~ ., data = trained_data)
print(nb_model)
# Predict using the trained model on the test dataset
nb_predictions <- predict(nb_model, tested_data)

# Check the predictions
head(nb_predictions)

nb_predictions <- predict(nb_model, newdata = tested_data)
confusion_matrix <- table(Predicted = nb_predictions, Actual = tested_data$StressCauses) 

# Create a confusion matrix
confusion_matrix <- table(Predicted = nb_predictions, Actual = trained_data$StressCauses)

# Calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

# Calculate precision
precision <- diag(confusion_matrix) / colSums(confusion_matrix)

# Calculate recall (sensitivity)
recall <- diag(confusion_matrix) / rowSums(confusion_matrix)

# Calculate F1-score
f1_score <- 2 * (precision * recall) / (precision + recall)

# Print the results
cat("Accuracy:", accuracy, "\n")
cat("Precision:", precision, "\n")
cat("Recall:", recall, "\n")
cat("F1-score:", f1_score, "\n")

# Print the confusion matrix
print("Confusion Matrix:")
print(confusion_matrix)



# Rename the column for convenience
colnames(trained_data)[colnames(trained_data) == "What.are.the.main.causes.of.your.stress...Select.all.that.apply."] <- "StressCauses"
# Check unique values in the target variable
unique(trained_data$StressCauses)
nb_model <- naiveBayes(StressCauses ~ ., data = trained_data)
# Make predictions
nb_predictions <- predict(nb_model, trained_data)
# Confusion matrix
confusion_matrix <- table(Predicted = nb_predictions, Actual = trained_data$StressCauses)
print(confusion_matrix)
#Load necessary package
install.packages("dplyr")
library(dplyr)
trained_data$StressCauses <- case_when(
    grepl("Academic", trained_data$StressCauses) ~ "Academic workload",
    grepl("Financial", trained_data$StressCauses) ~ "Financial concerns",
    grepl("Social", trained_data$StressCauses) ~ "Social relationships",
    grepl("Family", trained_data$StressCauses) ~ "Family problems",
    TRUE ~ "Other"
  )


# Convert to factor for Naïve Bayes
trained_data$StressCauses <- as.factor(trained_data$StressCauses)
table(trained_data$StressCauses)

# Calculate the total number of correct predictions
correct_predictions <- sum(diag(confusion_matrix))

# Calculate the total number of predictions
total_predictions <- sum(confusion_matrix)

# Compute accuracy
accuracy <- correct_predictions / total_predictions
print(paste("Accuracy:", round(accuracy * 100, 2), "%"))


library(caret)

# Use the confusionMatrix function for detailed metrics
cm <- confusionMatrix(confusion_matrix)

# Extract precision, recall, and F1
precision <- cm$byClass['Pos Pred Value']
recall <- cm$byClass['Sensitivity']
f1 <- 2 * (precision * recall) / (precision + recall)

print(paste("Precision:", round(precision, 2)))
print(paste("Recall:", round(recall, 2)))
print(paste("F1-Score:", round(f1, 2)))
