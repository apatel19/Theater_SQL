
<?php

switch($_POST['functionname']){
        case 'createaccount':
                $user = $_POST['username'];
                $email = $_POST['email'];
                $pass = $_POST['password'];
                $accountType = $_POST['accountType'];
                CreateAccount($user, $email, $pass, $accountType);
                break;
        case 'submitReview':
                $reviewNum = $_POST['maxReviewNum'];
                $movie = $_POST['movie'];
                $rate = $_POST['givenRatingValue'];
                $email = $_POST['currentUser'];
                $review_title = $_POST['title'];
                $comment = $_POST['comment'];
                SubmitMyReview($reviewNum ,$movie, $rate, $email, $review_title, $comment);
                break;
        case 'updateorderstatus':
                $orderid = $_POST['order_id'];
                UpdateOrderStatus($orderid);
                break;    
        case 'deletesavedcard':
                $cardnumber = $_POST['cardnumber'];
                DeleteSavedCard($cardnumber);
                break;
        case 'deletesavedtheater':
                $theaterid = $_POST['theaterid'];
                DeleteSavedTheater($theaterid);
                break;
        case 'savetopaymeninfo':
                $name = $_POST['name'];
                $number = $_POST['number'];
                $cvv = $_POST['cvv'];
                $exp = $_POST['exp'];
                $currentUser = $_POST['currentUser'];
                $currentUsername = $_POST['currentUsername'];
                SaveToPaymentInfo($name,$number,$cvv,$exp,$currentUser,$currentUsername);
                break;
        case 'saveToOrder':
                $orderid = $_POST['orderid'];
                $date = $_POST['date'];
                $time = $_POST['time'];
                $status = $_POST['status'];
                $senior = $_POST['senior'];
                $child = $_POST['child'];
                $adult = $_POST['adult'];
                $total_tickit = $_POST['total_tickit'];
                $cost = $_POST['cost'];
                $cardNo = $_POST['cardNo'];
                $theaterId = $_POST['theaterId'];
                $currentUsername = $_POST['username'];
                $email = $_POST['email'];
                $movie = $_POST['movie'];
                SaveToOrder($orderid, $date, $time, $status,$senior,$child,$adult,$total_tickit,$cost,$cardNo,$theaterId,$currentUsername,$email,$movie);
                break;
}

    function CreateAccount($user, $email, $pass, $accountType){
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
           
        $sql = "INSERT INTO USER VALUES ('$email','$user','$pass','$accountType');";
        // $result = $conn->query($sql);
           
            if(!$result = $conn->query($sql)){
                    die('There was an error running the query [' . $conn->error . ']');
            } else {
                    echo "1";
            }
            // echo $result;
            $conn->close();
    }

    function SubmitMyReview($reviewNum ,$movie, $rate, $email, $review_title, $comment){
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

        $sql = "INSERT INTO REVIEW VALUES ('$reviewNum','$movie','$review_title','$comment','$email',$rate);";

        if(!$result = $conn->query($sql)){
                    die('There was an error running the query [' . $conn->error . ']');
            } else {
                    echo "1";
            }
            // echo $result;
            $conn->close();
    }

    function UpdateOrderStatus($orderid){
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
        
        $sql = "UPDATE ORDER_INFO SET Status='Cancelled' Where Order_Id='$orderid';";
        if(!$result = $conn->query($sql)){
                    die('There was an error running the query [' . $conn->error . ']');
        } else {
               echo "1";
        }
            // echo $result;
            $conn->close();
    }

    function DeleteSavedCard($cardnumber){
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
        
        $sql = "Delete From PAYMENT_INFO WHERE Cardnumber = '$cardnumber';";
        if(!$result = $conn->query($sql)){
                die('There was an error running the query [' . $conn->error . ']');
        } else {
               echo "1";
        }
            // echo $result;
            $conn->close();
    }

    function DeleteSavedTheater($theaterid){
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
        
        $sql = "DELETE from PREFERS where Theater_ID='$theaterid';";
        if(!$result = $conn->query($sql)){
                die('There was an error running the query [' . $conn->error . ']');
        } else {
               echo "1";
        }
            // echo $result;
            $conn->close();
        
    }

    function SaveToPaymentInfo($name,$number,$cvv,$exp,$currentUser,$currentUsername){
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
        $sql = "INSERT INTO `PAYMENT_INFO` VALUES ('$currentUsername','$currentUser','$number','$cvv','$name','$exp');";

        if(!$result = $conn->query($sql)){
                die('There was an error running the query [' . $conn->error . ']');
        } else {
               echo "1";
        }
            // echo $result;
            $conn->close();
    }


    function SaveToOrder($orderid, $date, $time, $status,$senior,$child,$adult,$total_tickit,$cost,$cardNo,$theaterId,$currentUsername,$email){
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
        $sql = "INSERT INTO `ORDER_INFO` VALUES ('$orderid','$date','$time','$status',$senior,$child,$adult,$total_tickit,'$cost','$cardNo','$theaterId','$currentUsername','$email','$movie');";

        if(!$result = $conn->query($sql)){
                die('There was an error running the query [' . $conn->error . ']');
        } else {
               echo "1";
        }
            // echo $result;
            $conn->close();
        

    }
?>