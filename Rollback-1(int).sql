--Creating Table "INTERESTS"
create table interests_new(STUDENT_ID int, INTEREST varchar(15));
insert into interests_new(STUDENT_ID, INTEREST)
values ('1', 'Tennis'), ('1', 'Literature'), ('1', 'Math'), ('2', 'Tennis'), ('3', 'Math'), ('3', 'Music'), ('2', 'Football'), ('1', 'Chemistry'), ('3', 'Chess');

--Renaming "interests" table to the "interests_old"
ALTER TABLE interests RENAME TO interests_old;

--Renaming new "interests_new" table to the "interests"
ALTER TABLE interests_new RENAME TO interests;

--After this we should access "Rollback-2(int).sql" file in order to drop the old table - "interests_old"
--
--