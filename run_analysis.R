# Merge the training and the test sets to create one data set.
# Extract only the measurements on the mean and standard deviation for each measurement. 
# Use descriptive activity names to name the activities in the data set
# Appropriately label the data set with descriptive variable names. 

# From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# a txt file created with write.table() using row.name=FALSE

# Run as a function

run_analysis<-function(){
  
# Install dplyr

library("dplyr")

# Read data into R

Activity_Labels<-read.table("activity_labels.txt")
Features_Labels<-read.table("features.txt")

Subject<-read.table("subject_test.txt")
Activity<-read.table("y_test.txt")
myData<-read.table("X_test.txt")

Subject2<-read.table("subject_train.txt")
Activity2<-read.table("y_train.txt")
myData2<-read.table("X_train.txt")

# Merge Subject, Activity, Test

New<-cbind(Subject,Activity,myData)

# Merge Subject, Activity, Train

New2<-cbind(Subject2,Activity2,myData2)

# Merge Test and Train

LargeData<-rbind(New,New2)

# Label Features

colnames(LargeData)[1]<-"Subject"
colnames(LargeData)[2]<-"Activity"
fLabel<-make.names(as.character(Features_Labels[,2]),unique=TRUE)
FeatureLength<-length(fLabel)
for (i in 1:FeatureLength){colnames(LargeData)[i+2]<-fLabel[i]}

# Select Mean, Std

First<-select(LargeData,1:2,contains("mean"),contains("std"))
Second<-select(First,-contains("angle"),-contains("meanFreq"))
NewFeatureLength<-length(colnames(Second))
NewfLabel<-colnames(Second)[3:NewFeatureLength]
Generated <- select(Second, Subject, Activity)

# Generate Means

for (i in NewfLabel) {
  header <- select(Second, Subject, Activity)
  Feature <- Second[,i]
  Separate <- cbind(header, Feature)
  Grouped <- group_by(Separate, Subject, Activity) 
  Mutated <- mutate(Grouped, Feature = mean(Feature)) 
  names(Mutated)[3] <- paste("Mean of",i) 
  Simplified <- unique(Mutated)
  Generated <<- inner_join(Generated, Simplified)
  
}
End <- unique(Generated)
Final<-arrange(End,Subject,Activity)

# Label Activities

 aLabel<-as.character(Activity_Labels[,2])
 ActivityNum<-Final[,2]
 ActivityLength<-length(ActivityNum)
 for (i in 1:ActivityLength){
  Final[i,2]<-aLabel[ActivityNum[i]]
 }

# Output to file

write.table(Final,"TidyData.txt",row.names=FALSE)
}
