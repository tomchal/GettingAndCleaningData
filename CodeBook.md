# CodeBook 
##### for Getting and Cleaning Data Course Project result files
----------------

### tidy.csv
------------
Is a tidy dataset of dimensions: 10299x69
First 3 colums are "Dimensions" factors

|ColumnId| ColumnName | Description |
|---| ------ | ------ |
|1| subjectId |  Subject identifier (1-30) |
|2| activityId | Activity identifier (1-6) |
|3| activityName | Activity name |

Following columns are 66 variables named according to following convension 

|prefix|Feature (normalized [-1,1])|Function|Axis|
|---| ------ | ------ | --- |
|t - time|BodyAcc|Mean - mean|X - X axis|
|f - frequency|tBodyAccJerk|Std - Standard Deviation|Y - Y axis|
||fBodyAccJerkMag||Z- Z axis|
||tBodyAccMag||null - not applicable|
||tBodyAccJerkMag
||tBodyGyro
||tBodyGyroJerk
||fBodyGyroJerkMag
||tBodyGyroMag
||tBodyGyroJerkMag
||tGravityAcc
||tGravityAccMag

Examples: 
* tBodyAccMeanX    --------->    (t|BodyAcc|Mean|X)
* fBodyAccMagMean    ----->  (f|BodyAccMag|Mean|null)

Note: for more information please refer to **_README.txt_** and **_features_info.txt_** in original dataset.
### tidyAggregated.csv
------------
Has exactly same structure as **_tidy_**.csv but contains mean for each variable grouped by:
* subjectId
* activityId
* activityName

hence is't size is 180x69