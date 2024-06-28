SQL_Query folder contains all the required sql files to create the tables, procedures, triggers and functions.
1. createScripts.sql is to create the tables.
2. insert_library_details.sql is to insert data into the library_details table.
3. Student_details, publisher_details and book_details table are loaded using csv/xlsx file import. The required csv files are in the data folder.
4. For generating fake student data we used faker library in python. the required pyhton notebook file can be found inside Data folder as 'dmql.ipynb'.