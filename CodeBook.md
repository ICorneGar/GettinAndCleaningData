In this file we pretend to describe the variables and all the work performed to clean the collected dataset, and transform them in a tidy dataset.

- The first step was to download the data (see link1, below), and merge the test and training data in one unique big dataset. This step is useful for people that want to do their own separation between training and test set.

- Merged data set was summarized, extracting the mean and standar deviation of each measurement. Grouping them consistently.

- The index name for each kind of activity was replaced for a descriptive (colloquial) name. Then, the dataset was relabeled.

- Finally, the dataset resulted from previous steps was exported to "Tidy.txt" data file.  

Link1: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The principal variables are described below: 

- VarNames: the technical name and index of the measured features. In this case, the (x,y,z) values obtained from the gyroscope, accelerometer, etc.
- TrainData: the received training data.
- TrainNames: labels of TrainData
- TrainSubj: each row identifies the subject who performed the activity for each window sample, in the training set. Its range is from 1 to 30. 
- TestData: the recivied test data.
- TestNames: labels of TestData
- TestSubj: each row identifies the subject who performed the activity for each window sample, in the test set. Its range is from 1 to 30. 
- Data: merged training and test data.
- Names: labels of Data.
- Subj: merged subjects who performed training and test runs.
- TidyData: merged and relabeled dataset.
- NewData: a new dataset with the average of each variable/activity/subject of the TidyData.

