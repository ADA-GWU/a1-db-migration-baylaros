--Creating Table "INTERESTS"
create table interests_new(STUDENT_ID int, INTEREST varchar(15));
insert into interests_new(STUDENT_ID, INTEREST)
values ('1', 'Tennis'), ('1', 'Literature'), ('1', 'Math'), ('2', 'Tennis'), ('3', 'Math'), ('3', 'Music'), ('2', 'Football'), ('1', 'Chemistry'), ('3', 'Chess');

--renaming interests table to the old one
ALTER TABLE interests RENAME TO interests_old;

--renaming new interests_new table to interests
ALTER TABLE interests_new RENAME TO interests;