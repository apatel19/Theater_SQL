DROP TABLE IF EXISTS USER;
DROP TABLE IF EXISTS THEATER;
DROP TABLE IF EXISTS MOVIE;
DROP TABLE IF EXISTS SHOWTIME;
DROP TABLE IF EXISTS SYSTEM_INFO;
DROP TABLE IF EXISTS REVIEW;
DROP TABLE IF EXISTS PREFERS;
DROP TABLE IF EXISTS POPULAR_MOVIES;
DROP TABLE IF EXISTS PLAYS_AT;
DROP TABLE IF EXISTS PAYMENT_INFO;
DROP TABLE IF EXISTS ORDER_INFO;

CREATE TABLE USER (
	Email	VARCHAR ( 40 ) NOT NULL,
	Username	CHAR ( 15 ) NOT NULL,
	Password	VARCHAR ( 7 ) NOT NULL,
	User_Type	VARCHAR ( 12 ) NOT NULL,
	CONSTRAINT USERPK PRIMARY KEY(Email,Username)
);

INSERT INTO USER VALUES ('aleciarogers@gmail.com','arogers','123456','customer');
INSERT INTO USER VALUES ('dominicprice@gmail.com','dprice','123456','customer');
INSERT INTO USER VALUES ('majacooper@gmail.com','mcooper','123456','customer');
INSERT INTO USER VALUES ('barbarachapman@gmail.com','bchapman','123456','customer');
INSERT INTO USER VALUES ('reisscurran@gmail.com','rcurran','123456','customer');
INSERT INTO USER VALUES ('lincolnguevara@gmail.com','lguevara','123456','customer');
INSERT INTO USER VALUES ('lillymay@gmail.com','lmay','123456','customer');
INSERT INTO USER VALUES ('korbanweir@gmail.com','kweir','123456','customer');
INSERT INTO USER VALUES ('zeenatjuarez@gmail.com','zjuarez','123456','customer');
INSERT INTO USER VALUES ('alycebowman@gmail.com','abowman','123456','customer');
INSERT INTO USER VALUES ('arlenwheatley@gmail.com','awheatley','123456','customer');
INSERT INTO USER VALUES ('ellisgreene@gmail.com','egreene','123456','customer');
INSERT INTO USER VALUES ('sadiabenton@gmail.com','sbenton','123456','customer');
INSERT INTO USER VALUES ('abdurfischer@gmail.com','afischer','123456','customer');
INSERT INTO USER VALUES ('biankarowland@gmail.com','browland','123456','customer');
INSERT INTO USER VALUES ('francishartman@gmail.com','fhartman','123456','customer');
INSERT INTO USER VALUES ('barnabymajor@gmail.com','bmajor','123456','customer');
INSERT INTO USER VALUES ('barbaralarson@gmail.com','blarson','123456','customer');
INSERT INTO USER VALUES ('anacastillo@gmail.com','acastillo','123456','customer');
INSERT INTO USER VALUES ('jackmchugh@gmail.com','jmchugh','123456','customer');
INSERT INTO USER VALUES ('larrypratt@gmail.com','lpratt','123456','manager');
INSERT INTO USER VALUES ('jenniferadams@gmail.com','jadams','123456','manager');
INSERT INTO USER VALUES ('fannienevels@gmail.com','fnevels','123456','manager');
INSERT INTO USER VALUES ('joshualittle@gmail.com','jlittle','123456','manager');
INSERT INTO USER VALUES ('rosawahl@gmail.com','rwahl','123456','manager');



CREATE TABLE THEATER (
	 Theater_Id	VARCHAR ( 20 ) NOT NULL,
	 Street	VARCHAR ( 30 ),
	 City	VARCHAR ( 20 ),
	 State 	VARCHAR ( 20 ),
	 Zipcode	VARCHAR ( 10 ),
	 Name 	VARCHAR ( 20 ),
	CONSTRAINT THEATERPK PRIMARY KEY(Theater_Id)
);
INSERT INTO THEATER VALUES ('40756','713 Hill Dr.','Tuscaloosa','Alabama','35401','Cobb');
INSERT INTO THEATER VALUES ('40757','226 Goldfield Lane','Tuscaloosa','Alabama','35404','Fox');
INSERT INTO THEATER VALUES ('40758','8950 Albany Ave.','Tuscaloosa','Alabama','35402','Fandago');

INSERT INTO THEATER VALUES ('40759','369 East Lafayette St.','Birmingham','Alabama','35005','PVR');
INSERT INTO THEATER VALUES ('40760','38 Center Court ','Birmingham','Alabama','35005','AMC');
INSERT INTO THEATER VALUES ('40761','8182 Oak Court ','Birmingham','Alabama','35005','Gothic');

INSERT INTO THEATER VALUES ('40762','910 Blue Spring St. ','Nashville','Tennessee','37214','Palace');
INSERT INTO THEATER VALUES ('40763','9645 Oak Meadow Drive ','Nashville','Tennessee','37206','Phoenix');
INSERT INTO THEATER VALUES ('40764','201 Somerset Lane','Nashville','Tennessee','37213','Paramount');



CREATE TABLE SYSTEM_INFO (
	Cancellation_Fee	Integer,
	Senior_Discount	Integer,
	Child_Discount	Integer,
	Manager_Password	VARCHAR ( 20 )
);
INSERT INTO SYSTEM_INFO VALUES (10,5,5,'I_AM_MANAGER');




CREATE TABLE IF NOT EXISTS `MOVIE` (
	`Title`	VARCHAR ( 40 ) NOT NULL,
	`Release_Date`	VARCHAR(40),
	`Rating`	VARCHAR ( 5 ),
	`Genre`	VARCHAR ( 75 ),
	`Movie_Length`	VARCHAR ( 40 ),
	`Movie_Cast`	VARCHAR ( 100 ),
	`Synopsis`	VARCHAR ( 1500 ),
	CONSTRAINT `MOVIEPK` PRIMARY KEY(`Title`)
);
INSERT INTO `MOVIE` VALUES ('The Nun','09/07/2018','R','Horror, Mystery, Thriller','1h 36min','Demian Bichir, Taissa Farmiga, Jonas Bloquet, Bonnie Aarons, Ingrid Bisu','A priest with a haunted past and a novice on the threshold of her final vows are sent by the Vatican to investigate the death of a young nun in Romania and confront a malevolent force in the form of a demonic nun.');

INSERT INTO `MOVIE` VALUES ('Assassination Nation','09/21/2018','R',' Comedy, Crime, Drama ','1h 48min','Odessa Young, Hari Nef, Abra, Suki Waterhouse, Colman Domingo','After a malicious data hack exposes the secrets of the perpetually American town of Salem, chaos decends and four girls must fight to survive, while coping with the hack themselves.');

INSERT INTO `MOVIE` VALUES ('Halloween','10/19/2018','R','Horror, Thriller','1h 46min','Jamie Lee Curtis, Judy Greer, Andi Matichak, Will Patton, Virginia Gardner','Laurie Strode confronts her long-time foe Michael Myers, the masked figure who has haunted her since she narrowly escaped his killing spree on Halloween night four decades ago.');

INSERT INTO `MOVIE` VALUES ('Creed II','11/21/2018','PG-13','Drama, Sport','2h 10min','Michael Jordan, Sylvester Stallone, Tessa Thompson, Phylicia Rashad, Dolph Lundgren','Under the tutelage of Rocky Balboa, light heavyweight contender Adonis Creed faces off against Viktor Drago, son of Ivan Drago.');

INSERT INTO `MOVIE` VALUES ('Robin Hood','11/21/2018','PG-13','Action, Adventure, Thriller','1h 56min','Taron Egerton, Jamie Foxx, Ben Mendelsohn, Eve Hewson, Tim Minchin, Jamie Dornan','A war-hardened Crusader and his Moorish commander mount an audacious revolt against the corrupt English crown in a thrilling action-adventure packed with gritty battlefield exploits, mind-blowing fight choreography, and a timeless romance.');

INSERT INTO `MOVIE` VALUES ('Mowgli: Legend of the Jungle','11/29/2018','PG-13','Adventure, Drama','1h 44min','Christian Bale, Benedict Cumberbatch, Cate Blanchett, Tom Hollander, Andy Serkis','A human child raised by wolves must face off against a menacing tiger named Shere Khan, as well as his own origins.');

INSERT INTO `MOVIE` VALUES ('The Possession of Hannah Grace','11/30/2018','R','Horror, Mystery, Thriller ','1h 25min','Shay Mitchell, Grey Damon, Kirby Johnson, Nick Thune, Louis Herthum','When a cop who is just out of rehab takes the graveyard shift in a city hospital morgue, she faces a series of bizarre, violent events caused by an evil entity in one of the corpses.');

INSERT INTO `MOVIE` VALUES ('Roma','11/21/2018','R','Drama','2h 15min','Yalitza Aparicio, Marina de Tavira, Diego Authrey, Carlos Peralta, Marco Graf','A story that chronicles a year in the life of a middle-class family in Mexico City in the early 1970s.');

INSERT INTO `MOVIE` VALUES ('Green Book','11/11/2018','PG-13','Drama, Biograohy, Comedy','2h 10min','Viggo Mortensen, Mahershala Ali, Linda Cardellini','A working-class Italian-American bouncer becomes the driver of an African-American classical pianist on a tour of venues through the 1960s American South.');

INSERT INTO `MOVIE` VALUES ('The Favourite','11/23/2018','R','Drama, Biography, Comedy','1h 59min','Olivia Colman, Emma Stone, Rachel Weisz, Nicholas Hoult, Joe Alwyn','In early 18th century England, a frail Queen Anne (Colman) occupies the throne and her close friend Lady Sarah (Weisz) governs the country in her stead. When a new servant Abigail (Stone) arrives, her charm endears her to Sarah.');

INSERT INTO `MOVIE` VALUES ('Shoplifters','11/24/2018','R','Crime, Drama','2h 1min','Lily Franky, Sakura Ando, Mayu Matsuoka, Jyo Kairi, Miyu Sasaki','A family of small-time crooks take in a child they find outside in the cold.');

INSERT INTO `MOVIE` VALUES ('Capernaum','12/04/2018','R','Crime, Drama','2h 1min','Zain Al Rafeea, Yordanos Shiferaw, Boluwatife Treasure, Bankole','While serving a five-year sentence for a violent crime, a 12-year-old boy sues his parents for neglect');

INSERT INTO `MOVIE` VALUES ('Mary Queen of Scots','12/01/2018','R','Drama','2h 1min','Angela Bain, Richard Cant, Guy Rhys, Thom Petty, Saoirse Ronan','Mary Stuart\'s attempt to overthrow her cousin Elizabeth I, Queen of England, finds her condemned to years of imprisonment before facing execution.');

INSERT INTO `MOVIE` VALUES ('The Silence','11/30/2018','R','Horror','1 45min','Kiernan Shipka, Miranda Otto, Stanley Tucci, John Cobet, Kyle Breitkopf','The Story of a family struggling to survive in a world terrorized by a deadly, primeval species who have bred for decades in the pitch darkness of a vast underground cave system, hunting only with their acute hearing. As the family seeks refuge in a remote haven where they can wait out the invasion, they start to wonder what kind of world will remain when they\'re ready to emerge.');

INSERT INTO `MOVIE` VALUES ('Ralph Breaks the Internet','11/18/2018','PG','Animation, Adventure, Comedy','1h 52min',' John C. Reilly, Sarah Silverman, Gal Gadot, Taraji P. Henson, Jack McBrayer','Six years after the events of "Wreck-It Ralph," Ralph and Vanellope, now friends, discover a wi-fi router in their arcade, leading them into a new adventure.');

INSERT INTO `MOVIE` VALUES ('If Beale Street Could Talk','11/30/2018','R','Crime, Drama, Romance','1h 59min','KiKi Layne, Stephan James, Regina King, Colman Domingo, Teyonah Parris','A woman in Harlem desperately scrambles to prove her fiancé innocent of a crime while carrying their first child.');


CREATE TABLE SHOWTIME (
	theater_id	varchar ( 20 ),
	movie_title	varchar ( 100 ),
	show_time	varchar ( 200 ),
	CONSTRAINT SHOWTIME_THEATERFK FOREIGN KEY(theater_id) REFERENCES THEATER (Theater_Id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT SHOWTIME_MOVIEPK FOREIGN KEY(movie_title) REFERENCES MOVIE(Title) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `SHOWTIME` VALUES ('40756','Ralph Breaks the Internet','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40756','The Silence','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40756','Mary Queen of Scots','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40756','Mowgli: Legend of the Jungle','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40756','The Possession of Hannah Grace','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');

INSERT INTO `SHOWTIME` VALUES ('40757','Ralph Breaks the Internet','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40757','The Silence','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40757','Mary Queen of Scots','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40757','Mowgli: Legend of the Jungle','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40757','The Possession of Hannah Grace','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');


INSERT INTO `SHOWTIME` VALUES ('40758','Ralph Breaks the Internet','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40758','The Silence','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40758','Mary Queen of Scots','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40758','Mowgli: Legend of the Jungle','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40758','The Possession of Hannah Grace','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');

INSERT INTO `SHOWTIME` VALUES ('40759','Ralph Breaks the Internet','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40759','The Silence','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40759','Mary Queen of Scots','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40759','Mowgli: Legend of the Jungle','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40759','The Possession of Hannah Grace','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');

INSERT INTO `SHOWTIME` VALUES ('40760','Ralph Breaks the Internet','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40760','The Silence','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40760','Mary Queen of Scots','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40760','Mowgli: Legend of the Jungle','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40760','The Possession of Hannah Grace','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');

INSERT INTO `SHOWTIME` VALUES ('40761','Ralph Breaks the Internet','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40761','The Silence','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40761','Mary Queen of Scots','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40761','Mowgli: Legend of the Jungle','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40761','The Possession of Hannah Grace','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');

INSERT INTO `SHOWTIME` VALUES ('40762','Ralph Breaks the Internet','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40762','The Silence','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40762','Mary Queen of Scots','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40762','Mowgli: Legend of the Jungle','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40762','The Possession of Hannah Grace','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');

INSERT INTO `SHOWTIME` VALUES ('40763','Ralph Breaks the Internet','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40763','The Silence','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40763','Mary Queen of Scots','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40763','Mowgli: Legend of the Jungle','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40763','The Possession of Hannah Grace','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');

INSERT INTO `SHOWTIME` VALUES ('40764','Ralph Breaks the Internet','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40764','The Silence','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40764','Mary Queen of Scots','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40764','Mowgli: Legend of the Jungle','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');
INSERT INTO `SHOWTIME` VALUES ('40764','The Possession of Hannah Grace','12:00PM,1:00PM,2:00PM,3:00PM,4:00PM,5:00PM,6:00PM,7:00PM,8:00PM,9:00PM,10:00PM');



CREATE TABLE IF NOT EXISTS `REVIEW` (
	`Review_ID`	VARCHAR ( 20 ) NOT NULL,
	`Movie_Title`	VARCHAR ( 40 ) NOT NULL,
	`Title`	VARCHAR ( 40 ) NOT NULL,
	`Review_Comment`	VARCHAR ( 1000 ) NOT NULL,
	`Customer_Email`	VARCHAR ( 40 ),
	`Rating`	Integer NOT NULL,
	CONSTRAINT `REVIEWPK` PRIMARY KEY(`Review_ID`),
	CONSTRAINT `REVIEWFK` FOREIGN KEY(`Movie_Title`) REFERENCES `MOVIE`(`Title`) ON DELETE CASCADE ON UPDATE CASCADE
	
);
INSERT INTO REVIEW VALUES ('10001','If Beale Street Could Talk','Positive','Its fun movie','reisscurran@gmail.com',5);
INSERT INTO REVIEW VALUES ('10002','Ralph Breaks the Internet','Positive','Its great movie','jackmchugh@gmail.com',5);
INSERT INTO REVIEW VALUES ('10003','The Silence','Positive','Its fantastic movie','jackmchugh@gmail.com',5);
INSERT INTO REVIEW VALUES ('10004','Mary Queen of Scots','Positive','Its fun movie','jackmchugh@gmail.com',5);
INSERT INTO REVIEW VALUES ('10005','Capernaum','Positive','Its great movie','lillymay@gmail.com',5);
INSERT INTO REVIEW VALUES ('10006','Shoplifters','Positive','Its fantastic movie','alycebowman@gmail.com',5);
INSERT INTO REVIEW VALUES ('10007','The Favourite','Positive','Its fun movie','majacooper@gmail.com',5);
INSERT INTO REVIEW VALUES ('10008','Green Book','Positive','Its great movie','anacastillo@gmail.com',5);
INSERT INTO REVIEW VALUES ('10009','Roma','Positive','Its fantastic movie','anacastillo@gmail.com',5);
INSERT INTO REVIEW VALUES ('10010','The Possession of Hannah Grace','Positive','Its fun movie','anacastillo@gmail.com',5);
INSERT INTO REVIEW VALUES ('10011','Mowgli: Legend of the Jungle','Positive','Its great movie','majacooper@gmail.com',5);
INSERT INTO REVIEW VALUES ('10012','Robin Hood','Positive','Its fantastic movie','barbaralarson@gmail.com',5);
INSERT INTO REVIEW VALUES ('10013','Creed II','Positive','Its fun movie','barbaralarson@gmail.com',5);
INSERT INTO REVIEW VALUES ('10014','Halloween','Positive','Its great movie','barbarachapman@gmail.com',5);
INSERT INTO REVIEW VALUES ('10015','Assassination Nation','Positive','Its fantastic movie','barbaralarson@gmail.com',5);
INSERT INTO REVIEW VALUES ('10016','The Nun','Positive','Its fun movie','arlenwheatley@gmail.com',5);
INSERT INTO REVIEW VALUES ('10017','Mowgli: Legend of the Jungle','Positive','Its great movie','lincolnguevara@gmail.com',5);
INSERT INTO REVIEW VALUES ('10018','Mowgli: Legend of the Jungle','Positive','Its fantastic movie','lillymay@gmail.com',5);
INSERT INTO REVIEW VALUES ('10019','The Nun','Positive','Its fun movie','ellisgreene@gmail.com',5);
INSERT INTO REVIEW VALUES ('10020','The Nun','Positive','Its great movie','sadiabenton@gmail.com',5);
INSERT INTO REVIEW VALUES ('10021','Halloween','Positive','Its fantastic movie','sadiabenton@gmail.com',5);
INSERT INTO REVIEW VALUES ('10022','Halloween','Positive','Its fun movie','biankarowland@gmail.com',5);
INSERT INTO REVIEW VALUES ('10023','Mowgli: Legend of the Jungle','Positive','Its great movie','sadiabenton@gmail.com',5);
INSERT INTO REVIEW VALUES ('10024','Halloween','Positive','Its fantastic movie','barnabymajor@gmail.com',5);




CREATE TABLE IF NOT EXISTS `REVENUE_REPORT` (
	`Movie_month`	varchar ( 10 ),
	`Revenue_Amount`	Integer
);

INSERT INTO REVENUE_REPORT VALUES('12/2018','537.5');
INSERT INTO REVENUE_REPORT VALUES('11/2018','374.5');
INSERT INTO REVENUE_REPORT VALUES('10/2018','156');


CREATE TABLE IF NOT EXISTS `POPULAR_MOVIES` (
	`Movie_month`	varchar ( 10 ),
	`Movie_title`	varchar ( 100 ),
	`Total_bought_tickits`	integer
);

INSERT INTO POPULAR_MOVIES VALUES('09/2018','The Nun', 30);
INSERT INTO POPULAR_MOVIES VALUES('10/2018','Halloween', 56);
INSERT INTO POPULAR_MOVIES VALUES('11/2018','Mary Queen of Scots', 78);
INSERT INTO POPULAR_MOVIES VALUES('12/2018','Mowgli: Legend of the Jungle',50);
INSERT INTO POPULAR_MOVIES VALUES('09/2018','The Possession of Hannah Grace', 20);

INSERT INTO POPULAR_MOVIES VALUES('09/2018','The Nun', 30);
INSERT INTO POPULAR_MOVIES VALUES('10/2018','Halloween', 56);
INSERT INTO POPULAR_MOVIES VALUES('11/2018','Mary Queen of Scots', 78);
INSERT INTO POPULAR_MOVIES VALUES('12/2018','Mowgli: Legend of the Jungle',50);
INSERT INTO POPULAR_MOVIES VALUES('09/2018','The Possession of Hannah Grace', 20);

CREATE TABLE IF NOT EXISTS `PREFERS` (
	`Theater_ID`	varchar ( 20 ),
	`Username`	CHAR ( 15 ),
	`Email`	varchar ( 40 ));

INSERT INTO `PREFERS` VALUES ('40756','arogers','aleciarogers@gmail.com');
INSERT INTO `PREFERS` VALUES ('40757','arogers','aleciarogers@gmail.com');

INSERT INTO `PREFERS` VALUES ('40756','dprice','dominicprice@gmail.com');
INSERT INTO `PREFERS` VALUES ('40757','dprice','dominicprice@gmail.com');

INSERT INTO `PREFERS` VALUES ('40758','mcooper','majacooper@gmail.com');
INSERT INTO `PREFERS` VALUES ('40759','mcooper','majacooper@gmail.com');

INSERT INTO `PREFERS` VALUES ('40759','lguevara','lincolnguevara@gmail.com');
INSERT INTO `PREFERS` VALUES ('40760','lguevara','lincolnguevara@gmail.com');

INSERT INTO `PREFERS` VALUES ('40759','lmay','lillymay@gmail.com');
INSERT INTO `PREFERS` VALUES ('40760','lmay','lillymay@gmail.com');

INSERT INTO `PREFERS` VALUES ('40759','kweir','korbanweir@gmail.com');
INSERT INTO `PREFERS` VALUES ('40760','kweir','korbanweir@gmail.com');

INSERT INTO `PREFERS` VALUES ('40761','egreene','ellisgreene@gmail.com');
INSERT INTO `PREFERS` VALUES ('40762','egreene','ellisgreene@gmail.com');

INSERT INTO `PREFERS` VALUES ('40761','jmchugh','jackmchugh@gmail.com');
INSERT INTO `PREFERS` VALUES ('40762','jmchugh','jackmchugh@gmail.com');

INSERT INTO `PREFERS` VALUES ('40761','acastillo','anacastillo@gmail.com');
INSERT INTO `PREFERS` VALUES ('40762','acastillo','anacastillo@gmail.com');




CREATE TABLE IF NOT EXISTS `PLAYS_AT` (
	`theater_id`	varchar ( 20 ),
	`movie_title`	varchar ( 100 ),
	`playing`	varchar ( 200 ),
	CONSTRAINT `PLAYS_THEATERFK` FOREIGN KEY(`theater_id`) REFERENCES `THEATER`(`Theater_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `PLAYS_MOVIEPK` FOREIGN KEY(`movie_title`) REFERENCES `MOVIE`(`Title`) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO `PLAYS_AT` VALUES ('40756','Ralph Breaks the Internet','YES');
INSERT INTO `PLAYS_AT` VALUES ('40756','The Silence','YES');
INSERT INTO `PLAYS_AT` VALUES ('40756','Mary Queen of Scots','YES');
INSERT INTO `PLAYS_AT` VALUES ('40756','Mowgli: Legend of the Jungle','YES');
INSERT INTO `PLAYS_AT` VALUES ('40756','The Possession of Hannah Grace','YES');

INSERT INTO `PLAYS_AT` VALUES ('40757','Ralph Breaks the Internet','YES');
INSERT INTO `PLAYS_AT` VALUES ('40757','The Silence','YES');
INSERT INTO `PLAYS_AT` VALUES ('40757','Mary Queen of Scots','YES');
INSERT INTO `PLAYS_AT` VALUES ('40757','Mowgli: Legend of the Jungle','YES');
INSERT INTO `PLAYS_AT` VALUES ('40757','The Possession of Hannah Grace','YES');

INSERT INTO `PLAYS_AT` VALUES ('40758','Ralph Breaks the Internet','YES');
INSERT INTO `PLAYS_AT` VALUES ('40758','The Silence','YES');
INSERT INTO `PLAYS_AT` VALUES ('40758','Mary Queen of Scots','YES');
INSERT INTO `PLAYS_AT` VALUES ('40758','Mowgli: Legend of the Jungle','YES');
INSERT INTO `PLAYS_AT` VALUES ('40758','The Possession of Hannah Grace','YES');

INSERT INTO `PLAYS_AT` VALUES ('40759','Ralph Breaks the Internet','YES');
INSERT INTO `PLAYS_AT` VALUES ('40759','The Silence','YES');
INSERT INTO `PLAYS_AT` VALUES ('40759','Mary Queen of Scots','YES');
INSERT INTO `PLAYS_AT` VALUES ('40759','Mowgli: Legend of the Jungle','YES');
INSERT INTO `PLAYS_AT` VALUES ('40759','The Possession of Hannah Grace','YES');

INSERT INTO `PLAYS_AT` VALUES ('40760','Ralph Breaks the Internet','YES');
INSERT INTO `PLAYS_AT` VALUES ('40760','The Silence','YES');
INSERT INTO `PLAYS_AT` VALUES ('40760','Mary Queen of Scots','YES');
INSERT INTO `PLAYS_AT` VALUES ('40760','Mowgli: Legend of the Jungle','YES');
INSERT INTO `PLAYS_AT` VALUES ('40760','The Possession of Hannah Grace','YES');

INSERT INTO `PLAYS_AT` VALUES ('40761','Ralph Breaks the Internet','YES');
INSERT INTO `PLAYS_AT` VALUES ('40761','The Silence','YES');
INSERT INTO `PLAYS_AT` VALUES ('40761','Mary Queen of Scots','YES');
INSERT INTO `PLAYS_AT` VALUES ('40761','Mowgli: Legend of the Jungle','YES');
INSERT INTO `PLAYS_AT` VALUES ('40761','The Possession of Hannah Grace','YES');

INSERT INTO `PLAYS_AT` VALUES ('40762','Ralph Breaks the Internet','YES');
INSERT INTO `PLAYS_AT` VALUES ('40762','The Silence','YES');
INSERT INTO `PLAYS_AT` VALUES ('40762','Mary Queen of Scots','YES');
INSERT INTO `PLAYS_AT` VALUES ('40762','Mowgli: Legend of the Jungle','YES');
INSERT INTO `PLAYS_AT` VALUES ('40762','The Possession of Hannah Grace','YES');

INSERT INTO `PLAYS_AT` VALUES ('40763','Ralph Breaks the Internet','YES');
INSERT INTO `PLAYS_AT` VALUES ('40763','The Silence','YES');
INSERT INTO `PLAYS_AT` VALUES ('40763','Mary Queen of Scots','YES');
INSERT INTO `PLAYS_AT` VALUES ('40763','Mowgli: Legend of the Jungle','YES');
INSERT INTO `PLAYS_AT` VALUES ('40763','The Possession of Hannah Grace','YES');

INSERT INTO `PLAYS_AT` VALUES ('40764','Ralph Breaks the Internet','YES');
INSERT INTO `PLAYS_AT` VALUES ('40764','The Silence','YES');
INSERT INTO `PLAYS_AT` VALUES ('40764','Mary Queen of Scots','YES');
INSERT INTO `PLAYS_AT` VALUES ('40764','Mowgli: Legend of the Jungle','YES');
INSERT INTO `PLAYS_AT` VALUES ('40764','The Possession of Hannah Grace','YES');




CREATE TABLE IF NOT EXISTS `PAYMENT_INFO` (
	`Username`	char ( 15 ),
	`Email`	varchar ( 40 ),
	`Cardnumber`	varchar ( 40 ),
	`Cvv`	varchar ( 3 ),
	`Name_on_card`	varchar ( 50 ),
	`Card_expirationdate`	varchar ( 9 ),
	CONSTRAINT `PAYMENT_PK` PRIMARY KEY(`Cardnumber`),
	CONSTRAINT `PAYMENT_FK` FOREIGN KEY(`Email`,`Username`) REFERENCES `USER`(`Email`,`Username`) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `PAYMENT_INFO` VALUES ('lguevara','lincolnguevara@gmail.com','4641520719398145','933','Lincoln Guevara','09/2023');
INSERT INTO `PAYMENT_INFO` VALUES ('lguevara','lincolnguevara@gmail.com','4915440532158940','633','Lincoln Guevara','01/2023');
INSERT INTO `PAYMENT_INFO` VALUES ('lguevara','lincolnguevara@gmail.com','4035383628766405','705','Lincoln Guevara','05/2024');

INSERT INTO `PAYMENT_INFO` VALUES ('lmay','lillymay@gmail.com','4456198088208627','870','Lilly May','12/2018');
INSERT INTO `PAYMENT_INFO` VALUES ('lmay','lillymay@gmail.com','4314805358177637','330','Lilly May','03/2021');

INSERT INTO `PAYMENT_INFO` VALUES ('kweir','korbanweir@gmail.com','4517101064364791','828','Korban Weir','10/2021');
INSERT INTO `PAYMENT_INFO` VALUES ('kweir','korbanweir@gmail.com','4879742640992019','897','Korban Weir','03/2026');

INSERT INTO `PAYMENT_INFO` VALUES ('zjuarez','zeenatjuarez@gmail.com','4022882936623013','402','Zeenat Juarez','07/2022');
INSERT INTO `PAYMENT_INFO` VALUES ('zjuarez','zeenatjuarez@gmail.com','4829437266088371','976','Zeenat Juarez','06/2019');

INSERT INTO `PAYMENT_INFO` VALUES ('abowman','alycebowman@gmail.com','4586294192997248','230','Alyce Bowman','01/2020');
INSERT INTO `PAYMENT_INFO` VALUES ('abowman','alycebowman@gmail.com','4746267506195953','629','Alyce Bowman','02/2024');
INSERT INTO `PAYMENT_INFO` VALUES ('abowman','alycebowman@gmail.com','4285093600389509','261','Alyce Bowman','12/2018');

INSERT INTO `PAYMENT_INFO` VALUES ('awheatley','arlenwheatley@gmail.com','4823372901821983','549','Arlen Wheatley','07/2020');
INSERT INTO `PAYMENT_INFO` VALUES ('awheatley','arlenwheatley@gmail.com','4635362341103215','343','Arlen Wheatley','10/2027');

INSERT INTO `PAYMENT_INFO` VALUES ('egreene','ellisgreene@gmail.com','4111739839871994','846','Ellis Greene','01/2020');
INSERT INTO `PAYMENT_INFO` VALUES ('egreene','ellisgreene@gmail.com','4929080365156209','219','Ellis Greene','10/2027');




CREATE TABLE IF NOT EXISTS `ORDER_INFO` (
	`Order_Id`	VARCHAR ( 20 ),
	`Order_Date`	VARCHAR ( 20 ),
	`Time`	VARCHAR ( 10 ),
	`Status`	VARCHAR ( 10 ),
	`Senior_Tickits`	Integer,
	`Child_Tickits`	Integer,
	`Adult_Tickits`	Integer,
	`Total_Tickits`	Integer,
	`TotalCost`	VARCHAR ( 16 ),
	`CardNo`	VARCHAR ( 40 ),
	`Theater_Id`	VARCHAR ( 20 ),
	`Customer_Username`	CHAR ( 15 ),
	`Email`	VARCHAR ( 40 ),
	`Movie_Title`	VARCHAR ( 50 ),
	CONSTRAINT `ORDERPK` PRIMARY KEY(`Order_Id`)
);
INSERT INTO `ORDER_INFO` VALUES ('10001','12/07/2018','4:00PM','Unused',0,0,2,2,'22.25','4735460044089647','40756','arogers','aleciarogers@gmail.com','Robin Hood');

INSERT INTO `ORDER_INFO` VALUES ('10002','12/07/2018','5:00PM','Unused',0,0,2,2,'22.25','4236743911628215','40757','dprice','dominicprice@gmail.com','The Silence');
INSERT INTO `ORDER_INFO` VALUES ('10046','12/06/2018','5:00PM','Unused',0,0,2,2,'22.25','4236743911628215','40757','dprice','dominicprice@gmail.com','Shoplifters');


INSERT INTO `ORDER_INFO` VALUES ('10003','12/03/2018','2:00PM','Cancelled',0,0,1,1,'5.25','4978236706211315','40757','mcooper','majacooper@gmail.com','Green Book');
INSERT INTO `ORDER_INFO` VALUES ('10004','11/30/2018','3:00PM','Completed',0,2,2,4,'39.25','4502525703046418','40757','mcooper','majacooper@gmail.com','Mowgli: Legend of the Jungle');
INSERT INTO `ORDER_INFO` VALUES ('10005','12/01/2018','4:00PM','Completed',1,0,2,3,'25.25','4846224896905417','40758','mcooper','majacooper@gmail.com','The Favourite');
INSERT INTO `ORDER_INFO` VALUES ('10006','12/08/2018','5:00PM','Unused',0,0,2,2,'22.25','4236743911628215','40756','mcooper','majacooper@gmail.com','Capernaum');

INSERT INTO `ORDER_INFO` VALUES ('10007','12/07/2018','5:00PM','Unused',0,0,1,1,'10.25','4543942323452028','40757','bchapman','barbarachapman@gmail.com','Robin Hood');
INSERT INTO `ORDER_INFO` VALUES ('10008','11/19/2018','5:00PM','Cancelled',0,0,1,1,'5.25','4543942323452028','40759','bchapman','barbarachapman@gmail.com','Green Book');
INSERT INTO `ORDER_INFO` VALUES ('10009','10/25/2018','9:00PM','Completed',0,0,1,1,'10.25','4796800049481586','40757','bchapman','barbarachapman@gmail.com','Halloween');

INSERT INTO `ORDER_INFO` VALUES ('10010','12/07/2018','5:00PM','Unused',0,0,2,2,'22.25','4236743911628215','40757','rcurran','reisscurran@gmail.com','The Silence');
INSERT INTO `ORDER_INFO` VALUES ('10041','11/30/2018','10:00PM','Completed',0,0,1,1,'10.25','4236743911628215','40758','rcurran','reisscurran@gmail.com','If Beale Street Could Talk');


INSERT INTO `ORDER_INFO` VALUES ('10011','12/07/2018','9:00PM','Unused',0,0,1,1,'10.25','4641520719398145','40757','lguevara','lincolnguevara@gmail.com','The Silence');
INSERT INTO `ORDER_INFO` VALUES ('10012','10/30/2018','5:00PM','Completed',0,0,1,1,'10.25','4641520719398145','40758','lguevara','lincolnguevara@gmail.com','Halloween');
INSERT INTO `ORDER_INFO` VALUES ('10048','11/30/2018','5:00PM','Completed',0,0,2,2,'22.25','4035383628766405','40756','lguevara','lincolnguevara@gmail.com','Mowgli: Legend of the Jungle');

INSERT INTO `ORDER_INFO` VALUES ('10013','12/07/2018','9:00PM','Unused',0,0,1,1,'10.25','4456198088208627','40757','lmay','lillymay@gmail.com','The Silence');
INSERT INTO `ORDER_INFO` VALUES ('10014','11/22/2018','4:00PM','Cancelled',0,0,1,1,'5.25','4456198088208627','40757','lmay','lillymay@gmail.com','Roma');
INSERT INTO `ORDER_INFO` VALUES ('10015','11/25/2018','9:00PM','Completed',0,0,1,1,'10.25','4314805358177637','40756','lmay','lillymay@gmail.com','Mowgli: Legend of the Jungle');

INSERT INTO `ORDER_INFO` VALUES ('10016','12/07/2018','6:00PM','Unused',0,1,1,2,'16.25','4517101064364791','40757','kweir','korbanweir@gmail.com','The Silence');
INSERT INTO `ORDER_INFO` VALUES ('10017','11/29/2018','6:00PM','Cancelled',0,0,1,1,'5.25','4517101064364791','40762','kweir','korbanweir@gmail.com','The Favourite');
INSERT INTO `ORDER_INFO` VALUES ('10018','11/29/2018','10:00PM','Completed',0,2,2,4,'36.25','4517101064364791','40762','kweir','korbanweir@gmail.com','Mowgli: Legend of the Jungle');

INSERT INTO `ORDER_INFO` VALUES ('10019','12/07/2018','5:00PM','Unused',0,1,1,2,'16.25','4022882936623013','40757','zjuarez','zeenatjuarez@gmail.com','The Silence');
INSERT INTO `ORDER_INFO` VALUES ('10020','11/27/2018','6:00PM','Cancelled',0,1,1,2,'5.25','4022882936623013','40757','zjuarez','zeenatjuarez@gmail.com','The Favourite');
INSERT INTO `ORDER_INFO` VALUES ('10049','11/29/2018','10:00PM','Completed',0,1,1,2,'16.25','4022882936623013','40757','zjuarez','zeenatjuarez@gmail.com','Mowgli: Legend of the Jungle');

INSERT INTO `ORDER_INFO` VALUES ('10021','12/07/2018','4:00PM','Unused',0,0,2,2,'22.25','4586294192997248','40756','abowman','alycebowman@gmail.com','Robin Hood');

INSERT INTO `ORDER_INFO` VALUES ('10022','12/07/2018','5:00PM','Unused',0,1,1,2,'16.25','4823372901821983','40757','awheatley','arlenwheatley@gmail.com','The Silence');
INSERT INTO `ORDER_INFO` VALUES ('10023','09/15/2018','10:00PM','Completed',0,1,1,2,'16.25','4022882936623013','40757','awheatley','arlenwheatley@gmail.com','The Nun');

INSERT INTO `ORDER_INFO` VALUES ('10024','09/22/2018','10:00PM','Cancelled',0,1,1,2,'8.25','4111739839871994','40757','egreene','ellisgreene@gmail.com','Assassination Nation');
INSERT INTO `ORDER_INFO` VALUES ('10025','09/15/2018','10:00PM','Completed',0,1,1,2,'16.25','4111739839871994','40757','egreene','ellisgreene@gmail.com','The Nun');

INSERT INTO `ORDER_INFO` VALUES ('10026','09/15/2018','10:00PM','Completed',0,1,1,2,'16.25','4861943321079247','40757','sbenton','sadiabenton@gmail.com','The Nun');
INSERT INTO `ORDER_INFO` VALUES ('10027','10/30/2018','4:00PM','Cancelled',0,1,1,2,'10.25','4861943321079247','40757','sbenton','sadiabenton@gmail.com','Halloween');
INSERT INTO `ORDER_INFO` VALUES ('10028','10/25/2018','5:00PM','Completed',0,1,1,2,'16.25','4861943321079247','40757','sbenton','sadiabenton@gmail.com','Halloween');
INSERT INTO `ORDER_INFO` VALUES ('10029','11/29/2018','6:00PM','Completed',0,1,1,2,'16.25','4861943321079247','40757','sbenton','sadiabenton@gmail.com','Mowgli: Legend of the Jungle');

INSERT INTO `ORDER_INFO` VALUES ('10030','10/25/2018','5:00PM','Completed',0,1,1,2,'16.25','4676451244387015','40757','afischer','abdurfischer@gmail.com','Halloween');

INSERT INTO `ORDER_INFO` VALUES ('10031','10/25/2018','5:00PM','Completed',0,1,1,2,'16.25','4750185229243483','40757','browland','biankarowland@gmail.com','Halloween');
INSERT INTO `ORDER_INFO` VALUES ('10032','09/15/2018','5:00PM','Completed',0,1,1,2,'16.25','4750185229243483','40757','browland','biankarowland@gmail.com','The Nun');
INSERT INTO `ORDER_INFO` VALUES ('10033','11/29/2018','5:00PM','Completed',1,1,1,3,'22.25','4750185229243483','40757','browland','biankarowland@gmail.com','Mowgli: Legend of the Jungle');

INSERT INTO `ORDER_INFO` VALUES ('10034','11/27/2018','6:00PM','Cancelled',0,1,1,2,'5.25','4801627950452568','40757','fhartman','francishartman@gmail.com','The Favourite');

INSERT INTO `ORDER_INFO` VALUES ('10050','09/17/2018','6:00PM','Completed',0,1,1,2,'16.25','4650205028333243','40757','bmajor','barnabymajor@gmail.com','The Nun');
INSERT INTO `ORDER_INFO` VALUES ('10051','11/27/2018','6:00PM','Completed',0,1,1,2,'16.25','4650205028333243','40757','bmajor','barnabymajor@gmail.com','Mowgli: Legend of the Jungle');
INSERT INTO `ORDER_INFO` VALUES ('10052','10/29/2018','6:00PM','Completed',0,1,1,2,'16.25','4650205028333243','40757','bmajor','barnabymajor@gmail.com','Halloween');


INSERT INTO `ORDER_INFO` VALUES ('10035','09/27/2018','6:00PM','Completed',0,1,1,2,'16.25','4567323754519687','40757','blarson','barbaralarson@gmail.com','Assassination Nation');
INSERT INTO `ORDER_INFO` VALUES ('10036','11/27/2018','6:00PM','Completed',0,0,1,2,'10.25','4567323754519687','40757','blarson','barbaralarson@gmail.com','Creed II');
INSERT INTO `ORDER_INFO` VALUES ('10037','11/30/2018','6:00PM','Completed',1,1,1,3,'22.25','4567323754519687','40757','blarson','barbaralarson@gmail.com','Robin Hood');

INSERT INTO `ORDER_INFO` VALUES ('10038','11/27/2018','6:00PM','Completed',1,1,1,3,'22.25','4783475064745689','40757','acastillo','anacastillo@gmail.com','Green Book');
INSERT INTO `ORDER_INFO` VALUES ('10039','11/27/2018','6:00PM','Completed',0,1,1,2,'16.25','4783475064745689','40757','acastillo','anacastillo@gmail.com','Roma');
INSERT INTO `ORDER_INFO` VALUES ('10040','11/30/2018','6:00PM','Completed',1,1,1,3,'22.25','4783475064745689','40757','acastillo','anacastillo@gmail.com','The Possession of Hannah Grace');


INSERT INTO `ORDER_INFO` VALUES ('10042','11/20/2018','6:00PM','Completed',1,1,1,3,'22.25','4783475064745689','40757','jmchugh','jackmchugh@gmail.com','Ralph Breaks the Internet');
INSERT INTO `ORDER_INFO` VALUES ('10043','11/30/2018','10:00PM','Completed',1,1,1,3,'22.25','4783475064745689','40757','jmchugh','jackmchugh@gmail.com','The Silence');
INSERT INTO `ORDER_INFO` VALUES ('10044','12/02/2018','6:00PM','Completed',1,1,1,3,'22.25','4783475064745689','40757','jmchugh','jackmchugh@gmail.com','Mary Queen of Scots');

INSERT INTO `ORDER_INFO` VALUES ('10045','12/04/2018','5:00PM','Completed',0,0,2,2,'22.25','4236743911628215','40756','lmay','lillymay@gmail.com','Capernaum');

INSERT INTO `ORDER_INFO` VALUES ('10047','11/28/2018','4:00PM','Completed',0,0,2,2,'22.25','4586294192997248','40756','abowman','alycebowman@gmail.com','Shoplifters');
