---
title: "CodeBook"
author: "Manni Truong"
date: "27 September 2015"
output: html_document
---

This document describes the output that is being produced by running "run_analysis.R". For more background information refer to the README.

## Dimensions
The final tidy dataset is in wide form and has 81 columns and 180 rows. The first two columns identify the subject (subject_id) and activity (activity_desc). The remaining columns are averages of the features of the original dataset. Importantly these features have been filtered out by pattern matching, in particular they contain either "mean" or "std" in their names. 

## Features
The original dataset came with 561 features which were collected from the sensors of the smartphone. For a detailed discussion see below. As mentioned, the tidy dataset is a subset that only includes features containing the words mean or std (standard deviation). The feature names are cleaned to conform to R. The feature names are a mixture of abbreviated names and codes. For example: tBodyAcc_mean_x. The t prefix denotes time, Acc is short for acceleration. 

### From the original dataset:
*"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."*

## Data transformations
To get from the various datasets described earlier to the tidy one, the scripts performs a few steps. Firsty the training and test sets are merged back together to form one set. Descriptive names and labels are then applied to make variable names easier to follow. Then we subset only the features that deal with means and standard deviations. Here, we assume that all features have been correctly named so we use pattern matching to subset our data by feature names that contain the word "mean" or "std". Some cleaning is also being done, that is stripping out punctuation such as ".,()" and replacing "-" with "_". We don't lowercase as we think it makes the variable names more readable. Lastly to get the final tidy dataset in wide form we group the merged data by subject and activity and calculate the average of each variable for each activity and each subject.