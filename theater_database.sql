DROP TABLE IF EXISTS USER;
DROP TABLE IF EXISTS THEATER;
DROP TABLE IF EXISTS SYSTEM_INFO;
DROP TABLE IF EXISTS REVIEW;
/*`DROP TABLE IF EXISTS RESERVE;
*/DROP TABLE IF EXISTS PLAYS_AT;
DROP TABLE IF EXISTS PAYMENT_INFO;
DROP TABLE IF EXISTS ORDER_INFO;
DROP TABLE IF EXISTS MOVIE;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS POPULAR_MOVIES;
DROP TABLE IF EXISTS REVENUE_REPORT;
/*DROP TABLE IF EXISTS PURCHASE_INFO;
*/

/*
	Missing theater saved
*/
CREATE TABLE USER
(
	Email VARCHAR(40) NOT NULL,
	Username CHAR(15) NOT NULL,
	Password VARCHAR(7) NOT NULL,
	User_Type VARCHAR(12) NOT NULL,
	CONSTRAINT USERPK PRIMARY KEY (Email)
);



INSERT INTO USER VALUES ('test1@gmail.com','test1','123456','customer');
INSERT INTO USER VALUES ('test2@gmail.com','test2','123456','customer');
INSERT INTO USER VALUES ('test3@gmail.com','test3','123456','customer');
INSERT INTO USER VALUES ('test4@gmail.com','test4','123456','customer');
INSERT INTO USER VALUES ('test5@gmail.com','test5','123456','customer');
INSERT INTO USER VALUES ('manager1@gmail.com','manager1','123456','manager');
INSERT INTO USER VALUES ('manager2@gmail.com','manager2','123456','manager');


CREATE TABLE CUSTOMER
(
	Customer_Email VARCHAR(40),
	Order_Id VARCHAR(10),
	CONSTRAINT CSTMRPK PRIMARY KEY(Customer_Email, Order_Id),
	CONSTRAINT CSTMR_EKF FOREIGN KEY(Customer_Email) REFERENCES USER (Email) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT CSTMR_EKF FOREIGN KEY(Order_Id)  REFERENCES ORDER_INFO(Order_Id)
);


INSERT INTO CUSTOMER VALUES ('test1@gmail.com','123');
INSERT INTO CUSTOMER VALUES ('test2@gmail.com','987');

CREATE TABLE MOVIE
(
	Title VARCHAR(40) NOT NULL,
	Release_Date DATE,
	Rating VARCHAR(5),
	Genre VARCHAR(75),
	Movie_Length VARCHAR(5),
	Movie_Cast VARCHAR(100),
	Synopsis VARCHAR(1500),
	CONSTRAINT MOVIEPK PRIMARY KEY(Title)
);

INSERT INTO MOVIE VALUES ('Beast', '10-10-2018','PG', '201', 'Action', 'IDK MOVIE CASTING','ITS A GREAT MOVIE');
INSERT INTO MOVIE VALUES ('Batman', '10-04-2018','PG', '191', 'Action', 'IDK MOVIE CASTING','ITS A GREAT MOVIE');
INSERT INTO MOVIE VALUES ('Spiderman', '10-20-2018','PG', '201', 'Action','IDK MOVIE CASTING','ITS A GREAT MOVIE');
INSERT INTO MOVIE VALUES ('Hulk', '11-04-2018','PG', '191','Action','IDK MOVIE CASTING','ITS A GREAT MOVIE');
INSERT INTO MOVIE VALUES ('Superman', '10-14-2018','PG', '191','Action','IDK MOVIE CASTING','ITS A GREAT MOVIE');
INSERT INTO MOVIE VALUES ('Thor', '09-20-2018','PG', '201','Action','IDK MOVIE CASTING','ITS A GREAT MOVIE');
INSERT INTO MOVIE VALUES ('Ben 10', '09-13-2018','PG', '191','Action','IDK MOVIE CASTING','ITS A GREAT MOVIE');

CREATE TABLE REVIEW
(
	Review_Id VARCHAR(20),
	Title VARCHAR(40) NOT NULL,
	Review_Comment VARCHAR(1000) NOT NULL,
	Customer_Email VARCHAR(40),
	Rating Integer NOT NULL, 
	CONSTRAINT REVIEWPK PRIMARY KEY(Review_Id),
	CONSTRAINT CSTMR_EKF FOREIGN KEY(Customer_Email) REFERENCES CUSTOMER (Customer_Email) ON DELETE CASCADE ON UPDATE CASCADE	
);

INSERT INTO REVIEW VALUES('1AFGHI2','Beast','Fun Moview! Loved it!','test1@gmail.com',4);
INSERT INTO REVIEW VALUES('14FHHI2','Spiderman','Fun Movie! Loved it!','test2@gmail.com',4);
INSERT INTO REVIEW VALUES('10FGEI2','Hulk','Fun Movie! Loved it!','test3@gmail.com',4);


CREATE TABLE ORDER_INFO
(
	Order_Id VARCHAR(20),
	Order_Date Date,
	Time VARCHAR(10),
	Status VARCHAR(10),
	Senior_Tickits Integer,
	Child_Tickits Integer,
	Adult_Tickits Integer,
	Total_Tickits Integer,
	Theater_Id VARCHAR(20),
	Customer_Id VARCHAR(40),
	Movie_Title VARCHAR(50),
	CONSTRAINT ORDERPK PRIMARY KEY(Order_Id),
	CONSTRAINT ORDER_EFK FOREIGN KEY(Theater_Id) REFERENCES THEATER (Theater_Id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT ORDER_FK FOREIGN KEY(Customer_Id) REFERENCES CUSTOMER (Customer_Email) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT ORDER_TITLE_FK FOREIGN KEY(Movie_Title) REFERENCES MOVIE (Title) ON DELETE CASCADE ON UPDATE CASCADE
);



	
INSERT INTO ORDER_INFO VALUES ('123','10-10-2018','6:00PM','BOOKED',0,0,2,2,'TH1','test1@gmail.com','Hulk');
INSERT INTO ORDER_INFO VALUES ('987','10-4-2018','7:00PM','BOOKED',2,1,2,5,'TH2','test2@gmail.com','Spiderman');

CREATE TABLE THEATER
(
	Theater_Id VARCHAR(20) NOT NULL,
	Street VARCHAR(30),
	City VARCHAR(20),
	State VARCHAR(20),
	Zipcode VARCHAR(10),
	Name VARCHAR(20),
	CONSTRAINT THEATERPK PRIMARY KEY(Theater_Id)
);

INSERT INTO THEATER VALUES ('TH1','123 STREET AVE','TUSCALOOSA','ALABAMA','35401','COBB THEATER');
INSERT INTO THEATER VALUES ('TH2','123 STREET AVE','COTTONDALE','ALABAMA','35405','FANDAGO THEATER');

CREATE TABLE SYSTEM_INFO
(
	Cancellation_Fee Integer,
	Senior_Discount Integer,
	Child_Discount Integer,
	Manager_Password VARCHAR(20)
);

INSERT INTO SYSTEM_INFO VALUES (10, 5, 5, 'I_AM_MANAGER');

create table PAYMENT_INFO
(
	User_email varchar(40),
	Cardnumber varchar(12),
	Cvv varchar(3),
	Name_on_card varchar(50),
	Card_expirationdate varchar(9),
	CONSTRAINT PAYMENT_PK PRIMARY KEY(User_email),
  	CONSTRAINT PAYMENT_FK FOREIGN KEY(User_email) REFERENCES CUSTOMER (Customer_Email) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO PAYMENT_INFO VALUES ('test1@gmail.com','1234432156788765','333','test one','12/2019');
INSERT INTO PAYMENT_INFO VALUES ('test2@gmail.com','1237635426782365','444','test two','02/2019');

Create table plays_at
(
	theater_id varchar(20),	
	movie varchar(100),
	showtime varchar(200)
);


Insert Into plays_at Values ('TH1', 'Superman', '11:00AM,2:00PM,4:00PM,7:00PM,10:00PM,11:00PM');
Insert Into plays_at Values ('TH2', 'Spiderman', '11:00AM,2:00PM,4:00PM,7:00PM,10:00PM,11:00PM');


Create TABLE POPULAR_MOVIES
(
	Movie_month varchar(10),
	Movie_title varchar(100),
	Total_bought_tickits integer,
	constraint popular_movies_pk primary key(Movie_month)
);

Insert into POPULAR_MOVIES values('May2018','Spiderman',1000);
Insert into POPULAR_MOVIES values('Sept2018','Superman',1000);
Insert into POPULAR_MOVIES values('July2018','HULK',1000);
INSERT INTO POPULAR_MOVIES VALUES('July2019','Batman',1000);
INSERT INTO POPULAR_MOVIES VALUES('May2019','Captain',1000);


CREATE TABLE REVENUE_REPORT
(	
	Movie_month varchar(10),
	Revenue_Amount Integer,
	constraint REVENUE_PK PRIMARY KEY(Movie_month)
);

Insert into REVENUE_REPORT values ('MAY2019',10000);
Insert into REVENUE_REPORT values ('AUG2019',10000);
Insert into REVENUE_REPORT values ('SEPT2019',10000);
Insert into REVENUE_REPORT values ('JULY2019',10000);