--First we are creating new table with "student_id" and "interest" column
create table interests_new(STUDENT_ID int, INTEREST varchar(15));

--We are using unnest function in order to open the array and order them as ascending order
insert into interests_new(student_id, interest) select student_id, unnest(interests) from interests;

--renaming interests table to the old one
ALTER TABLE interests RENAME TO interests_old;

--renaming new interests_new table to interests
ALTER TABLE interests_new RENAME TO interests;