#Code Book - Summary of Human Activity Recognition Using Smartphones Dataset V1.0

The raw input data is tidied up as follows:

1. Identify features of interest - read features.txt and look for features with
names containing mean() or std(). Clean up feature names - remove the characters '(', and ')', and replace '-' with '_'.

2. Read data files from the test/ and train/ subdirectories.
From the feature files, select only the features of interest.

3. Read the activity-code to activity-name mapping from the activity_lables.txt
file.
Column-merge the features, labels, and subjects.
Then join with activity code mapping, and eliminate
the activity code column from the result.

4. Give the same column names to test data and training data, and
then merge the two row-wise.

5. Get the mean of all columns, grouped by activity name and subject.

6. Rename summary columns to names that are descriptive and meaningful to people.
Write the resulting tidy data to a file called 'tidyData.txt'.

The above steps are encapsulated in the R script run_analysis.R.

##Data Dictionary

* activity name
       * a string denoting the activity performed, one of WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, and LAYING
* subject
	* a number between 1 and 30, denoting the subject that underwent the test
* mean of X of body acceleration signal in time
	* Units: g
* mean of Y of body acceleration signal in time
 	* Units: g
* mean of Z of body acceleration signal in time
 	* Units: g
* std deviation of X of body acceleration signal in time
	* Units: g
* std deviation of Y of body acceleration signal in time
	* Units: g
* std deviation of Z of body acceleration signal in time
	* Units: g
* mean of X of gravity acceleration signal in time
	* Units: g
* mean of Y of gravity acceleration signal in time
	* Units: g
* mean of Z of gravity acceleration signal in time
	* Units: g
* std deviation of X of gravity acceleration signal in time
	* Units: g
* std deviation of Y of gravity acceleration signal in time
	* Units: g
* std deviation of Z of gravity acceleration signal in time
	* Units: g
* mean of X of body acceleration jerk in time
	* Units: g/sec
* mean of Y of body acceleration jerk in time
	* Units: g/sec
* mean of Z of body acceleration jerk in time
	* Units: g/sec
* std deviation of X of body acceleration jerk in time
	* Units: g/sec
* std deviation of Y of body acceleration jerk in time
	* Units: g/sec
* std deviation of Z of body acceleration jerk in time
	* Units: g/sec
* mean of X of body gyro signal in time
	* Units: radians/sec
* mean of Y of body gyro signal in time
	* Units: radians/sec
* mean of Z of body gyro signal in time
	* Units: radians/sec
* std deviation of X of body gyro signal in time
	* Units: radians/sec
* std deviation of Y of body gyro signal in time
	* Units: radians/sec
* std deviation of Z of body gyro signal in time
	* Units: radians/sec
* mean of X of body gyro jerk signal in time
	* Units: radians/sec/sec
* mean of Y of body gyro jerk signal in time
 	* Units: radians/sec/sec
* mean of Z of body gyro jerk signal in time
   	* Units: radians/sec/sec
* std deviation of X of body gyro jerk signal in time
   	* Units: radians/sec/sec
* std deviation of Y of body gyro jerk signal in time
   	* Units: radians/sec/sec
* std deviation of Z of body gyro jerk signal in time
   	* Units: radians/sec/sec
* mean of body accelaration magnitude in time
   	* Units: g
* std deviation of body acceleration magnitude in time
   	* Units: g
* mean of gravity acceleration magnitude in time
   	* Units: g
* std deviation of gravity acceleration magnitude in time
   	* Units: g
* mean of body acceleration jerk magnitude in time
   	* Units: g/sec
* std deviation of body acceleration jerk magnitude in time
   	* Units: g/sec
* mean of body gyro signal magnitude in time
   	* Units: radians/sec
* std deviation of body gyro signal magnitude in time
   	* Units: radians/sec
* mean of body gyro jerk signal magnitude in time
   	* Units: radians/sec/sec
* std deviation of body gyro jerk signal magnitude in time
   	* Units: radians/sec/sec
* mean of X of body acceleration signal in frequency
   	* Units: g
* mean of Y of body acceleration signal in frequency
   	* Units: g
* mean of Z of body acceleration signal in frequency
   	* Units: g
* std deviation of X of body acceleration signal in frequency
   	* Units: g
* std deviation of Y of body acceleration signal in frequency
   	* Units: g
* std deviation of Z of body acceleration signal in frequency
   	* Units: g
* mean of X of body acceleration jerk signal in frequency
  	* Units: g/sec
* mean of Y of body acceleration jerk signal in frequency
  	* Units: g/sec
* mean of Z of body acceleration jerk signal in frequency
  	* Units: g/sec
* std deviation of X of body acceleration jerk signal in frequency
  	* Units: g/sec
* std deviation of Y of body acceleration jerk signal in frequency
  	* Units: g/sec
* std deviation of Z of body acceleration jerk signal in frequency
  	* Units: g/sec
* mean of X of body gyro signal in frequency
  	* Units: radians/sec
* mean of Y of body gyro signal in frequency
  	* Units: radians/sec
* mean of Z of body gyro signal in frequency
  	* Units: radians/sec
* std deviation of X of body gyro signal in frequency
  	* Units: radians/sec
* std deviation of Y of body gyro signal in frequency
  	* Units: radians/sec
* std deviation of Z of body gyro signal in frequency
  	* Units: radians/sec
* mean of body acceleration magnitude in frequency
  	* Units:g
* std deviation of body acceleration magnitude in frequency
  	* Units:g
* mean of body acceleration jerk magnitude in frequency
  	* Units:g/sec
* std deviation of body acceleration jerk magnitude in frequency
  	* Units:g/sec
* mean of body gyro signal magnitude in frequency
  	* Units:radians/sec
* std deviation of body gyro signal magnitude in frequency
  	* Units:radians/sec
* mean of body gyro jerk signal magnitude in frequency
  	* Units:radians/sec/sec
* std deviation of body gyro jerk signal magnitude in frequency
  	* Units:radians/sec/sec
