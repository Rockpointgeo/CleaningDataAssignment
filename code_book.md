# Code Book

---

## Data file

`tidy_data.txt`

---

## Comments

This tidy data set was derived from the data set described in the publication:

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
> Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
> Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Many of the details of this codebook are reproduced from the original README.txt from the
raw data set.

---

The experiments have been carried out with a group of 30 volunteers within an age bracket 
of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 
SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using 
its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 
3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded 
to label the data manually. The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and 
then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The 
sensor acceleration signal, which has gravitational and body motion components, was separated using a 
Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to 
have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each 
window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals 
tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant 
rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter 
with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated 
into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass 
Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were 
calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, 
fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. The 33 human readable 
names 

* TimeDomain_BodyAcceleration_[XYZ]Component (3 measurements)
* TimeDomain_GravityAcceleration_[XYZ]Component (3 measurements)
* TimeDomain_BodyAccelerationJerk_[XYZ]Component (3 measurements)
* TimeDomain_BodyGyroscope_[XYZ]Component (3 measurements)
* TimeDomain_BodyGyroscopeJerk_[XYZ]Component (3 measurements)
* TimeDomain_BodyAcceleration_Magnitude
* TimeDomain_GravityAcceleration_Magnitude
* TimeDomain_BodyAccelerationJerk_Magnitude
* TimeDomain_BodyGyroscope_Magnitude
* TimeDomain_BodyGyroscopeJerk_Magnitude
* FrequencyDomain_BodyAcceleration_[XYZ]Component (3 measurements)
* FrequencyDomain_BodyAccelerationJerk_[XYZ]Component (3 measurements)
* FrequencyDomain_BodyGyroscope_[XYZ]Component (3 measurements)
* FrequencyDomain_BodyAcceleration_Magnitude
* FrequencyDomain_BodyAccelerationJerk_Magnitude
* FrequencyDomain_BodyGyroscope_Magnitude
* FrequencyDomain_BodyGyroscopeJerk_Magnitude


The set of variables that extracted from the data set are: 

mean(): Mean value
std(): Standard deviation

The values in the tidy data set represent the mean value
of for each of the 66 measurements for a particular subject performing a particular activity.
The column names are contained in a header line in the data file. The names a human 
readable verions the feature labels in the raw data set. All of the raw data values
were normalized to lie between -1 and 1. 

There are 180 measurements that correspond to 30 subjects observed during 6 activities.
The rows are organized by subject and then by activity. The subjects are ordered from
1 to 30 and the activities are ordered as follows:

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

The first 10 rows of file would have the labels:

* WALKING.1
* WALKING_UPSTAIRS.1
* WALKING_DOWNSTAIRS.1
* SITTING.1
* STANDING.1
* LAYING.1
* WALKING.2
* WALKING_UPSTAIRS.2
* WALKING_DOWNSTAIRS.2
* SITTING.2