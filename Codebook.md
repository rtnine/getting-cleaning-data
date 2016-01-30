Codebook.md

Codebook for the Coursera - Getting and Cleaning Data Course Final Project
Created by Robert Nine on 30 Jan 2016

==================================================================
Getting and Cleaning Data Course Project 

The purpose of this project is to demonstrate the student's ability to collect, 
work with, and clean a data set. The goal is to prepare tidy data that can be used 
for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing - 
see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to 
develop the most advanced algorithms to attract new users. The data linked to from the 
course website represent data collected from the accelerometers from the Samsung Galaxy S 
smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the 
    average of each variable for each activity and each subject.

==================================================================

Data analyzed was from the Human Activity Recognition Using Smartphones Dataset Project
Version 1.0

Conducted by:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

==================================================================

The experiment was carried out with a group of 30 volunteers within an age bracket 
of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using the smartphone's embedded accelerometer and gyroscope, they captured 
3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The original dataset was randomly partitioned into two sets, where 70% of the 
volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise 
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap 
(128 readings/window). The sensor acceleration signal, which has gravitational and body 
motion components, was separated using a Butterworth low-pass filter into body acceleration 
and gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 
features was obtained by calculating variables from the time and frequency domain. 
See 'features_info.txt' for more details. 

For each record the experiment provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) 
  and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Feature Selection 
=================

The features selected for the original dataset came from the accelerometer and gyroscope 3-axial 
raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) 
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter 
and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration 
signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with 
a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to 
obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these 
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, 
tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, 
fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of original variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

As stated in the Coursera project description, we are only interested in the
mean and standard deviations for each measurement. After running the run_analysis.R 
script this left us with a new data that contains 180 records with 68 columns:

  30 Subjects, each performing 6 activities

This left us with the following features, whose names were expanded for readability:

 [1] "subject"							
      an integer from 1 to 30 representing the test subject                                                     
 [2] "activity"           
      a factor describing the activity being tested, valid values consist of:
      WALKING
, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS
, SITTING
, STANDING
, and LAYING
                
 [3] "timeBodyAcceleration.Mean.X" 
      the mean of the x axis of time domain body acceleration signal obtained by 
      subtracting the gravity from the total acceleration, measured in gravities (g)                                 
 [4] "timeBodyAcceleration.Mean.Y"
      the mean of the y axis of time domain body acceleration signal obtained by 
      subtracting the gravity from the total acceleration, measured in gravities (g)                                    
 [5] "timeBodyAcceleration.Mean.Z"
      the mean of the z axis of time domain body acceleration signal obtained by 
      subtracting the gravity from the total acceleration, measured in gravities (g)                                    
 [6] "timeBodyAcceleration.Standard.Deviation.X"
      the standard deviation of the x axis of the time domain body acceleration signal 
      obtained by subtracting the gravity from the total acceleration, measured in gravities (g)                      
 [7] "timeBodyAcceleration.Standard.Deviation.Y"
      the standard deviation of the y axis of the time domain body acceleration signal 
      obtained by subtracting the gravity from the total acceleration, measured in gravities (g)                       
 [8] "timeBodyAcceleration.Standard.Deviation.Z"
      the standard deviation of the z axis of the time domain body acceleration signal 
      obtained by subtracting the gravity from the total acceleration, measured in gravities (g)                       
 [9] "timeGravityAcceleration.Mean.X"           
      the mean of the time domain acceleration signal from the smartphone accelerometer x axis in gravities (g)                    
[10] "timeGravityAcceleration.Mean.Y"    
      the mean of the time domain acceleration signal from the smartphone accelerometer y axis in gravities (g)                           
[11] "timeGravityAcceleration.Mean.Z"    
      the mean of the time domain acceleration signal from the smartphone accelerometer z axis in gravities (g)                             
[12] "timeGravityAcceleration.Standard.Deviation.X"   
      the standard deviation of the time domain acceleration signal from the smartphone accelerometer x axis 
      in gravities (g)               
[13] "timeGravityAcceleration.Standard.Deviation.Y"   
      the standard deviation of the time domain acceleration signal from the smartphone accelerometer y axis 
      in gravities (g)                             
[14] "timeGravityAcceleration.Standard.Deviation.Z"   
      the standard deviation of the time domain acceleration signal from the smartphone accelerometer z axis 
      in gravities (g)                             
[15] "timeBodyAccelerationJerk.Mean.X"     
      the mean of the x axis of the time domain body acceleration jerk, measured in gravities (g)                              
[16] "timeBodyAccelerationJerk.Mean.Y"  
      the mean of the y axis of the time domain body acceleration jerk, measured in gravities (g)                              
[17] "timeBodyAccelerationJerk.Mean.Z"  
      the mean of the z axis of the time domain body acceleration jerk, measured in gravities (g)                              
[18] "timeBodyAccelerationJerk.Standard.Deviation.X" 
      the standard deviation of the x axis of the time domain body acceleration jerk, measured in gravities (g)                 
[19] "timeBodyAccelerationJerk.Standard.Deviation.Y"  
      the standard deviation of the y axis of the time domain body acceleration jerk, measured in gravities (g)               
[20] "timeBodyAccelerationJerk.Standard.Deviation.Z"  
      the standard deviation of the z axis of the time domain body acceleration jerk, measured in gravities (g)               
[21] "timeBodyAngular.Speed.Mean.X"  
      the mean of the x axis of the time domain angular velocity vector measured by the gyroscope for each window sample in radians/second                               
[22] "timeBodyAngular.Speed.Mean.Y"   
      the mean of the y axis of the time domain angular velocity vector measured by the gyroscope for each window sample in radians/second                                  
[23] "timeBodyAngular.Speed.Mean.Z"                                 
      the mean of the z axis of the time domain angular velocity vector measured by the gyroscope for each window sample in radians/second    
[24] "timeBodyAngular.Speed.Standard.Deviation.X"                   
      the standard deviation of the x axis of the time domain angular velocity measured by the gyroscope for each window sample in radians/second    
[25] "timeBodyAngular.Speed.Standard.Deviation.Y"                   
      the standard deviation of the y axis of the time domain angular velocity measured by the gyroscope for each window sample in radians/second
[26] "timeBodyAngular.Speed.Standard.Deviation.Z"                   
      the standard deviation of the z axis of the time domain angular velocity measured by the gyroscope for each window sample in radians/second
[27] "timeBodyAngular.Acceleration.Mean.X"                      
      the mean of the x axis of the time domain angular velocity vector measured by the gyroscope for each window sample in radians/second    
[28] "timeBodyAngular.Acceleration.Mean.Y"     
      the mean of the y axis of the time domain angular velocity vector measured by the gyroscope for each window sample in radians/second                     
[29] "timeBodyAngular.Acceleration.Mean.Z"                          
      the mean of the z axis of the time domain angular velocity vector measured by the gyroscope for each window sample in radians/second 
[30] "timeBodyAngular.Acceleration.Standard.Deviation.X"            
      the standard deviation of the x axis of the time domain angular velocity vector measured by the gyroscope for each window sample in radians/second 
[31] "timeBodyAngular.Acceleration.Standard.Deviation.Y"            
      the standard deviation of the y axis of the time domain angular velocity vector measured by the gyroscope for each window sample in radians/second 
[32] "timeBodyAngular.Acceleration.Standard.Deviation.Z"            
      the standard deviation of the z axis of the time domain angular velocity vector measured by the gyroscope for each window sample in radians/second 
[33] "timeBodyAccelerationMagnitude.Mean"    
      the mean of the time domain body acceleration magnitude, measured in gravities (g)                          
[34] "timeBodyAccelerationMagnitude.Standard.Deviation"   
      the standard deviation of the time domain body acceleration magnitude, measured in gravities (g)          
[35] "timeGravityAccelerationMagnitude.Mean"      
      the mean of the time domain acceleration signal magnitude from the smartphone accelerometer in gravities (g)                    
[36] "timeGravityAccelerationMagnitude.Standard.Deviation"   
      the standard deviation of the time domain acceleration signal magnitude from the smartphone accelerometer in gravities (g)        
[37] "timeBodyAccelerationJerkMagnitude.Mean"       
      the mean of the time domain body acceleration jerk magnitude in gravities (g)                  
[38] "timeBodyAccelerationJerkMagnitude.Standard.Deviation"     
      the standard deviation of the time domain body acceleration jerk magnitude in gravities (g)      
[39] "timeBodyAngular.SpeedMagnitude.Mean"      
      the mean of the time domain angular velocity vector magnitude measured by the gyroscope for each window sample in radians/second                      
[40] "timeBodyAngular.SpeedMagnitude.Standard.Deviation"     
      the standard deviation of the time domain angular velocity vector magnitude measured by the gyroscope for each window sample in radians/second        
[41] "timeBodyAngular.AccelerationMagnitude.Mean"     
      the mean of the time domain angular velocity magnitude measured by the gyroscope for each window sample in radians/second               
[42] "timeBodyAngular.AccelerationMagnitude.Standard.Deviation"     
      the standard deviation of the time domain angular velocity magnitude measured by the gyroscope for each window sample in radians/second   
[43] "frequencyBodyAcceleration.Mean.X"   
      the mean of the x axis of frequency domain body acceleration signal obtained by 
      subtracting the gravity from the total acceleration, measured in gravities (g)                            
[44] "frequencyBodyAcceleration.Mean.Y"  
      the mean of the y axis of frequency domain body acceleration signal obtained by 
      subtracting the gravity from the total acceleration, measured in gravities (g)                              
[45] "frequencyBodyAcceleration.Mean.Z"                             
      the mean of the z axis of frequency domain body acceleration signal obtained by 
      subtracting the gravity from the total acceleration, measured in gravities (g)   
[46] "frequencyBodyAcceleration.Standard.Deviation.X"    
      the standard deviation of the x axis of the frequency domain body acceleration signal 
      obtained by subtracting the gravity from the total acceleration, measured in gravities (g)            
[47] "frequencyBodyAcceleration.Standard.Deviation.Y"    
      the standard deviation of the y axis of the frequency domain body acceleration signal 
      obtained by subtracting the gravity from the total acceleration, measured in gravities (g)               
[48] "frequencyBodyAcceleration.Standard.Deviation.Z"               
      the standard deviation of the z axis of the frequency domain body acceleration signal 
      obtained by subtracting the gravity from the total acceleration, measured in gravities (g)    
[49] "frequencyBodyAccelerationJerk.Mean.X"   
      the mean of the x axis of the frequency domain body acceleration jerk, measured in gravities (g)                        
[50] "frequencyBodyAccelerationJerk.Mean.Y" 
      the mean of the y axis of the frequency domain body acceleration jerk, measured in gravities (g)                           
[51] "frequencyBodyAccelerationJerk.Mean.Z"                         
      the mean of the z axis of the frequency domain body acceleration jerk, measured in gravities (g)   
[52] "frequencyBodyAccelerationJerk.Standard.Deviation.X"   
      the standard deviation of the x axis of the frequency domain body acceleration jerk, measured in gravities (g)          
[53] "frequencyBodyAccelerationJerk.Standard.Deviation.Y"     
      the standard deviation of the y axis of the frequency domain body acceleration jerk, measured in gravities (g)             
[54] "frequencyBodyAccelerationJerk.Standard.Deviation.Z"           
      the standard deviation of the z axis of the frequency domain body acceleration jerk, measured in gravities (g)       
[55] "frequencyBodyAngular.Speed.Mean.X"    
      the mean of the x axis of the frequency domain angular velocity vector measured by the gyroscope for each window sample in radians/second                           
[56] "frequencyBodyAngular.Speed.Mean.Y" 
      the mean of the y axis of the frequency domain angular velocity vector measured by the gyroscope for each window sample in radians/second                                
[57] "frequencyBodyAngular.Speed.Mean.Z"                            
      the mean of the z axis of the frequency domain angular velocity vector measured by the gyroscope for each window sample in radians/second     
[58] "frequencyBodyAngular.Speed.Standard.Deviation.X"      
      the standard deviation of the x axis of the frequency domain angular velocity measured by the gyroscope for each window sample in radians/second          
[59] "frequencyBodyAngular.Speed.Standard.Deviation.Y"   
      the standard deviation of the y axis of the frequency domain angular velocity measured by the gyroscope for each window sample in radians/second            
[60] "frequencyBodyAngular.Speed.Standard.Deviation.Z"              
      the standard deviation of the z axis of the frequency domain angular velocity measured by the gyroscope for each window sample in radians/second 
[61] "frequencyBodyAccelerationMagnitude.Mean"    
      the mean of the frequency domain body acceleration magnitude, measured in gravities (g)                        
[62] "frequencyBodyAccelerationMagnitude.Standard.Deviation" 
      the standard deviation of the frequency domain body acceleration magnitude, measured in gravities (g)        
[63] "frequencyBodyAccelerationJerkMagnitude.Mean"       
      the mean of the frequency domain body acceleration jerk magnitude in gravities (g)             
[64] "frequencyBodyAccelerationJerkMagnitude.Standard.Deviation"  
      the standard deviation of the frequency domain body acceleration jerk magnitude in gravities (g)       
[65] "frequencyBodyAngular.SpeedMagnitude.Mean"         
      the mean of the frequency domain angular velocity vector magnitude measured by the gyroscope for each window sample in radians/second             
[66] "frequencyBodyAngular.SpeedMagnitude.Standard.Deviation"  
      the standard deviation of the frequency domain angular velocity vector magnitude measured by the gyroscope for each window sample in radians/second        
[67] "frequencyBodyAngular.AccelerationMagnitude.Mean"   
      the mean of the frequency domain angular velocity magnitude measured by the gyroscope for each window sample in radians/second            
[68] "frequencyBodyAngular.AccelerationMagnitude.Standard.Deviation"
      the standard deviation of the frequency domain angular velocity magnitude measured by the gyroscope for each window sample in radians/second  
