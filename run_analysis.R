setwd("D:/Programs/R/UCI HAR Dataset")
library(reshape2)

# Merge the training and the test sets to create one data set

# read and bind the training data set 
features   <- read.table("./train/x_train.txt")
activities <- read.table("./train/y_train.txt")
subjects   <- read.table("./train/subject_train.txt")
train <- cbind(features, activities, subjects)
# it is useful to set features‘ columns to the first place

# read and bind the test data set 
features   <- read.table("./test/x_test.txt")
activities <- read.table("./test/y_test.txt")
subjects   <- read.table("./test/subject_test.txt")
test <- cbind(features, activities, subjects)

d <- rbind(train, test)

# Appropriately labels the data set with descriptive variable names 
features <- read.table("features.txt")
features_names <- as.character(features$V2)
names(d) <- c(features_names, "activity", "subject")

# Extract only the measurements on the mean and standard deviation 
# for each measurement
indexes  <- grep("mean|std", features$V2, ignore.case = TRUE)
d <- d[, c(563,562,indexes)]

# Use descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt")
d$activity <- as.factor(d$activity)
levels(d$activity) <- as.character(activity_labels$V2)

# Create an independent tidy data set (td) with the average of each
# variable for each activity and each subject
md <- melt(d, id.vars = c( "subject","activity"), measure.vars = 3:ncol(d))
td <- dcast(md, subject + activity ~ variable, mean)
write.table(td, file = "tidy.txt", row.name=FALSE)
