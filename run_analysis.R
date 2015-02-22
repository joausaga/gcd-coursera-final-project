# Load libraries
library(dplyr)

# Read datasets
train_set = read.table("X_train.txt", sep="")
train_labels = read.table("y_train.txt", sep="")
test_set = read.table("X_test.txt", sep="")
test_labels = read.table("y_test.txt", sep="")
activity_labels = read.table("activity_labels.txt", sep="")
features = read.table("features.txt", sep="")
subject_train = read.table("subject_train.txt", sep="")
subject_test = read.table("subject_test.txt", sep="")

# Add columns name
colnames(activity_labels) = c("id","activity_name")
colnames(test_labels) = c("activity")
colnames(train_labels) = c("activity")
colnames(subject_train) = c("subject_id")
colnames(subject_test) = c("subject_id")

# Make feature names valid R names and assign them as the column names of to train and test sets (Req. 4)
valid_column_names = make.names(names=features[,2], unique=TRUE, allow_ = TRUE)
colnames(test_set) = valid_column_names
colnames(train_set) = valid_column_names

# Combine subjects, activities and features with test and train datasets
m_test_activity_set = cbind(subject_test,test_labels,test_set)
m_train_activity_set = cbind(subject_train,train_labels,train_set)

# Merge train and test sets (Req. 1)
total_set = rbind(m_train_activity_set,m_test_activity_set)

# Extract mean and standard deviations (Req. 2)
mean_sd_set = select(total_set,subject_id,activity,contains("mean"),contains("std"))

# Label activities with descriptive names (Req. 3)
total_set$activity[total_set$activity==1] = tolower(activity_labels[activity_labels$id==1,"activity_name"])
total_set$activity[total_set$activity==2] = tolower(activity_labels[activity_labels$id==2,"activity_name"])
total_set$activity[total_set$activity==3] = tolower(activity_labels[activity_labels$id==3,"activity_name"])
total_set$activity[total_set$activity==4] = tolower(activity_labels[activity_labels$id==4,"activity_name"])
total_set$activity[total_set$activity==5] = tolower(activity_labels[activity_labels$id==5,"activity_name"])
total_set$activity[total_set$activity==6] = tolower(activity_labels[activity_labels$id==6,"activity_name"])

# Create final dataset containing the average of each variable for each activity and each subject (Req. 5)
final_dataset = total_set %>%
                group_by(subject_id, activity) %>%
                summarise_each(funs(mean))

# Write the final dataset as a txt file 
write.table(final_dataset, "avg_dataset.txt", row.name=F)