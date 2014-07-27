##Peer assessment coursera getting and cleaning data.
#rm(list=ls()) #cleaning vars
cat("\014")  #clear screen

##1. READING AND JOINING TRAINING AND TESTS DATA SETS.
#Reading features (variables) names
VarNames <- read.table('features.txt')
#Reading train data
TrainData <- read.table("./train/X_train.txt")
TrainNames <- read.table("./train/y_train.txt")
TrainSubj <- read.table("./train/subject_train.txt")
#Reading test data
TestData <- read.table("./test/X_test.txt")
TestNames <- read.table("./test/y_test.txt") 
TestSubj <- read.table("./test/subject_test.txt")
#Merging train and test sets
Data <- rbind(TrainData, TestData)
Names <- rbind(TrainNames, TestNames)
Subj <- rbind(TrainSubj, TestSubj)

##2. EXTRACTING MEANS AND STANDAR DEVIATIONS
#Indexing mean and standar deviation (std) data
Ordinal<-grep("mean\\(\\)|std\\(\\)", VarNames$V2)
MeanStdData <- Data[, Ordinal]

##3. RENAMING DESCRIPTIVELY
Labels <- read.table("activity_labels.txt")
Names[, 1] <- Labels[Names[, 1], 2]
names(Names) <- "Activity"

##4. RELABELING THE DATASET 
names(Subj)<-"Subject"
TidyData <- cbind(Subj,Names,Data)

##5. CREATING NEW DATASET WITH THE AVERAGE OF EACH VARIABLE/ACTIVITY/SUBJECT 
NewData<-as.data.frame(matrix(NA,length(levels(factor(Subj$Subject)))*length(Labels$V1),dim(TidyData)[2]))
names(NewData) <- names(TidyData)
cnt<-1
for (i in 1:length(levels(factor(Subj$Subject)))){
  for(j in 1:length(Labels$V2)){
    NewData[cnt,1]<-sort(unique(Subj)[,1])[i]
    NewData[cnt,2]<-toString(Labels$V2[j])
    flag1<-i==TidyData$Subject
    flag2<-Labels$V2[j]==TidyData$Activity
    NewData[cnt,3:dim(TidyData)[2]]<-colMeans(TidyData[flag1&flag2, 3:dim(TidyData)[2]])
    cnt<-cnt+1
  }
}

#head of new (tidy) dataset, columns 1 to 6.
head(NewData[1:6])

#Exporting file
write.table(NewData, "Tidy.txt")






