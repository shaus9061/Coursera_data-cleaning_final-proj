# Coursera_data-cleaning_final proj
1. The run_analysis.R script loads the samsung data from the given URL(line 3) and unzips it(line 5). If the file is already loaded, commit out lines 3 and 4. 
2. The script then pulls the variable names out of one of the files and edits them so they are tidier (lines 6-10). 
3. The script mkes two data frames.  The first data frame(test) is made up of all the data from the test group (lines 12-15). The second data frame(train) is made up of all the data from the train group (lines 17-20).
4. The two data sets are then combined into one large data set(all) and the sctivity vector and subjet vector are called out for later use(lines 22-24).
5. The activity numbers 1-6 are replaced with descriptive names(lines 26-31).
6. The mean and standard deviation measurements are extracted and putt into new data set(allmsd)(lines 34-36).
7. Three tables are created that show the mean of the data grouped by 1.activity, 2. subject, and 3. subject and activity.
