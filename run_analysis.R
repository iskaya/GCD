library(data.table)
library(reshape2)

# Merge the training and the test sets to create one data set.

features_names <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
features_test <- read.table("UCI HAR Dataset/test/X_test.txt")
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
features_train <- read.table("UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")

subject <- rbind(subject_test, subject_train)
features <- rbind(features_test, features_train)
activity <- rbind(activity_test, activity_train)

colnames(features) <- t(features_names[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"

data <- cbind(subject, activity, features)
dim(data)


# Extract only the measurements on the mean and standard deviation for each 
# measurement. 

mean_std <- grep("mean|std", names(data), ignore.case=TRUE)
mean_std <- c(1, 2, mean_std)
mean_std_data <- data[, mean_std]
dim(mean_std_data)


# Use descriptive activity names to name the activities in the data set

mean_std_data$Activity <- as.character(mean_std_data$Activity)
for (i in 1:6) {
    mean_std_data$Activity[mean_std_data$Activity == i] <- as.character(activity_labels[i,2])
}
mean_std_data$Activity <- as.factor(mean_std_data$Activity)


# Appropriately label the data set with descriptive variable names. 

names(mean_std_data)
names(mean_std_data) <- sub("^t", "Time", names(mean_std_data))
names(mean_std_data) <- sub("^f", "Frequency", names(mean_std_data))
names(mean_std_data) <- sub("Acc", "Acceleration", names(mean_std_data))
names(mean_std_data) <- sub("Gyro", "Gryoscopic", names(mean_std_data))
names(mean_std_data) <- sub("Mag", "Magnitude", names(mean_std_data))
names(mean_std_data) <- sub("BodyBody", "Body", names(mean_std_data))
names(mean_std_data) <- sub("-mean", "Mean", names(mean_std_data))
names(mean_std_data) <- sub("-std", "Std", names(mean_std_data))
names(mean_std_data)

# From the data set in previous step, create a second, independent tidy data 
# set with the average of each variable for each activity and each subject.

melt_data <- melt(mean_std_data, id=c("Subject","Activity"))
tidy <- dcast(melt_data, Subject + Activity ~ variable, mean)

write.table(tidy, file="tidy.txt", row.names=FALSE)

