---
title: "README"
author: "Manni Truong"
date: "27 September 2015"
output: html_document
---

## Background
This repo was created as part of the *Getting and Cleaning Data* course project of coursera.com. The goal of this project is to produce a tidy data set from the *Human Activity Recognition Using Smartphones Dataset*. The Human Activity data project carried out experiments which involved the subject wearing a smartphone (Samsung Galaxy S II) on the waist and performing six activities:
- walking
- walking upstairs
- walking downstairs
- sitting
- standing
- laying.

A total of 30 volunteers form the group of subjects. The smartphone's embedded accelerometer and gyroscope captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

## How to run
The main script of this repo is run_analysis.R. Before running make sure your current working directory is set to where the script sits. Then to produce the tidy data set in csv form run:

```{r}
source("run_analysis.R")
```

It should only take a few seconds to finish.

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
