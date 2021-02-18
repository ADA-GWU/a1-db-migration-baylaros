--Dropping the old table "interests_old"
DROP TABLE interests_old;

--Dropping the old column "array_agg"
alter table interests
DROP column array_agg;