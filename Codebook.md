# Code Book - Human Activity Recognition Summary

## 1. Project Description
This project summarizes sensor data from the **UCI Human Activity Recognition Using Smartphones Dataset**. The goal was to take raw data captured by smartphone accelerometers and gyroscopes and transform it into a "tidy" summary table of averages.

## 2. Source Data
* **Participants:** 30 volunteers (subjects).
* **Activities:** 6 different physical activities (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying).
* **Equipment:** Samsung Galaxy S II smartphone.

## 3. Transformation Steps
The following steps were performed by the `run_analysis.R` script:

### Step 1: Assembly and Merging
* **Horizontal Assembly:** The `subject`, `activity` (y), and `measurement` (X) files were joined side-by-side using `cbind()` for both the training and test sets.
* **Vertical Integration:** The training and test data frames were stacked using `rbind()` to create a master dataset of 10,299 observations.

### Step 2: Feature Extraction
* Used the `dplyr` `select()` and `contains()` functions to extract the `subject`, `activity`, and any columns containing the strings **"mean"** or **"std"**. Note: This reorders the data so all mean columns appear before all standard deviation columns.

### Step 3: Descriptive Activity Names
* Converted the `activity` column into a **factor** using labels from `activity_labels.txt` (e.g., 1 became "WALKING").

### Step 4: Descriptive Variable Labeling
* Applied names from `features.txt` to the dataset columns to ensure variables like `tBodyAcc-mean()-X` are clearly identified.

### Step 5: Final Aggregation (Tidy Data)
* Grouped the data by `subject` and `activity` and calculated the `mean()` of all measurements using `summarise_all()`.
* The final output is a tidy dataset with **180 rows** (30 subjects x 6 activities).

## 4. Variables in the Tidy Dataset
* **subject**: Integer. ID of the volunteer (1-30).
* **activity**: Factor. The type of activity performed (e.g., WALKING).
* **Measurements**: Numeric values representing the **average** of the original mean and standard deviation features. (Examples: `tBodyAcc-mean()-X`, `tGravityAcc-std()-Z`).

## 5. Units
* Sensor measurements are normalized and bounded within [-1, 1]. They are unitless ratios.