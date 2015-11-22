---
title: "Run_analysis Codebook"
author: "tbudd"
date: "November 22, 2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
The Coursera page on which the assignment is based is [here.](https://class.coursera.org/getdata-034/human_grading)

The assignment uses data from the [Human Activity Recognition (HAR) Using Smart Phones Data Set.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data from the HAR project are cleaned and made tidy. Then the averages of the mean() and std() columns are returned grouped by subject (participant) and activity.

##Study design and data processing
The study design and initial data processing are described on the [HAR site.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Further details are provided in the README.txt and the features_info.txt files supplied with the dataset in the root directory.

The data were further processed to create a tidy dataset using R (and the dplyr package) as described below under "Creating the tidy datafile". The averages of the mean() and std() columns are returned grouped by subject (participant) and activity.

###Collection of the raw data
The HAR dataset is a collection of accelerometer and gyroscope measurements from subjects wearing a smartphone on their waists while doing various activities.

Collection of the raw data is described in detail under the Data Set Information on the [HAR site.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

###Notes on the original (raw) data 
The raw dataset was downloaded from [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Eight files were processed from the raw data to create the tidy data with averages:
- activity_labels.txt - contains the text descriptions of the activities and an index column 
- features.txt - contains the text descriptions of the features (accelerometer and gyroscope measurements) and an index column
- subject_train.txt - the subject #s corresponding to the training data observations
- y_train.txt - the activity #s corresponding to what the subject was doing during each training data observation 
- x_train.txt - the columns correspond to the features in features.txt. Rows are training data observations
- subject_test.txt - the subject #s corresponding to the test data observations
- y_test.txt - the activity #s corresponding to what the subject was doing during each test data observation
- x_test.txt - the columns correspond to the features in features.txt. Rows are test data observations

The following two files in the root of the dataset directory were used for reference only:
- README.txt - provides details of the experiment and the provided dataset
- features_info.txt - provides detailed discussion of the features/variables in the dataset

All other files (e.g., inertial signals) in the dataset were ignored as they were unnecessary for calculating the averages of the means and standard deviations.

##Creating the tidy data file

###Guide to create the tidy data file
1. First, the dataset was downloaded from [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. A run_analysis project was created in RStudio.
3. The dataset was unzipped and installed underneath the run_analysis project directory.
4. The run_analysis function was run to create the averaged tidy data file (tidy_data.txt).

Notes:
- run_analysis() takes no parameters. It expects the HAR dataset to be unzipped in the directory from which it is run.
- More information on what run_analysis() does can be found in the [README.txt.](https://github.com/tbudd/run_analysis/blob/master/README.md)
- The tidy data output is in the wide form (unstacked), where each variable attribute for a subject is in a separate column.

###Cleaning of the data
run_analysis() computes the average of the mean() and std() variables in the UCI HAR dataset per the steps below: 

1. It combines the subject and activity variables with each of the test and training tables. 
2. It combines the test and training tables row-wise.
3. It then extracts only the mean() and std() variables (columns) for averaging.
4. It uses the features.txt file to give the columns descriptive names.
5. It joins the result of step 4 on the activity_labels.txt file to replace the numeric activities with the text descriptions.
6. It aggregates the result of step 5 by subject and activity, returning the averages of the columns in the result table.
7. Finally, prints the result of step 6 to a file and returns the result as well.

Refer to the run_analysis [README.txt](https://github.com/tbudd/run_analysis/blob/master/README.md) for further details.

##Description of the variables in the tiny_data.txt file

 - Dimensions of the dataset - 180 observations of 68 variables

###Summary of the data
 
The tidy data output is in the wide form (unstacked), where each variable attribute for a subject is in a separate column. Each of the variables (with the exceptions of subject and activity) is an average of smart phone accelerometer and gyroscope measurements grouped by subject number and activity.

There are 30 subjects in the dataset. The accelerometer and gyroscope averages are presented for each subject in each of the 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), sorted first by subject, then by activity.

Below is the str() of the dataset:

'data.frame':	180 obs. of  68 variables:

 $ subject                    : int  1 2 3 4 5 6 7 8 9 10 ...

 $ activity                   : chr  "LAYING" "LAYING" "LAYING" "LAYING" ...

 $ tBodyAcc-mean()-X          : num  0.222 0.281 0.276 0.264 0.278 ...

 $ tBodyAcc-mean()-Y          : num  -0.0405 -0.0182 -0.019 -0.015 -0.0183 ...

 $ tBodyAcc-mean()-Z          : num  -0.113 -0.107 -0.101 -0.111 -0.108 ...

 $ tBodyAcc-std()-X           : num  -0.928 -0.974 -0.983 -0.954 -0.966 ...

 $ tBodyAcc-std()-Y           : num  -0.837 -0.98 -0.962 -0.942 -0.969 ...

 $ tBodyAcc-std()-Z           : num  -0.826 -0.984 -0.964 -0.963 -0.969 ...

 $ tGravityAcc-mean()-X       : num  -0.249 -0.51 -0.242 -0.421 -0.483 ...

 $ tGravityAcc-mean()-Y       : num  0.706 0.753 0.837 0.915 0.955 ...

 $ tGravityAcc-mean()-Z       : num  0.446 0.647 0.489 0.342 0.264 ...

 $ tGravityAcc-std()-X        : num  -0.897 -0.959 -0.983 -0.921 -0.946 ...

 $ tGravityAcc-std()-Y        : num  -0.908 -0.988 -0.981 -0.97 -0.986 ...

 $ tGravityAcc-std()-Z        : num  -0.852 -0.984 -0.965 -0.976 -0.977 ...

 $ tBodyAccJerk-mean()-X      : num  0.0811 0.0826 0.077 0.0934 0.0848 ...

 $ tBodyAccJerk-mean()-Y      : num  0.00384 0.01225 0.0138 0.00693 0.00747 ...

 $ tBodyAccJerk-mean()-Z      : num  0.01083 -0.0018 -0.00436 -0.00641 -0.00304 ...

 $ tBodyAccJerk-std()-X       : num  -0.958 -0.986 -0.981 -0.978 -0.983 ...

 $ tBodyAccJerk-std()-Y       : num  -0.924 -0.983 -0.969 -0.942 -0.965 ...

 $ tBodyAccJerk-std()-Z       : num  -0.955 -0.988 -0.982 -0.979 -0.985 ...

 $ tBodyGyro-mean()-X         : num  -0.01655 -0.01848 -0.02082 -0.00923 -0.02189 ...

 $ tBodyGyro-mean()-Y         : num  -0.0645 -0.1118 -0.0719 -0.093 -0.0799 ...

 $ tBodyGyro-mean()-Z         : num  0.149 0.145 0.138 0.17 0.16 ...

 $ tBodyGyro-std()-X          : num  -0.874 -0.988 -0.975 -0.973 -0.979 ...

 $ tBodyGyro-std()-Y          : num  -0.951 -0.982 -0.977 -0.961 -0.977 ...

 $ tBodyGyro-std()-Z          : num  -0.908 -0.96 -0.964 -0.962 -0.961 ...

 $ tBodyGyroJerk-mean()-X     : num  -0.107 -0.102 -0.1 -0.105 -0.102 ...

 $ tBodyGyroJerk-mean()-Y     : num  -0.0415 -0.0359 -0.039 -0.0381 -0.0404 ...

 $ tBodyGyroJerk-mean()-Z     : num  -0.0741 -0.0702 -0.0687 -0.0712 -0.0708 ...

 $ tBodyGyroJerk-std()-X      : num  -0.919 -0.993 -0.98 -0.975 -0.983 ...

 $ tBodyGyroJerk-std()-Y      : num  -0.968 -0.99 -0.987 -0.987 -0.984 ...

 $ tBodyGyroJerk-std()-Z      : num  -0.958 -0.988 -0.983 -0.984 -0.99 ...

 $ tBodyAccMag-mean()         : num  -0.842 -0.977 -0.973 -0.955 -0.967 ...

 $ tBodyAccMag-std()          : num  -0.795 -0.973 -0.964 -0.931 -0.959 ...

 $ tGravityAccMag-mean()      : num  -0.842 -0.977 -0.973 -0.955 -0.967 ...

 $ tGravityAccMag-std()       : num  -0.795 -0.973 -0.964 -0.931 -0.959 ...

 $ tBodyAccJerkMag-mean()     : num  -0.954 -0.988 -0.979 -0.97 -0.98 ...

 $ tBodyAccJerkMag-std()      : num  -0.928 -0.986 -0.976 -0.961 -0.977 ...

 $ tBodyGyroMag-mean()        : num  -0.875 -0.95 -0.952 -0.93 -0.947 ...

 $ tBodyGyroMag-std()         : num  -0.819 -0.961 -0.954 -0.947 -0.958 ...

 $ tBodyGyroJerkMag-mean()    : num  -0.963 -0.992 -0.987 -0.985 -0.986 ...

 $ tBodyGyroJerkMag-std()     : num  -0.936 -0.99 -0.983 -0.983 -0.984 ...

 $ fBodyAcc-mean()-X          : num  -0.939 -0.977 -0.981 -0.959 -0.969 ...

 $ fBodyAcc-mean()-Y          : num  -0.867 -0.98 -0.961 -0.939 -0.965 ...

 $ fBodyAcc-mean()-Z          : num  -0.883 -0.984 -0.968 -0.968 -0.977 ...

 $ fBodyAcc-std()-X           : num  -0.924 -0.973 -0.984 -0.952 -0.965 ...

 $ fBodyAcc-std()-Y           : num  -0.834 -0.981 -0.964 -0.946 -0.973 ...

 $ fBodyAcc-std()-Z           : num  -0.813 -0.985 -0.963 -0.962 -0.966 ...

 $ fBodyAccJerk-mean()-X      : num  -0.957 -0.986 -0.981 -0.979 -0.983 ...

 $ fBodyAccJerk-mean()-Y      : num  -0.922 -0.983 -0.969 -0.944 -0.965 ...

 $ fBodyAccJerk-mean()-Z      : num  -0.948 -0.986 -0.979 -0.975 -0.983 ...

 $ fBodyAccJerk-std()-X       : num  -0.964 -0.987 -0.983 -0.98 -0.986 ...

 $ fBodyAccJerk-std()-Y       : num  -0.932 -0.985 -0.971 -0.944 -0.966 ...

 $ fBodyAccJerk-std()-Z       : num  -0.961 -0.989 -0.984 -0.98 -0.986 ...

 $ fBodyGyro-mean()-X         : num  -0.85 -0.986 -0.97 -0.967 -0.976 ...

 $ fBodyGyro-mean()-Y         : num  -0.952 -0.983 -0.978 -0.972 -0.978 ...

 $ fBodyGyro-mean()-Z         : num  -0.909 -0.963 -0.962 -0.961 -0.963 ...

 $ fBodyGyro-std()-X          : num  -0.882 -0.989 -0.976 -0.975 -0.981 ...

 $ fBodyGyro-std()-Y          : num  -0.951 -0.982 -0.977 -0.956 -0.977 ...

 $ fBodyGyro-std()-Z          : num  -0.917 -0.963 -0.967 -0.966 -0.963 ...

 $ fBodyAccMag-mean()         : num  -0.862 -0.975 -0.966 -0.939 -0.962 ...

 $ fBodyAccMag-std()          : num  -0.798 -0.975 -0.968 -0.937 -0.963 ...

 $ fBodyBodyAccJerkMag-mean() : num  -0.933 -0.985 -0.976 -0.962 -0.977 ...

 $ fBodyBodyAccJerkMag-std()  : num  -0.922 -0.985 -0.975 -0.958 -0.976 ...

 $ fBodyBodyGyroMag-mean()    : num  -0.862 -0.972 -0.965 -0.962 -0.968 ...

 $ fBodyBodyGyroMag-std()     : num  -0.824 -0.961 -0.955 -0.947 -0.959 ...

 $ fBodyBodyGyroJerkMag-mean(): num  -0.942 -0.99 -0.984 -0.984 -0.985 ...

 $ fBodyBodyGyroJerkMag-std() : num  -0.933 -0.989 -0.983 -0.983 -0.983 ...
 
The variables are described in detail below. For further information, refer to the dataset README.txt and feature_info.txt files in the root directory of the HAR dataset.

###Variable 1 (subject)
A numeric representation of the subject whose accelerometer and gyroscope measurements are in each row.
- Class:      integer
- Values:     1-30
- Units:      none
- Schema:     none

###Variable 2 (activity)
A character string representation of the activity the subject was performing during the accelerometer and gyroscope measurements.
- Class:      chr
- Values:     WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- Units:      none
- Schema:     none

###Variables 3-68 (named according to schema below)
A number respresenting the processed specific measurement from either the accelerometer or gyroscope. For details on the processing refer to the dataset README.txt and feature_info.txt files in the root directory of the HAR dataset.
- Class:      num
- Values:     -1 through 1
- Units:      none, because the estimates of the measures were normalized to be between -1 and 1 inclusive.
- Schema:     \<domain\>\<acceleration vector\>\<sensor\>\<specific measure\>\<function\>\<axis\>

Schema notes:

\<domain\> one letter, t for time domain, f for frequency domain

\<acceleration vector\> either Body or Gravity for either the body or gravity component of the acceleration signal, respectively

\<sensor\> either Acc for accelerometer or Gyro for gyroscope

\<specific measure\> (optional, either Jerk or Mag or both or none) Jerk is the derivative of acceleration with respect to time. Mag is the magnitude of the X,Y,Z vectors for the measure.

\<function\> either Mean or Std for the mean value or standard deviation, respectively. Only columns ending in mean() and std() were included in the result, because the assignment requested only means and standard deviations of the measurements. For example, MeanFreq() was not used, because MeanFreq() is defined in the frequency_info.txt file as "the weighted average of the frequency components to obtain a mean frequency," which is not the simple mean.

\<axis\> X,Y,or Z depending on the direction of the force vector. Specific measures that include Mag do not have an X,Y, or Z suffix, because the magnitude is a scalar.

##Sources
The Coursera page on which the assignment is based is [here.](https://class.coursera.org/getdata-034/human_grading)

The assignment uses data from the [Human Activity Recognition (HAR) Using Smart Phones Data Set.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The raw dataset was downloaded from [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

This codebook was created using the "Codebook Template" from the "Data Science Specialization" website, ["Getting and Cleaning Data" page.](http://datasciencespecialization.github.io/getclean/)


