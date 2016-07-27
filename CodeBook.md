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
meanStdCols <- filter(features, grepl(".*(mean|std).*", V2)) %>% select(V1)
meanStdData <- select(X_merged, meanStdCols$V1)
colnames(meanStdData) <- features[gsub("V", "", colnames(meanStdData)), ]$V2

meanStdWithMeta <- bind_cols(subjectActivity, meanStdData)
gathered <- gather(meanStdWithMeta, variable, val, -c(subject, activity))
grouped <- group_by(gathered, subject, activity, variable)
result <- summarize(grouped, mean(val))
