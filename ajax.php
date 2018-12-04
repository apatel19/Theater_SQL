

<?php

     switch($_GET['functionname']){
        case 'logindata':
            $email = $_GET['email'];
            $pass = $_GET['pass'];
            LogInData($email, $pass);
            break;
        case 'checkmanagerpassword':
            $managerpass = $_GET['managerPassword'];
            ManagerPassCheck($managerpass);
            break;
        case 'getusername':
            $currentUser = $_GET['currentUser'];
            GetUsername($currentUser);
            break;
        case 'getMoviesList':
            GetMoviesList();
            break;
        case 'getsinglemoviedata':
            $title = $_GET['title'];
            GetSingleMovieData($title);
            break;
        case 'getmoviereviewdata':
            $title = $_GET['title'];
            GetMovieReviewData($title);
            break;
        case 'didWatchThisMovie':
            $title = $_GET['title'];    
            $currentUser = $_GET['currentUser'];
            DidWatchThisMovie($title,$currentUser);
            break;
        case 'getOrderHistoryData':
            $currentUser = $_GET['currentUser'];
            GetOrderHistoryData($currentUser);
            break;
        case 'getSingleTheaterInfo':
            $theaterId = $_GET['theaterId'];
            GetSingleTheaterInfo($theaterId);
            break;
        case 'getsavedcardinfo':
            $currentUser = $_GET['currentUser'];
            GetSavedCardInfo($currentUser);
            break;
        case 'getpreferedtheater':
            $currentUser = $_GET['currentUser'];
            GetPreferedTheater($currentUser);
            break;
        case 'getTheaterList':
            GetTheaterList();
            break;
        case 'getshowtime':
            $title = $_GET['title'];
            $theater = $_GET['theater'];
            GetShowTime($title,$theater);
            break;
        case 'getMaxNumOrderInfo':
            GetMaxNumberOrderInfo();
            break;
        case 'revenueData':
            GetRevenueData();
            break;
        case 'populardata';
            GetPopularMovie();
            break;
        case 'getCancellationCharge':
            GetCancellationCharge();
            break;
    }

    function LogInData($email, $pass){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        $valid = "false";
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }            
        $info = array();   
        $sql = "SELECT * FROM USER;";
        $result = $conn->query($sql);
            
            if ($result->num_rows > 0) {
                // output data of each row
                while($row = $result->fetch_assoc()) {
                    if ($row['Email'] == $email && $row['Password'] == $pass) {
                        //$valid = true;
                        //$valid = $row['Username'];
                        array_push($info,["username"=>$row["Username"],"type"=>$row["User_Type"]]);
                    }
                }
            } else {
                array_push($info,["username"=>"nill"]);
            }
            // echo json_encode($valid);
            echo json_encode($info);
            $conn->close();
    }

    function ManagerPassCheck($managerpass){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        $valid = "false";
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }            

        $sql = "SELECT Manager_Password FROM SYSTEM_INFO;";
        $result = $conn->query($sql);
            
            if ($result->num_rows > 0) {
                // output data of each row
                while($row = $result->fetch_assoc()) {
                    if ($row['Manager_Password'] == $managerpass) {
                        $valid = true;
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
        $dbname = "Theater_Final";
    
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }            
        $movie_title = array();
        $sql = "SELECT DISTINCT movie_title from PLAYS_AT";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    array_push($movie_title, $row['movie_title']);
                }
        } else {
            echo "0 results";
        }
        echo json_encode($movie_title);
    }

    function GetRevenueData(){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        $valid = "false";
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        } 
        $revenue = array();
        $sql = "SELECT Movie_month, Sum(Revenue_Amount) as sumrev From REVENUE_REPORT GROUP by Movie_month;";
        $result = $conn->query($sql);
        
        if ($result->num_rows >= 0) {
            while($row = $result->fetch_assoc()) {
                array_push($revenue,["date"=>$row["Movie_month"],"cost"=>$row["sumrev"]]);
            }
         } else {
             echo json_encode("0 results");
        }
        echo json_encode($revenue);
    }

    function GetPopularMovie(){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        $valid = "false";
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        } 
        $movie = array();
        $sql = "SELECT Movie_month, Movie_title, SUM(Total_bought_tickits) as 'sumtickit' from POPULAR_MOVIES GROUP BY Movie_month, Movie_title ORDER BY Movie_month";
        $result = $conn->query($sql);
        
        if ($result->num_rows >= 0) {
            while($row = $result->fetch_assoc()) {
                array_push($movie,["monthYear"=>$row["Movie_month"],"movie"=>$row["Movie_title"],"tickit"=>$row["sumtickit"]]);
            }
         } else {
             echo json_encode("0 results");
        }
        echo json_encode($movie);
    }
    function GetSingleMovieData($title){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        $valid = "false";
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }            
        $movie_title = array();
        $sql = "SELECT * FROM MOVIE WHERE Title='$title';";
        $result = $conn->query($sql);

        $rt = "SELECT AVG(Rating) as average From REVIEW where Movie_Title = '$title';";
        $rating = $conn->query($rt);

        if ($result->num_rows > 0) {
                $rate = $rating->fetch_assoc();
                while($row = $result->fetch_assoc()) {
                    array_push($movie_title,["title"=>$row["Title"],"avgRating"=>$rate["average"], "releaseDate"=>$row["Release_Date"],"rating"=>$row['Rating'],"genre"=>$row["Genre"],"length"=>$row["Movie_Length"],"movie_cast"=>$row["Movie_Cast"],"synopsis"=>$row["Synopsis"]]);
                }
        } else {
            echo "0 results";
        }
        echo json_encode($movie_title);

    }

    function GetMovieReviewData($title){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        $valid = "false";
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }
        $movie_review = array();
        $sql="SELECT * FROM REVIEW where Movie_Title='$title';";
        $result = $conn->query($sql);

        $rt = "SELECT AVG(Rating) as average From REVIEW where Movie_Title = '$title';";
        $rating = $conn->query($rt);



        if ($result->num_rows > 0) {
                $rate = $rating->fetch_assoc();
                while($row = $result->fetch_assoc()) {
                    array_push($movie_review,["avgRating"=>$rate["average"],
                                              "movie"=>$row["Movie_Title"],"title"=>$row["Title"],"review_comment"=>$row["Review_Comment"],"rating"=>$row["Rating"],"email"=>$row["Customer_Email"]]);
                }
        } else {
            echo "0 results";
        }
        echo json_encode($movie_review);
    }

    function DidWatchThisMovie($title,$currentUser){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        $valid = "false";
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }
        
        $sql = "SELECT * FROM ORDER_INFO where Email='$currentUser' AND Movie_Title='$title' AND Status ='Completed';";
        $result = $conn->query($sql);

        $max_sql = "SELECT Max(Review_ID) as MaxId FROM REVIEW;";
        $maxResult = $conn->query($max_sql);

        if ($result->num_rows > 0) {
            $max = $maxResult->fetch_assoc();
            $valid = $max['MaxId'];
            echo json_encode($valid); 
        } else {
            echo json_encode($valid);
        }

    }

    function GetOrderHistoryData($currentUser){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        $valid = "false";
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }

        $orders = array();
        $sql="SELECT * FROM ORDER_INFO where Email='$currentUser';";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                array_push($orders,["order_id"=>$row["Order_Id"],"order_date"=>$row["Order_Date"],"time"=>$row["Time"],
                                    "status"=>$row["Status"],"senior"=>$row["Senior_Tickits"],"child"=>$row["Child_Tickits"],"adult"=>$row["Adult_Tickits"],
                                    "total"=>$row["Total_Tickits"],"cost"=>$row["TotalCost"], "movie"=>$row["Movie_Title"],"cardNo"=>$row["CardNo"],"theater_id"=>$row["Theater_Id"],"email"=>$row["Email"]]);
            }
         } else {
             echo json_encode("0 results");
        }
        echo json_encode($orders);
    }


    function GetSingleTheaterInfo($theaterId){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        $valid = "false";
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }
        $theater = array();
        $sql = "SELECT * FROM THEATER where Theater_Id='$theaterId';";
        $result = $conn->query($sql);

         if ($result->num_rows >= 0) {
            while($row = $result->fetch_assoc()) {
                array_push($theater,["theaterId"=>$row["Theater_Id"],"street"=>$row["Street"],"city"=>$row["City"],"state"=>$row["State"],"zipcode"=>$row["Zipcode"],"name"=>$row["Name"]]);
            }
         } else {
             echo json_encode("0 results");

        }
        echo json_encode($theater);
    }

    function GetSavedCardInfo($currentUser){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        $valid = "false";
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }

        $card = array();
        $sql = "SELECT * FROM PAYMENT_INFO where Email='$currentUser';";
        $result = $conn->query($sql);

        if ($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                array_push($card,["number"=>$row["Cardnumber"],"cvv"=>$row["Cvv"],"name"=>$row["Name_on_card"],"exp"=>$row["Card_expirationdate"]]);
            }
        } else {
                array_push($card,["number"=>"No info to show"]);
        }
        echo json_encode($card);
    }

    function GetPreferedTheater($currentUser){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        $valid = "false";
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }
        $theater = array();
        $sql = "SELECT * FROM PREFERS where Email='$currentUser';";
        $result = $conn->query($sql);

        if ($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                // array_push($theater,["theaterId"=>$row["Theater_ID"]]);
                $id = $row["Theater_ID"];
                $getInfo = "SELECT * FROM THEATER where Theater_Id='$id';";
                $getInfoResult = $conn->query($getInfo);
                if($getInfoResult->num_rows > 0){
                    while($temp = $getInfoResult -> fetch_assoc()){
                        array_push($theater, ["theaterId"=>$temp["Theater_Id"],"street"=>$temp["Street"],"city"=>$temp["City"],"state"=>$temp["State"],"zipcode"=>$temp["Zipcode"],"name"=>$temp["Name"]]);
                    }
                }
            }
        } else {
                array_push($theater,["theaterId"=>"No info to show"]);
        }
        echo json_encode($theater);
    }

    function GetTheaterList(){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }
        $theater_list = array();

        $sql = "SELECT * FROM THEATER;";
        $result = $conn->query($sql);

        if ($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                array_push($theater_list,["theaterId"=>$row["Theater_Id"],"street"=>$row["Street"],"city"=>$row["City"],"state"=>$row["State"],"zipcode"=>$row["Zipcode"],"name"=>$row["Name"]]);
            }
        } else {
                array_push($theater_list,["theaterId"=>"No info theater_list to show"]);
        }
        echo json_encode($theater_list);

    }
    
    function GetShowTime($title,$theater){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }
        $showtime = array();
        $sql = "SELECT * FROM SHOWTIME where theater_id='$theater' and movie_title='$title';";

        $result = $conn->query($sql);
        if ($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                array_push($showtime,["theaterId"=>$row["theater_id"],"showtime"=>$row["show_time"]]);
            }
        } else {
                array_push($showtime,["theaterId"=>"No info theater_list to show"]);
        }
        echo json_encode($showtime);
    }  

    function GetMaxNumberOrderInfo() {
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        
        $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }

        $maxNumber = "";
        $sql = "SELECT Max(Order_Id) as maxnum From ORDER_INFO;";
        $maxResult = $conn->query($sql);

        if ($maxResult->num_rows > 0){
            while($row = $maxResult->fetch_assoc()){
                echo json_encode($row["maxnum"]);
            }
        } else {
            echo json_encode("0");
        }
    }

    function GetCancellationCharge(){
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "Theater_Final";
        
        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
        }

        $sql = "SELECT Cancellation_Fee From SYSTEM_INFO;";
        $maxResult = $conn->query($sql);

        if ($maxResult->num_rows > 0){
            $row = $maxResult->fetch_assoc();
                echo json_encode($row["Cancellation_Fee"]);
        
        } else {
            echo json_encode("0");
        }

    }
?>