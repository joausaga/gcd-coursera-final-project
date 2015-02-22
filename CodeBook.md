Human Activity Recognition Using Smartphones Dataset
---

-------

The provided dataset is based on a dataset that contains information about the experiments that have been conducted to monitor, through a wearable device (Samsung Galaxy S II), physical activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) in 30 voluntary subjects. More information about the experiment can be found [[here]](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Using the device's embedded accelerometer and gyroscope, the following features were measured:

*tBodyAcc:* body acceleration ('Acc') signal. The prefix 't' indicates that the signal belongs to the time domain.

*tGravityAcc:* gravity acceleration signal.

*tBodyAccJerk:* body acceleration [Jerk](http://www.mmsonline.com/articles/understanding-jerk-control) signal.

*tBodyGyroJerk:* body gyroscope ('Gyro') Jerk signal.

*tBodyAccMag:* body acceleration signal in [euclidean norm](http://en.wikipedia.org/wiki/Norm_%28mathematics%29#Euclidean_norm).

*tGravityAccMag:* gravity acceleration signal in euclidean norm.

*tBodyAccJerkMag:* body acceleration Jerk signal in euclidean norm.

*tBodyGyroMag:* body gyroscope signal in euclidean norm.

*tBodyGyroJerkMag:* body gyroscope Jerk signal in euclidean norm.

*fBodyAcc:* body acceleration signal transformed using Fast Fourier Transform [(FTT)](http://en.wikipedia.org/wiki/Fast_Fourier_transform). The prefix 'f' indicates that the signal belongs to the frequency domain.

*fBodyAccJerk:* body acceleration Jerk signal in the frequency domain.

*fBodyGyro:* body gyroscope signal in the frequency domain.

*fBodyAccJerkMag:* body acceleration Jerk signal in euclidean norm and in the frequency domain.

*fBodyGyroMag:* body gyroscope signal in euclidean norm and in the frequency domain.

*fBodyGyroJerkMag:* body gyroscope Jerk signal in euclidean norm and in the frequency domain.

**The variables that were estimated from these signals are: **

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values

iqr(): Interquartile range

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal

kurtosis(): kurtosis of the frequency domain signal

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window

angle(): Angle between to vectors

**A suffix 'X', 'Y', or 'Z' was appended to each variable name to indicate the axial of the variable.**

The original dataset come split into several files: 

*X_train.txt:* train set containing information about the 70% of the volunteers that were selected for generating the training data.

*X_test.txt:* test set containing information about the 30% of the volunteers that were chosen to generate test data.

*y_train.txt:* identifiers of the activities performed by the volunteers that generate the training data. Its ranges from 1 to 6.

*y_test.txt:* identifiers of the activities performed by the volunteers that generate the test data. Its ranges from 1 to 6.

*activity_label.txt:* links the activity identifiers with their name, namely: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

*features.txt:* list of all features measured.

*subject_train.txt:* identifiers of the subjects that participated in generating training data. Its ranges from 1 to 30.

*subject_test.txt:* identifiers of the subjects that participated in generating test data. Its ranges from 1 to 30.

### Pre-processing and transformation work

1. The files above mentioned were load into R dataframes.

2. It was labeled the columns of the dataframes: activity_labels ('id', 'activity_name'), test_labels ('activity'), train_labels ('activity'), subject_train ('subject_id'), subject_test ('subject_id').

3. The names of the features were converted into R valid names.

4. The converted names of the features were assigned as the column names of the train and test dataframes.

5. It was added two new columns, **subject_id** and **activity**, to the train and test dataframes. The first column to identify the subject and the second to indicate the activity.

6. The dataframes produced in step 5 were merged, by row, into a single dataframe. 

7. A new dataframe was produced from the dataframe created in step 6 but containing only the variable related with the measurements of mean and standard deviations.

8. The identifiers of the activities in the dataframe created in step 6 were replaced by the activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

9. Finally, a last dataset was created by grouping by activity and subject the content of the dataframe created in step 6 and then by calculating the average of each variable. This dataset contains the variables: subject_id, activity, and the mean of the signal measurements (mean, std, max, min, sma, etc.) in each axial, X, Y, and Z.