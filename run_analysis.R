run_analysis <- function () {
  activityLabels <- read.table("activity_labels.txt", header = FALSE)  
  featureNames <- read.table("features.txt")

  testFeatures <- read.table("./test/X_test.txt")
  testActivity <- read.table("./test/y_test.txt")
  testSubject <- read.table("./test/subject_test.txt")
  
  trainFeatures <- read.table("./train/X_train.txt")
  trainActivity <- read.table("./train/y_train.txt")
  trainSubject <- read.table("./train/subject_train.txt")
  
  features <- rbind(testFeatures, trainFeatures)
  activity <- rbind(testActivity, trainActivity)
  subject <- rbind(testSubject, trainSubject)
  colnames(features) <- featureNames[[2]]
  colnames(activity) <- "Activity"
  colnames(subject) <- "Subject"
  for (i in 1:6) {
    activity[activity == i] <- activityLabels[i, 2]
  }
  colnames(features) <- sub("Acc", "Accelerometer", colnames(features))
  colnames(features) <- sub("^t", "Time", colnames(features))
  colnames(features) <- sub("^f", "Frequency", colnames(features))
  colnames(features) <- sub("Gyro", "Gyroscope", colnames(features))
  colnames(features) <- sub("Mag", "Magnitude", colnames(features))
  colnames(features) <- sub("BodyBody", "Body", colnames(features))

  d <- cbind(features,activity, subject)

  labelIndices <- grep("mean|std|Activity|Subject", colnames(d))
  d <- d[labelIndices]
  
  tidy <- aggregate(. ~Subject + Activity, d, mean)
}
  
  

