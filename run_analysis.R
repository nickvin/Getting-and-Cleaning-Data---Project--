library(dplyr)

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
test <- cbind(subject_test,Y_test,X_test)
names(test) <- c("Subject","Activity", as.character(features[,2]))

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
train <- cbind(subject_train,Y_train,X_train)
names(train) <- c("Subject","Activity", as.character(features[,2]))

test_train <- rbind(test,train)

valid_column_names <- make.names(names=names(test_train),unique=TRUE, allow_ = TRUE)
names(test_train) <- valid_column_names

test_train2 <- select(test_train,1,2,contains(".mean."),contains(".std."))

activities <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("Number","Activity"))
test_train2$Activity <- activities$Activity[match(test_train2$Activity, activities$Number)]


final <- setNames(aggregate(test_train2[,3:68],by=list(test_train2$Subject,test_train2$Activity),FUN=mean),names(test_train2))

