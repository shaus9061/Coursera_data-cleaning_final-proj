library(dplyr)

filename = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(filename, "tempfile.zip")
paths <- unzip("tempfile.zip")
labels <- read.table(paths[2])
names(labels) <- c("num", "variable")
variables <- labels$variable
variables <- gsub("\\()","",as.character(variables))
variables <- gsub("\\,"," ",as.character(variables))

test <- data.frame(read.table(paths[15]))
names(test) <- variables 
test$subject <- readLines(paths[14])
test$activity <- readLines(paths[16])

train <- data.frame(read.table(paths[27]))
names(train) <- variables
train$subject <- readLines(paths[26])
train$activity <- readLines(paths[28])

all <-rbind(test, train)
activity <- all$activity
subject <- all$subject

activity <- gsub("1", "Walking", activity)
activity <- gsub("2", "Walking_Upstairs", activity)
activity <- gsub("3", "Walking_Downstairs", activity)
activity <- gsub("4", "Sitting", activity)
activity <- gsub("5", "Standing", activity)
activity <- gsub("6", "Laying", activity)


allmsd <- cbind(all[, grep("mean", names(all))], all[, grep("std", names(all))])
allmsd <-cbind(subject, allmsd)
allmsd <- cbind(activity, allmsd)

meantable <- allmsd %>% group_by(subject, activity) %>% summarise_all(mean)
write.table(meantable, file = "Tidy_Data.txt", row.names = FALSE)