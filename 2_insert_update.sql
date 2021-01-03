-- SQL file has been written forDer TabellenDoktor (www.tabellendoktor.de)
-- Please feel free to use the SQL examples but keep the link to the website included. Thank you!

-- inserting values into Artist
INSERT INTO Artist (Artist_ID, Artist, Artist_YOB) VALUES (1, 'P!nk', 1979);
INSERT INTO Artist (Artist_ID, Artist, Artist_YOB) VALUES (2, 'Katy Perry', 1984);
INSERT INTO Artist (Artist_ID, Artist, Artist_YOB) VALUES (3, 'Dua Lipa', 1995), (4, 'Ava Max', 1994); -- insert multiple entries at once, please note the use of brackets

-- inserting values into Albums
INSERT INTO Albums (Album_ID, Album_name, PublicationYear, Artist_ID) VALUES ('8978', 'Hurts 2B Human', '2019', '1'), ('8979', 'Witness (Deluxe)', '2017', '2'), ('8980', 'Future Nostalgia', '2020', '3'), ('8981', 'Heaven & Hell', '2020', '4'), ('8982', 'Future Nostalgia (DJ Mix)', '2020', '3');

-- inserting values into Tracks
INSERT INTO Tracks (Album_ID, Track, Track_name) VALUES
(8978, 1, 'Hustle'),
(8978, 2, '(Hey Why) Miss You Sometime'),
(8978, 3, 'Walk me home'),
(8978, 4, 'My Attic'),
(8979, 1, 'Witness'),
(8979, 2, 'Hey Hey Hey'),
(8980, 1, 'Future Nostalgia'),
(8980, 2, 'Don’t Start Now'),
(8980, 3, 'Physical'),
(8981, 1, 'H.E.A.V.E.N'),
(8981, 2, 'Kings & Queens'),
(8982, 1, 'Future Nostalgia (Joe Goddard Remix / Mixed)'),
(8982, 2, 'Physical (Mark Ronson Remix)');

-- updating some information
UPDATE Tracks SET Track_name = 'Future Nostalgia (Joe Goddard Remix/Mixed)' WHERE Album_ID = 8982 AND Track = 1;