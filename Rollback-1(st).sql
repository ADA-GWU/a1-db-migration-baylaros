--Creating new column with old name - "st_id"
alter table students
add ST_ID int;

--Making old column to be equal to the new column - "student_id"
UPDATE students
set ST_ID=STUDENT_ID;

--At this point please access "Rollback-2(st).sql" in order to drop the "student_id" column. 

--Changing types of the columns
alter table students
alter column st_name type varchar(15);
alter table students
alter column st_last type varchar(15);