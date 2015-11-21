---
title: "README"
author: "tbudd"
date: "November 13, 2015"
output: html_document
---

run_analysis() uses the "Human Activity Recognition (HAR) Using Smartphones Dataset" from [here.] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The HAR dataset is a collection of accelerometer and gyroscope measurements from subjects wearing a smartphone on their waists while doing various activities.

run_analysis() assumes all of the files are in ".\UCI HAR Dataset" in the original file heirarchy.

A full description of the HAR project is [here.](
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Additional details are provided in the README.txt and features_info.txt files included at the root of the provided dataset.

run_analysis() computes the average of the mean() and std() variables in the UCI HAR dataset per the steps below: 

1. It combines the subject and activity variables with each of the test and training tables. 
    The subject and activity variables are in subject_XXXX.txt and activity_labels.txt, respectively, where XXXX is either "test" or "train" depending on whether the file corresponds to the "test" or "training" data, respectively. 
    The result is a test table with corresponding subject and activity columns and a training table with its own corresponding subject and activity columns.
2. It combines the test and training tables row-wise, that is, appending the test rows to the training rows.
 It then extracts only the mean() and st() variables (columns) for averaging.
3. Since the columns in the original data are unamed, it uses the features.txt file (containing the feature names) to give the columns descriptive names.
4. It joins the result of step 3 with the activity_labels.txt file (using the numeric activity columns in both tables as indices) to replace the numeric activities with the activity text descriptions.
5. It aggregates the result of step 4 by subject and activity, sotring on subject and activity, returning the averages of the columns in the result table.
6. Finally, it prints the result of step 5 to a wide-form tidy file (tidy_data.txt) and returns the result as well.

Notes:
- Inertial data (included in the HAR dataset) were not used, because they were not necessary to calculate the averages of the means and standard deviations.

- Only columns ending in mean() and std() were included in the result, because the assignment requested means and standard deviations of the measurements. For example, MeanFreq() was not used, because MeanFreq() is defined in the frequency_info.txt file as "the weighted average of the frequency components to obtain a mean frequency," which is not the simple mean.

- The column names were taken from the features.txt files verbatim. While longer column names could have been used, shorter names make for narrower columns, allowing multiple columns to be viewed at once. It is a trade-off. The original data author did a reasonably good job with the acronyms, and some of them are already quite long (36 characters). If we used  full English descriptions for each variable, some of the variable names would be twice as long, e.g, TimeDomainGravityAccelerationMagnitudeStandardDeviationXaxis. The code book contains complete descriptions of the column headings in the resulting tidy_data.txt.

- The tidy data output is in the wide form (unstacked), where each variable attribute for a subject is in a separate column. Subject and activity do not have meaningful averages, so the columns displaying those averages were removed.

The output can be perused using this code:
```{r, echo=FALSE}
data <- read.table(file_path, header = TRUE)
View(data)
```