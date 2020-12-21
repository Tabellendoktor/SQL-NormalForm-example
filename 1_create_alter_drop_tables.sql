 -- Delete tables from database if they exist already
DROP TABLE IF EXISTS Tracks; -- start with Tracks because of the foreign key contraints
DROP TABLE IF EXISTS Albums;
DROP TABLE IF EXISTS Artist;

-- Create table Artist
CREATE TABLE Artist (
    Artist_ID INTEGER, -- ID for an artist (we do it manually, so no auto-increment)
    Artist VARCHAR(30) NOT NULL, -- name of the artist, 30 characters, NOT NULL = is required
    Artist_YOB INTEGER(4), -- four digit integer for the year of birth (MySQL/MariaDB also has YEAR as type, other implementations do not have)
    PRIMARY KEY (Artist_ID) -- becomes primary key and thereby implictly UNIQUE as well
);

-- Create table Album
CREATE TABLE Albums (
    Album_ID INTEGER, -- ID for an album (we do it manually, so no auto-increment)
    Album_name VARCHAR(50) NOT NULL, -- NOT NULL = is required 
    PublicationYear INTEGER(4) NOT NULL, -- four digit integer for the year, NOT NULL = is required
    Artist_ID INTEGER, -- that will be our foreign key (see below)
    FOREIGN KEY (Artist_ID) REFERENCES Artist(Artist_ID), -- degining the relationship
    PRIMARY KEY (Album_ID)
);

-- Create table Tracks
CREATE TABLE Tracks (
    Album_ID INTEGER, 
    Track INTEGER,
    Track_name VARCHAR(160) NOT NULL, -- each track needs a name
    FOREIGN KEY (Album_ID) REFERENCES Albums(Album_ID),
    PRIMARY KEY (Album_ID, Track)
);

-- add an additional column
ALTER TABLE Artist ADD placeOfBirth VARCHAR(40);
-- delete an column again
ALTER TABLE Artist DROP placeOfBirth;