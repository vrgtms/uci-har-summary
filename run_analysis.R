# Download and unzip the UCI HAR dataset if folder is not present
if (!("UCI HAR Dataset" %in% dir())) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip")
  unzip("UCI HAR Dataset.zip")
  file.remove("UCI HAR Dataset.zip")
}

# Install dplyr if not installed
if (!("dplyr" %in% installed.packages())) {
  install.packages("dplyr")
}

# Read the data into dataframes
train           <- read.table(file.path("UCI HAR Dataset", "train", "X_train.txt"))
train.labels    <- read.table(file.path("UCI HAR Dataset", "train", "y_train.txt"))
train.subjects  <- read.table(file.path("UCI HAR Dataset", "train", "subject_train.txt"))

test            <- read.table(file.path("UCI HAR Dataset", "test", "X_test.txt"))
test.labels     <- read.table(file.path("UCI HAR Dataset", "test", "y_test.txt"))
test.subjects   <- read.table(file.path("UCI HAR Dataset", "test", "subject_test.txt"))

features        <- read.table(file.path("UCI HAR Dataset", "features.txt"))
activity.labels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"))

# (4) Set column names for dataframes
colnames(train) <- features[,2]
colnames(test)  <- features[,2]

# (1) Merge the training and test datasets
train$activity  <- train.labels[[1]]
train$subject   <- train.subjects[[1]]

test$activity   <- test.labels[[1]]
test$subject    <- test.subjects[[1]]

merged <- rbind(train, test)

# (2) Keep only the means and standard deviations
meanAndStdCols  <- grep( "std|mean", colnames(merged), value=TRUE )
colsToKeep      <- c(meanAndStdCols, "activity", "subject")
merged          <- merged[colsToKeep]

# (3) Change activity ids to descriptive labels
merged$activity <- activity.labels[[2]][merged$activity]

# (5) Create new, summary dataset with averages for each variable for each activity and subject
library("dplyr")
summary <- merged %>%
        group_by(subject, activity) %>%
        summarize_all(funs(mean))

# Save the summary dataset to "uci_har_summary.txt"
write.table(summary, file="uci_har_summary.txt", row.name = FALSE)