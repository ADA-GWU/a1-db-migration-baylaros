--dropping the old table that we don't need
DROP TABLE interests_old;

--dropping the old column array_agg
alter table interests
DROP column array_agg;