
Project: Creating a tidy dataset 
from the "Human Activity Recognition Using Smartphones Dataset"
Authors:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The UCI HAR Dataset dataset containes data which were obtained by the accelerometers and gyroscopes embedded in Smartphones. 
Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration as well as the triaxial angular velocity from the gyroscop were measured. For analytical reasons the measured values were dispersed into 561 variables (features).

The experiments were carried out by 30 persons, each test person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
The test persons (subjects) were randomly divided into two groups: 70% into "training data", 30% into "test data".


The UCI HAR Dataset containes txt-files.
The relevant files, which were used, are:  
- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all variable names.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels. Each row identifies the activity, whose features were recorded.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels. Each row identifies the activity, whose feature were recorded.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity. Its range is from 1 to 30, regarding 21 persons (70%)

- 'test/subject_test.txt': Each row identifies the subject who performed the activity. Its range is from 1 to 30, regarding 9 persons (30%)










The UCI HAR Dataset (zip format) was downloaded (2015-02-10) and represented as a file list.


With read.table() the txt files were transformed into data frames, the corresponding test and training data frames were combined by rows.

subject_test.txt and subject_train.txt 
were combined to the object subjects.
This data frame contains 1 variable and 10299 rows.

y_test.txt and y_train.txt 
were combined to the object activities.

X_test.txt and X_train.txt
were combined to the object measuremment.
The data frame contains 561 variables and 10299 rows

Each row of each data frame corresponds to the other.

Before combining the three datasets the columns of the mean and standard deviation were extracted, to omit variables which are not necessary for the further process.
In the first step the file features.txt was read in as a data frame. Column 2 contains the feature name, with grep() was searched for a pattern with mean or std in the name. The resulting integer vector was used to subset "measurements".

The datasets subjects, activity, measurement were combined (data frame "data").

Descriptive names for activities were replaced with a factor with 6 levels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The column/variable names of "data" were adapted to the rules in R and made easier to understand.
- (minus) and () in the names were removed, 
t (as abbreviation for time) and f (as abbreviation for frequency) were replaced 
with the full word, the part with "BodyBody" which obviously was a mistake, was written shorter.



The processed data frame contains for each of the 30 subjects and for the activities (as factors) Walking, Walking upstairs, Walking downstairs, Sitting, Standing, Lying the mean of the measured data of each variable.


The data are stored in a txt file format as a wide tidy dataset.







http://www.statmethods.net/input/valuelabels.html






