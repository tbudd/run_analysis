---
title: "Run_analysis Codebook"
author: "tbudd"
date: "November 22, 2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
The assignment uses data from the [Human Activity Recognition (HAR) Using Smart Phones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data from the HAR project are cleaned and made tidy. Then the averages of the mean() and std() columns are returned grouped by subject (participant) and activity.

##Study design and data processing
The study design and initial data processing are described on the [HAR site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data were further processed to create a tidy dataset using R (and the dplyr package) as described below under "Creating the tidy datafile". The averages of the mean() and std() columns are returned grouped by subject (participant) and activity.

###Collection of the raw data
Collection of the raw data is described under the Data Set Information on the [HAR site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

###Notes on the original (raw) data 
The raw data set was downloaded from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Eight files were processed from the raw data to create the tidy data with averages:
- activity_labels.txt
- features.txt
- subject_train.txt
- y_train.txt
- x_train.txt
- subject_test.txt
- y_test.txt
- x_test.txt

Two files in the root of the dataset directory were used for reference
- README.txt
- features_info.txt

All other files (e.g., inertial signals) in the dataset were ignored as they were unnecessary for the tidy data of averages.

##Creating the tidy datafile

###Guide to create the tidy data file
Description on how to create the tidy data file (1. download the data, ...)/

###Cleaning of the data
Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail]()

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
This codebook was created using the "Codebook Template" from the "Data Science Specialization" website, ["Getting and Cleaning Data" page](http://datasciencespecialization.github.io/getclean/)

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)

