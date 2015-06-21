#The Tidy Data Set
The tidy data set is a subset of the data found in: Human Activity Recognition Using Smartphones Dataset
Version 1.0

The original "messy" data can be retrieved from this URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Download
The version of the original data used to create this tidy data set was zipped on January 15, 2014 and downloaded on June 11, 2015 at 12:10 PM CDT. The actual original data files were created between October 10, 2012 and December 10, 2012.

##Summary Description: The Messy Data
The messy data contains observations of 30 subjects wearing a Samsung Galaxy smartphone recording 561 time and frequency measurements for six types of movement: walking, walking upstairs, walking downstairs, sitting, standing, and lying down.

#Variables: Overview
The tidy data set consists of 180 observations of 68 variables.
The Subject and Activity variables are primary and secondary keys.
The 66 time and frequency variables hold the calculated means of measurements taken in the original study.

##Subject Variable
The subjects of the test are identified by a ID number ranging from 1-30.
Although the subjects were initially divided into two arbitrary, non-overlapping groups for observation, the data collected for each group was combined again to form this dataset. 

##Activity Variable
Six activities were observed. 
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

##Selected Time and Frequency Measurements
The underlying data contained 561 time and frequency readings that were monitored for each activity for each subject.

#Selection
From this set, 66 variables focusing on mean or standard deviation of time and frequency measurements were selected. 
The selection excluded some variables with "mean" in their names: Freqmean and angle. The first, because we are interested only in means of actual movement; Freqmean is already a calculated field representing the "weighted average of frequency components". The second, because the angle is a calculated field measuring the angle between two vectors.

Thus, this is the list of the 66 Features variables of interest.
featureLabelsSelected
 [1] "tBodyAcc.mean...X"           "tBodyAcc.mean...Y"           "tBodyAcc.mean...Z"           "tGravityAcc.mean...X"       
 [5] "tGravityAcc.mean...Y"        "tGravityAcc.mean...Z"        "tBodyAccJerk.mean...X"       "tBodyAccJerk.mean...Y"      
 [9] "tBodyAccJerk.mean...Z"       "tBodyGyro.mean...X"          "tBodyGyro.mean...Y"          "tBodyGyro.mean...Z"         
[13] "tBodyGyroJerk.mean...X"      "tBodyGyroJerk.mean...Y"      "tBodyGyroJerk.mean...Z"      "tBodyAccMag.mean.."         
[17] "tGravityAccMag.mean.."       "tBodyAccJerkMag.mean.."      "tBodyGyroMag.mean.."         "tBodyGyroJerkMag.mean.."    
[21] "fBodyAcc.mean...X"           "fBodyAcc.mean...Y"           "fBodyAcc.mean...Z"           "fBodyAccJerk.mean...X"      
[25] "fBodyAccJerk.mean...Y"       "fBodyAccJerk.mean...Z"       "fBodyGyro.mean...X"          "fBodyGyro.mean...Y"         
[29] "fBodyGyro.mean...Z"          "fBodyAccMag.mean.."          "fBodyBodyAccJerkMag.mean.."  "fBodyBodyGyroMag.mean.."    
[33] "fBodyBodyGyroJerkMag.mean.." "tBodyAcc.std...X"            "tBodyAcc.std...Y"            "tBodyAcc.std...Z"           
[37] "tGravityAcc.std...X"         "tGravityAcc.std...Y"         "tGravityAcc.std...Z"         "tBodyAccJerk.std...X"       
[41] "tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"        "tBodyGyro.std...X"           "tBodyGyro.std...Y"          
[45] "tBodyGyro.std...Z"           "tBodyGyroJerk.std...X"       "tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"      
[49] "tBodyAccMag.std.."           "tGravityAccMag.std.."        "tBodyAccJerkMag.std.."       "tBodyGyroMag.std.."         
[53] "tBodyGyroJerkMag.std.."      "fBodyAcc.std...X"            "fBodyAcc.std...Y"            "fBodyAcc.std...Z"           
[57] "fBodyAccJerk.std...X"        "fBodyAccJerk.std...Y"        "fBodyAccJerk.std...Z"        "fBodyGyro.std...X"          
[61] "fBodyGyro.std...Y"           "fBodyGyro.std...Z"           "fBodyAccMag.std.."           "fBodyBodyAccJerkMag.std.."  
[65] "fBodyBodyGyroMag.std.."      "fBodyBodyGyroJerkMag.std.." 


#Transformations
##Variable Names: Subject Column
1. The generated column name was replaced with an English label.
For example: "V1" was replaced by "Subject".

##Variable Names: Activity Column
1. The generated column name was replaced with an English label.
For example: "V1" was replaced by "Activity".

##Variable Names (66 Observed Features)
1. The generated column names were replaced with their English counterparts found in the file features.txt.
For example: "V1" was replaced by "tBodyAcc-mean()-X"
2. The English column names were then transformed into syntactically valid names with the function make.names().
For example: "tBodyAcc-mean()-X" was replaced by "tBodyAcc-mean...X".
3. To indicate that the value represented a calculated mean, rather than raw observations, the prefix "Mean: " was pasted to the front of the name.
For example: "tBodyAcc-mean...X" was replace by "Mean..tBodyAcc-mean...X".

##Values
The numeric code for the Activity was replaced with its corresponding English label. 
The activity_labels.txt file provided with the original data was used to perform a table lookup to do the replacement.
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

#Calculations
For each of the six activities for each of the 30 subjects, multiple measurements were recorded in the original data.
For the purposes of this tidy data set, we were interested in the mean values of those measurements.


1. For each of the 66 time or frequency columns, the mean for each activity by each subject was calculated and replaces the raw observations.
2. Redundant data was removed from the resulting calculation of the mean with the function unique().
