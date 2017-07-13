# Getting and Cleaning Data Course Project
------------------------------------------
### Intro
-----------------------------------------
This repo contains the work done for a Coursera course assignment.
The purpose of the project was to develope an R script named - **_run_analysis.R_** in order to tidy and analyse data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data used for the project can be dowloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
###  **_run_analysis.R_** - sequence of actions
-----------------------------------------
* Attach needed packages (dplyr)
* Merge the training and the test sets to create one data set.
* Label the data set with original variable names taken from "features.txt" file
* Extract only the measurements on the mean and standard deviation for each measurement.
* Modify variable names according to camelCase convension
* Use descriptive activity names to name the activities in the data set
* Add subject to dataset
* Save clear dataset to **_tidy.csv_** file
* Create data set with the average of each variable for each activity and each subject.
* Save aggregated data to **_tidyAggregated.csv_** file 

