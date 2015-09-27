---
title: "CodeBook"
author: "Manni Truong"
date: "27 September 2015"
output: html_document
---

This document describes the output that is being produced by running "run_analysis.R". For more background information refer to the README.

## Dimensions
The final tidy dataset is in wide form and has 81 columns and 180 rows. The first two columns identify the subject (subject_id) and activity (activity_desc). The remaining columns are averages of the features of the original dataset. Importantly these features have been filtered out by pattern matching, in particular they contain either "mean" or "std" in their names. 

## Data transformations
To get from the various datasets described earlier to the tidy one, the scripts performs a few steps. Firsty the training and test sets are merged back together to form one. Descriptive names and labels are then applied to make variable names easier to follow. Then we subset only the features that deal with means and standard deviations. Here, we assume that all features have been correctly named so we use pattern matching subset our data by feature names that contain the word "mean" or "std". Some cleaning is also being done, that is stripping out punctuation such as ".,()" and replacing "-" with "_". We don't lowercase as we think it makes the variable names more readable. Lastly to get the final tidy dataset in wide form we group the merged data by subject and activity and calculate the average of each variable for each activity and each subject.