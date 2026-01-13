library(dplyr)
##Merges the training and the test sets to create one data set.
# 1. Read the three files in the 'train' folder
train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
train_subject <- read.table("train/subject_train.txt")

# 2. Combine them into one training data frame
train_full <- cbind(train_subject, train_y, train_x)


# 3. Read the three files in the 'test' folder
test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt")
test_subject <- read.table("test/subject_test.txt")

# 4. Combine them into one test data frame
test_full <- cbind(test_subject, test_y, test_x)

# 5. Combine the full training and test sets
combined_data <- rbind(train_full, test_full)

# 6. Combine them into one training data frame
##train_full <- cbind(train_subject, train_y, train_x)

##Extracts only the measurements on the mean and standard deviation for each measurement. 

# 1. Read the features list
features <- read.table("features.txt")
# Assign names to all columns
# Column 1: Subject
# Column 2: Activity
# Remaining columns: The names from the features file
colnames(combined_data) <- c("subject", "activity", features[, 2])


# We also keep 'subject' and 'activity' so we don't lose our labels!
tidy_data <- combined_data %>%
  select(subject, activity, contains("mean"), contains("std"))


##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names. 
# Read the labels
activity_labels <- read.table("activity_labels.txt")
# Update the activity column
tidy_data <- tidy_data %>%
  mutate(activity = factor(activity, 
                           levels = activity_labels[, 1], 
                           labels = activity_labels[, 2]))

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for ea
# 1. Group by subject and activity
# 2. Calculate the mean for every other column
final_tidy_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# 3. Save the result to a text file for submission
write.table(final_tidy_data, "final_tidy_summary.txt", row.name = FALSE)