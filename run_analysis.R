## setting environment variables
working_directory <- 'F:/User/CoursEnLigne/GettingAndCleansingData/Project/UCI HAR Dataset'
test_subdirectory <- 'test'
train_subdirectory <- 'train'
activity_labels_file <- 'activity_labels.txt'
features_file <- 'features.txt'
subject_train_file <- 'subject_train.txt'
x_train_file <- 'X_train.txt'
y_train_file <- 'y_train.txt'
subject_test_file <- 'subject_test.txt'
x_test_file <- 'X_test.txt'
y_test_file <- 'y_test.txt'
x_cols_width <- rep(16,561)
subject_cols_width <- c(2)
y_cols_width <- c(1)
project_result_file <- "project_result.txt"

## setting the working directory
setwd(working_directory)

## loading files
## features
features <- read.csv(features_file, header = FALSE, sep = " ")

## train data
## subject
subject_train <- read.fwf(paste(train_subdirectory, subject_train_file, sep = '/'), subject_cols_width)

## x
x_train <- read.fwf(paste(train_subdirectory, x_train_file, sep = '/'), x_cols_width)

## y
y_train <- read.fwf(paste(train_subdirectory, y_train_file, sep = '/'), y_cols_width)

## test data
## subject
subject_test <- read.fwf(paste(test_subdirectory, subject_test_file, sep = '/'), subject_cols_width)

## x
x_test <- read.fwf(paste(test_subdirectory, x_test_file, sep = '/'), x_cols_width)

## y
y_test <- read.fwf(paste(test_subdirectory, y_test_file, sep = '/'), y_cols_width)

## checking that data frames dimension are compatible
stopifnot(nrow(subject_test) == nrow(x_test) && nrow(subject_test == nrow(y_test)))
stopifnot(nrow(subject_train) == nrow(x_train) && nrow(subject_train == nrow(y_train)))
stopifnot(nrow(features) == ncol(x_train) && nrow(features) == ncol(x_test))

## merging data frames
## we choose to merge x, then y, then subject but 
## merging test data and then training data could be a better and safer option...
x_merged <- rbind(x_test,x_train)
y_merged <- rbind(y_test, y_train)
subject_merged <- rbind(subject_test, subject_train)

## merging subject / y / merged in a data frame to get the structure presented in
## the code book
merged_data <- cbind(subject_merged, y_merged, x_merged)

## naming columns
## getting the names of x file columns
col_names <- as.vector(features[,2])
## naming the first (= subject) and second (= activity_code)
col_names <- append('activity_code', col_names)
col_names <- append('subject', col_names)
## renaming
colnames(merged_data) <- col_names 

## loading the table to translate activity code into descriptive activity name
activity_labels <- read.csv(activity_labels_file, header = FALSE, sep = " ")
## renaming activity_labels columns
colnames(activity_labels) <- c('activity_code', 'activity_name')

## joining merged_data and activity_labels by activity code
final_data <- merge(merged_data, activity_labels, by='activity_code')

## defining the set of columns to extract from the data
## subjet, activity, and every std deviation value
select_cols <- append(c("subject","activity_code", "activity_name"), col_names[grep("std", col_names)])

## and every mean value
select_cols <- append(select_cols, col_names[grep("mean", col_names)])

## selecting data
selected_data <- final_data[,select_cols]

## computing average values from selected_data
## there are 82 columns
## each column must be averaged except col 1 (subject) col 2 (activity_code)
## and col 3 (activity_name)
project_result <- aggregate(selected_data[,c(4:82)], list(subject = selected_data$subject, activity_name = selected_data$activity_name), FUN=mean)
write.table(project_result, file= project_result_file)


## END OF WORK 
## GOOD NIGHT


