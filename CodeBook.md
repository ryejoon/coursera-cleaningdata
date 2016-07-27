Below are the variables used for the run_analysis.R script.

subject_test : test subjects from "./test/subject_test.txt"

subject_train : train subjects from "./train/subject_train.txt")

subject_merged : merged subjects from both test and train data


y_test : test activities from "./test/y_test.txt")

y_train : train activities from "./train/y_train.txt")

y_merged : merged activities from both test and train data

 
X_test : sensor values for test data from "./test/X_test.txt"

X_train : sensor values for train data from "./train/X_train.txt"

X_merged : merged sensor values from both test and train data


subjectActivity : binded from merged subject data and activities data


features : feature labels from "./features.txt"

meanStdCols : column indexes for features containing the string 'mean' and 'std'

meanStdData : only mean and standard deviation data from the entire sensor values


meanStdWithMeta : mean and standard deviation data along with subject and activity data

grouped : 'meanStdWithMeta' data grouped by subject and variable

result : mean value for sensor values for each subjects's activity's variable
