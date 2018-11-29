
 $(document).ready(function(){
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
     
    $("#cardPreferedTheater").hide();
    /* Log In button on Log In Card */
    $("#btnLogIn_loginCard").click(function(){
        loginValidationCheck();
        showOrderHistoryTable();
        showSavedPaymentInformation();
        showAllPreferedTheater();
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
        $("#cardMovieOverview").show();
    });    

    $("#btnBack_overview").click(function(){
        $("#cardSingleMovieData").show();
        $("#cardMovieOverview").hide();
    });

    $("#btnMovieReview_cardSingleMovieData").click(function(){
        $("#cardSingleMovieData").hide();
        $("#cardMovieReview").show();
    });

    $("#btnAddReview").click(function(){
        $("#cardGiveReview").show();
        $("#cardMovieReview").hide();
    });

    $("#btnBack_movieReview").click(function(){
        $("#cardSingleMovieData").show();
        $("#cardMovieReview").hide();
    });

    $("#btnBack_cardGiveReview").click(function(){
        $("#cardMovieReview").show();
        $("#cardGiveReview").hide();
    });

    $("#btnSubmitReview").click(function(){
        $("#cardGiveReview").hide();
         $("#cardMovieList").show();
    });

    $("#btnBack_cardChooseTheater").click(function(){
        $("#cardChooseTheater").hide();
        $("#cardSingleMovieData").show();
    });

    $("#btnBuyTickit_cardSingleMovieData").click(function(){
        $("#cardChooseTheater").show();
        $("#cardSingleMovieData").hide();
    });

    $("#btnSelectTime").click(function(){
        $("#cardChooseTime").show();
        $("#cardChooseTheater").hide();
    });

    $("#btnBack_cardChooseTime").click(function(){
        $("#cardChooseTheater").show();
        $("#cardChooseTime").hide();
    });

    $("#btnSelectTickit").click(function(){
        $("#cardPurchaseTickit").show();
        $("#cardChooseTime").hide();
    });

    $("#btnBack_cardPurchaseTickit").click(function(){
        $("#cardPurchaseTickit").hide();
        $("#cardChooseTime").show();
    }); 

    $("#btnPayment").click(function(){
        $("#cardPurchaseTickit").hide();
        $("#cardPaymentInformation").show();
    });

    $("#btnBack_cardPaymentInformation").click(function(){
        $("#cardPaymentInformation").hide();
        $("#cardPurchaseTickit").show();
    });

    $("#btnSubmitPayment").click(function(){
        $("#cardOrderDone").show();
        $("#cardPaymentInformation").hide();
    });
   
    $("#btnHome_cardOrderDone").click(function(){
        $("#cardOrderDone").hide();
        $("#cardMovieList").show();
    });

    
    $("#btnOrderHistory_ME").click(function(){
        $("#cardPersonalAccount").hide();
        $("#cardShowAllCustomerOrder").show();
    });

    $("#btnBack_cardShowAllCustomerOrder").click(function(){
        $("#cardPersonalAccount").show();
        $("#cardShowAllCustomerOrder").hide();
    });

    $("#btnViewDetails_cardShowAllCustomerOrder").click(function(){
        $("#cardShowAllCustomerOrder").hide();
        $("#cardOrderDetail").show();
    }); 

    $("#btnBack_OrderDetails").click(function(){
        $("#cardOrderDetail").hide();
        $("#cardShowAllCustomerOrder").show();
    }); 

    $("#btnPaymentInfo_ME").click(function(){
        $("#cardSavedPaymentInformation").show();
        $("#cardPersonalAccount").hide();
    });

    $("#btnBack_savedPaymentInfo").click(function(){
        $("#cardSavedPaymentInformation").hide();
        $("#cardPersonalAccount").show();
    });

    $("#btnPreferedTheater_ME").click(function(){
        $("#cardPreferedTheater").show();
        $("#cardPersonalAccount").hide();
    });

    $("#btnBack_PreferedTheater").click(function(){
        $("#cardPreferedTheater").hide();
        $("#cardPersonalAccount").show();
    });

    function loginValidationCheck(){
        $("#cardLogin").show();
        $("#cardCreateAccount").hide();
        var email = $("#login_email_address").val();
        var pass = $("#login_password").val();
        $.ajax({
        url:'ajax.php',
        type:'GET',
        data:{functionname:'logindata' ,email:email, pass:pass}, //Pass your varibale in data
        success:function(json_data){
            loadDataWithCurrentMovies();
            // if (json_data === "true"){
            //     $("#cardLogin").hide();
            //     loadDataWithCurrentMovies();
            // } else {
            //     alert("Invalid credentials");
            // }
             console.log(json_data); 
            }
        })
    }
    
    function createAccountValidaionCheck(){
        console.log("Create button tapped");
        $("#cardCreateAccount").hide();
        loadDataWithCurrentMovies();
        console.log("Showing movie list");
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
    var tr, td;
    tbody = document.getElementById("showList");
    // loop through data source
    for (var i = 0; i < str.length; i++) {
        tr = tbody.insertRow(tbody.rows.length);
        tr.style.alignSelf = "center";
        td =  tr.insertCell(tr.cells.length);
        //td.setAttribute("align","center");
        //td.style.alignSelf = "center";
        var btn = document.createElement('button');
        btn.className = "mdl-button mdl-js-button mdl-button--primary";
        btn.innerHTML = str[i];
        btn.style.fontSize = "18px";
        btn.style.alignSelf = "center";
        btn.style.width = '150px';
        btn.style.height = '60px';
        btn.id = str[i];
        btn.value = str[i];
        btn.addEventListener('click', function(){
            movieSelected(this.id);
        })
        td.appendChild(btn);
    }
}

    function movieSelected(title){
        console.log(title);
        $("#cardMovieList").hide();
        document.getElementById("movieSelectedTitle").innerHTML = title;
        $("#cardSingleMovieData").show();;
    }


    function generateDates() {
        var ul = document.getElementById('date');
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

            var label = document.createElement('label');
            label.innerHTML = today;

            li.appendChild(input);
            li.appendChild(label);
            ul.appendChild(li);
        }
    }

        function selectedMovieDate(date){
            console.log(date);
        }

        function generateTime () {
            var timeArray = ["4:00PM", "6:00PM", "8:00PM", "10:00PM", "11:00PM"];
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

        function selectedMovieTime(date){
            console.log(date);
        }

        function buyTickitDropDownList() {
            
            var typeOfTickit = ["adultTickit_dropdown", "seniorTickit_dropdown", "childTickit_dropdown"];
            for (var i = 0; i < typeOfTickit.length; i++){
                var _select = document.getElementById(typeOfTickit[i]);
                _select.addEventListener('change', function(){
                    selectedTickits (this.id, this.value);
                })

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
        }

        function addSavedCardsToDropDown () {
            var _select = document.getElementById('savedCard_dropdown');
            _select.addEventListener('change', function(){
                savedCardChanged(this.id, this.value);
            })

            var savedCard = ["Select one card","12344567898761234","12344567898761234",
                             "12344567898761234","12344567898761234",
                             "12344567898761234","12344567898761234"];

            for (var i = 0; i < savedCard.length; i++){

                var _option = document.createElement('option');
                
                if (savedCard[i] == "Select one card"){
                    _option.selected = "selected";
                    _option.value = "null";
                }
                else {
                    _option.value = savedCard[i];
                }
                _option.innerHTML = savedCard[i];
                
                _option.id = savedCard[i];
                _option.name = "SavedCard";
                _option.style.fontSize = "20px";
                _select.appendChild(_option);
            }
        }

        function savedCardChanged(id, name){
            console.log(id);
            console.log(name);
        }

        function showOrderHistoryTable () {
            var orderId = ["1234","4567","4343","6666","5678"];
            var movie = ["Movie1", "Movie2","Movie3","Movie4","Movie5"];
            var status = ["Completed","Unused","Cancelled","Complete","Comleted"];
            var cost = ["12.3","45.6","1142","666","333"];

                    var table = document.getElementById('orderHistoryTable');
                    table.border = '1';
                    var tableBody = document.createElement('TBODY');
                    
                    for (var i = 0; i < 5; i++) {
                        var tr = document.createElement('TR');
                        tableBody.appendChild(tr);

                        for (var j = 0; j < 5; j++) {
                        var td = document.createElement('TD');
                        td.width = '75';
                        
                        if(j == 0){
                            var _input = document.createElement('input');
                            _input.type = "radio";
                            _input.name = "orderHistory";
                            _input.id = orderId[i];
                            _input.addEventListener('click', function(){
                                selectedOrderFromOrderHistory(this.id);
                            })
                            td.appendChild(_input);
                            tr.appendChild(td);
                        } else if (j == 1){
                            td.appendChild(document.createTextNode(orderId[i]));
                            tr.appendChild(td);
                        }else if (j == 2){
                            td.appendChild(document.createTextNode(movie[i]));
                            tr.appendChild(td);
                        }else if (j == 3){
                            td.appendChild(document.createTextNode(status[i]));
                            tr.appendChild(td);
                        }else if (j == 4){
                            td.appendChild(document.createTextNode(cost[i]));
                            tr.appendChild(td);
                        }
                        }
                    }
                    table.appendChild(tableBody);
               
        }
        function selectedOrderFromOrderHistory(order) {
            console.log(order);
        }

        function showSavedPaymentInformation(){
            var cardNumber = ["1234","4567","4343","6666","5678"];
            var name = ["Name1", "Name2","Name3","Name4","Name5"];
            var expDate = ["12/2019","12/2019","12/2019","12/2019","12/2019"];

                    var table = document.getElementById('savedPaymentInformationTable');
                    table.border = '1';
                    var tableBody = document.createElement('TBODY');
                    console.log(table);
                    for (var i = 0; i < 5; i++) {
                        var tr = document.createElement('TR');
                        tableBody.appendChild(tr);

                        for (var j = 0; j < 4; j++) {
                        var td = document.createElement('TD');
                        td.width = '75';
                                if(j == 0){
                                    var _input = document.createElement('input');
                                    _input.type = "radio";
                                    _input.name = "paymentInfo";
                                    _input.id = cardNumber[i];
                                    _input.addEventListener('click', function(){
                                        selectedCardToDelete(this.id);
                                    })
                                    td.appendChild(_input);
                                    tr.appendChild(td);
                                } else if (j == 1){
                                    td.appendChild(document.createTextNode(cardNumber[i]));
                                    tr.appendChild(td);
                                }else if (j == 2){
                                    td.appendChild(document.createTextNode(name[i]));
                                    tr.appendChild(td);
                                }else if (j == 3){
                                    td.appendChild(document.createTextNode(expDate[i]));
                                    tr.appendChild(td);
                                }
                        }
                    }
                    table.appendChild(tableBody);
        }

        function selectedCardToDelete(card){
            console.log(card);
        }

        function showAllPreferedTheater () {
            var address = ["123 Street Tuscaloosa AL 35401",
                           "900 Street Tuscaloosa AL 35401",
                           "567 Street Tuscaloosa AL 35401"];

            var ul = document.getElementById('listPreferedTheaters');

            for (var i = 0; i < address.length; i++){
                var li = document.createElement('li');
                var span1 = document.createElement('span');
                var input = document.createElement('input');
                var span2 = document.createElement('span');
                var label = document.createElement('label');


                span1.style.display = "inline-block";
                span1.style.padding = "20px";

                input.type = "radio";
                input.name = "preferredTheater";
                input.id = address[i];
                input.addEventListener('click', function(){
                                selectedPreferedTheater(this.id);
                            })

                span2.style.display = "inline-block";
                span2.style.padding = "20px";

                label.innerHTML = address[i];

                span1.appendChild(input);
                span2.appendChild(label);

                li.appendChild(span1)
                li.appendChild(span2);
                console.log("Added");
                ul.appendChild(li);
            }
        }

        function selectedPreferedTheater(theater){
            console.log(theater);
        }
 });
