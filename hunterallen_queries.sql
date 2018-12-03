/* 
 * Login:
 * User: Username, Password
 *
 * Returns a single tuple with a username if the given username and password combination is valid
 * Returns no tuples if the username and password combination is not valid
 */
SELECT Username FROM USER WHERE Username = '$username_variable' AND Password = '$password_variable'

/* 
 * New Customer Registration
 *
 * Inserts new customer information into Customer table
 */
INSERT INTO CUSTOMER (Username, Email, Password) VALUES ('$username_variable', '$email_variable', '$password_variable')

/*
 * New Manager Registration
 *
 * Inserts new manager information into Manager table
 */
 INSERT INTO MANAGER (Username, Email, Password) VALUES ('$username_variable', '$email_variable', '$password_variable')
 
 /*
  * Movies Now Playing In Theaters
  *
  * Returns titles of movies currently playing in theaters
  */
SELECT Title FROM MOVIE WHERE Release_date < SELECT strftime('%s', 'now')

/*
 * Customer Order History
 *
 * Returns all tuples from Order table where username attribute matches the user's username
 */
SELECT * FROM Order WHERE Username = '$current_username_variable'

/*
 * Customer Payment Information
 *
 * Returns the tuple from Payment_information table where username attribute matches the user's username
 * Can return multiple tuples if the user has multiple saved payment methods
 */
SELECT * FROM Payment_information WHERE Username = '$current_username_variable'

/*
 * Customer Preferred Theater
 *
 * Returns the tuple from the Theater table where the theater is the user's preferred theater
 * Can return multiple tuples if the user has had multiple preferred theaters
 */
SELECT * FROM THEATER WHERE Theater_id = (SELECT Theater_id from PREFERS WHERE Username = '$current_username_variable')

/*
 *Search Theater
 */

/*
 * Movie Information
 *
 * Returns information for specific movie
 * Returns a single tuple
 */
SELECT Title, Length, Genre, Release_date, Rating FROM MOVIE WHERE Title = '$movie_title_variable'

/*
 * Movie Overview
 *
 * Returns the synopsis and cast for a specific movie
 * Returns a single tuple
 */
SELECT Synopsis, Cast FROM MOVIE WHERE Title = '$movie_title_variable'

/*
 * View Movie Reviews
 *
 * Returns all reviews for a specific movie
 * Returns the number of tuples equal to the number of reviews for a specific movie
 */
SELECT * FROM REVIEW WHERE Title = '$movie_title_variable'

/*
 * Write Movie Review
 *
 * Inserts a new movie review into the Review table
 */
INSERT INTO REVIEW (Review_id, Title, Comment, Rating, Username) VALUES ('$id_variable', '$movie_title_variable', '$comment_variable', '$rating_variable', '$current_username_variable')

/*
 * Buying Ticket
 */

/*
 * Revenue Report
 *
 * Returns all months and that month's total revenue
 * Returns the number of tuples equal to the number of months in the database
 */ 

/*
 * Popular Movie Report
 */