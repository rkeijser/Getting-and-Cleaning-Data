# CodeBook
## Getting and Cleaning Data - Course Project - Remco Keijser

The script run_analysis.R performs the 5 steps described in the course project's definition.  

1. ##### IMPORT TRAINING AND TEST SETS AND CREATE ONE DATA SET.  

  * Set workingdirectory to folder UCI HAR Dataset.
  * Imported files:

    features.txt  
    activity_labels.txt  
    subject_train.txt  
    x_train.txt  
    y_train.txt  
    subject_test.txt  
    x_test.txt  
    y_test.txt  

  Assign column names (features) and merge to create one data set (DATASET)

2. ##### EXTRACT ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT.
   Create TIDY.DATASET by subsetting using logcal vectors.

3. ##### USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET
   Merge data subset with the activityType table.

4. ##### APPROPRIATELY LABEL THE DATA SET WITH DESCRIPTIVE ACTIVITY NAMES.
   Use gsub and sub function for pattern replacement to clean up the data labels.

5. ##### CREATE A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT.
  Produce only a data set with the average of each veriable for each activity and subject (TIDY.DATASET2.txt).

###### Identifiers:

subject  -  The ID of the test subject  
activity -  The type of activity performed when the corresponding measurements were taken

###### Variables:
* tbodyacc.mean.x
* tbodyacc.mean.y
* tbodyacc.mean.z
* tbodyacc.std.x
* tbodyacc.std.y
* tbodyacc.std.z
* tgravityacc.mean.x
* tgravityacc.mean.y
* tgravityacc.mean.z
* tgravityacc.std.x
* tgravityacc.std.y
* tgravityacc.std.z
* tbodyaccjerk.mean.x
* tbodyaccjerk.mean.y
* tbodyaccjerk.mean.z
* tbodyaccjerk.std.x
* tbodyaccjerk.std.y
* tbodyaccjerk.std.z
* tbodygyro.mean.x
* tbodygyro.mean.y
* tbodygyro.mean.z
* tbodygyro.std.x
* tbodygyro.std.y
* tbodygyro.std.z
* tbodygyrojerk.mean.x
* tbodygyrojerk.mean.y
* tbodygyrojerk.mean.z
* tbodygyrojerk.std.x
* tbodygyrojerk.std.y
* tbodygyrojerk.std.z
* tbodyaccmag.mean
* tbodyaccmag.std
* tgravityaccmag.mean
* tgravityaccmag.std
* tbodyaccjerkmag.mean
* tbodyaccjerkmag.std
* tbodygyromag.mean
* tbodygyromag.std
* tbodygyrojerkmag.mean
* tbodygyrojerkmag.std
* fbodyacc.mean.x
* fbodyacc.mean.y
* fbodyacc.mean.z
* fbodyacc.std.x
* fbodyacc.std.y
* fbodyacc.std.z
* fbodyacc.meanfreq.x
* fbodyacc.meanfreq.y
* fbodyacc.meanfreq.z
* fbodyaccjerk.mean.x
* fbodyaccjerk.mean.y
* fbodyaccjerk.mean.z
* fbodyaccjerk.std.x
* fbodyaccjerk.std.y
* fbodyaccjerk.std.z
* fbodyaccjerk.meanfreq.x
* fbodyaccjerk.meanfreq.y
* fbodyaccjerk.meanfreq.z
* fbodygyro.mean.x
* fbodygyro.mean.y
* fbodygyro.mean.z
* fbodygyro.std.x
* fbodygyro.std.y
* fbodygyro.std.z
* fbodygyro.meanfreq.x
* fbodygyro.meanfreq.y
* fbodygyro.meanfreq.z
* fbodyaccmag.mean
* fbodyaccmag.std
* fbodyaccmag.meanfreq
* fbodybodyaccjerkmag.mean
* fbodybodyaccjerkmag.std
* fbodybodyaccjerkmag.meanfreq
* fbodybodygyromag.mean
* fbodybodygyromag.std
* fbodybodygyromag.meanfreq
* fbodybodygyrojerkmag.mean
* fbodybodygyrojerkmag.std
* fbodybodygyrojerkmag.meanfreq
* subject
* training.label

###### Activity Labels:

WALKING: subject was walking during the test  
WALKING_UPSTAIRS: subject was walking up a staircase during the test  
WALKING_DOWNSTAIRS: subject was walking down a staircase during the test  
SITTING: subject was sitting during the test  
STANDING: subject was standing during the test  
LAYING: subject was laying down during the test  
