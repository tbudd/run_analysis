---
title: "README"
author: "tbudd"
date: "November 13, 2015"
output: html_document
---

run_analysis() uses the "Human Activity Recognition (HAR) Using Smartphones Dataset"" from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

run_analysis() assumes all of the files are in ".\UCI HAR Dataset" in the original file heirarchy.

A full description of the HAR project is here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

run_analysis computes the average of the mean() and std() variables in the UCI HAR dataset per the steps below: 

1.It combines the subject and activity variables with each of the test and training tables. The subject and activity variables are in the subject_XXXX.txt and activity_labels.txt, repectively, where XXXX is either "test" or "train" depending on whether the file corresponds to the "test" or "training" data, respectively. The result is a test table with the corresponding subject and activity columns, and a training table with the appropriate subject and activity columns.
2. It combines the test and training tables rowwise, that is appending the test rows to the training table.
3. It then extracts only the mean() and st() variables (columns) for averaging.
4. Since the columns in the original data are unamed, it uses the features.txt file to give the columns descriptive names.
5. It joins the result of step 4 on the activity_labels.txt file to replace the numeric activities with the text descriptions.
6. It aggregates the result of step 5 by subject and activity, returning the averages of the columns in the result table.
7. Finally, prints the result of step 6 to a file and returns the result as well.

Notes:
Inertial data were not included from the dataset, because they were not necessary to calculate the averages of the means and standard deviations.

Only columns ending in mean() and std() were included in the result, because the assignment requested means and standard deviations. MeanFreq() is defined in the frequency_infot.txt file as "the Weighted average of the frequency components to obtain a mean frequency," which is not exactly the same as mean.

The column names were taken from the features.txt files verbatim. While longer column names could have been used, shorter names make for narrower columns, allowing more to be viewed at once. It is a trade off. The original data author did a reasonably good job with the acronyms, and some of them are already quite long (36 chars). The code book contains complete descriptions if there is any confusion.

The tidy data output is in the wide form (unstacked), where each variable attribute for a subject is in a separate column. Subject and activity do not have meaningful averages, so those averaged columns were removed.

The output can be perused using this code:
```{r, echo=FALSE}
data <- read.table(file_path, header = TRUE)
View(data)
```