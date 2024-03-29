# SQL examples 

These SQL examples have been written to introduce some basic SQL commands and concepts. 

Covered functions include SELECT, INSERT, CREATE, ALTER, UPDATE, DELETE. The code has been written with MySQL as target. Nonetheless it should basically run on any SQL-capable database as no special commands have been used. 

## Authorship
All SQL files have been written as part of my teaching. Please feel free to use the SQL examples but keep the link to the website included. Thank you!

## Words of precaution
**&tldr; Think before you run something. And creating backups is never wrong**

* Running any of the code from this repo/collection of code is the sole responsibility of you as the user
* Examples are just that: examples
* If you do not understand it, do not run it. Especially not on production environments
* Code might behave differently on your platform/in your environment than intended

## Contact

Contact me via my website https://www.digitalisierungsarchitekt.de/kontakt

# Content of the files

All files work on three tables as examples
* _Artist_ to store data about music artists
* _Albums_ each is related to one artist (n:1-relationship) and has some properties as well
* _Tracks_ each of them is related to one album (n:1-relationship)

## 1 CREATE ALTER DROP TABLES

Within this file tables are created and altered (additional columns added and removed). Before doing so, there is a DROP IF EXIST so we are sure to start on a clean slate. So do not run if you would like to keep tables with the same name

## 2 INSERT UPDATE

Some sample data is inserted and also some data is altered to show that is done

## 3 SELECT

Different aspects and approaches to select data. From simple queries on one table up to some JOINed examples - it's all here

## 4 additional INSERT (more data)

Provides more data to play with. Within the VALUES part of some INSERT commands, you might encounter some double quotes _''_ (two times a single quote) to insert words like _don't_. Without the double quotes the database thinks the string ends and does not know what to do with the rest.

## 5 DELETE data

Shows how data can be deleted from the database without removing a whole table. 
