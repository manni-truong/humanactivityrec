---
title: "README"
author: "Manni Truong"
date: "27 September 2015"
output: html_document
---

## Background
This repo was created as part of the *Getting and Cleaning Data* course project of coursera.com. The goal of this project is to produce a tidy data set from the *Human Activity Recognition Using Smartphones Dataset*. The Human Activity data project carried out experiments which involved the subject wearing a smartphone (Samsung Galaxy S II) on the waist and performing six activities:

* walking
* walking upstairs
* walking downstairs
* sitting
* standing
* laying.

A total of 30 volunteers form the group of subjects. The smartphone's embedded accelerometer and gyroscope captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The original dataset is partioned into two sets: training data (70 per cent) and test data (30 per cent). They  The original data for this project is spread out between different files.

## Datasets used 
In order to obtain the tidy dataset the following original datasets have been used. I have copied the descriptions from the README of the original experiment. 

* 'features.txt': List of all features
* 'activity_labels.txt': Links the class labels with their activity name
* 'train/X_train.txt': Training set
* 'train/y_train.txt': Training labels
* 'test/X_test.txt': Test set
* 'test/y_test.txt': Test labels
* 'train/subject_train.txt' and 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

## Data transformations
To get from the various datasets described earlier to the tidy one, the scripts performs a few steps. Firsty the training and test sets are merged back together to form one. Descriptive names and labels are then applied to make variable names easier to follow. Then we subset only the features that deal with means and standard deviations. Here, we assume that all features have been correctly named so we use pattern matching subset our data by feature names that contain the word "mean" or "std". Some cleaning is also being done, that is stripping out punctuation such as ".,()" and replacing "-" with "_". We don't lowercase as we think it makes the variable names more readable. Lastly to get the final tidy dataset in wide form we group the merged data by subject and activity and calculate the average of each variable for each activity and each subject.

## How to run
The main script of this repo is run_analysis.R. Before running make sure your current working directory is set to where the script sits. Then to produce the tidy data set in csv form run:

```{r}
source("run_analysis.R")
```

It should only take a few seconds to finish and by the end produces a file called tidy_data.csv. 
