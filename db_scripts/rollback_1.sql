-- Rename the musician table back to singer.
ALTER TABLE musician RENAME TO singer;
--Drop the columns added during the migration.
ALTER TABLE singer DROP COLUMN role;
ALTER TABLE singer DROP COLUMN bandName;
-- Remove the band table created during the migration.
DROP TABLE band;

ALTER TABLE album DROP FOREIGN KEY FK_A_singerName;
ALTER TABLE singer CHANGE COLUMN musicianName singerName VARCHAR(50);
ALTER TABLE album ADD CONSTRAINT FK_A_singerName FOREIGN KEY (singerName) REFERENCES singer (singerName);