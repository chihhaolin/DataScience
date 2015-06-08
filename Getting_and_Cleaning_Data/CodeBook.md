# Code Book

## Data Source
1. The data for the project: [Download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. The full description of the data: [Web](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )

## R script
The R script `run_analysis.R` contains the following functions

1. Merges the training and the test sets to create one data set, including 
  * `train/X_train.txt` and `test/X_test.txt` (10299 obs. of 66 variables),
  * `train/subject_train.txt` and `test/subject_test.txt` (10299 obs of 1 variable), 
  * `train/y_train.txt` and `test/y_test.txt`(10299 obs of 1 variable).
2. Extracts only the measurements on the mean and standard deviation for each measurement, extracting `mean` and `std` from `features.txt` 
3. Uses descriptive activity names to name the activities in the data set. The `activity_labels.txt` contains 6 activities
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The output result is called `data_set_with_the_averages.txt`(tab-delimited text) containing 180 obs of 68 variables. 
The variables are shown as follows

```r 
 [1] "subject"                   "activity"                  "tBodyAcc_mean_X"           "tBodyAcc_mean_Y"          
 [5] "tBodyAcc_mean_Z"           "tBodyAcc_std_X"            "tBodyAcc_std_Y"            "tBodyAcc_std_Z"           
 [9] "tGravityAcc_mean_X"        "tGravityAcc_mean_Y"        "tGravityAcc_mean_Z"        "tGravityAcc_std_X"        
[13] "tGravityAcc_std_Y"         "tGravityAcc_std_Z"         "tBodyAccJerk_mean_X"       "tBodyAccJerk_mean_Y"      
[17] "tBodyAccJerk_mean_Z"       "tBodyAccJerk_std_X"        "tBodyAccJerk_std_Y"        "tBodyAccJerk_std_Z"       
[21] "tBodyGyro_mean_X"          "tBodyGyro_mean_Y"          "tBodyGyro_mean_Z"          "tBodyGyro_std_X"          
[25] "tBodyGyro_std_Y"           "tBodyGyro_std_Z"           "tBodyGyroJerk_mean_X"      "tBodyGyroJerk_mean_Y"     
[29] "tBodyGyroJerk_mean_Z"      "tBodyGyroJerk_std_X"       "tBodyGyroJerk_std_Y"       "tBodyGyroJerk_std_Z"      
[33] "tBodyAccMag_mean"          "tBodyAccMag_std"           "tGravityAccMag_mean"       "tGravityAccMag_std"       
[37] "tBodyAccJerkMag_mean"      "tBodyAccJerkMag_std"       "tBodyGyroMag_mean"         "tBodyGyroMag_std"         
[41] "tBodyGyroJerkMag_mean"     "tBodyGyroJerkMag_std"      "fBodyAcc_mean_X"           "fBodyAcc_mean_Y"          
[45] "fBodyAcc_mean_Z"           "fBodyAcc_std_X"            "fBodyAcc_std_Y"            "fBodyAcc_std_Z"           
[49] "fBodyAccJerk_mean_X"       "fBodyAccJerk_mean_Y"       "fBodyAccJerk_mean_Z"       "fBodyAccJerk_std_X"       
[53] "fBodyAccJerk_std_Y"        "fBodyAccJerk_std_Z"        "fBodyGyro_mean_X"          "fBodyGyro_mean_Y"         
[57] "fBodyGyro_mean_Z"          "fBodyGyro_std_X"           "fBodyGyro_std_Y"           "fBodyGyro_std_Z"          
[61] "fBodyAccMag_mean"          "fBodyAccMag_std"           "fBodyBodyAccJerkMag_mean"  "fBodyBodyAccJerkMag_std"  
[65] "fBodyBodyGyroMag_mean"     "fBodyBodyGyroMag_std"      "fBodyBodyGyroJerkMag_mean" "fBodyBodyGyroJerkMag_std"
```
