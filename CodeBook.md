The script begins by loading the various requires files for transformation (i.e. subject_test, y_test, X_test, features, y_train, X_train, subject_train).
The variables into which these tables are loaded conserve the related nomenclature.
The first part of the transformation begings by binding the columns of the subject_test, y_test and X_test (into the test variable).
Column headers are then modified to Subject, Activity and the related column headers described in features.txt (headers are loaded into the names variable).
The same transformations are done for the *_train files (into the train variable).
Since both file sets have the same number of columns, both resulting tables are binded by rows (into test_train).
Since the column names from the features file are not appropriate for R (given they contain illegal characters), these headers are coerced into valid names with the make.names function (then loaded into valid_column_names).
The column headers of test_train are then replaced by the correct headers in valid_column_names.
Then, a second table (test_train2) is created by only selecting columns containing ".mean." and ".std.", in addition to the Subject and Activity columns.
This selection does discard the columns that contain the word mean but that don't contain mean() as per the original header in the source file (e.g. this discrads the gravityMean column relating to the activity() data).
The activities table is then loaded into the activities variable, which will then be used to replaced the Activity numbers in the test_train2 table by the appropriate activity name.
The final transformation performs an aggreagte function on test_train2 to extract the mean of each column (except Subject and Activity) and store the result per Subject/Activity (instead of having multiple data points for each Subject/Activity, only the mean of these data points will be kept). The result is stored in the final variable.
In the same line of code, the names of the two first columns (Subject and Activity are restored since they are corrupted by the aggregate function).

