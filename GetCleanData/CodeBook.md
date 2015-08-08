# CodeBook - (Module 3 Getting and Cleaning Data)

This code book contains the information that describes the variables, the data, and any transformations or work that had been
 performed to clean up the data

 ## Steps took

 * Information of data could be obtained from the following link

 	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

 * Data obtained from the following link

 	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 * Loaded the training and test text file into the data frames
 * Combined both training and test data by using rbind
 * Paired down all the data frames to include the mean & standard deviation variables
 * Activity IDs was replaced with activity labels to improve readability
 * Generated tidy_data.txt with the combined data  
 * Another data set was created to apply the mean & standard deviation calculation across the groups
 * Generated cal_tidy_data.txt as the result output


 ## Variables

 * subject		: Representing a participant in study ( 1 : 30)
 * activity 	: Activity that the subject was doing the measurement
 * tBodyAccmeanX
 * tBodyAccmeanY 
 * tBodyAccmeanZ 
 * tBodyAccstdX 
 * tBodyAccstdY 
 * tBodyAccstdZ 
 * tGravityAccmeanX 
 * tGravityAccmeanY 
 * tGravityAccmeanZ 
 * tGravityAccstdX 
 * tGravityAccstdY 
 * tGravityAccstdZ 
 * tBodyAccJerkmeanX 
 * tBodyAccJerkmeanY 
 * tBodyAccJerkstdX 
 * tBodyAccJerkstdY 
 * tBodyAccJerkstdZ 
 * tBodyGyromeanX 
 * tBodyGyromeanY 
 * tBodyGyromeanZ 
 * tBodyGyrostdX 
 * tBodyGyrostdY 
 * tBodyGyrostdZ 
 * tBodyGyroJerkmeanX 
 * tBodyGyroJerkmeanY 
 * tBodyGyroJerkmeanZ 
 * tBodyGyroJerkstdX 
 * tBodyGyroJerkstdY 
 * tBodyGyroJerkstdZ 
 * tBodyAccMagmean 
 * tBodyAccMagstd 
 * tGravityAccMagmean 
 * tGravityAccMagstd 
 * tBodyAccJerkMagmean 
 * tBodyAccJerkMagstd 
 * tBodyGyroMagmean 
 * tBodyGyroMagstd 
 * tBodyGyroJerkMagmean 
 * tBodyGyroJerkMagstd 
 * fBodyAccmeanX 
 * fBodyAccmeanY 
 * fBodyAccmeanZ 
 * fBodyAccstdX 
 * fBodyAccstdY 
 * fBodyAccstdZ 
 * fBodyAccJerkmeanX 
 * fBodyAccJerkmeanY 
 * fBodyAccJerkmeanZ 
 * fBodyAccJerkstdX 
 * fBodyAccJerkstdY 
 * fBodyAccJerkstdZ 
 * fBodyGyromeanX 
 * fBodyGyromeanY 
 * fBodyGyromeanZ 
 * fBodyGyrostdX 
 * fBodyGyrostdY 
 * fBodyGyrostdZ 
 * fBodyAccMagmean 
 * fBodyAccMagstd 
 * fBodyBodyAccJerkMagmean 
 * fBodyBodyAccJerkMagstd 
 * fBodyBodyGyroMagmean 
 * fBodyBodyGyroMagstd 
 * fBodyBodyGyroJerkMagmean 
 * fBodyBodyGyroJerkMagstd	 
