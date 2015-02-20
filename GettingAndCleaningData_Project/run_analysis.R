## run_analysis.R

## download
if(!file.exists("project")){dir.create("./project")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="dataset.zip")

## unzip
unzip(zipfile="dataset.zip", exdir = "project", unzip = "internal",
      setTimes = FALSE)
list.files("dataset/")

downloadDate <- date()
downloadDate

################################################################

## 1. merging the test and training datasets

## reading in the txt-files
## creating dataset: subjects
subjectTest <- read.table("test/subject_test.txt")
subjectTraining <- read.table("train/subject_train.txt")

subjects <- rbind(subjectTest, subjectTraining)


## ## creating dataset: activities
activityTest <- read.table("test/y_test.txt")
activityTraining <- read.table("train/y_train.txt")

activities <- rbind(activityTest,activityTraining)


## creating dataset: measurements
featuresTest <- read.table("test/X_test.txt")
featuresTraining <- read.table("train/X_train.txt")

measurements <- rbind(featuresTest, featuresTraining)


#########################################################


##  2. extract the mean and std-measurements
##  read in features.txt, use variables with mean or std in the name
## creating dataset: whichFeatures
whichFeatures <- read.table("features.txt")
meanStdOnly <- grep("(mean|std)", whichFeatures[, 2])

## subset columns (with mean or std in the name) in measurements
measurements <- measurements[, meanStdOnly]




## bind the 3 dataset to a single one
data <- cbind(subjects,activities,measurements)




####################################################################



## 3. descriptive names for activities
## creating dataset: activityNames

activityNames <- read.table("activity_labels.txt")

## changing the values of factors to names, updating "data"
data[ ,2] <- factor(data[ ,2], 
                    levels = activityNames[ ,1],
                    labels = activityNames[ ,2])

## http://www.statmethods.net/input/valuelabels.html

                    
                    
######################################################################



## 4. descriptive names for data set
names(data)[1:2] <- c("subject", "activity")

featureNames <- whichFeatures[meanStdOnly, 2]
featureNames <- gsub("^t", "time", featureNames)
featureNames <- gsub("^f", "frequency", featureNames)
featureNames <- gsub("BodyBody", "Body", featureNames)
featureNames <- gsub("-", "", featureNames)
featureNames <- gsub("\\(", "", featureNames)
featureNames <- gsub("\\)", "", featureNames)
names(data)[3:81] <- featureNames

####################################################################

## 5.creating a dataset with the average of each variable 
## for each activity and each subject. 

library(dplyr)
data2 <- tbl_df(data)
rm(data)

## calculating mean for each variable for each activity and each subject
data3 <- data2 %>% group_by(subject, activity) %>% summarise_each(funs(mean))


## stored as tidyData.txt
write.table(data3, file="tidyData.txt", row.name=FALSE)




##reading back
## path to file !
wide <- read.table("tidyData.txt", header=TRUE)


