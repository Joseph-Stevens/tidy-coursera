# Tidy Data
Purpose: To make a dataset that conforms to the principles of tidy data.

# Course Project Files
* run_analysis.R: The R script used to create TidyData.txt (the dataset).
* CodeBook.md: A description of the files and their variables.
* README.md: What you are reading.

# Process
1. The source data files can be found here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. The following files are needed in your working directory for run_analysis.R to function:
* activity_labels.txt
* features.txt
* subjects_train.txt
* X_test.txt
* y_test.txt
* subjects_train.txt
* X_train.txt
* y_train.txt
3. Check if the dplyr package is installed. If it isn't, it needs to be.
4. Copy the run_analysis.R file into the working directory. 
5. Source the run_analysis.R file.
6. In the console, start the script with the command: run_analysis()
7. The output of the script will be a text file in the working directory named: TidyData.txt
8. To check that the TidyData.txt file conforms to the principles of tidy data, use read.table("TidyData.txt", header=TRUE)

#Result
The multiple text files have been converted into one dataset with headers and with activity descriptions rather than numeric codes.

The test and train datasets have been combined.

The variables have been simplified to just ones containing "mean" and "std". The observations have been simplified to just the mean of a set of numbers with the header changed to reflect that.
