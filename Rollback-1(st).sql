--Creating new column with old name
alter table students
add ST_ID int;

--Making it to be equal to the old column
UPDATE students
set ST_ID=STUDENT_ID;

--Changing types of the columns
alter table students
alter column st_name type varchar(15);
alter table students
alter column st_last type varchar(15);