-- SQL file has been written forDer TabellenDoktor (www.tabellendoktor.de)
-- Please feel free to use the SQL examples but keep the link to the website included. Thank you!

-- just select all artists (with all columns)
SELECT *
FROM Artist;

-- select artists with a calculated age >= 30
SELECT Artist, 2020 - Artist_YOB AS age 
FROM Artist
WHERE 2020 - Artist_YOB >= 30;

-- select from tracks those with a name containing "physical" at any position
SELECT * FROM Tracks WHERE Track_name LIKE '%Physical%'; 

-- UNION between artists born >= 1994 and < 1995 (no duplicates)
SELECT * FROM Artist WHERE Artist_YOB >= 1994
UNION
SELECT * FROM Artist WHERE Artist_YOB < 1995;

-- UNION between artists born >= 1994 and < 1995 (including duplicates)
SELECT * FROM Artist WHERE Artist_YOB >= 1994
UNION ALL
SELECT * FROM Artist WHERE Artist_YOB < 1995;

-- INTERSECT in MySQL not available, so we need to work around
SELECT * FROM Artist WHERE Artist_YOB >= 1994 AND
Artist_ID IN (SELECT Artist_ID FROM Artist WHERE Artist_YOB < 1995);

-- EXCEPT in MySQL not available, so we need to work around
SELECT * FROM Artist WHERE Artist_YOB >= 1994 AND
Artist_ID NOT IN (SELECT Artist_ID FROM Artist WHERE Artist_YOB < 1995);

-- SELECT average number of tracks per album, including subquery
SELECT AVG(numberOfTracks)
FROM (SELECT Album_ID, COUNT(Track) AS numberOfTracks FROM Tracks GROUP BY Album_ID) AS tracksCountTable;

-- average number of tracks - just for albums with ID smaller or equal 8980
SELECT AVG(numberOfTracks)
FROM (SELECT Album_ID, COUNT(Track) AS numberOfTracks FROM Tracks WHERE Album_ID <= 8980 GROUP BY Album_ID) AS tracksCountTable;

-- JOIN tracks with albums
SELECT *
FROM Tracks INNER JOIN Albums ON Tracks.Album_ID = Albums.Album_ID;

-- JOIN tracks with albums with artist
SELECT *
FROM Tracks INNER JOIN Albums ON Tracks.Album_ID = Albums.Album_ID
	INNER JOIN Artist ON Albums.Artist_ID = Artist.Artist_ID;

-- Get number of tracks and albums per artist (albums need to be distinct in the count)
SELECT Artist.Artist, COUNT(Tracks.Track) AS numberOfTracks, COUNT(DISTINCT Albums.Album_ID) AS numberOfAlbums
FROM Tracks INNER JOIN Albums ON Tracks.Album_ID = Albums.Album_ID
	INNER JOIN Artist ON Albums.Artist_ID = Artist.Artist_ID
GROUP BY Artist.Artist;

-- Get average number of tracks per album for each artist
SELECT *, numberOfTracks/numberOfAlbums AS avgNumberTracksPerAlbum
FROM
(SELECT Artist.Artist, COUNT(Tracks.Track) AS numberOfTracks, COUNT(DISTINCT Albums.Album_ID) AS numberOfAlbums
FROM Tracks INNER JOIN Albums ON Tracks.Album_ID = Albums.Album_ID
	INNER JOIN Artist ON Albums.Artist_ID = Artist.Artist_ID
GROUP BY Artist.Artist) AS artistStat;

-- show only artists with more than two albums
SELECT Albums.Artist_ID, Artist.Artist, COUNT(Album_ID) 
FROM Albums INNER JOIN Artist ON Artist.Artist_ID = Albums.Artist_ID
GROUP BY Albums.Artist_ID
HAVING COUNT(Album_ID) > 2
ORDER BY COUNT(Album_ID) ASC;

SELECT * FROM
(SELECT Albums.Artist_ID, Artist.Artist, COUNT(Album_ID) AS albumCount
FROM Albums INNER JOIN Artist ON Artist.Artist_ID = Albums.Artist_ID
GROUP BY Albums.Artist_ID) AS resultTable
WHERE albumCount > 2;
