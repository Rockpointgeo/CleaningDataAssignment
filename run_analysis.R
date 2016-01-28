# get file locations
#  data files contain one row for each feature vector
train_data_file <- "data/UCI HAR Dataset/train/X_train.txt"
test_data_file <- "data/UCI HAR Dataset/test/X_test.txt"
#  subject file contains the subject id for each feature vector
train_subject_file <- "data/UCI HAR Dataset/train/subject_train.txt"
test_subject_file <- "data/UCI HAR Dataset/test/subject_test.txt"
#  activity file contains the activity id for each feature vector
train_activity_file <- "data/UCI HAR Dataset/train/y_train.txt"
test_activity_file <- "data/UCI HAR Dataset/test/y_test.txt"
#  activity labels file contains descriptive labels for the activities
activity_labels_file <- "data/UCI HAR Dataset/activity_labels.txt"
#  feature labels file contains the names of the features in the data files
feature_labels_file <- "data/UCI HAR Dataset/features.txt"


# load files
test_data <- read.table(test_data_file)
test_subject <- read.table(test_subject_file)
test_activity <- read.table(test_activity_file)
train_data <- read.table(train_data_file)
train_subject <- read.table(train_subject_file)
train_activity <- read.table(train_activity_file)
activity_labels <- read.table(activity_labels_file, stringsAsFactors=FALSE)
feature_labels <- read.table(feature_labels_file, stringsAsFactors=FALSE)

# ASSN STEP 1
# megre the subjects, activities and data from the test and train files
#  into to single data table
merged_data <- cbind(rbind(test_subject, train_subject), 
                  rbind(test_activity, train_activity),
                  rbind(test_data, train_data))

# ASSN STEP 3
# name the columns
names(merged_data) <- append(c("subject", "activity"), 
                             as.character(feature_labels[[2]]))

# ASSN STEP 2
# subset the data to keep only the fetaures with std() and mean()
subset_merged_data <- merged_data[ ,append(c(1,2), grep("mean\\(\\)|std\\(\\)",
                        feature_labels[[2]])+2)]

# ASSN STEP 4
# convert the activity column to a factor using the activity labels
subset_merged_data$activity <- factor(subset_merged_data$activity, 
                        labels= activity_labels[[2]])

# Change the variable names so they are readable
#   the pattern will be <domain>_<measurement>_<component>_<statistic>
#   <domain> can be FrequencyDomain  "^f"
#                   TimeDomain       "^t"
#   <measurement> can be BodyAcceleration      "BodyAcc"
#                        GravityAcceleration   "GravAcc"
#                        BodyAccelerationJerk  "BodyAccJerk"
#                        BodyGyroscope         "BodyGyro"
#                        BodyGyroscopeJerk     "BodyGyroJerk"
#                        BodyBodyAccelerationJerk  "BodyBodyAccJerk"
#                        BodyBodyGyroscope         "BodyBodyGyro"
#                        BodyBodyGyroscopeJerk     "BodyBodyGyroJerk"
#  <component> can be XComponent   "-X$"
#                     YComponent   "-Y$"
#                     ZComponent   "-Z$"
#                     Magnitude    "Mag-"
#  <statistic> can be Mean               "mean\\(\\)"
#                     StandardDeviation  "std\\(\\)"

# Create a placeholder list for the readable_names
readable_names <- replicate(length(names(subset_merged_data[-(1:2)])), 
                            c(""))

# <domain>
# get the indices
domain_f_ind <- grepl("^f", names(subset_merged_data[-(1:2)]))
# append the readable name
readable_names[domain_f_ind] <- lapply(readable_names[domain_f_ind],
                                       paste0, "FrequencyDomain_")
readable_names[!domain_f_ind] <- lapply(readable_names[!domain_f_ind],
                                       paste0, "TimeDomain_")
# <measurement>
# Get the indices
meas_BodyAcc_ind <- grepl("^[ft]BodyAcc[-M]", names(subset_merged_data[-(1:2)]))
meas_GravityAcc_ind <- grepl("^[ft]GravityAcc[-M]", names(subset_merged_data[-(1:2)]))
meas_BodyAccJerk_ind <- grepl("^[ft]BodyAccJerk[-M]", names(subset_merged_data[-(1:2)]))
meas_BodyGyro_ind <- grepl("^[ft]BodyGyro[-M]", names(subset_merged_data[-(1:2)]))
meas_BodyGyroJerk_ind <- grepl("^[ft]BodyGyroJerk[-M]", names(subset_merged_data[-(1:2)]))
meas_BodyBodyAccJerk_ind <- grepl("^[ft]BodyBodyAccJerk[-M]", names(subset_merged_data[-(1:2)]))
meas_BodyBodyGyro_ind <- grepl("^[ft]BodyBodyGyro[-M]", names(subset_merged_data[-(1:2)]))
meas_BodyBodyGyroJerk_ind <- grepl("^[ft]BodyBodyGyroJerk[-M]", names(subset_merged_data[-(1:2)]))
# append the readable name
readable_names[meas_BodyAcc_ind] <- lapply(readable_names[meas_BodyAcc_ind],
                                           paste0, "BodyAcceleration_")
readable_names[meas_GravityAcc_ind] <- lapply(readable_names[meas_GravityAcc_ind],
                                           paste0, "GravityAcceleration_")
readable_names[meas_BodyAccJerk_ind] <- lapply(readable_names[meas_BodyAccJerk_ind],
                                              paste0, "BodyAccelerationJerk_")
readable_names[meas_BodyGyro_ind] <- lapply(readable_names[meas_BodyGyro_ind],
                                           paste0, "BodyGyroscope_")
readable_names[meas_BodyGyroJerk_ind] <- lapply(readable_names[meas_BodyGyroJerk_ind],
                                            paste0, "BodyGyroscopeJerk_")
readable_names[meas_BodyBodyAccJerk_ind] <- lapply(readable_names[meas_BodyBodyAccJerk_ind],
                                               paste0, "BodyBodyAccelerationJerk_")
readable_names[meas_BodyBodyGyro_ind] <- lapply(readable_names[meas_BodyBodyGyro_ind],
                                            paste0, "BodyBodyGyroscope_")
readable_names[meas_BodyBodyGyroJerk_ind] <- lapply(readable_names[meas_BodyBodyGyroJerk_ind],
                                                paste0, "BodyBodyGyroscopeJerk_")
# <component>
# get the indices
comp_X_ind <- grepl("-X$", names(subset_merged_data[-(1:2)]))
comp_Y_ind <- grepl("-Y$", names(subset_merged_data[-(1:2)]))
comp_Z_ind <- grepl("-Z$", names(subset_merged_data[-(1:2)]))
comp_mag_ind <- grepl("Mag-", names(subset_merged_data[-(1:2)]))
# append the readable name
readable_names[comp_X_ind] <- lapply(readable_names[comp_X_ind],
                                                paste0, "XComponent_")
readable_names[comp_Y_ind] <- lapply(readable_names[comp_Y_ind],
                                                   paste0, "YComponent_")
readable_names[comp_Z_ind] <- lapply(readable_names[comp_Z_ind],
                                                paste0, "ZComponent_")
readable_names[comp_mag_ind] <- lapply(readable_names[comp_mag_ind],
                                                    paste0, "Magnitude_")
# <statistic>
# get the indices
stat_mean_ind <- grepl("-mean\\(\\)", names(subset_merged_data[-(1:2)]))
stat_std_ind <- grepl("-std\\(\\)", names(subset_merged_data[-(1:2)]))
# append the readable name
readable_names[stat_mean_ind] <- lapply(readable_names[stat_mean_ind],
                                     paste0, "Mean")
readable_names[stat_std_ind] <- lapply(readable_names[stat_std_ind],
                                       paste0, "StandardDeviation")

# replace the old names with the readable ones
names(subset_merged_data) <- append(c("Subject", "Activity"), 
                                    as.character(readable_names))

# ASSN STEP 5
# split the data by Activity and Subject
split_data <- split(subset_merged_data, list(subset_merged_data$Activity, 
                                       subset_merged_data$Subject))
# calculate the column means and reorganize into a matrix
tidy_data <- sapply(split_data, function(x) colMeans(as.matrix(x[,-(1:2)])))

# write data set
write.table(data.frame(tidy_data),"tidy_data.txt", row.names=FALSE)