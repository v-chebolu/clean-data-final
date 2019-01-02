library(dplyr)

# ------------
# STEP 1.
# Identify features of interest - read features.txt and look for features with
# names containing mean() or std(). Clean up feature names.
# ------------
features <- read.table("features.txt", header=F, col.names=c("colnum","colname"), 
              colClasses=c("numeric","character"))
features <- features[grep("-mean\\(\\)|-std\\(\\)", features$colname),]
features$colname = gsub('\\(\\)','',features$colname)
features$colname = gsub('-','_',features$colname)
features$colname = tolower(features$colname)

# ------------
# STEP 2.
# Read data files from the test/ and train/ subdirectories.
# From the feature files, select only the features of interest.
# tstf stands for test features, trnf is training features,
# tsts is test subjects, trns is training subjects,
# tstl is test labels, trnl is training labels.
# -------------
tstf <- read.table("test/X_test.txt", header=F)[,features$colnum]
trnf <- read.table("train/X_train.txt", header=F)[,features$colnum]

tsts <- read.table("test/subject_test.txt", header=F, col.names="subject")
trns <- read.table("train/subject_train.txt", header=F, col.names="subject")

tstl <- read.table("test/y_test.txt", header=F, col.names="activity_code")
trnl <- read.table("train/y_train.txt", header=F, col.names="activity_code")

# -------------
# STEP 3.
# Read the activity-code to activity-name mapping from the activity_lables.txt
# file.
# Column-merge the features, labels, and subjects.
# Then join with activity code mapping, and eliminate
# the activity code column from the result.
# -------------
act <- read.table("activity_labels.txt", header=F, col.names=c("activity_code","activity_name"))

tst <- cbind(tstf, tstl, tsts)
trn <- cbind(trnf, trnl, trns)

tst <- merge(tst, act, by="activity_code")
trn <- merge(trn, act, by="activity_code")    

tst <- tst[,2:69]
trn <- trn[,2:69]

# -------------
# STEP 4.
# Give the same column names to test data and training data, and
# then merge the two row-wise.
# -------------
colnames(tst) <- c(features$colname, "subject", "activity_name")
colnames(trn) <- c(features$colname, "subject", "activity_name")
all_data <- rbind(tst, trn)

# -------------
# STEP 5.
# Get the mean of all columns, grouped by activity name and subject.
# -------------
summary <- all_data %>% group_by(activity_name, subject) %>% summarize_all(funs(mean))

# -------------
# STEP 6.
# Rename summary columns to names that are descriptive and meaningful to humans.
# Write the resulting tidy data to a file called 'tidyData.txt'.
# -------------
names(summary)[names(summary) == 'activity_name'] <- 'activity name'
names(summary)[names(summary) == 'tbodyacc_mean_x'] <- 'mean of X of body acceleration signal in time'
names(summary)[names(summary) == 'tbodyacc_mean_y'] <- 'mean of Y of body acceleration signal in time'
names(summary)[names(summary) == 'tbodyacc_mean_z'] <- 'mean of Z of body acceleration signal in time'
names(summary)[names(summary) == 'tbodyacc_std_x'] <- 'std deviation of X of body acceleration signal in time'
names(summary)[names(summary) == 'tbodyacc_std_y'] <- 'std deviation of Y of body acceleration signal in time'
names(summary)[names(summary) == 'tbodyacc_std_z'] <- 'std deviation of Z of body acceleration signal in time'
names(summary)[names(summary) == 'tgravityacc_mean_x'] <- 'mean of X of gravity acceleration signal in time'
names(summary)[names(summary) == 'tgravityacc_mean_y'] <- 'mean of Y of gravity acceleration signal in time'
names(summary)[names(summary) == 'tgravityacc_mean_z'] <- 'mean of Z of gravity acceleration signal in time'
names(summary)[names(summary) == 'tgravityacc_std_x'] <- 'std deviation of X of gravity acceleration signal in time'
names(summary)[names(summary) == 'tgravityacc_std_y'] <- 'std deviation of Y of gravity acceleration signal in time'
names(summary)[names(summary) == 'tgravityacc_std_z'] <- 'std deviation of Z of gravity acceleration signal in time'
names(summary)[names(summary) == 'tbodyaccjerk_mean_x'] <- 'mean of X of body acceleration jerk in time'
names(summary)[names(summary) == 'tbodyaccjerk_mean_y'] <- 'mean of Y of body acceleration jerk in time'
names(summary)[names(summary) == 'tbodyaccjerk_mean_z'] <- 'mean of Z of body acceleration jerk in time'
names(summary)[names(summary) == 'tbodyaccjerk_std_x'] <- 'std deviation of X of body acceleration jerk in time'
names(summary)[names(summary) == 'tbodyaccjerk_std_y'] <- 'std deviation of Y of body acceleration jerk in time'
names(summary)[names(summary) == 'tbodyaccjerk_std_z'] <- 'std deviation of Z of body acceleration jerk in time'
names(summary)[names(summary) == 'tbodygyro_mean_x'] <- 'mean of X of body gyro signal in time'
names(summary)[names(summary) == 'tbodygyro_mean_y'] <- 'mean of Y of body gyro signal in time'
names(summary)[names(summary) == 'tbodygyro_mean_z'] <- 'mean of Z of body gyro signal in time'
names(summary)[names(summary) == 'tbodygyro_std_x'] <- 'std deviation of X of body gyro signal in time'
names(summary)[names(summary) == 'tbodygyro_std_y'] <- 'std deviation of Y of body gyro signal in time'
names(summary)[names(summary) == 'tbodygyro_std_z'] <- 'std deviation of Z of body gyro signal in time'
names(summary)[names(summary) == 'tbodygyrojerk_mean_x'] <- 'mean of X of body gyro jerk signal in time'
names(summary)[names(summary) == 'tbodygyrojerk_mean_y'] <- 'mean of Y of body gyro jerk signal in time'
names(summary)[names(summary) == 'tbodygyrojerk_mean_z'] <- 'mean of Z of body gyro jerk signal in time'
names(summary)[names(summary) == 'tbodygyrojerk_std_x'] <- 'std deviation of X of body gyro jerk signal in time'
names(summary)[names(summary) == 'tbodygyrojerk_std_y'] <- 'std deviation of Y of body gyro jerk signal in time'
names(summary)[names(summary) == 'tbodygyrojerk_std_z'] <- 'std deviation of Z of body gyro jerk signal in time'
names(summary)[names(summary) == 'tbodyaccmag_mean'] <- 'mean of body accelaration magnitude in time'
names(summary)[names(summary) == 'tbodyaccmag_std'] <- 'std deviation of body acceleration magnitude in time'
names(summary)[names(summary) == 'tgravityaccmag_mean'] <- 'mean of gravity acceleration magnitude in time'
names(summary)[names(summary) == 'tgravityaccmag_std'] <- 'std deviation of gravity acceleration magnitude in time'
names(summary)[names(summary) == 'tbodyaccjerkmag_mean'] <- 'mean of body acceleration jerk magnitude in time'
names(summary)[names(summary) == 'tbodyaccjerkmag_std'] <- 'std deviation of body acceleration jerk magnitude in time'
names(summary)[names(summary) == 'tbodygyromag_mean'] <- 'mean of body gyro signal magnitude in time'
names(summary)[names(summary) == 'tbodygyromag_std'] <- 'std deviation of body gyro signal magnitude in time'
names(summary)[names(summary) == 'tbodygyrojerkmag_mean'] <- 'mean of body gyro jerk signal magnitude in time'
names(summary)[names(summary) == 'tbodygyrojerkmag_std'] <- 'std deviation of body gyro jerk signal magnitude in time'
names(summary)[names(summary) == 'fbodyacc_mean_x'] <- 'mean of X of body acceleration signal in frequency'
names(summary)[names(summary) == 'fbodyacc_mean_y'] <- 'mean of Y of body acceleration signal in frequency'
names(summary)[names(summary) == 'fbodyacc_mean_z'] <- 'mean of Z of body acceleration signal in frequency'
names(summary)[names(summary) == 'fbodyacc_std_x'] <- 'std deviation of X of body acceleration signal in frequency'
names(summary)[names(summary) == 'fbodyacc_std_y'] <- 'std deviation of Y of body acceleration signal in frequency'
names(summary)[names(summary) == 'fbodyacc_std_z'] <- 'std deviation of Z of body acceleration signal in frequency'
names(summary)[names(summary) == 'fbodyaccjerk_mean_x'] <- 'mean of X of body acceleration jerk signal in frequency'
names(summary)[names(summary) == 'fbodyaccjerk_mean_y'] <- 'mean of Y of body acceleration jerk signal in frequency'
names(summary)[names(summary) == 'fbodyaccjerk_mean_z'] <- 'mean of Z of body acceleration jerk signal in frequency'
names(summary)[names(summary) == 'fbodyaccjerk_std_x'] <- 'std deviation of X of body acceleration jerk signal in frequency'
names(summary)[names(summary) == 'fbodyaccjerk_std_y'] <- 'std deviation of Y of body acceleration jerk signal in frequency'
names(summary)[names(summary) == 'fbodyaccjerk_std_z'] <- 'std deviation of Z of body acceleration jerk signal in frequency'
names(summary)[names(summary) == 'fbodygyro_mean_x'] <- 'mean of X of body gyro signal in frequency'
names(summary)[names(summary) == 'fbodygyro_mean_y'] <- 'mean of Y of body gyro signal in frequency'
names(summary)[names(summary) == 'fbodygyro_mean_z'] <- 'mean of Z of body gyro signal in frequency'
names(summary)[names(summary) == 'fbodygyro_std_x'] <- 'std deviation of X of body gyro signal in frequency'
names(summary)[names(summary) == 'fbodygyro_std_y'] <- 'std deviation of Y of body gyro signal in frequency'
names(summary)[names(summary) == 'fbodygyro_std_z'] <- 'std deviation of Z of body gyro signal in frequency'
names(summary)[names(summary) == 'fbodyaccmag_mean'] <- 'mean of body acceleration magnitude in frequency'
names(summary)[names(summary) == 'fbodyaccmag_std'] <- 'std deviation of body acceleration magnitude in frequency'
names(summary)[names(summary) == 'fbodybodyaccjerkmag_mean'] <- 'mean of body acceleration jerk magnitude in frequency'
names(summary)[names(summary) == 'fbodybodyaccjerkmag_std'] <- 'std deviation of body acceleration jerk magnitude in frequency'
names(summary)[names(summary) == 'fbodybodygyromag_mean'] <- 'mean of body gyro signal magnitude in frequency'
names(summary)[names(summary) == 'fbodybodygyromag_std'] <- 'std deviation of body gyro signal magnitude in frequency'
names(summary)[names(summary) == 'fbodybodygyrojerkmag_mean'] <- 'mean of body gyro jerk signal magnitude in frequency'
names(summary)[names(summary) == 'fbodybodygyrojerkmag_std'] <- 'std deviation of body gyro jerk signal magnitude in frequency'

write.table(summary, file="tidyData.txt", row.names=F)

