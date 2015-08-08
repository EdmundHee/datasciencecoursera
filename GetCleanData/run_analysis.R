## This project is issued from Coursera Data Science - Module 3 (Getting and Cleaning Data)
# Information of Data that being used in this project could be found here:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
# This script merges data from a number of txt file and produces a tidy data which may be
# useful for future use 

setwd('/Users/Edmund/MyProject/datasciencecoursera/GetCleanData/MLModule3/')

print("Step 1 - Merges the training and the test sets to create one data set.")
# Load all the text file 
subject_train <- read.table('./data/train/subject_train.txt')
x_train <- read.table("./data/train/X_train.txt")
y_train <- read.table('./data/train/y_train.txt')
table(y_train)

subject_test <- read.table('./data/test/subject_test.txt')
x_test <- read.table('./data/test/X_test.txt')
y_test <- read.table('./data/test/y_test.txt')
table(y_test)

# Merge x_train with x_test
print("Merge X Data")
x_merge <- rbind(x_train,x_test)
dim(x_merge) # 10299   561

# Merge y_train with y_test
print("Merge Y Data")
y_merge <- rbind(y_train,y_test)
dim(y_merge) # 10299     1

# Merge subject_train with subject_test
print("Merge Subject Data")
subject_merge <- rbind(subject_train,subject_test)
dim(subject_merge) # 10299     1

print("Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.")
# Load feature text
features <- read.table('./data/features.txt')
meanstd <- grep("mean\\(\\)|std\\(\\)",features[,2])
x_merge <- x_merge[,meanstd]
dim(x_merge) # 10299    66
names(x_merge) <- gsub("mean", "Mean", names(x_merge)) 
names(x_merge) <- gsub("std", "Std", names(x_merge)) 
names(x_merge) <- gsub("\\(\\)", "", features[meanstd, 2]) 
names(x_merge) <- gsub("-", "", names(x_merge))

print("Step 3 - Uses descriptive activity names to name the activities in the data set")
activity <- read.table('./data/activity_labels.txt')
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[y_merge[, 1], 2]
y_merge[, 1] <- activityLabel
names(y_merge) <- "activity"

print("Step 4 - Appropriately labels the data set with descriptive variable names.")
names(subject_merge) <- "subject"
clean_data <- cbind(subject_merge, y_merge, x_merge)
dim(clean_data) # 10299    68
# Create a clean data set
write.table(clean_data, "tidy_data.txt")
print("tidy_data.txt is created")

print("Step 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.")
subject_length <- length(table(subject_merge)) # 30
activity_length <- dim(activity)[1] # 6
clean_data_length <- dim(clean_data)[2]
result <- matrix(NA, nrow=subject_length*activity_length, ncol=clean_data_length) 
result <- as.data.frame(result)
colnames(result) <- colnames(clean_data)
row <- 1
for(x in 1:subject_length) {
    for(y in 1:activity_length) {
        result[row, 1] <- sort(unique(subject_merge)[, 1])[x]
        result[row, 2] <- activity[y, 2]
        bool1 <- x == clean_data$subject
        bool2 <- activity[y, 2] == clean_data$activity
        result[row, 3:clean_data_length] <- colMeans(clean_data[bool1&bool2, 3:clean_data_length])
        row <- row + 1
    }
}
head(result)
write.table(result, "cal_tidy_data.txt", row.name=FALSE)










