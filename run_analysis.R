# Manni Truong, WOodMac 2015
#
# Part of Getting and Cleaning Data course on coursera.
# Script was created as assignment. 

# loading libraries
library(stringr)


# set paths to data files
path_to_test <- "./test/X_test.txt"
path_to_train <- "./train/X_train.txt"

# find classes of data file
classes_test <- sapply(read.table(path_to_test, nrows = 100), class)
classes_train <- sapply(read.table(path_to_train, nrows = 100), class)


# reading in data
x_test <- read.table(path_to_test, colClasses = classes_test)
x_train <- read.table(path_to_train, colClasses = classes_train)

# merging test and train into one set 
x_merged_set <- rbind(x_test, x_train)

print(dim(x_test))
print(dim(x_train))
print(dim(x_merged_set))

# reading column names from features.txt
features <- read.table("features.txt")

# clean up names
features$V2 <- gsub("-", "_", features$V2)
features$V2 <- str_trim(features$V2)
features$V2 <- tolower(features$V2)
features$V2 <- gsub("\\(|\\)", "", features$V2)

features$V1 <- paste0("v", features$V1)

print(head(features))
