# README

## Getting and Cleaning Data Final Assignment

---

### Analysis script

All of the analysis is performed by the script `run_analysis.R`

---

### Raw data

The raw data was obtained from 
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

A detailed description of the data set can be found at 
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

---

### Data analysis steps

0. Load the useful data files from the zip.
    * Test and training data files (`X_train.txt` and `X_test.txt`). Multiple columns 
    containing values for each of the 561 features. Each row corresponds to a measurement 
    on a given subject for a given activity.
    * Test and training subject files (`subject_train.txt` and `subject_test.txt`.). A single 
    column with integers from 1 to 30 providing a link from the data to the subject.
    * Test and training activity files (`y_train.txt` and `y_test.txt`). A single column 
    with integers from 1 to 6 providing a link from the data to the activity.
    * Activity labels file (`activity_labels.txt`). Two columns: the first integers from 
    1 to 6 and the second a description of the activity i.e. WALKING
    * Feature labels file (`features.txt`). Two columns: the first integers from 1 to 561 
    and the second a dscreption of the feature i.e. tBodyAcc-mean()-X

1. Merge the training and the test sets to create one data set.
    * The test and training subject, activity and data arrays were combined to create merged
    data frame containing 563 columns (subject, activity and 561 features) for all of the 
    measurements in the test and training data. 

2. Assign names to the columns.
    * The first two columns were named subject and activity. The remaining colums were named
    using the contents of the feature_labels data file.
    
3. Subset the data to keep only the fetaures with std() and mean()
    * The data frame was subsetted by selecting columns using grep/regexp to extract the
    columns with std() or mean() in the column name. The subject and activity columns were also 
    kept. 

4. Convert the activity column to a factor using the activity labels
    * The integer values in the activity olumn were changed into a factor variable using the 
    contents of the activity labels data as labels.

5. Change the feature variable names such that they are readable by humans
    * A pattern for the readable names was selected. It consisted of four character strings 
    `<domain>_<measurement>_<component>_<statistic>` that are defined as:
        - `<domain>` e.g. FrequencyDomain instead of f.
        - `<measurement>`: is the full spelling of the measurement e.g. BodyAcceleration instead
        of BodyAcc.
        - `<component>`: e.g. XComponent instead of X() or Magnitude instead of Mag
        - `<statistic>`: e.g. StandardDeviation instead of std()
    * Three of the features had the word Body repeated twice in their name. This error was found
    in the feature labeld file and was corrected at this stage.
    * The renaming consisted of a series of grepl/regexp calls to get the indicies and then
    lapply/paste0 calls to gradually build the readable column names
    * after the readable names were complete they were assigned to the feature columns of the 
    merged and subsetted data frame.

6. Creates a second, independent tidy data set with the average of each variable for each 
activity and each subject.
    * The merged subset data frame was split according to both subject and activity.
    * Sapply was used to calulate the column means of the columns containing the feature
    variables.
    * the resulting matrix was transposed so that the measurement variables are the columns
    * the resulting matrix was written to a text file named `tidy_data.txt` using table.write.
        - The columns of the data contain the mean values of the features of the data set
        and they are labelled with the readable names.
        - The rows of the data file are not labelled but they correspond to the activity and subject
        `<activity>.<subject> i.e. `WALKING.1`.

