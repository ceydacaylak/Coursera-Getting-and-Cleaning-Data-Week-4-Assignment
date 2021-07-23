library(utils)
library(plyr)

#Read training sets, test sets, features and activity levels:

x_train <- read.table("~/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("~/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt")

features <- read.table('~/UCI HAR Dataset/features.txt', head= FALSE)

activity_labels = read.table('~/UCI HAR Dataset/activity_labels.txt', header = FALSE)

#Their properties:
str(x_train)
str(y_train)
str(subject_train)
str(x_test)
str(y_test)
str(features)

# 1) Merging training and test sets:

subject_data <- rbind(subject_train, subject_test)
activity_data <- rbind(y_train, y_test)
features_data <- rbind(x_train, x_test)

names(subject_data)<-c("subject")
names(activity_data)<- c("activity")
names(features_data)<- features$V2

#Combine them together:
data <- cbind(subject_data, activity_data)
all_data <- cbind(features_data, data)

# 2) Subset "Features" variable with "mean()" or "std()"
subset_feature <-features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]

#Subset "all data" by "Feature" Variable
subset_all_data <-c(as.character(subset_feature), "subject", "activity" )

all_data<-subset(all_data, select = subset_all_data)
all_data
# 3) Uses descriptive activity names to name the activities in the data set

#Use "activity_labels" variable to assign activity names:
all_data$activity<-factor(all_data$activity,labels=activity_labels[,2])

head(all_data$activity,10)

# 4) Appropriately labels the data set with descriptive variable names. 
#if it starts with "t" then change it to "time" or if it starts with "Acc" change it to "Acc", etc.

names(all_data)<-gsub("^t", "time", names(all_data))
names(all_data)<-gsub("^f", "frequency", names(all_data))
names(all_data)<-gsub("Acc", "Accelerometer", names(all_data))
names(all_data)<-gsub("Gyro", "Gyroscope", names(all_data))
names(all_data)<-gsub("Mag", "Magnitude", names(all_data))
names(all_data)<-gsub("BodyBody", "Body", names(all_data))


# 5 ) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

all_data2<- aggregate(. ~subject + activity, all_data, mean)
all_data2<- all_data2[order(all_data2$subject,all_data2$activity),]

write.table(all_data2, file = "tidydata.txt",row.name=FALSE)








