$(document).ready(function(){  

  var date_input=$('input[name="date"]'); //our date input has the name "date"
  var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
  date_input.datepicker({
      format: 'mm/dd/yyyy',
      // startDate : '-365d',
      container: container,
      todayHighlight: true,
      autoclose: true,
  });
  console.log("page is loaded");


  $("#loginBtn").on('click', function (event){
    console.log("login button pressed");    
    // console.log($('#loginEmail').val()+":"+$('#loginPassword').val());
    // $.post("login", {email: $('#loginEmail').val(),
    //   password: $('#loginPassword').val()},function(data){      
    //    alert("Result: "+data);      
    // });
  });



  function formError(errCode) {
    switch(errCode) {
      case 1:
        alert("Invalid email");
        break;      
      case 2:
        alert("Invalid first name");
        break;
      default:
        alert("Something is wrong");
        break;
    }
  }

  function changeToInValid(element){
    element.removeClass("is-valid");
    element.addClass("is-invalid");  
  } 
  function changeToValid(element){
    element.removeClass("is-invalid");
    element.addClass("is-valid");  
  } 


  function getEmail(){
    let emailElement = $('#emailInput');
    let emailText = emailElement.val();    
    let regex = /^[a-z0-9._+\-]+@[a-z0-9.\-]+\.[a-z]{2,3}$/;
    if (!emailText.match(regex)) {            
      changeToInValid(emailElement); 
      return null;       
    } else {
      // changeToValid(emailElement);                  
      // return emailText;
      // ajax call can be made to server, if it already exists
      $.post("signup", {cmdUserServlet: "CHECK_EMAIL",
                email: emailText},function(data){
                let jsonResp = JSON.parse(data);
                if (jsonResp.emailExists==0) {
                  console.log("email is ok")                  
                  changeToValid(emailElement);                  
                  return emailText;
                } 
            }); 
      changeToInValid(emailElement);    
      return null;              
    }
  }

  function getPassword() {
    let passElement = $('#passwordInput');
    let passText = passElement.val();
    let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;
    if (!passText.match(regex)) {            
      changeToInValid(passElement);        
      return null;
    } else {      
      changeToValid(passElement);
      return passText;        
    }
  }

  function getBirth() {
    let dateElement = $('#dateInput');
    let inDate = dateElement.val();
    let cDate = Date.parse(inDate)    
    let currDate = Date.now();
    let ageDiff = currDate - cDate;
    let ageDate = new Date(ageDiff);
    let age = Math.abs(ageDate.getUTCFullYear()-1970);
    if (age<15) {      
      changeToInValid(dateElement);
      return null
    } else {    
      changeToValid(dateElement);
      return inDate;
    }          
  }

  $('#emailInput').focusout(function(){    
    getEmail();
  });

  $('#passwordInput').keyup(function(){
    getPassword();
  });

  $('#dateInput').change(function(){
    getBirth();
  })
  
  // client side sign up form validation
  $("#signupBtn").on('click',function() {    
    // Error code used for showing which value is failed
    let errorCode = 0;
    let errorIndex=0;

    // check the email
    let inEmail = $('#emailInput').val();        
    console.log(inEmail);
    if (inEmail==null){
      errorCode|=(1<<errorIndex);
    }
    
    // check the password
    errorIndex++;
    let inPassword = getPassword();
    if (inPassword==null){
      errorCode|=(1<<errorIndex);
    }

    // check the firstname
    errorIndex++;
    let inFirstName = $('#firstNameInput').val();
    if (inFirstName==""){
      errorCode|=(1<<errorIndex);
    }

    // check the lastname
    errorIndex++;
    let inLastName = $('#lastNameInput').val();
    if (inLastName==""){
      errorCode|=(1<<errorIndex);
    }

    // check the gender
    errorIndex++;
    let inGender = $('#genderInput').val();
    console.log("gender:"+inGender);
    if (inGender==""){
      errorCode|=(1<<errorIndex);
    }

    // check the age
    errorIndex++;
    let inDateOfBirth = getBirth();
    if (inDateOfBirth==null){
      errorCode|=(1<<errorIndex);
    }    

    // check the city
    errorIndex++;
    let inCity = $('#cityInput').val();
    if (inCity==""){
      errorCode|=(1<<errorIndex);
    }

    // check the state
    errorIndex++;
    let inState = $('#stateInput').val();
    if (inState==""){
      errorCode|=(1<<errorIndex);
    }

    // check the zipcode
    errorIndex++;
    let inZipcode = $('#zipcodeInput').val();
    if (inZipcode==""){
      errorCode|=(1<<errorIndex);
    }

    // check the street
    errorIndex++;
    let inStreet = $('#streetInput').val();
    if (inStreet==""){
      errorCode|=(1<<errorIndex);
    }

    errorIndex++;
    // if it is other than 0, there is an error
    if (errorCode!=0) {      
      alert("there is a error"+errorCode);
      return;
    }    
    
    let jsonPayload = new Object();
    jsonPayload.email = inEmail;
    jsonPayload.firstName = inFirstName;
    console.log(inLastName);
    jsonPayload.lastName = inLastName;
    jsonPayload.password = inPassword;
    jsonPayload.gender = inGender;
    jsonPayload.dateOfBirth = inDateOfBirth;
    jsonPayload.city = inCity; 
    jsonPayload.state = inState;
    jsonPayload.zipcode = inZipcode;
    jsonPayload.street = inStreet;

    let jsonStr = JSON.stringify(jsonPayload);
    console.log(jsonStr);
    
    // there is no error in validation
    // send AJAX post call to server
    $.post("signup", {cmdUserServlet: "CREATE_USER",
      payload: jsonStr},function(data){
        console.log(data);
        window.location.replace("home");
      // alert("Result: "+data);      
    });

  }) ;
});