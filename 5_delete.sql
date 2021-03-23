-- SQL file has been written forDer TabellenDoktor (www.tabellendoktor.de)
-- Please feel free to use the SQL examples but keep the link to the website included. Thank you!

-- This file delets some entries from the database without droping the whole tables

DELETE FROM Tracks WHERE Album_ID = 8980 AND Track > 1; -- delete all tracks above 1 from the album with ID 8980;
DELETE FROM Tracks WHERE Track_name LIKE '%Physical%'; -- deletes all tracks where the name contains Cool