
 $(document).ready(function(){

    var currentUser = "";
    var currentUsername = "";
    $("#cardCreateAccount").hide();
    $("#cardMovieList").hide();
    $("#cardPersonalAccount").hide();
    $("#cardSingleMovieData").hide();
    $("#cardMovieOverview").hide();
    $("#cardMovieReview").hide();
    $("#cardGiveReview").hide();
    $("#cardChooseTheater").hide();
    $("#cardChooseTime").hide();
    $("#cardPurchaseTickit").hide();
    $("#cardPaymentInformation").hide();
    $("#cardOrderDone").hide();

    $("#cardShowAllCustomerOrder").hide();
    $("#cardOrderDetail").hide();

    $("#cardSavedPaymentInformation").hide();
        
    $("#managerFunctionality").hide();
    $("#cardReport").hide();
    $("#cardPopularMovie").hide();
    
    $("#cardPreferedTheater").hide();
    /* Log In button on Log In Card */
    $("#btnLogIn_loginCard").click(function(){
        loginValidationCheck();
    });
    
    /* Create Account button on Log In Card */
    $("#btnCreateAccount_loginCard").click(function(){
       $("#cardLogin").hide();
       $("#cardCreateAccount").show();
    });

    /* Log In button in Create Account Card*/
    $("#btnLogIn_createAccountCard").click(function(){
       $("#cardLogin").show();
       $("#cardCreateAccount").hide();
    });


    /* Create Account button in Create Account Card */
    $("#btnCreateAccount_createAccountCard").click(function(){
       createAccountValidaionCheck(); 
    });

    $("#btnMeClicked").click(function(){
        $("#cardMovieList").hide();
        $("#cardPersonalAccount").show();
    });
    
    $("#btnBack_cardPersonalAccount").click(function(){
        $("#cardMovieList").show();
        $("#cardPersonalAccount").hide();
    });

    $("#btnBack_cardSingleMovieData").click(function(){
        $("#cardMovieList").show();
        $("#cardSingleMovieData").hide();
    });

    $("#btnOverview_cardSingleMovieData").click(function(){
        $("#cardSingleMovieData").hide();
        showSynopsisAndCast();
        $("#cardMovieOverview").show();
    });    

    $("#btnBack_overview").click(function(){
        $("#cardSingleMovieData").show();
        $("#cardMovieOverview").hide();
    });

    $("#btnMovieReview_cardSingleMovieData").click(function(){
        $("#cardSingleMovieData").hide();
        showMovieReview();
        $("#cardMovieReview").show();
    });

    $("#btnAddReview").click(function(){
        showRatingOption ();
        $("#cardGiveReview").show();
        $("#cardMovieReview").hide();
    });

    $("#btnBack_movieReview").click(function(){
        $("#cardSingleMovieData").show();
        $("#cardMovieReview").hide();
    });

    $("#btnBack_cardGiveReview").click(function(){
        showMovieReview();
        $("#cardMovieReview").show();
        $("#cardGiveReview").hide();
    });

    $("#btnSubmitReview").click(function(){
        submitMyReview();
    });

    $("#btnBack_cardChooseTheater").click(function(){
        $("#cardChooseTheater").hide();
        $("#cardSingleMovieData").show();
    });

    $("#btnBuyTickit_cardSingleMovieData").click(function(){
        $("#cardChooseTheater").show();
        console.log('Clicked by tickit');
        getSavedTheaterInfo();
        $("#cardSingleMovieData").hide();
    });

    $("#btnSearchTheater").click(function(){
        searchTheater();
    });


    $("#btnSelectTime").click(function(){
        checkIfTheaterIsSelected();
        // $("#cardChooseTime").show();
        // $("#cardChooseTheater").hide();
    });

    $("#btnBack_cardChooseTime").click(function(){
        $("#cardChooseTheater").show();
        $("#cardChooseTime").hide();
    });

    $("#btnSelectTickit").click(function(){
        checkIfTimeAndDateSelected();
        // $("#cardPurchaseTickit").show();
        // $("#cardChooseTime").hide();
    });

    $("#btnBack_cardPurchaseTickit").click(function(){
        $("#cardPurchaseTickit").hide();
        $("#cardChooseTime").show();
    }); 

    $("#btnPayment").click(function(){
        checkIfTickitsSelected();
        // $("#cardPurchaseTickit").hide();
        // $("#cardPaymentInformation").show();
    });

    $("#btnBack_cardPaymentInformation").click(function(){
        $("#cardPaymentInformation").hide();
        $("#cardPurchaseTickit").show();
    });

    $("#btnSubmitPayment").click(function(){
        checkForPaymentMethod();
        // $("#cardOrderDone").show();
        // $("#cardPaymentInformation").hide();
    });
   
    $("#btnHome_cardOrderDone").click(function(){
        $("#cardOrderDone").hide();
        $("#cardMovieList").show();
    });

    
    $("#btnOrderHistory_ME").click(function(){
        $("#cardPersonalAccount").hide();
        console.log("Open Order history");
        getOrderHistoryData();
        $("#cardShowAllCustomerOrder").show();
    });

    $("#btnBack_cardShowAllCustomerOrder").click(function(){
        $("#cardPersonalAccount").show();
        $("#cardShowAllCustomerOrder").hide();
    });

    $("#btnViewDetails_cardShowAllCustomerOrder").click(function(){
        $("#cardShowAllCustomerOrder").hide();
        showOrderDetails();
        $("#cardOrderDetail").show();
    }); 

    $("#btnBack_OrderDetails").click(function(){
        $("#cardOrderDetail").hide();
        $("#cardShowAllCustomerOrder").show();
    }); 

    $("#btnCancelOrder").click(function(){
        console.log("Clicked!!");
        checkOrderStatus();
    });

    $("#btnPaymentInfo_ME").click(function(){
        $("#cardSavedPaymentInformation").show();
        getAllSavedPaymentInfo();
        $("#cardPersonalAccount").hide();
    });

    $("#btnBack_savedPaymentInfo").click(function(){
        $("#cardSavedPaymentInformation").hide();
        $("#cardPersonalAccount").show();
    });

    $("#btnDeletePaymentCard").click(function(){
        deleteSelectedSavedCard();
        getAllSavedPaymentInfo();
    });

    $("#btnPreferedTheater_ME").click(function(){
        $("#cardPreferedTheater").show();
        $("#cardPersonalAccount").hide();
         getAllPreferedTheater();
    });

    $("#btnBack_PreferedTheater").click(function(){
        $("#cardPreferedTheater").hide();
        $("#cardPersonalAccount").show();
    });

    $("#btnDeleteThisTheater").click(function(){
        deleteSelectedTheater();
        getAllPreferedTheater();
    }); 

    $("#revenue").click(function(){
        showRevenue();
         $("#cardReport").show();
          $("#managerFunctionality").hide();
    });

    $("#popularMovie").click(function(){
        ShowPopularMovie();
        console.log("clicked");
        $("#cardPopularMovie").show();
        $("#managerFunctionality").hide();
    });

    $("#report_back").click(function(){
        $("#cardReport").hide();
          $("#managerFunctionality").show();
    });

    $("#popular_back").click(function(){
         $("#cardPopularMovie").hide();
        $("#managerFunctionality").show();
    });

  async  function showRevenue(){
    await $.ajax({
        url:'ajax.php',
        type:'GET',
        data:{functionname:'revenueData'}, //Pass your varibale in data
        success:function(json_data){
                console.log(json_data);
                var valid = JSON.parse(json_data);
                console.log(valid);
                if (valid != ""){
                    var ul = document.getElementById('revenueList');
                    ul.innerHTML = "";
                    
                    for (var i = 0; i < valid.length; i++){
                        var li = document.createElement('li');
                        li.innerHTML = valid[i]['date']  + " Revenue: " + valid[i]["cost"] ;
                        ul.appendChild(li);
                    }
                } else {
                    alert("Not valid revenue");
                    return;
                }
            }
        })
    }
  async  function ShowPopularMovie () {
         await $.ajax({
        url:'ajax.php',
        type:'GET',
        data:{functionname:'populardata'}, //Pass your varibale in data
        success:function(json_data){
                console.log(json_data);
                var valid = JSON.parse(json_data);
                console.log(valid);
                if (valid != ""){
                    var ul = document.getElementById('popularList');
                    ul.innerHTML = "";
                    
                    for (var i = 0; i < valid.length; i++){
                        var li = document.createElement('li');
                        li.innerHTML = valid[i]['monthYear'] + "\t" + valid[i]['movie']  + "\t Total Tickit Sell: " + valid[i]["tickit"] + " tickits";
                        ul.appendChild(li);
                    }
                } else {
                    alert("Not valid revenue");
                    return;
                }
            }
        })
    }

    function loginValidationCheck(){
        var email = $("#login_email_address").val();
        var pass = $("#login_password").val();
        $.ajax({
        url:'ajax.php',
        type:'GET',
        data:{functionname:'logindata' ,email:email, pass:pass}, //Pass your varibale in data
        success:function(json_data){
                console.log(json_data);
                var valid = JSON.parse(json_data);
                console.log(valid);
                if (valid != ""){
                    if (valid[0]['type'] == "customer"){
                        currentUsername = valid[0]['username'];
                        currentUser = email;
                        document.getElementById("setUsername").innerHTML = currentUsername + " Account";
                        console.log(currentUsername);
                        loadDataWithCurrentMovies();
                    } else {
                         $("#managerFunctionality").show();
                         $("#cardLogin").hide();
                         $("#cardCreateAccount").hide();
                    }
                } else {
                    alert("Not valid email or password");
                    return;
                }
            }
        })
    }
    

   async function createAccountValidaionCheck(){
        var username = $("#createAccount_username").val();
        var email = $("#createAccount_email_address").val();
        var password = $("#createAccount_password").val();
        var confirmPassword = $("#createAccount_confirm_password").val();
        var managerPassword = $("#createAccount_manager_password").val();
        var accountType = ""
        console.log(username + " " + email + " " + password + " " + confirmPassword + " " + managerPassword);
        if (password != confirmPassword){
            alert("Password and ConfirPassword not same.");
            return;
        }

        if (managerPassword == ""){
            accountType = "customer";
        }
        else {
            var value = await checkManagerPassword(managerPassword);
            console.log("Returned " + value);
                if (value == true){
                    accountType = "manager";
                    console.log("Manager Pass valid");
                } else {
                    alert("Manager password is not correct.");
                    return;
                }
        }
        $.ajax({
        url:'post.php',
        type:'POST',
        data:{functionname:'createaccount',username:username,email:email,password:password,accountType:accountType}, //Pass your varibale in data
        success:function(json_data){
                console.log(json_data);
                if (json_data != 1) {
                    alert (json_data);
                    return;
                } else {
                    if (accountType == "customer"){
                        currentUser = email;
                        currentUsername = username;
                        document.getElementById("setUsername").innerHTML = currentUsername + " Account";
                        loadDataWithCurrentMovies();
                    } else {
                         $("#managerFunctionality").show();
                         $("#cardLogin").hide();
                         $("#cardCreateAccount").hide();
                    }
                }
            }
        })
    }
   
  async  function checkManagerPassword(managerPassword) {
        var valid = "";
        await $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'checkmanagerpassword' ,managerPassword:managerPassword}, //Pass your varibale in data
                success:function(json_data){
                    valid = JSON.parse(json_data);
                    console.log(valid); 
                    }
                })
        return valid;
    }   

    function loadDataWithCurrentMovies(){
        $("#cardMovieList").show();
        $("#cardLogin").hide();
        $("#cardCreateAccount").hide();
        $.ajax({
        url:'ajax.php',
        type:'GET',
        data:{functionname:'getMoviesList'}, //Pass your varibale in data
        success:function(data){
             console.log(data); //you get return value in this varibale, us it anywhere
             var str = JSON.parse(data);
             console.log(str);
             showMovieList(str);
            }
        })
    }
    /*
        movie list table fill
    */
        function showMovieList(str) {
            var li;
            var ul = document.getElementById('showMovieList');
            ul.innerHTML = "";
            selectedMovie_orderInfo = "";
            for(var i = 0; i < str.length; i++){
                li = document.createElement('li');
                var input = document.createElement('input');
                input.type = "button";
                input.className = "mdl-button mdl-js-button mdl-button--primary";
                input.id = str[i];
                input.value = str[i];
                input.innerHTML = str[i];
                input.addEventListener('click', function(){
                    movieSelected(this.id);
                })
                li.appendChild(input);
                ul.appendChild(li);
        }
    }

   async function movieSelected(title){
        console.log(title);
       await $.ajax({
        url:'ajax.php',
        type:'GET',
        data:{functionname:'getsinglemoviedata',title:title}, //Pass your varibale in data
        success:function(data){
              var str = JSON.parse(data);
              if (str[0]["rating"] != ""){
                  $("#cardMovieList").hide();
                  selectedMovie_orderInfo = str[0]["title"];
                  document.getElementById("movieSelectedTitle").innerHTML = str[0]["title"];
                  document.getElementById("releaseDate").innerHTML = 'Release Date ' + str[0]["releaseDate"];
                  document.getElementById("ratingLengthAverage").innerHTML = str[0]["rating"] + ' | ' + str[0]["length"] + ' | ' + 'AVG: '+  str[0]["avgRating"];
                  ratingLength_orderInfo = str[0]["rating"] + ' | ' + str[0]["length"] + ' | ' + 'AVG: '+  str[0]["avgRating"];
                  document.getElementById("genre").innerHTML = str[0]["genre"];
                  $("#cardSingleMovieData").show();
              }
            }
        })
    }

    function showSynopsisAndCast() {
        var title = document.getElementById("movieSelectedTitle").innerHTML;
        $.ajax({
        url:'ajax.php',
        type:'GET',
        data:{functionname:'getsinglemoviedata',title:title}, //Pass your varibale in data
        success:function(data){
              var str = JSON.parse(data);
              if (str[0]["rating"] != ""){
                  document.getElementById("overview_title").innerHTML = str[0]["title"];
                  document.getElementById("synopsis_text").innerHTML = 'Release Date ' + str[0]["synopsis"];
                  var cast = str[0]["movie_cast"];
                  var res = cast.split(',');
                  var ul = document.getElementById('showCast');
                  ul.innerHTML = '';
                  for (var i = 0; i < res.length; i++){
                    var li = document.createElement('li');
                    li.innerHTML = res[i];
                    ul.appendChild(li);
                  }
              }
            }
        })
    }

    function showMovieReview() {
        var title = document.getElementById("movieSelectedTitle").innerHTML;
        document.getElementById('movieReview_title').innerHTML = title;
        $.ajax({
        url:'ajax.php',
        type:'GET',
        data:{functionname:'getmoviereviewdata',title:title}, //Pass your varibale in data
        success:function(data){
              var str = JSON.parse(data);
              var ul = document.getElementById("showReview");
              ul.innerHTML = '';
              for (var i = 0; i < str.length; i++){
                document.getElementById("reviewAverageRating").innerHTML = "Average Rating: " + str[0]["avgRating"];
                var li = document.createElement('li');
                li.className = "mdl-list__item mdl-list__item--three-line";

                var span1= document.createElement('span');
                span1.className = "mdl-list__item-primary-content";

                var span2 = document.createElement('span');
                span2.innerHTML = str[i]['title'];

                var span3 = document.createElement('span');
                span3.style.color = "black";
                span3.style.fontSize = "14px";
                span3.style.display = "inline-block";
                span3.style.paddingLeft = "170px";
                span3.innerHTML = "Rating: " + str[i]["rating"];
                
                var span4 = document.createElement('span');
                span4.className = "mdl-list__item-text-body";
                span4.innerHTML = str[i]["review_comment"];

                span2.appendChild(span3);                
                span1.appendChild(span2);
                span1.appendChild(span4);
                li.appendChild(span1);
                ul.appendChild(li);
              }
              console.log(str);
            }
        })
    }

        function showRatingOption () {
            var ul = document.getElementById('showRatingOption');
            ul.innerHTML = "";
            for (var i = 1; i < 6; i++){
                var li = document.createElement('li');
                var _input = document.createElement('input');
                _input.type = "radio";
                _input.name = "rating";
                _input.value = i;
                _input.innerHTML = i;
                _input.id = i;
                _input.addEventListener('click', function(){
                    selectedRateForReview(this.id);
                })

                var label = document.createElement('label');
                label.innerHTML = i;

                li.style.display = "inline-block";
                li.style.padding = "10px";
                li.appendChild(label);
                li.appendChild(_input);
                ul.appendChild(li);
            }
            givenRatingValue = "";
        }

        var givenRatingValue =""; 
        function selectedRateForReview(x){
            givenRatingValue = x;
        }

  async  function submitMyReview() {
        var title = document.getElementById("movieSelectedTitle").innerHTML;
        document.getElementById('giveReview_title').innerHTML = title;

      await $.ajax({
        url:'ajax.php',
        type:'GET',
        data:{functionname:'didWatchThisMovie' ,title:title,currentUser:currentUser}, //Pass your varibale in data
        success:function(json_data){
            var valid = JSON.parse(json_data);
                console.log(currentUser + " USER");
                if(valid == 'false') {
                     alert("You have not watched " + title + " movie.");
                     return;
                } else {
                    var maxReviewNum = parseInt(valid);
                    console.log("Watched this movie");
                    console.log("Max Number: " + maxReviewNum);
                    nowICanSubmitReview(title, maxReviewNum);
                    // $("#cardMovieList").show();
                    // $("#cardGiveReview").hide();
                }
            }
        })
    }

    function nowICanSubmitReview(movie, maxReviewNum) {
        if (givenRatingValue == ""){
            alert("Not given rating.");
            return;
        }

        var title, comment;
        title = $('#added_review_title').val();
        if (title == ""){
            alert("Enter in review title");
            return;
        }
        comment = $('#added_review_comment').val();
        maxReviewNum = maxReviewNum + 1;
        $.ajax({
        url:'post.php',
        type:'POST',
        data:{functionname:'submitReview',maxReviewNum:maxReviewNum,movie:movie,givenRatingValue:givenRatingValue,currentUser:currentUser,title:title,comment:comment}, //Pass your varibale in data
        success:function(json_data){
                console.log(json_data);
                if (json_data != 1) {
                    alert (json_data);
                    return;
                } else {
                  console.log("Added review.")
                }
            }
        })
    }
/*
ORDER_Info;

*/
var selectedMovie_orderInfo = "";
var selectedTheater_orderInfo = "";
var selectedDate_orderInfo = "";
var selectedTime_orderInfo = "";
var ratingLength_orderInfo = "";

var selectedAdult_orderInfo = "";
var selectedChild_orderInfo = "";
var selectedSenior_orderInfo = "";
var totalCost_orderInfo = "";
var totalTickits_orderInfo = "";

var selectedPaymentCard_orderInfo = "";

   async function getSavedTheaterInfo(){
        await  $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'getpreferedtheater',currentUser:currentUser}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        console.log(res);
                        if (res[0]["theaterId"] != "No info to show"){
                            var res = JSON.parse(json_data);
                            //showAllPreferedTheater(res);
                            //console.log(res);
                            generateSavedTheaterList(res)
                        } else {
                            res = "No saved theater";
                            return;
                        }
                    }
                })


    }

    function generateSavedTheaterList(res){
        var ul = document.getElementById('savedTheater');
            ul.innerHTML = "";
            selectedTheater_orderInfo = "";
            for (var i = 0; i < res.length; i++){
                var li = document.createElement('li');
                var span1 = document.createElement('span');
                var input = document.createElement('input');
                var span2 = document.createElement('span');
                var label = document.createElement('label');
                span1.style.display = "inline-block";
                span1.style.padding = "20px";

                input.type = "radio";
                input.name = "preferredTheater";
                input.id = res[i]["theaterId"];
                input.addEventListener('click', function(){
                                selectedTheater(this.id);
                            })

                span2.style.display = "inline-block";
                span2.style.padding = "20px";

                label.innerHTML = res[i]["street"] + " " + res[i]["city"] + " " + res[i]["state"] + " " + res[i]["zipcode"];

                span1.appendChild(input);
                span2.appendChild(label);

                li.appendChild(span1)
                li.appendChild(span2);
                ul.appendChild(li);
            }
    }

    function selectedTheater(theater){
        selectedTheater_orderInfo = theater;
        console.log(theater)
    }

   async function searchTheater(){
        await  $.ajax({
                    url:'ajax.php',
                    type:'GET',
                    data:{functionname:'getTheaterList'}, //Pass your varibale in data
                    success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        if (res[0]["theaterId"] != ""){
                            console.log(res);
                            generateSerchedTheaterList(res);
                        } else {
                            alert("Didnt find matching theater.");
                            return;
                        }
                    }
                })

    }

    function generateSerchedTheaterList(res){
            var city = $("#added_city").val();
            var state = $("#added_state").val();
            var temp = ""
            if (city == "" && state == ""){
                temp = res;
            } else if (city == "" && state != ""){
                temp = res.filter(function(res){
                    return res["state"] == state;
                });
            } else if (city != "" && state == ""){
                temp = res.filter(function(res){
                    return res["city"] == city;
                });
            } else if (city != "" && state != ""){
                temp = res.filter(function(res){
                    return res["city"] == city && res["state"] == state;
                });
            }
            console.log(temp);

            var ul = document.getElementById('searchedTheaterList');
            ul.innerHTML = "";
            for (var i = 0; i < temp.length; i++){
                var li = document.createElement('li');
                var span1 = document.createElement('span');
                var input = document.createElement('input');
                var span2 = document.createElement('span');
                var label = document.createElement('label');
                span1.style.display = "inline-block";
                span1.style.padding = "20px";

                input.type = "radio";
                input.name = "preferredTheater";
                input.id = temp[i]["theaterId"];
                input.addEventListener('click', function(){
                                selectedTheater(this.id);
                            })

                span2.style.display = "inline-block";
                span2.style.padding = "20px";

                label.innerHTML = temp[i]["street"] + " " + temp[i]["city"] + " " + temp[i]["state"] + " " + temp[i]["zipcode"];

                span1.appendChild(input);
                span2.appendChild(label);

                li.appendChild(span1)
                li.appendChild(span2);
                ul.appendChild(li);
            }

             saveTheaterForFuture = "";   
             var ul = document.getElementById('saveTheater');
             ul.innerHTML = "";
             
             var li = document.createElement('li');
             var input = document.createElement('input');
             input.type = "checkbox";
             input.addEventListener('click', function(){
                        saveThisTheater(input.checked);
                    })
             var label = document.createElement('label');
             label.innerHTML = "Save this theater for future.";
             li.appendChild(input)
             li.appendChild(label)
             ul.appendChild(li);



    }
    var saveTheaterForFuture = "";
    function saveThisTheater(x){
        saveTheaterForFuture = x;
    }

    function checkIfTheaterIsSelected(){
        if (selectedTheater_orderInfo == ""){
            alert("Select your theater");
            return;
        } else {
            if (saveTheaterForFuture){
                saveTheaterForFuture1(selectedTheater_orderInfo);
            }
            generateDates();
            generateTime();
            $("#cardChooseTime").show();
            $("#cardChooseTheater").hide();
        }
    }

  async  function saveTheaterForFuture1(x){
            console.log(x);
         await  $.ajax({
                        url:'post.php',
                        type:'POST',
                        data:{functionname:'savetheater',theater:x,currentUser:currentUser,currentUsername:currentUsername}, //Pass your varibale in data
                        success:function(json_data){
                                console.log(json_data);
                                if (json_data != 1) {
                                    alert (json_data);
                                    return;
                                } else {
                                    console.log("Saved");
                                }
                            }
                     })

    }
  
    function generateDates() {
        var ul = document.getElementById('date');
        ul.innerHTML = "";
        selectedDate_orderInfo = "";
        for (var i = 0; i < 7; i++){
            var today = new Date();
            today.setDate(today.getDate() + i);
             var dd = today.getDate();
             var dd = today.getDate();
             var mm = today.getMonth()+1; //January is 0!
             var yyyy = today.getFullYear();
            if(dd<10) {
                dd = '0'+dd
            } 
            if(mm<10) {
                mm = '0'+mm
            } 
            today = mm + '/' + dd + '/' + yyyy;
            console.log(today);
            
            var li = document.createElement('li');
            li.id = today;
            var input = document.createElement('input');
            input.type = "radio";
            input.name = "date";
            input.id = today;
            input.addEventListener('click', function(){
                selectedMovieDate(this.id);
            })
            console.log(today);
            var label = document.createElement('label');
            label.innerHTML = today;

            li.appendChild(input);
            li.appendChild(label);
            ul.appendChild(li);
        }
    }

        function selectedMovieDate(date){
            console.log(date);
            selectedDate_orderInfo = date; 
        }

      async  function generateTime () {
            var timeArray = "";
            await $.ajax({
                    url:'ajax.php',
                    type:'GET',
                    data:{functionname:'getshowtime',title:selectedMovie_orderInfo,theater:selectedTheater_orderInfo}, //Pass your varibale in data
                    success:function(json_data){
                        console.log(json_data);
            
                        var res = JSON.parse(json_data);
                        if (res[0]["theaterId"] != ""){
                            console.log(res);
                            timeArray = res[0]['showtime'].split(',');
                        } else {
                            alert("Didnt find showtime.");
                            return;
                        }
                    }
                })

            
            var ul = document.getElementById('time');
            for(var i = 0; i < timeArray.length; i++){
                    var li = document.createElement('li');
                    li.id = timeArray[i];
                    var input = document.createElement('input');
                    input.type = "radio";
                    input.name = "time";
                    input.id = timeArray[i];
                    input.addEventListener('click', function(){
                        selectedMovieTime(this.id);
                    })
                    var label = document.createElement('label');
                    label.innerHTML = timeArray[i];
                    li.appendChild(input);
                    li.appendChild(label);
                    ul.appendChild(li);            
            }
        }

        function selectedMovieTime(time){
            selectedTime_orderInfo = time;
        }

      async  function checkIfTimeAndDateSelected (){
            if (selectedTime_orderInfo == "" || selectedDate_orderInfo == ""){
                alert('Please select movie time and date');
                return;
            }
            var address = "";
            await $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'getSingleTheaterInfo',theaterId:selectedTheater_orderInfo}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        console.log(res);
                        if (res){
                            address = res[0]['street'] + " " + res[0]['city'] + " " + res[0]['state'] + " " + res[0]['zipcode'];
                        } else {
                            alert("You have no theater info.");
                            return;
                        }
                    }
                })

            document.getElementById('title_purchase').innerHTML = selectedMovie_orderInfo;
            document.getElementById('ratingLength_purchase').innerHTML = ratingLength_orderInfo;
            document.getElementById('dateTime_purchase').innerHTML = selectedDate_orderInfo + " | " + selectedTime_orderInfo;
            document.getElementById('adress_purchase').innerHTML = address;

            selectedAdult_orderInfo = 0;
            selectedChild_orderInfo = 0;
            selectedSenior_orderInfo = 0;
            buyTickitDropDownList();

            $("#cardPurchaseTickit").show();
            $("#cardChooseTime").hide();
        }

        var charge1 = 0, charge2 = 0, charge3 = 0;
       
       
        function buyTickitDropDownList() {
            var typeOfTickit = ["adultTickit_dropdown", "seniorTickit_dropdown", "childTickit_dropdown"];
            for (var i = 0; i < typeOfTickit.length; i++){
                var _select = document.getElementById(typeOfTickit[i]);
                _select.addEventListener('change', function(){
                    selectedTickits (this.id, this.value);
                })
                charge1 = 0, charge2 = 0, charge3 = 0;
                totalCost_orderInfo = 0;
                totalTickits_orderInfo = 0;
                selectedAdult_orderInfo = 0;
                selectedSenior_orderInfo = 0;
                selectedChild_orderInfo = 0;
                for(var j = 0; j < 11; j++){
                    var _option = document.createElement('option');
                     _option.id = j;
                     if (j == 0){
                        _option.selected = "selected";
                     }
                     if (typeOfTickit[i] == "adultTickit_dropdown"){
                        _option.name = "adult";
                     } else if (typeOfTickit[i] == "seniorTickit_dropdown"){
                         _option.name = "senior";
                     } else if (typeOfTickit[i] == "childTickit_dropdown"){
                         _option.name = "child";
                     }
                     _option.innerHTML = j;
                     _option.value = j;
                     _select.appendChild(_option);
                }
            }
        }

        function selectedTickits (name, count) {
            console.log(name);
            console.log(count);
            var adultTotal = document.getElementById('AdultTotal');
            var seniorTotal = document.getElementById('SeniorTotal');
            var childTotal = document.getElementById('ChildTotal');
            var grandTotal = document.getElementById('GrandTotal');

            
            if (name == "adultTickit_dropdown"){
                selectedAdult_orderInfo = parseInt(count);
                charge1 = 13 * selectedAdult_orderInfo;
                adultTotal.innerHTML = " $13 * "+ selectedAdult_orderInfo.toString() + " = $" +  charge1.toString(); 

            } else if (name == "seniorTickit_dropdown"){
                selectedSenior_orderInfo = parseInt(count);
                charge2 = 10 * selectedSenior_orderInfo;
                seniorTotal.innerHTML = " $10 * "+ selectedSenior_orderInfo.toString() + " = $" +  charge2.toString(); 

            } else if (name == "childTickit_dropdown"){
                selectedChild_orderInfo = parseInt(count);
                charge3 = 8 * selectedChild_orderInfo;
                childTotal.innerHTML = " $8 * "+ selectedChild_orderInfo.toString() + " = $" +  charge3.toString(); 
            }

            var total = charge1 + charge2 + charge3;
            totalCost_orderInfo = total;
            totalTickits_orderInfo = selectedAdult_orderInfo + selectedSenior_orderInfo + selectedChild_orderInfo;
            grandTotal.innerHTML = "Total Cost = $" + total.toString();

        }

      async  function checkIfTickitsSelected() {
            if (selectedAdult_orderInfo == 0 && selectedChild_orderInfo == 0 && selectedSenior_orderInfo == 0){
                alert("Please select tickit counts from dropdown");
                return;
            }  

            var address = "";
            await $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'getSingleTheaterInfo',theaterId:selectedTheater_orderInfo}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        console.log(res);
                        if (res){
                            address = res[0]['street'] + " " + res[0]['city'] + " " + res[0]['state'] + " " + res[0]['zipcode'];
                        } else {
                            alert("You have no theater info.");
                            return;
                        }
                    }
                })

            document.getElementById('title_payment').innerHTML = selectedMovie_orderInfo;
            document.getElementById('lengthTime_payment').innerHTML = ratingLength_orderInfo;
            document.getElementById('dateTime_payment').innerHTML = selectedDate_orderInfo + " | " + selectedTime_orderInfo;
            document.getElementById('address_payment').innerHTML = address;
            selectedPaymentCard_orderInfo = "";
            addSavedCardsToDropDown();
             saveCardForFuture = "";   
             var ul = document.getElementById('saveCard');
             ul.innerHTML = "";
             
             var li = document.createElement(li);
             var input = document.createElement('input');
             input.type = "checkbox";
             input.addEventListener('click', function(){
                        saveThisCard(input.checked);
                    })
             var label = document.createElement('label');
             label.innerHTML = "Save this card for future payments.";
             li.appendChild(input)
             li.appendChild(label)
             ul.appendChild(li);


             $("#cardPurchaseTickit").hide();
             $("#cardPaymentInformation").show();
        }
        var saveCardForFuture = "";
        function saveThisCard(x){
            saveCardForFuture = x;
            console.log(x + "  saved");
        }
        var generatedOrderId = "";
       async function addSavedCardsToDropDown () {
            var _select = document.getElementById('savedCard_dropdown');
            _select.addEventListener('change', function(){
                savedCardChanged(this.id);
            })
            var savedCard = "";
            selectedPaymentCard_orderInfo = "";
            await  $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'getsavedcardinfo',currentUser:currentUser}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        if (res[0]["number"] != "No info to show"){
                            var res = JSON.parse(json_data);
                            savedCard = res;
                        } else {
                            // alert("You have no saved card.");
                            //return;
                        }
                    }
                })
                console.log(savedCard);

            if (savedCard != ""){
                for (var i = -1; i < savedCard.length; i++){

                    var _option = document.createElement('option');
                    
                    if (i == -1){
                        _option.selected = "selected";
                        _option.value = "null";
                        _option.innerHTML = "Select one card";
                        _option.id = "null";
                    }
                    else {
                        _option.value = savedCard[i]['number'];
                        _option.innerHTML = savedCard[i]['number'];
                        _option.id = savedCard[i]['number'];
                    }
                    console.log("!");
                    _option.name = "SavedCard";
                    _option.style.fontSize = "20px";
                    _select.appendChild(_option);
                }
            }
        }
        var userSelectedFromDropDownCard = "false";
        function savedCardChanged(id){
            if (id != "null"){
                userSelectedFromDropDownCard = "true";
                selectedPaymentCard_orderInfo = id;
            }
        }

       async function checkForPaymentMethod(){
            var result = checkForInputCardDetails();
            if (userSelectedFromDropDownCard == "false" && result == "empty"){
                alert ("Select a payment mthod");
                return;
            }
           var OrderId = "";
           var monthYear = "";
           
            await  $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'getMaxNumOrderInfo'}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        console.log(res);
                        if (res != "0"){
                            OrderId = parseInt(res) + 1;
                            var temp = selectedDate_orderInfo.split('/');
                            monthYear = temp[0] + "/" + temp[2];
                            console.log(monthYear);
                        } else {
                             alert("Network error.");
                             return;
                        }
                    }
                })

                 console.log(OrderId);
         if (saveCardForFuture){
                     await  $.ajax({
                        url:'post.php',
                        type:'POST',
                        data:{functionname:'savetopaymeninfo',name:result[0],number:result[1],cvv:result[2],exp:result[3],currentUser:currentUser,currentUsername:currentUsername}, //Pass your varibale in data
                        success:function(json_data){
                                console.log(json_data);
                                if (json_data != 1) {
                                    alert (json_data);
                                    return;
                                } else {
                                }
                            }
                     })
            }
            console.log(selectedMovie_orderInfo);
            var order = OrderId.toString();
            await $.ajax({
                url:'post.php',
                type:'POST',
                data:{functionname:'saveToOrder',orderid:order,date:selectedDate_orderInfo,time:selectedTime_orderInfo,status:"Unused",senior:selectedSenior_orderInfo,
                                                child:selectedChild_orderInfo,adult:selectedAdult_orderInfo,total_tickit:totalTickits_orderInfo,cost:totalCost_orderInfo,
                                                cardNo:selectedPaymentCard_orderInfo,theaterId:selectedTheater_orderInfo,username:currentUsername,email:currentUser,
                                                movie:selectedMovie_orderInfo,monthYear:monthYear}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        if (json_data != 1) {
                            alert (json_data);
                            return;
                        } else {
                           console.log ("Entered successfully");
                           $("#cardOrderDone").show();
                           $("#cardPaymentInformation").hide();
                           showConfirmation(order);
                        }
                    }
        })
   
        }

       async  function showConfirmation(order) {
             var address = "";
            await $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'getSingleTheaterInfo',theaterId:selectedTheater_orderInfo}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        console.log(res);
                        if (res){
                            address = res[0]['street'] + " " + res[0]['city'] + " " + res[0]['state'] + " " + res[0]['zipcode'];
                        } else {
                            alert("You have no theater info.");
                            return;
                        }
                    }
                })
            document.getElementById('title_done').innerHTML = selectedMovie_orderInfo;
            document.getElementById('ratingLength_done').innerHTML = ratingLength_orderInfo;
            document.getElementById('dateTimeDone').innerHTML = selectedDate_orderInfo + " | " + selectedTime_orderInfo;
            document.getElementById('address_done').innerHTML = address;
            document.getElementById('confirmation_num').innerHTML = order;
        }

        function checkForInputCardDetails(){
            var cardDetail = [];
            var name =  $("#added_name_on_card").val();
            var number = $("#added_cardNumber").val();
            var cvv = $("#added_cardCvv").val();
            var exp = $("#added_cardExpiration").val();
            cardDetail.push(name);
            cardDetail.push(number);
            cardDetail.push(cvv);
            cardDetail.push(exp);
            
            if (cardDetail.includes("")){
                console.log(cardDetail);
                return "empty";
            }
            selectedPaymentCard_orderInfo = number;
            return cardDetail;
        }

        /*******
         * 
         * 
         * 
         * 
         */
        var histData = "";
     $("#btnSearchOrder").click(function(){
       var searchFor = $("#searchForThisOrder").val();
       console.log(searchFor);
       var temp = [];
       for (var i = 0; i < histData.length; i++){
           if (histData[i]['order_id'] == searchFor){
               temp.push(histData[i]);
           } 
       }
       if (temp != ""){
            showOrderHistoryTable(temp);
       } else if (temp == ""){
           getOrderHistoryData();
       } 
       else {
           alert('No Order Exist!')
           getOrderHistoryData();
           return;
       }
    });
      async function getOrderHistoryData(){
          console.log(currentUser); 
          await  $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'getOrderHistoryData',currentUser:currentUser}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        if (res[0]["order_id"] != ""){
                            console.log(res);
                            histData = res;
                            showOrderHistoryTable (res);
                        } else {
                            alert("You have no order history.");
                            return;
                        }
                    }
                })
        }

        function showOrderHistoryTable (orders) {
                    console.log(orders);
                    var table = document.getElementById('orderHistoryTable');
                    table.border = '1';
                    var tableBody = document.createElement('TBODY');
                    table.innerHTML = "";
                    for (var i = 0; i < orders.length; i++) {
                        var tr = document.createElement('TR');
                        tableBody.appendChild(tr);

                        for (var j = 0; j < 5; j++) {
                        var td = document.createElement('TD');
                        td.width = '175';
                        
                                if(j == 0){
                                    var _input = document.createElement('input');
                                    _input.type = "radio";
                                    _input.name = "orderHistory";
                                    _input.id = orders[i]["order_id"];
                                    _input.addEventListener('click', function(){
                                        selectedOrderFromOrderHistory(this.id);
                                    })
                                    td.appendChild(_input);
                                    tr.appendChild(td);
                                } else if (j == 1){
                                    td.appendChild(document.createTextNode(orders[i]["order_id"]));
                                    tr.appendChild(td);
                                }else if (j == 2){
                                    td.appendChild(document.createTextNode(orders[i]["movie"]));
                                    tr.appendChild(td);
                                }else if (j == 3){
                                    td.appendChild(document.createTextNode(orders[i]["status"]));
                                    tr.appendChild(td);
                                }else if (j == 4){
                                    td.appendChild(document.createTextNode(orders[i]["cost"]));
                                    tr.appendChild(td);
                                }
                        }
                    }
                    table.appendChild(tableBody);
               
        }

        var selected_OrderNumber = "";
        function selectedOrderFromOrderHistory(order) {
             console.log(order);
             selected_OrderNumber = order;
        }

      async function showOrderDetails(){
            var detail = "";
            var theater = "";
            var movie = "";

            await $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'getOrderHistoryData',currentUser:currentUser}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        if (res[0]["order_id"] != ""){
                            for (var i = 0; i < res.length; i++){
                                if (res[i]["order_id"] == selected_OrderNumber) {
                                    detail = res[i];
                                }
                            }
                        } else {
                            alert("You have no order history.");
                            return;
                        }
                    }
                })
            await $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'getsinglemoviedata',title:detail['movie']}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        if (res[0]["title"] != ""){
                            for (var i = 0; i < res.length; i++){
                                if (res[i]["title"] == detail['movie']) {
                                    movie = res[i];
                                    console.log(movie);
                                }
                            }
                        } else {
                            alert("You have no movie.");
                            return;
                        }
                    }
                })
            await $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'getSingleTheaterInfo',theaterId:detail['theater_id']}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        console.log(detail['theater_id']);
                        console.log(res);
                        if (res){
                            theater = res[0];
                        } else {
                            alert("You have no theater info.");
                            return;
                        }
                    }
                })
            if (detail != ""){
                document.getElementById('title_orderDetail').innerHTML = detail["movie"];
                document.getElementById('ratingLength_orderDetail').innerHTML = movie["rating"] + " | " + movie["length"];
                document.getElementById('dateTile_orderDetail').innerHTML = detail['order_date'] + " | " + detail['time'];
                document.getElementById('theaterInfo_orderDetail').innerHTML = theater["street"] + " " + theater["city"] + " " + theater["state"] + " " + theater["zipcode"];
                document.getElementById('tickit_orderDetails').innerHTML = "Total: " + detail["total"] + " Tickits Cost: " + detail["cost"];
            }
            else {
                alert("No detail to show");
                return;
            }
            orderStatus = detail;
        }
        var orderStatus = "";
      async  function checkOrderStatus(){
            if (orderStatus["status"] == "Completed" || orderStatus["status"] == "Cancelled"){
                alert('Can not proceed request because order status is ' + orderStatus["status"]);
                return;
            }
            var cancellation = "";
            var monthYear = "";
            var minusThis = "";
            var tickitsToMinus = "";
            var movie = "";
            await  $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'getCancellationCharge'}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        if (res != "0"){
                            console.log(res);
                            cancellation = res;
                            cancellation = Math.round(orderStatus['cost'] * (cancellation / 100));
                            minusThis = (parseInt(orderStatus['cost']) - cancellation ) * -1;
                            var temp = (orderStatus['order_date'].split('/'));
                            monthYear = temp[0] + "/" + temp[2];
                            tickitsToMinus = parseInt(orderStatus['total']) * -1;
                            movie = orderStatus['movie'];
                            console.log(monthYear);
                            console.log(minusThis);

                            alert("Cancellation charge was " + cancellation );
                        } else {
                            alert("Cancellation alert");
                            return;
                        }
                    }
                })



               await $.ajax({
                url:'post.php',
                type:'POST',
                data:{functionname:'updateorderstatus',order_id:orderStatus['order_id'], cost:cancellation, monthYear:monthYear, minusThis:minusThis, tickitsToMinus:tickitsToMinus, movie:movie}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        if (json_data != 1) {
                            alert (json_data);
                            return;
                        } else {
                             getOrderHistoryData();
                             $("#cardOrderDetail").hide();
                             $("#cardShowAllCustomerOrder").show();
                        }
                    }
        })

        }

        async function getAllSavedPaymentInfo(){
            await  $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'getsavedcardinfo',currentUser:currentUser}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        if (res[0]["number"] != "No info to show"){
                            var res = JSON.parse(json_data);
                            showSavedPaymentInformation(res)
                        } else {
                            alert("You have no saved card.");
                            return;
                        }
                    }
                })
        }
       
        function showSavedPaymentInformation(res){
                    selectedCard = "";
                    var table = document.getElementById('savedPaymentInformationTable');
                    table.border = '1';
                    var tableBody = document.createElement('TBODY');
                    console.log(table);
                    table.innerHTML = ""
                    for (var i = 0; i < res.length; i++) {
                        var tr = document.createElement('TR');
                        tableBody.appendChild(tr);
                        for (var j = 0; j < 4; j++) {
                        var td = document.createElement('TD');
                        td.width = '75';
                                if(j == 0){
                                    var _input = document.createElement('input');
                                    _input.type = "radio";
                                    _input.name = "paymentInfo";
                                    _input.id = res[i]["number"];
                                    _input.addEventListener('click', function(){
                                        selectedCardToDelete(this.id);
                                    })
                                    td.appendChild(_input);
                                    tr.appendChild(td);
                                } else if (j == 1){
                                    td.appendChild(document.createTextNode(res[i]['number']));
                                    tr.appendChild(td);
                                }else if (j == 2){
                                    td.appendChild(document.createTextNode(res[i]['name']));
                                    tr.appendChild(td);
                                }else if (j == 3){
                                    td.appendChild(document.createTextNode(res[i]['exp']));
                                    tr.appendChild(td);
                                }
                        }
                    }
                    table.appendChild(tableBody);
        }
        var selectedCard = "";
        function selectedCardToDelete(card){
            selectedCard = card;
        }

        function deleteSelectedSavedCard(){
             $.ajax({
                url:'post.php',
                type:'POST',
                data:{functionname:'deletesavedcard',cardnumber:selectedCard}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        if (json_data != 1) {
                            alert (json_data);
                            return;
                        } else {
                             getAllSavedPaymentInfo();
                        }
                    }
        })
        } 

      async  function getAllPreferedTheater(){
            await  $.ajax({
                url:'ajax.php',
                type:'GET',
                data:{functionname:'getpreferedtheater',currentUser:currentUser}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        var res = JSON.parse(json_data);
                        console.log(res);
                        if (res[0]["theaterId"] != "No info to show"){
                            var res = JSON.parse(json_data);
                            showAllPreferedTheater(res);
                            //console.log(res);
                        } else {
                            alert("You have no saved theater.");
                            return;
                        }
                    }
                })
        }

        function showAllPreferedTheater (res) {
            
            var ul = document.getElementById('listPreferedTheaters');
            ul.innerHTML = "";
            selectedTheaterToDelete = "";
            for (var i = 0; i < res.length; i++){
                var li = document.createElement('li');
                var span1 = document.createElement('span');
                var input = document.createElement('input');
                var span2 = document.createElement('span');
                var label = document.createElement('label');


                span1.style.display = "inline-block";
                span1.style.padding = "20px";

                input.type = "radio";
                input.name = "preferredTheater";
                input.id = res[i]["theaterId"];
                input.addEventListener('click', function(){
                                selectedPreferedTheater(this.id);
                            })

                span2.style.display = "inline-block";
                span2.style.padding = "20px";

                label.innerHTML = res[i]["street"] + " " + res[i]["city"] + " " + res[i]["state"] + " " + res[i]["zipcode"];

                span1.appendChild(input);
                span2.appendChild(label);

                li.appendChild(span1)
                li.appendChild(span2);
                ul.appendChild(li);
            }
        }
        var selectedTheaterToDelete = "";
        function selectedPreferedTheater(theater){
            selectedTheaterToDelete = theater;
            console.log(theater);
        }

        function deleteSelectedTheater(){
             $.ajax({
                url:'post.php',
                type:'POST',
                data:{functionname:'deletesavedtheater',theaterid:selectedTheaterToDelete}, //Pass your varibale in data
                success:function(json_data){
                        console.log(json_data);
                        if (json_data != 1) {
                            alert (json_data);
                            return;
                        } else {
                             console.log("Deleted");
                        }
                    }
         })
        }
 });