This is the course project in Getting and Cleaning Data. The goal of the project
is to write the script “run\_analysis.R” for creating a special tidy data file.
The script deals with the results of an experiment in which 30 volunteers
determined the parameters of motion of their bodies for the six types of
physical activity. The parameters were measured using the gyroscope and
accelerometer of a smartphone, which the volunteers wore at their waists during
the experiment. The available input data are in the folder "data". They are
divided into two parts – the test data set (datatest) and the training set
(datatrain) witch have the same internal structure. Each part includes three
text files of source data.

"X\_train(test).txt" – matrix of parameters of motion of body.  Rows are
observations, columns are parameters (features).  Totally there are 561
parameters. Names of the parameters are listed in the common file
'datafeatures.txt’. The number of rows(observations) in the test group is 2947,
the number of rows in the training group is 7352.

"y\_train(test).txt" – matrix, where each row contains integer code of the
motion activity for every observation. The codes range from 1 to 6. The common
file 'dataactivity\_labels.txt' holds activity names for the codes.

"subject\_train(test).txt" - matrix, where each row contains integer code of the
volunteer (subject) who performed the activity.

Indeed the values in the feature matrixes are not a pure raw data. They are
obtained by averaging of the series of the  smartphone signals, which are
available in special folders, but we does not need them for our assignment.  


The script does the following:

1.  Merges the training and the test sets to create one data set. For this, two
    columns with activity and subject IDs are added to the to the feature
    matrices. This is done using the function cbind  so that the features’
    columns remained at the beginning of the result tables in order to they had
    the same indexes with indexes in list of their names in file
    'datafeatures.txt’. After that the result tables are merged using the
    function rbin.

2.  Appropriately labels the data set with descriptive variable names. It is
    better to do until the order of the columns in the main table (d)
    corresponds to the order of their quite descriptive names in the file
    'datafeatures.txt’.

3.  Extracts only the measurements on the mean and standard deviation for each
    measurement. It is good to do using the regular expression "mean\|std" for
    the vector features\$V2 from the feature names matrix. The extraction is
    also accompanied with moving key variables ("subject" and "activity") to the
    beginning of the result table.

4.  Uses descriptive activity names to name the activities in the data set. It
    is done by coercing the column "activity"  to a factor and adjusting the
    factor's levels properly.

5.  Creates a second, independent tidy data set with the average of each
    variable for each activity and each subject. Reshaping is done with help of
    the package ‘reshape2’ using the functions ‘melt’ and ‘dcast’. The result
    table is saved to the file “tidy.txt”.

 
