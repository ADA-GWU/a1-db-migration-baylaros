--Creating Table "INTERESTS"
create table INTERESTS(STUDENT_ID int, INTEREST varchar(15));
insert into INTERESTS(STUDENT_ID, INTEREST)
values ('1', 'Tennis'), ('1', 'Literature'), ('1', 'Math'), ('2', 'Tennis'), ('3', 'Math'), ('3', 'Music'), ('2', 'Football'), ('1', 'Chemistry'), ('3', 'Chess');

--creating new "INTERESTS" column
alter table interests
add interests varchar(15);

--Making "interests" column to be equal to "interest" column
update interests
set interests = interest;

--Creating new "interests_new" table with array_agg
CREATE TABLE interests_new AS select student_id, array_agg(interests) from interests group by(student_id) order by (student_id);

--renaming "interests" table to the old one
ALTER TABLE interests RENAME TO interests_old;

--renaming new "interests_new" table to interests
ALTER TABLE interests_new RENAME TO interests;

--here we have to drop the old table, please see the "Migration-2(int)".sql file

--creating new INTERESTS column
alter table interests
add interests varchar[];

--Making interests column to be equal to array_agg column
update interests
set interests = array_agg;

--here we have to drop the old column, please see the "Migration-2(int)".sql file
