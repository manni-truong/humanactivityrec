---
title: "CodeBook"
author: "Manni Truong"
date: "27 September 2015"
output: html_document
---

This document describes the original dataset and final output that is being produced by running "run_analysis.R". For more background information refer to the README.

## Dimensions
The final tidy dataset is in wide form and has 81 columns and 180 rows. The first two columns identify the subject (subject_id) and activity (activity_desc). The remaining columns are averages of the features of the original dataset. Importantly these features have been filtered out by pattern matching, in particular they contain either "mean" or "std" in their names. 

## Features
The original dataset came with 561 features which were collected from the sensors of the smartphone. For a detailed discussion see below. More importantly the measures have been normalised and bounded within [-1,1] which effectively removes the unit of measurement. As mentioned, the tidy dataset is a subset that only includes features containing the words mean or std (standard deviation). The feature names are cleaned to conform to R. The feature names are a mixture of abbreviated names and codes. For example: tBodyAcc_mean_x. The t prefix denotes time, Acc is short for accelerometer.

### From the original dataset:
"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

## Data transformations
To get from the various datasets described earlier to the tidy one, the scripts performs a few steps. Firsty the training and test sets are merged back together to form one set. Descriptive names and labels are then applied to make variable names easier to follow. Then we subset only the features that deal with means and standard deviations. Here, we assume that all features have been correctly named so we use pattern matching to subset our data by feature names that contain the word "mean" or "std". Some cleaning is also being done, that is stripping out punctuation such as ".,()" and replacing "-" with "_". We don't lowercase as we think it makes the variable names more readable. Lastly to get the final tidy dataset in wide form we group the merged data by subject and activity and calculate the average of each variable for each activity and each subject.

## List of features in final tidy data set

n = 81

### Description of symbols
t: time domain signals  
Acc: accelerometer  
Mag: magnitude   
Gyro: gyroscope   
XYZ: pattern is used to denote 3-axial signals in the X, Y and Z directions.

All measures are normalised within [-1,1], that is units are effectively removed.

* subject_id, identifies a subject in the experiment
* activity_desc, six different activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* tBodyAcc_mean_X
* tBodyAcc_mean_Y
* tBodyAcc_mean_Z
* tBodyAcc_std_X
* tBodyAcc_std_Y
* tBodyAcc_std_Z
* tGravityAcc_mean_X
* tGravityAcc_mean_Y
* tGravityAcc_mean_Z
* tGravityAcc_std_X
* tGravityAcc_std_Y
* tGravityAcc_std_Z
* tBodyAccJerk_mean_X
* tBodyAccJerk_mean_Y
* tBodyAccJerk_mean_Z
* tBodyAccJerk_std_X
* tBodyAccJerk_std_Y
* tBodyAccJerk_std_Z
* tBodyGyro_mean_X
* tBodyGyro_mean_Y
* tBodyGyro_mean_Z
* tBodyGyro_std_X
* tBodyGyro_std_Y
* tBodyGyro_std_Z
* tBodyGyroJerk_mean_X
* tBodyGyroJerk_mean_Y
* tBodyGyroJerk_mean_Z
* tBodyGyroJerk_std_X
* tBodyGyroJerk_std_Y
* tBodyGyroJerk_std_Z
* tBodyAccMag_mean
* tBodyAccMag_std
* tGravityAccMag_mean
* tGravityAccMag_std
* tBodyAccJerkMag_mean
* tBodyAccJerkMag_std
* tBodyGyroMag_mean
* tBodyGyroMag_std
* tBodyGyroJerkMag_mean
* tBodyGyroJerkMag_std
* fBodyAcc_mean_X
* fBodyAcc_mean_Y
* fBodyAcc_mean_Z
* fBodyAcc_std_X
* fBodyAcc_std_Y
* fBodyAcc_std_Z
* fBodyAcc_meanFreq_X
* fBodyAcc_meanFreq_Y
* fBodyAcc_meanFreq_Z
* fBodyAccJerk_mean_X
* fBodyAccJerk_mean_Y
* fBodyAccJerk_mean_Z
* fBodyAccJerk_std_X
* fBodyAccJerk_std_Y
* fBodyAccJerk_std_Z
* fBodyAccJerk_meanFreq_X
* fBodyAccJerk_meanFreq_Y
* fBodyAccJerk_meanFreq_Z
* fBodyGyro_mean_X
* fBodyGyro_mean_Y
* fBodyGyro_mean_Z
* fBodyGyro_std_X
* fBodyGyro_std_Y
* fBodyGyro_std_Z
* fBodyGyro_meanFreq_X
* fBodyGyro_meanFreq_Y
* fBodyGyro_meanFreq_Z
* fBodyAccMag_mean
* fBodyAccMag_std
* fBodyAccMag_meanFreq
* fBodyBodyAccJerkMag_mean
* fBodyBodyAccJerkMag_std
* fBodyBodyAccJerkMag_meanFreq
* fBodyBodyGyroMag_mean
* fBodyBodyGyroMag_std
* fBodyBodyGyroMag_meanFreq
* fBodyBodyGyroJerkMag_mean
* fBodyBodyGyroJerkMag_std
* fBodyBodyGyroJerkMag_meanFreq

