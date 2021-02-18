--creating new table STUDENTS
create table STUDENTS(st_id int, st_name varchar(15), st_last varchar(15));
insert into STUDENTS(st_id, st_name, st_last)
values ('1', 'Konul', 'Gurbanova'), ('2', 'Shahnur', 'Isgandarli'),('3', 'Natavan', 'Mammadova');

--adding new column to the table
alter table students
add STUDENT_ID int;

--Making "student_id" to be equal to "st_id"
UPDATE students
set STUDENT_ID=ST_ID;

--Please see the "Migration-2(st).sql" file for dropping the old column

--Changing the types of the columns
alter table students
alter column st_name type varchar(30);
alter table students
alter column st_last type varchar(30);