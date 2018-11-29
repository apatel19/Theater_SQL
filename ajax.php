

<?php

     switch($_GET['functionname']){
        
        case 'logindata':
            $email = $_GET['email'];
            $pass = $_GET['pass'];
            LogInData($email, $pass);
            break;
        case 'getMoviesList':
            GetMoviesList();
            break;
    }
    

    function LogInData($email, $pass){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater";
        $valid = "false";
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }            
           
        $sql = "SELECT Email, Password FROM USER;";
        $result = $conn->query($sql);
            
            if ($result->num_rows > 0) {
                // output data of each row
                while($row = $result->fetch_assoc()) {
                    if ($row['Email'] == $email && $row['Password'] == $pass) {
                        $valid = "true";
                    }
                }
            } else {
                echo "0 results";
            }
            echo json_encode($valid);
            $conn->close();
    }

    function GetMoviesList(){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater";
        $valid = "false";
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }            
        $movie_title = array();
        $sql = "SELECT * FROM MOVIE;";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    array_push($movie_title, $row['Title']);
                }
        } else {
            echo "0 results";
        }
        echo json_encode($movie_title);
    }

?>