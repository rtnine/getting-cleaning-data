Getting and Cleaning Data Course Project

Project of Getting and Cleaning Data course on Coursera, May 2014 edition.

Project Description

The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The following will need to be submitted:
1. a tidy data set as described below
2. a link to a Github repository with your script for performing the analysis, and a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
3. a README.md in the repo with your script. This file explains how the script works.

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data for the project can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The goal is to create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

What you find in this repository
CodeBook.md: information about raw and tidy data set and elaboration made to transform them
LICENSE: license terms for text and code
README.md: this file
run_analysis.R: R script to transform raw data set in a tidy one
UCI_HAR_MEAN_STD.csv: tidy dataset produced by run_analysis.R

How to create the tidy data set
1. clone this repository: git clone git@github.com:rtnine/getting-cleaning-data.git
2. download compressed raw data and unzip it and copy the directory UCI HAR Dataset to the cloned repository root directory (NOTE: this step is optional as the script will look for the data file, and if it is not found will download the dataset using the URL above, and unzip it
3. open a R console and set the working directory to the repository root (use setwd())
4. source run_analisys.R script (it requires the plyr package): source('run_analysis.R')
5. Afterwards in the repository root directory you find the file UCI_HAR_MEAN_STD.csv with the tidy data set.
