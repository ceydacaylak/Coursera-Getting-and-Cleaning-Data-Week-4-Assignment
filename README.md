# Getting-and-Cleaning-Data-Course-Project-Peer-Grading

This is the course project for Getting and Cleaning Data course on Coursera. The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

Here are the data for the project:

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

# Instructions for Project:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps:
Firstly, the variables are introduced in `run_analysis.R` :
`
x_train 
y_train
subject_train
x_test 
y_test
subject_test
features
activity_labels
`
Then train and test variables are merged by rows and their variable names are setted, as in mentioned in step 1.

Then the whole data merged by columns in `all_data`

Subsetted `all_data` by the names of features on the mean and standard deviation and then subsetted `all_data` by selected names of features.

Factorized `all_data$activity` by the activity names: Standing, walking, laying, etc.

Changed the names of all_data with descriptive variable names in step 4.

Created a second, independent tidy data set with the average of each variable for each activity and each subject in `all_data2`

**The output is in tidydata text file.**
