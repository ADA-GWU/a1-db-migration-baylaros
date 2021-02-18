--dropping the old table
DROP TABLE interests_old;

--dropping the old column array_agg
alter table interests
DROP column array_agg;