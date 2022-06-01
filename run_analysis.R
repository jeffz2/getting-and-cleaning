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
  data <- cbind(features,activity, subject)
  
  labelIndices <- grep("mean|std", featureNames[[2]])
  data <- data[labelIndices]
}