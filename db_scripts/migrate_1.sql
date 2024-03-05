-- Rename the singer table to musician
ALTER TABLE singer RENAME TO musician;

-- Add the new columns to the musician table
ALTER TABLE musician ADD COLUMN role VARCHAR(50);
ALTER TABLE musician ADD COLUMN bandName VARCHAR(50);
-- Rename the Column Name
ALTER TABLE musician CHANGE COLUMN singerName musicianName VARCHAR(50);

UPDATE musician SET role = 'vocals', bandName = 'Crazy Duo' WHERE musicianName = 'Alina';
UPDATE musician SET role = 'guitar', bandName = 'Mysterio' WHERE musicianName = 'Mysterio';
UPDATE musician SET role = 'percussion', bandName = 'Crazy Duo' WHERE musicianName = 'Rainbow';
UPDATE musician SET role = 'piano', bandName = 'Luna' WHERE musicianName = 'Luna';

-- Create the band table as per the new schema
CREATE TABLE band (
    bandName VARCHAR(50) PRIMARY KEY,
    creation YEAR,
    genre VARCHAR(50)
);
-- insert the values into the band table
INSERT INTO band VALUES ("Crazy Duo", 2015, "rock"), ("Luna", 2009, "classical"), ("Mysterio", 2019, "pop");


-- Drop the Existing Foreign Key Constraint
ALTER TABLE album DROP FOREIGN KEY FK_A_singerName;

-- Add the New Foreign Key Constraint
ALTER TABLE album
ADD CONSTRAINT FK_A_singerName
FOREIGN KEY (singerName) REFERENCES musician(musicianName);