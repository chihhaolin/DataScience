# 1. Merges the training and the test sets to create one data set.
df1 <- read.table("train/X_train.txt")
df2 <- read.table("test/X_test.txt")
X = rbind(df1, df2)

df1 <- read.table("train/subject_train.txt")
df2 <- read.table("test/subject_test.txt")
S = rbind(df1, df2)

df1 <- read.table("train/y_train.txt")
df2 <- read.table("test/y_test.txt")
Y = rbind(df1, df2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
index <- grep("mean\\(|std\\(", features[, 2]) 
X <- X[, index]
colnames(X) <- features[index, 2]
colnames(X) <- gsub("\\(|\\)", "", colnames(X))
colnames(X) <- gsub("\\-", "_", colnames(X))
#colnames(X) <- tolower(colnames(X))

# 3. Uses descriptive activity names to name the activities in the data set.
activities <- read.table("activity_labels.txt")
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"


# 4. Appropriately labels the data set with descriptive activity names.
names(S) <- "subject"
cleaned <- cbind(S, Y, X)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
cleaned %>%
  group_by(subject,activity)  %>%
  summarise_each(funs(mean)) -> results

write.table(results, "data_set_with_the_averages.txt", row.names=FALSE)
#write.table(results, "data_set_with_the_averages.csv", sep = ",",row.names=FALSE)
