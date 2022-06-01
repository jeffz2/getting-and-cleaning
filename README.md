# getting-and-cleaning

The run_analysis function first extracts all the data from the txt files. Next, it merges all the similar data tables into the appropriate table and renames the column(s) to the names provided in the label txt files. The function then adjusts all the labels to the corresponding activity name and makes the feature column names a bit more descriptive. Finally, the tables are merged into one table and the mean is calulated for each subject and activity. The final output is written to a file called tidy.txt.
