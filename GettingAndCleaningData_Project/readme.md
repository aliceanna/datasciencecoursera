
This folder contains 
the dataset,
codebook.md
run_analysis.R
tidyData.txt



The script run_analysis.R should do the following:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Base:
Human Activity Recognition Using Smartphones Dataset, Version 1.0
created by:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.


Description of process in run_analysis.R:
Read in data frame subjects 
Read in data frame activities
Read in data frame measurement

Read in data frame whichFeatures 
Get the mean and standard deviation features in measurement by subsetting

Merge the 3 data frames to "data""
Read in dataframe activityNames, use labels to replace levels in column 2 of "data"

Get names for variables in "data"

using library(dplyr) , group_by(), summarise_each() and apply mean() to each measurement variable

Store this tidy dataset in txt format.



Output: tidyData.txt

The resulting wide tidy dataset contains columns for subject, activity, and each feature that contains a mean or standard deviation (std) in the variable name basing on the start data frame.. 

Please use: read.table("tidyData.txt", header=TRUE)





