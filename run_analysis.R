### Attach needed packages (dplyr)
library(dplyr)

### Download and unpack original dataset
fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "data.zip")
unzip("data.zip")

### Merge the training and the test sets to create one data set.
traindata<- read.csv("./UCI HAR Dataset/train/X_train.txt",sep = "",header = FALSE)
testdata<- read.csv("./UCI HAR Dataset/test/X_test.txt",sep = "",header = FALSE)
alldata<- rbind(traindata,testdata)

### Label the data set with original variable names taken from "features.txt" file
features<- read.csv("./UCI HAR Dataset/features.txt",sep = "",header = FALSE)
names(alldata)<-features$V2

### Extract only the measurements on the mean and standard deviation for each measurement.
alldata<-alldata[, grep("mean\\(|std\\(",features[,2])]

### Modify variable names according to camelCase convension
names1<-gsub("-*mean\\(\\)-*","Mean",names(alldata))
names(alldata)<-gsub("-*std\\(\\)-*","Std",names1)


### Use descriptive activity names to name the activities in the data set
traindata_y<- read.csv("./UCI HAR Dataset/train/y_train.txt",sep = "",header = FALSE)
testdata_y<- read.csv("./UCI HAR Dataset/test/y_test.txt",sep = "",header = FALSE)

alldata_y<- rbind(traindata_y,testdata_y)
names(alldata_y) <- c("activityId")

labels<-read.csv("./UCI HAR Dataset/activity_labels.txt",sep = "",header = FALSE)
names(labels)<-c("activityId","activityName")

alldata_y<-left_join(alldata_y, labels)

alldata<-cbind(alldata_y,alldata)

### Add subject to dataset
subject_train<- read.csv("./UCI HAR Dataset/train/subject_train.txt",sep = "",header = FALSE)
subject_test<- read.csv("./UCI HAR Dataset/test/subject_test.txt",sep = "",header = FALSE)

allsubject<- rbind(subject_train,subject_test)
names(allsubject) <- c("subjectId")
alldata<-cbind(allsubject,alldata)

### convert subjectId,activityId,activityName to factors
alldata$subjectId<-as.factor(alldata$subjectId)
alldata$activityId<-as.factor(alldata$activityId)
alldata$activityName<-as.factor(alldata$activityName)

###  Save clear dataset to tidy.csv file  
write.table(alldata, file = "tidy.csv",row.names = FALSE)

###  Create data set with the average of each variable for each activity and each subject.
alldata1<- alldata %>% group_by(subjectId,activityId,activityName) %>% summarise_all(funs(mean))

###  Save aggregated data to tidyAggregated.csv file 
write.table(alldata1, file = "tidyAggregated.csv",row.names = FALSE) 
