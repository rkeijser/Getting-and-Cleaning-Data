install.packages("dplyr")
library("dplyr")

# WORKING DIRECTORY IS THE MAIN FOLDER OF THE UCI HAR Dataset

# IMPORT VARIABLES OF EACH FEATURE VECTOR
features <- read.table(file="features.txt", header=FALSE, dec=".")

# IMPORT ACTIVITY LABELS
activity_labels <- read.table(file="activity_labels.txt", header=FALSE, dec=".")
        
# IMPORT TRAINING DATA SET
subject_id_train <- read.table(file="train/subject_train.txt", header=FALSE, dec=".")
X_train <- read.table(file="train/X_train.txt", header=FALSE, dec=".")
y_train <- read.table(file="train/y_train.txt", header=FALSE, dec=".")

# ADD SUBJECT AND TRAINING LABEL TO DATASET X_train
colnames(X_train) <- as.factor(features[,2])
X_train$subject <- as.numeric(subject_id_train[,1])
X_train$training.label <- as.numeric(y_train[,1])

# IMPORT TEST DATA SET
subject_id_test <- read.table(file="test/subject_test.txt", header=FALSE, dec=".")
X_test <- read.table(file="test/X_test.txt", header=FALSE, dec=".")
y_test <- read.table(file="test/y_test.txt", header=FALSE, dec=".")
# ADD SUBJECT AND TRAINING LABEL TO DATASET X_train
colnames(X_test) <- as.factor(features[,2])
X_test$subject <- as.numeric(subject_id_test[,1])
X_test <- as.numeric(y_test[,1])


# MERGE TRAINING AND TEST DATA SETS
DATASET <- rbind(X_train, X_test)

# SUBSET MERGED DATASET ON MEAN AND STD OF EACH MEASUREMENT
meanStdColumns <- grep("mean|std", features$V2, value = FALSE)
meanStdColumnsNames <- grep("mean|std", features$V2, value = TRUE)
DATASET.SUBSET <- DATASET[,c(meanStdColumns)]
DATASET.SUBSET$subject <- DATASET$subject
DATASET.SUBSET$training.label <- DATASET$training.label
TIDY.DATASET <- DATASET.SUBSET


# DESCRIPTIVE VARIABEL NAMES AND CREATE FINAL TIDY DATASET
names(TIDY.DATASET) <- tolower(names(TIDY.DATASET))
names(TIDY.DATASET) <- gsub("\\)","", names(TIDY.DATASET),)
names(TIDY.DATASET) <- gsub("\\(","", names(TIDY.DATASET),)
names(TIDY.DATASET) <- gsub("-",".", names(TIDY.DATASET),)
names(TIDY.DATASET) <- gsub("_",".", names(TIDY.DATASET),)
TIDY.DATASET$training.label <- sub("1", activity_labels[1,2], TIDY.DATASET$training.label)
TIDY.DATASET$training.label <- sub("2", activity_labels[2,2], TIDY.DATASET$training.label)
TIDY.DATASET$training.label <- sub("3", activity_labels[3,2], TIDY.DATASET$training.label)
TIDY.DATASET$training.label <- sub("4", activity_labels[4,2], TIDY.DATASET$training.label)
TIDY.DATASET$training.label <- sub("5", activity_labels[5,2], TIDY.DATASET$training.label)
TIDY.DATASET$training.label <- sub("6", activity_labels[6,2], TIDY.DATASET$training.label)
write.table(TIDY.DATASET, file = "TIDY.DATASET.txt", row.name=FALSE, sep="\t")

# SECOND INDEPENDANT DATESET WITH AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
TIDY.DATASET2 <- TIDY.DATASET %>% group_by(subject, training.label) %>%  summarise_each(funs(mean))
write.table(TIDY.DATASET2, file = "TIDY.DATASET2.txt", row.name=FALSE, sep="\t")