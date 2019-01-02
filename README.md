# Summary of Human Activity Recognition Using Smartphones Dataset
##Version 1.0

Raw input data was taken from the "Human Activity Recognition Using Smartphones Dataset Version 1.0" project of the UCI Machine Learning Repository. The zip archive of the data was available at the following URL for this assignment:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###How the original raw data was produced:

Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The sensor acceleration signals were separated by a low-pass filter into a body acceleration component and a gravity acceleration component. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain jerk signals. Also Eucledian norm was applied to the X, Y, and Z signals to calculate the magnitude.

Fast fourier transform was applied to some of the signals to produce the frequency measurements. The output data columns with names ending in "in frequency" denote the frequency measurements.

Mean and standard deviation were calculated for the measurements, and the results are normalized to fall between -1 and 1.

###How the raw data is tidied up for this assignment:

An R script is developed for tidying up the data. 

First, the features of interest are identified. These are all the features with 'mean()' or 'std()' in their name. Feature names are tidied up to eliminate the characters '(', ')' and to replace '-' with '\_'.

The raw data files are read from the train and test subdirectories, and only the features of interest are selected from it.

The activity code label, and the subject variables are added to the raw test and training data. The activity code variable in raw data is then mapped to activity name. 

Training and test data is then combined.

All of the measures are averaged, grouping by activity name and subject. Columns are given new names that are descriptive and meaningful to people. The results are written to the output tidy data file.


###Files in the repository:

* readme.md      - this readme file
* codebook.md    - a brief description of the tidying process followed by a list of output data columns and their units of measurement
* run_analysis.R - the R code to convert the raw data to tidy output data


###Instructions for running the script to produce the tidy data output file

Download the zip archive of the original raw data, and unzip it. Place the run\_analysis.R script in the root directory of the unzipped archive. Then, bring up RStudio or the R console, change directory to the root directory of the unzipped archive, and run the run\_analysis.R file. The output tidy data is produced in the tidyData.txt file in the same directory. You can inspect it by reading it back using read.table() with header=TRUE option.

The script uses the dplyr library.

