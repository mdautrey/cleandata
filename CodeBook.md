#Accelerometric and gyroscopic data aggregation
## Analysing source datafiles
> We want to transform source datafiles to get the matrix below

     AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    SYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    SYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    SYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    SYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    SYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    SYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    SYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    SYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    SYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    SYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    SYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    SYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

* A = activity / numerical code (Y) => labels corresponding to the codes are defined in the file activity_labels.txt
* F : features => Features are used to name the numerical data columns
* S : Subject => subject identified the person wearing the sensor
* Y : numerical code of the activity
* X : numerical data. Each value X is associated with a feature F, a Subject S and an activity code Y

> The mapping between the various fields and the files is defined as follows :
* S : subject_train.txt (a one column file)
* X : X_train.txt
* Y : y_train.txt
* F : features.txt
* A : activity_labels.txt

## Test and train directories
> The project requires that two directories, train and test data, are merged

> In each directory, there is a subdirectory "Inertial Signals" that contains the raw data (before filtering, and so on...). We don't need to process these files.

## Loading files into data frames
> We chose to use read.fwf to do most of the job, except features and activity labels files for which using read.csv was easier. read.fwf is very slow. In a future version, we may look for an optimized library.

## Post-load check
>We check that dimensions of resulting frames were compatible. Further verification such as type and consistance checking could be a good thing but we don't have time to
## Merging data frames
>Merging dataframes into a single one was quite an easy step, using rbind and cbind. We then renamed cols. We didn't check that the naming was consistant...
## Next steps
...


