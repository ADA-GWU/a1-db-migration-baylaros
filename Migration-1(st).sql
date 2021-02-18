--Creating new table "STUDENTS"
create table STUDENTS(st_id int, st_name varchar(15), st_last varchar(15));
insert into STUDENTS(st_id, st_name, st_last)
values ('1', 'Konul', 'Gurbanova'), ('2', 'Shahnur', 'Isgandarli');

--Adding new column "stundet_id"
alter table students
add STUDENT_ID int;

--Making "student_id" to be equal to "st_id"
UPDATE students
set STUDENT_ID=ST_ID;

--At this point please access "Migration-2(st).sql" file in order to drop the old table "st_id"

--Changing the types of the columns
alter table students
alter column st_name type varchar(30);
alter table students
alter column st_last type varchar(30);