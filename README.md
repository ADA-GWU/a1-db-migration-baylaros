# a1-db-migration-baylaros

First and foremost in order to make migration and rollback first we should create tables. 
In this assignment we have 2 tables: "STUDENTS" and "INTERESTS" and for each table we will have 2 migration.sql files (4 in total) and 2 rollback.sql files (4 in total) in order to have efficient and effective migration and rollback. 



# INTERESTS TABLE (MIGRATION)

First we run the "migration-1(int).sql" file (int means interests) and we run first command in the file: 
``` bash
create table INTERESTS(STUDENT_ID int, INTEREST varchar(15)); 
```
Whereas in this code the student_id is the column and int is the type - integer, whereas interest is the second column and the type is the string with maximum of 15 characters limit.

The second line of code is: 
``` bash
insert into INTERESTS(STUDENT_ID, INTEREST)
values ('1', 'Tennis'), ('1', 'Literature'), ('1', 'Math'), ('2', 'Tennis'), ('3', 'Math'), ('3', 'Music'), ('2', 'Football'), ('1', 'Chemistry'), ('3', 'Chess');
```
whereas in the first line we say to the program that we want to add values for the given 2 columns and the value should be written as in order in which we wrote "insert into" command, like, first one should be the id and second one should be the interest. 

And then we do this command: 
``` bash
alter table interests
add interests varchar(15);
```
In which alter means we want to modify, add or delete something from the table, so we alter the table "interests" and add another column named interests with the same type as we used when we created the table, varchar(15)

Then:
``` bash
update interests
set interests = interest;
```
So update is the updating of the table because we modified it and added column. And then in the set command we are copying data from "interest" column to "interests" column


In order to make an array column first we should create new table with new array_agg column whereas we take data from old table and making it as an array according to the students_id so in our case there will be 3 rows:
``` bash
CREATE TABLE interests_new AS select student_id, array_agg(interests) from interests group by(student_id) order by (student_id);
```
As it is seen, we are creating new table named "interests_new" and copying data "student_id" as it was and "interests" column as like array from the old table and grouping and ordering the "interests" column according to the "student_id". 

After the creation of the new table we should rename the old table in order to use the name "INTERESTS" as a table name for the new table. 
``` bash
ALTER TABLE interests RENAME TO interests_old;
```
And then renaming the new table as "INTERESTS" table:
``` bash
ALTER TABLE interests_new RENAME TO interests;
```
After this command, we should open "migration-2(int).sql" file (int for interest) in order to drop the old table. We run: 
``` bash
DROP TABLE interests_old;
```
If we will look closely the new array column we created the name is "array_agg" so we should change the name of it to "interests", so in order to do it in a efficient way we create new column with the new name and dropping the old one, the process is same as it was when we used "alter table" command first time:
``` bash
alter table interests
add interests varchar[];
```
But the difference is we didn't write varchar(15) we wrote varchar[] so here [] these symbols means it is array, because the "array_agg" column is the array

And then we run:
``` bash
update interests
set interests = array_agg;
```
And then we open the migration-2(int).sql file (int for interest) in order to drop the old "array_agg" column, we run: 
``` bash
alter table interests
DROP column array_agg;
```



# INTERESTS TABLE (ROLLBACK)

The rollback of the migration table is very easy. 
First we should open the file name "Rollback-1(int).sql" (int for interest). As we created the table for the "interests" we are creating it again as well but now we name it as "interests_new"
``` bash
create table interests_new(STUDENT_ID int, INTEREST varchar(15));
insert into interests_new(STUDENT_ID, INTEREST)
values ('1', 'Tennis'), ('1', 'Literature'), ('1', 'Math'), ('2', 'Tennis'), ('3', 'Math'), ('3', 'Music'), ('2', 'Football'), ('1', 'Chemistry'), ('3', 'Chess');
```
And then we rename the "interests" table to "interests_old" so that we will be able to use the name "interests"
``` bash
ALTER TABLE interests RENAME TO interests_old;
```
And then renamin the new table to "interests"
``` bash
ALTER TABLE interests_new RENAME TO interests;
```
The last step for the interests is dropping the old table in which we should open the file "Rollback-2(int).sql" (int for interest): 
``` bash
DROP TABLE interests_old;
```




# STUDENTS TABLE (MIGRATION)

First we open the file "Migration-1.sql(st)" (st for students) and the creation of the table is identical as "Interests" table but here we have 1 extra column: 
``` bash
create table STUDENTS(st_id int, st_name varchar(15), st_last varchar(15));
insert into STUDENTS(st_id, st_name, st_last)
values ('1', 'Konul', 'Gurbanova'), ('2', 'Shahnur', 'Isgandarli'), ('3', 'Natavan', 'Mammadova');
```
And then we are adding new column regarding this command: 
``` bash
alter table students
add STUDENT_ID int;
```
And updating the table and setting that "student_id" will be equal to "st_id":
``` bash
UPDATE students
set STUDENT_ID=ST_ID;
```
The next obstacle is that setting the limits. So the "st_name" and "st_last columns" limits are 15 whereas we should make it 30: 
``` bash
alter table students
alter column st_name type varchar(30);
alter table students
alter column st_last type varchar(30);
```
So in the code after the column name "type new_type" is the command for changing or setting new type. 

After the creation and update of the column we should drop the old "st_id" column, whereas we access to file named "Migration-2(st)" (st for students) 
``` bash
alter table students
drop column st_id;
```



# STUDENTS TABLE (ROLLBACK)

As we created new column and dropped the old one, now we a shpuld reverse it and create old one and drop the new one whereas you should access "Rollback-1(st) (st for students)". The commands are the same:
``` bash
alter table students
add ST_ID int;
```
And then we run: 
``` bash
UPDATE students
set ST_ID=STUDENT_ID;
```
So if we remember we changed the limits to 30, now we should reverse it to 15: 
``` bash
alter table students
alter column st_name type varchar(15);
alter table students
alter column st_last type varchar(15);
```
Lastly, accessing the "Rollback-2(st).sql" (st for students) and drop the new table that we created during migration: 
``` bash
alter table students
DROP column student_id;
```



