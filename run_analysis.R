# Manni Truong, WOodMac 2015
#
# Part of Getting and Cleaning Data course on coursera.
# Script was created as assignment. 

# loading libraries
library(stringr)


# set paths to data files
path_to_test_x <- "./test/X_test.txt"
path_to_test_y <- "./test/y_test.txt"
path_to_test_subj <- "test/subject_test.txt"

path_to_train_x <- "./train/X_train.txt"
path_to_train_y <- "./train/y_train.txt"
path_to_train_subj <- "train/subject_train.txt"

# find classes of data file
classes_test_x <- sapply(read.table(path_to_test_x, nrows = 100), class)
classes_test_y <- sapply(read.table(path_to_test_y, nrows = 100), class)
classes_test_subj <- sapply(read.table(path_to_test_subj, nrows = 100), class)

classes_train_x <- sapply(read.table(path_to_train_x, nrows = 100), class)
classes_train_y <- sapply(read.table(path_to_train_y, nrows = 100), class)
classes_train_subj <- sapply(read.table(path_to_train_subj, nrows = 100), class)


# reading in data
x_test <- read.table(path_to_test_x, colClasses = classes_test_x)
y_test <- read.table(path_to_test_y, colClasses = classes_test_y)
subj_test <- read.table(path_to_test_subj, colClasses = classes_test_subj) 

x_train <- read.table(path_to_train_x, colClasses = classes_train_x)
y_train <- read.table(path_to_train_y, colClasses = classes_train_y)
subj_train <- read.table(path_to_train_subj, colClasses = classes_train_subj)


# change col names for y sets
colnames(y_test)[1] <- "activity_id"
colnames(subj_test)[1] <- "subject_id"

colnames(y_train)[1] <- "activity_id"
colnames(subj_train)[1] <- "subject_id"


# merge cols
test <- cbind(subj_test, y_test, x_test)
train <- cbind(subj_train, y_train, x_train)

# merging test and train into one set 
merged_set <- rbind(test, train)


# reading column names 
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

# clean up names
features$V2 <- gsub("-", "_", features$V2)
features$V2 <- str_replace_all(features$V2, "([_])|[[:punct:]]", "\\1") # remove punctuation bar "_"

# prepend "V" so we can match later
features$V1 <- paste0("V", features$V1)


# Give headers descriptive names from features.txt
colnames(merged_set)[colnames(merged_set) %in% features$V1] <- features$V2

# set actitvity names
merged_set$activity_desc <- activities$V2[match(merged_set$activity_id, activities$V1)]

# only extract mean and std
merged_set <- merged_set[, grep("subject_id|activity_desc|(mean|std)", names(merged_set))]


# tidy data set with mean
tidy <- group_by(merged_set, subject_id, activity_desc) %>% summarise_each(c("mean"))


# output data in csv
write.table(tidy, "tidy_data.csv", sep = ",", row.names = FALSE)

print(dim(test))
print(dim(train))
print(dim(merged_set))
print(dim(tidy))