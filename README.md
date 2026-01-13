# Getting and Cleaning Data Course Project

This repository contains the R script and documentation for the Coursera "Getting and Cleaning Data" Course Project, which utilizes the UCI Human Activity Recognition dataset.

## Project Goal
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Files in this Repository
* `run_analysis.R`: The R script that performs all 5 steps of the data cleaning process.
* `CodeBook.md`: A code book that describes the variables, the data, and the specific transformations performed.
* `README.md`: This file, providing an overview of the project and the script logic.
* `final_tidy_summary.txt`: The final output dataset (the tidy summary of averages).

## How to Run the Script
1. Download the data from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
2. Unzip the file into your R working directory. You should see a folder named `UCI HAR Dataset`.
3. Open RStudio and ensure the `dplyr` library is installed.
4. Run the script using `source("run_analysis.R")`.
5. The script will produce a file named `final_tidy_summary.txt` in your working directory.

## Script Logic (The 5 Steps)
The `run_analysis.R` script follows these specific requirements:

1. **Merge Data**: It uses `cbind()` to join the subject, activity, and measurement files for both the training and test sets, then uses `rbind()` to merge them into one master dataset (`combined_data`).
2. **Extract Measurements**: It uses the `select()` and `contains()` functions to extract only the columns representing the mean and standard deviation for each measurement.
3. **Descriptive Activity Names**: It matches the activity codes with the `activity_labels.txt` file to replace integers (1-6) with names like "WALKING".
4. **Appropriate Labeling**: It applies descriptive variable names from the `features.txt` file to the column headers.
5. **Create Tidy Dataset**: It groups the data by subject and activity and uses `summarise_all(mean)` to calculate the average of each variable for each activity and each subject.