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
INSERT INTO USER VALUES ('test1@gmail.com','test1','123456','customer');
INSERT INTO USER VALUES ('test2@gmail.com','test2','123456','customer');
INSERT INTO USER VALUES ('test3@gmail.com','test3','123456','customer');
INSERT INTO USER VALUES ('test4@gmail.com','test4','123456','customer');
INSERT INTO USER VALUES ('test5@gmail.com','test5','123456','customer');
INSERT INTO USER VALUES ('test6@gmail.com','test6','123456','customer');
INSERT INTO USER VALUES ('manager1@gmail.com','manager1','123456','manager');
INSERT INTO USER VALUES ('manager2@gmail.com','manager2','123456','manager');
INSERT INTO USER VALUES ('manager3@gmail.com','manager3','123456','manager');



CREATE TABLE THEATER (
	 Theater_Id	VARCHAR ( 20 ) NOT NULL,
	 Street	VARCHAR ( 30 ),
	 City	VARCHAR ( 20 ),
	 State 	VARCHAR ( 20 ),
	 Zipcode	VARCHAR ( 10 ),
	 Name 	VARCHAR ( 20 ),
	CONSTRAINT THEATERPK PRIMARY KEY(Theater_Id)
);
INSERT INTO THEATER VALUES ('theater1','123 Test street','Tuscaloosa','Alabama','Zipcode','Theater 1');
INSERT INTO THEATER VALUES ('theater2','2 Test street','Tuscaloosa','Alabama','Zipcode','Theater 2');
INSERT INTO THEATER VALUES ('theater3','3 Test street','Tuscaloosa','Alabama','Zipcode','Theater 3');
INSERT INTO THEATER VALUES ('theater4','4 Test street','Tuscaloosa','Alabama','Zipcode','Theater 4');

CREATE TABLE SYSTEM_INFO (
	Cancellation_Fee	Integer,
	Senior_Discount	Integer,
	Child_Discount	Integer,
	Manager_Password	VARCHAR ( 20 )
);
INSERT INTO SYSTEM_INFO VALUES (10,5,5,'I_AM_MANAGER');

CREATE TABLE IF NOT EXISTS `MOVIE` (
	`Title`	VARCHAR ( 40 ) NOT NULL,
	`Release_Date`	DATE,
	`Rating`	VARCHAR ( 5 ),
	`Genre`	VARCHAR ( 75 ),
	`Movie_Length`	VARCHAR ( 5 ),
	`Movie_Cast`	VARCHAR ( 100 ),
	`Synopsis`	VARCHAR ( 1500 ),
	CONSTRAINT `MOVIEPK` PRIMARY KEY(`Title`)
);
INSERT INTO `MOVIE` VALUES ('Spiderman','09/13/2018','PG-13','Action','189','Peter Parker','Spider Man Its Spider Man');
INSERT INTO `MOVIE` VALUES ('Superman','09/25/2018','PG-13','Action','159','Clark Kent','Super Man Its Super Man');
INSERT INTO `MOVIE` VALUES ('Batman','10/13/2018','PG-13','Action','199','Bruce Wayne','I am Batman');


CREATE TABLE SHOWTIME (
	theater_id	varchar ( 20 ),
	movie_title	varchar ( 100 ),
	show_time	varchar ( 200 ),
	CONSTRAINT SHOWTIME_THEATERFK FOREIGN KEY(theater_id) REFERENCES THEATER (Theater_Id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT SHOWTIME_MOVIEPK FOREIGN KEY(movie_title) REFERENCES MOVIE(Title) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `SHOWTIME` VALUES ('theater1','Spiderman','12:00PM,4:00PM,8:00PM');
INSERT INTO `SHOWTIME` VALUES ('theater1','Spiderman','12:00PM,4:00PM,8:00PM');
INSERT INTO `SHOWTIME` VALUES ('theater2','Superman','12:00PM,4:00PM,8:00PM');
INSERT INTO `SHOWTIME` VALUES ('theater1','Batman','12:00PM,4:00PM,8:00PM');



CREATE TABLE IF NOT EXISTS `REVIEW` (
	`Review_ID`	VARCHAR ( 20 ) NOT NULL,
	`Title`	VARCHAR ( 40 ) NOT NULL,
	`Review_Comment`	VARCHAR ( 1000 ) NOT NULL,
	`Customer_Email`	VARCHAR ( 40 ),
	`Rating`	Integer NOT NULL,
	CONSTRAINT `REVIEWPK` PRIMARY KEY(`Review_ID`),
	CONSTRAINT `REVIEWFK` FOREIGN KEY(`Title`) REFERENCES `MOVIE`(`Title`) ON DELETE CASCADE ON UPDATE CASCADE
	
);
INSERT INTO REVIEW VALUES ('123456','Spiderman','Its fun movie','test1@gmail.com',5);
INSERT INTO REVIEW VALUES ('145626','Superman','Its great movie','test2@gmail.com',5);
INSERT INTO REVIEW VALUES ('188826','Batman','Its fantastic movie','test3@gmail.com',5);





CREATE TABLE IF NOT EXISTS `REVENUE_REPORT` (
	`Movie_month`	varchar ( 10 ),
	`Revenue_Amount`	Integer,
	CONSTRAINT `REVENUE_PK` PRIMARY KEY(`Movie_month`)
);



CREATE TABLE IF NOT EXISTS `PREFERS` (
	`Theater_ID`	varchar ( 20 ),
	`Username`	CHAR ( 15 ),
	`Email`	varchar ( 40 ),
	CONSTRAINT `PREFERS_FK` FOREIGN KEY(`Theater_ID`) REFERENCES `THEATER`(`Theater_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `PREFERS_FK1` FOREIGN KEY(`Email`,`Username`) REFERENCES `USER`(`Email`,`Username`) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `PREFERS` VALUES ('theater1','test1','test1@gmail.com');
INSERT INTO `PREFERS` VALUES ('theater2','test1','test1@gmail.com');
INSERT INTO `PREFERS` VALUES ('theater3','test2','test2@gmail.com');
INSERT INTO `PREFERS` VALUES ('theater1','test2','test2@gmail.com');




CREATE TABLE IF NOT EXISTS `POPULAR_MOVIES` (
	`Movie_month`	varchar ( 10 ),
	`Movie_title`	varchar ( 100 ),
	`Total_bought_tickits`	integer,
	CONSTRAINT `popular_movies_pk` PRIMARY KEY(`Movie_month`)
);





CREATE TABLE IF NOT EXISTS `PLAYS_AT` (
	`theater_id`	varchar ( 20 ),
	`movie_title`	varchar ( 100 ),
	`playing`	varchar ( 200 ),
	CONSTRAINT `PLAYS_THEATERFK` FOREIGN KEY(`theater_id`) REFERENCES `THEATER`(`Theater_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `PLAYS_MOVIEPK` FOREIGN KEY(`movie_title`) REFERENCES `MOVIE`(`Title`) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `PLAYS_AT` VALUES ('theater1','Spiderman','Yes');
INSERT INTO `PLAYS_AT` VALUES ('theater1','Spiderman','Yes');
INSERT INTO `PLAYS_AT` VALUES ('theater1','Superman','Yes');
INSERT INTO `PLAYS_AT` VALUES ('theater1','Spiderman','Yes');
INSERT INTO `PLAYS_AT` VALUES ('theater1','Superman','Yes');
INSERT INTO `PLAYS_AT` VALUES ('theater1','Superman','No');
INSERT INTO `PLAYS_AT` VALUES ('theater2','Spiderman','Yes');





CREATE TABLE IF NOT EXISTS `PAYMENT_INFO` (
	`Username`	char ( 15 ),
	`Email`	varchar ( 40 ),
	`Cardnumber`	varchar ( 16 ),
	`Cvv`	varchar ( 3 ),
	`Name_on_card`	varchar ( 50 ),
	`Card_expirationdate`	varchar ( 9 ),
	`Saved`	Varchar ( 10 ),
	CONSTRAINT `PAYMENT_PK` PRIMARY KEY(`Cardnumber`),
	CONSTRAINT `PAYMENT_FK` FOREIGN KEY(`Email`,`Username`) REFERENCES `USER`(`Email`,`Username`) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `PAYMENT_INFO` VALUES ('test1','test1@gmail.com','12341231234','333','Apurva Patel','10/2019','Yes');
INSERT INTO `PAYMENT_INFO` VALUES ('test2','test2@gmail.com','1241123442123212','333','Apurva Patel','10/2019','Yes');






CREATE TABLE IF NOT EXISTS `ORDER_INFO` (
	`Order_Id`	VARCHAR ( 20 ),
	`Order_Date`	Date,
	`Time`	VARCHAR ( 10 ),
	`Status`	VARCHAR ( 10 ),
	`Senior_Tickits`	Integer,
	`Child_Tickits`	Integer,
	`Adult_Tickits`	Integer,
	`Total_Tickits`	Integer,
	`CardNo`	VARCHAR ( 16 ),
	`Theater_Id`	VARCHAR ( 20 ),
	`Customer_Username`	CHAR ( 15 ),
	`Email`	VARCHAR ( 40 ),
	`Movie_Title`	VARCHAR ( 50 ),
	CONSTRAINT `ORDERPK` PRIMARY KEY(`Order_Id`),
	CONSTRAINT `ORDER_FK` FOREIGN KEY(`Email`,`Customer_Username`) REFERENCES `USER`(`Email`,`Username`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `ORDER_TITLE_FK` FOREIGN KEY(`Movie_Title`) REFERENCES `MOVIE`(`Title`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `ORDER_CARDNOFK` FOREIGN KEY(`CardNo`) REFERENCES `PAYMENT_INFO`(`Cardnumber`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `ORDER_EFK` FOREIGN KEY(`Theater_Id`) REFERENCES `THEATER`(`Theater_Id`) ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO `ORDER_INFO` VALUES ('order1','09/2018','6:00PM','Open',0,0,2,2,'1241123442123212','theater1','test1','test1@gmail.com','Spiderman');
