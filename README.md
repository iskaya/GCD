# Getting and Cleaning Data Project


## Background

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like [Fitbit](https://www.fitbit.com/), [Nike](https://secure-nikeplus.nike.com/plus/), and 
[Jawbone Up](https://jawbone.com/up) are racing to develop the most advanced algorithms to attract new users. The data used in this analysis  represent data collected by the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project can be found here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## Purpose 

The purpose of this project is to collect, work with, and clean a data 
set. The goal is to prepare a tidy data that can be used for later analysis. 

Included in this repo: 
* `README.md`: explains how all of the scripts work and how they are connected. 
* `CodeBook.md`: describes the variables, the data, and any transformations or work that was performed to clean up the data.
* `run_analysis.R`: script for performing the analysis.
* `tidy.txt`: a cleaned data set.  


#### Dependencies

In order to properly run the R script, the `data.table` and `reshape2` packages are required. These can be downloaded from [CRAN](https://cran.r-project.org/).


#### run_analysis.R
An R script created to do the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#### tidy.txt
A .txt file that is the result of running *run_analysis.R*. This is an indepedent data set that contains the average of each variable for each activity and each subject.

