library(dplyr)
library(tidyr)
subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")
subject_merged <- bind_rows(subject_test, subject_train)

y_test <- read.table("./test/y_test.txt")
y_train <- read.table("./train/y_train.txt")
y_merged <- bind_rows(y_test, y_train)

X_test <- read.table("./test/X_test.txt")
X_train <- read.table("./train/X_train.txt")
X_merged <- bind_rows(X_test, X_train)

subjectActivity <- bind_cols(subject_merged, y_merged)
colnames(subjectActivity) <- c("subject", "activity")
activityLabels <- read.table("./activity_labels.txt")
subjectActivity <- mutate(subjectActivity, activity = activityLabels[activity,]$V2)

features <- read.table("./features.txt")
meanStdCols <- filter(features, grepl(".*(mean|std).*", V2)) %>% select(V1)
meanStdData <- select(X_merged, meanStdCols$V1)
colnames(meanStdData) <- features[gsub("V", "", colnames(meanStdData)), ]$V2

meanStdWithMeta <- bind_cols(subjectActivity, meanStdData)
gathered <- gather(meanStdWithMeta, variable, val, -c(subject, activity))
grouped <- group_by(gathered, subject, activity, variable)
result <- summarize(grouped, mean(val))

write.table(result, row.name=FALSE, file = "./tidyresult.txt")