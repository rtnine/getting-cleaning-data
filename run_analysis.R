#
# run_analysis.R
#
# Written by Robert Nine
# For Coursera Getting and Cleaning Data Course
# 30 Jan 2016

library(plyr)

# 0. Acquire data
# Check to see if data directory exists. If not, create it
if(!file.exists("./data")){dir.create("./data")}

# Check to see if data file exists. If not, download it and unzip it
if(!file.exists("./data/UCI_HAR_Dataset.zip")){fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";
download.file(fileUrl,destfile="./data/UCI_HAR_Dataset.zip");
unzip("./data/UCI_HAR_Dataset.zip",exdir="./data")}

# set path and read in data from downloaded files
dataPath <- file.path("./data" , "UCI HAR Dataset")
dfSubjectTrain <- read.table(file.path(dataPath, "train", "subject_train.txt"),header = FALSE)
dfSubjectTest  <- read.table(file.path(dataPath, "test" , "subject_test.txt"),header = FALSE)
dfActivityTrain <- read.table(file.path(dataPath, "train", "Y_train.txt"),header = FALSE)
dfActivityTest  <- read.table(file.path(dataPath, "test" , "Y_test.txt" ),header = FALSE)
dfFeaturesTrain <- read.table(file.path(dataPath, "train", "X_train.txt"),header = FALSE)
dfFeaturesTest  <- read.table(file.path(dataPath, "test" , "X_test.txt" ),header = FALSE)

# 1. Merge the training and the test sets to create one data set.
dfSubject <- rbind(dfSubjectTrain, dfSubjectTest)
dfActivity<- rbind(dfActivityTrain, dfActivityTest)
dfFeatures<- rbind(dfFeaturesTrain, dfFeaturesTest)
# Set the variable names
names(dfSubject)<-c("subject")
names(dfActivity)<- c("activity")
dfFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dfFeatures)<- dfFeaturesNames$V2
# Merge the columns into a single dataframe
dfMergedSubjectActivity <- cbind(dfSubject, dfActivity)
dfMergedData <- cbind(dfFeatures, dfMergedSubjectActivity)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
subdataFeaturesNames<-dfFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dfFeaturesNames$V2)]
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
dfMergedData<-subset(dfMergedData,select=selectedNames)

# 3. Use descriptive activity names to name the activities in the data set
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE, colClasses="character")
dfMergedData$activity <- factor(dfMergedData$activity,levels=activityLabels$V1,labels=activityLabels$V2)

# 4. Appropriately label the data set with descriptive variable names.
# Remove parenthese
names(dfMergedData)<-gsub('\\(|\\)',"",names(dfMergedData), perl = TRUE)
# Change hyphens to periods
names(dfMergedData)<-gsub('\\-',".",names(dfMergedData), perl = TRUE)
# Expand abbreviations and fix unclear jargon
names(dfMergedData)<-gsub("^t", "time", names(dfMergedData))
names(dfMergedData)<-gsub("^f", "frequency", names(dfMergedData))
names(dfMergedData)<-gsub("Acc", "Acceleration", names(dfMergedData))
names(dfMergedData)<-gsub("Mag", "Magnitude", names(dfMergedData))
names(dfMergedData)<-gsub("BodyBody", "Body", names(dfMergedData))
names(dfMergedData)<-gsub("GyroJerk","Angular.Acceleration",names(dfMergedData))
names(dfMergedData)<-gsub("Gyro","Angular.Speed",names(dfMergedData))
names(dfMergedData)<-gsub("\\.mean",".Mean",names(dfMergedData))
names(dfMergedData)<-gsub("\\.std",".Standard.Deviation",names(dfMergedData))
names(dfMergedData)<-gsub("Freq\\.","Frequency.",names(dfMergedData))
names(dfMergedData)<-gsub("Freq$","Frequency",names(dfMergedData))

# 5. From the data set in step 4, create a second, independent tidy data set with the average 
# of each variable for each activity and each subject.
dfDataSubset<-aggregate(. ~subject + activity, dfMergedData, mean)
dfDataSubset<-dfDataSubset[order(dfDataSubset$subject,dfDataSubset$activity),]
write.table(dfDataSubset, file="UCI_HAR_MEAN_STD.csv", sep=",", row.name=FALSE)
