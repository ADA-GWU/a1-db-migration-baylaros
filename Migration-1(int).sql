--Creating Table "INTERESTS"
create table INTERESTS(STUDENT_ID int, INTEREST varchar(15));
insert into INTERESTS(STUDENT_ID, INTEREST)
values ('1', 'Tennis'), ('1', 'Literature'), ('1', 'Math'), ('2', 'Tennis'), ('3', 'Math'), ('3', 'Music'), ('2', 'Football'), ('1', 'Chemistry'), ('3', 'Chess');

--Creating new "INTERESTS" column
alter table interests
add interests varchar(15);

--Making "interests" column to be equal to "interest" column
update interests
set interests = interest;

--Creating new "interests_new table"
CREATE TABLE interests_new AS select student_id, jsonb_agg(interests) from interests group by(student_id) order by (student_id);

--renaming "interests" table to the old one - "interests_old"
ALTER TABLE interests RENAME TO interests_old;

--renaming new "interests_new" table to the name "interests"
ALTER TABLE interests_new RENAME TO interests;


DROP TABLE interests_old;

--
--
--At this point we should access to the "Migration-2(int).sql" file and drop the old table "interests_old"
--
--



--creating new "INTERESTS" column
alter table interests
add interests jsonb;

--Making "interests" column to be equal to "array_agg" column
update interests
set interests = jsonb_agg;


--At this point we have to access "Migration-2(int).sql" file in order to drop the old column - "array_agg"
--
--
--

alter table interests
DROP column jsonb_agg;