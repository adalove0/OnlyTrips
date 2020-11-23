import React, { useEffect, useState, useRef } from "react";
import App from "../App";
import logo from "../images/OnlyTrips.png";
import Modal from "react-bootstrap/Modal";
import Button from "react-bootstrap/Button";
import Alert from "react-bootstrap/Button";

function SignUp() {
  var loginEmail;
  var confirmEmail;
  var firstLastName;
  var loginPassword;
  var confirmPassword;
  var age;

  var locationState;
  var locationCity;
  var locationCountry;
  var locationZip;

  var secQ1;
  var ans1;
  var secQ2;
  var ans2;
  var secQ3;
  var ans3;

  const [message, setMessage] = useState("");
  const [show, setShow] = useState(false);

  const doSignUp = async (event) => {
    var visAlertSuccess = document.getElementById("alertSuccessDiv");
    var visAlertDanger = document.getElementById("alertDangerDiv");
    event.preventDefault();
    if (
      loginEmail.value === "" ||
      confirmEmail.value === "" ||
      firstLastName.value === "" ||
      loginPassword.value === "" ||
      confirmPassword.value === "" ||
      age.value === "" ||
      locationCity.value === "" ||
      locationCountry.value === "" ||
      locationState.value === "" ||
      locationZip.value === ""
    ) {
      visAlertDanger.style.visibility = "visible";
      visAlertDanger.innerHTML += "Please fill in all blanks";
    } else if (loginEmail.value !== confirmEmail.value) {
      visAlertDanger.style.visibility = "visible";
      visAlertDanger.innerHTML = "Login Emails don't match";
      // return;
    } else if (loginPassword.value !== confirmPassword.value) {
      visAlertDanger.style.visibility = "visible";
      visAlertDanger.innerHTML = "Passwords don't match";
      // return;
    } else {
      visAlertSuccess.style.visibility = "visible";
    }

    var obj = {
      email: loginEmail.value,
      name: firstLastName.value,
      password: loginPassword.value,
      age: age.value,
      location: {
        city: locationCity.value,
        state: locationState.value,
        country: locationCountry.value,
        zip: locationZip.value,
      },
      securityQ1: secQ1.value,
      answer1: ans1.value,
      secerityQ2: secQ1.value,
      ans2: ans2.value,
      secQ3: secq3.value,
      ans3: ans3.value,
    };

    var js = JSON.stringify(obj);
    //alert(js);
    const appName = "onlytrips";
    function buildPathSignUp(route) {
      if (process.env.NODE_ENV === "production") {
        return "https://" + appName + ".herokuapp.com/" + route;
      } else {
        return "http://localhost:5000/signup";
      }
    }
    try {
      const response = await fetch(buildPathSignUp("signup"), {
        method: "POST",
        body: js,
        headers: { "Content-Type": "application/json" },
      });

      var res = await response.json();
      console.log(res);

      if (res.id <= 0) {
        setMessage("User/Password combination incorrect");
      } else {
        var user = {
          firstName: res.firstName,
          lastName: res.lastName,
          id: res.id,
        };
        localStorage.setItem("user_data", JSON.stringify(user));
        setMessage(res.id + "" + res.email);
        window.location.href = "#/onlytrips";
      }
    } catch (e) {
      //alert(e.toString());
      return;
    }
  };

  const closeAlert = async (event) => {
    var visAlertSuccess = document.getElementById("alertSuccessDiv");
    var visAlertDanger = document.getElementById("alertDangerDiv");
    event.preventDefault();
    console.log("Hello");
    visAlertDanger.style.visibility = "hidden";
    visAlertSuccess.style.visibility = "hidden";
  };

  function saveQuestion(question) {
    var qClass;
    var dropDown;
    if (question >= 1 && question <= 3) {
      qClass = document.getElementById("secQ1");
      dropDown = document.getElementsByClassName("dropdown-content1")[0];
      console.log(dropDown.style.block);
      if (question == 1) {
        console.log(qClass.placeholder);
        qClass.value = "What is your mother's maiden name?";
        secQ1 = "What is your mother's maiden name?";
      } else if (question == 2) {
        console.log(2);
        qClass.value = "What is the name of your first pet?";
        secQ1 = "What is the name of your first pet?";
      } else {
        console.log(3);
        qClass.value = "What is the make of your first car?";
        secQ1 = "What is the make of your first car?";
      }

      //dropDown.removeClass('hover');
    } else if (question >= 4 && question <= 6) {
      qClass = document.getElementById("secQ2");
      if (question == 4) {
        console.log(4);
        qClass.value = "What middle school did you attend?";
        secQ2 = "What middle school did you attend?";
      } else if (question == 5) {
        console.log(5);
        qClass.value = "Where would you like to travel?";
        secQ2 = "Where would you like to travel?";
      } else {
        console.log(6);
        qClass.value = "What is your favorite color?";
        secQ2 = "What is your favorite color?";
      }
    } else {
      qClass = document.getElementById("secQ3");
      if (question == 7) {
        console.log(7);
        qClass.value = "What is your favorite TV show?";
        secQ3 = "What is your favorite TV show?";
      } else if (question == 8) {
        console.log(8);
        qClass.value = "What did you want to be when you were growing up?";
        secQ3 = "What did you want to be when you were growing up?";
      } else {
        console.log(9);
        qClass.value = "What month was your father born in?";
        secQ3 = "What month was your father born in?";
      }
    }
  }

  const goToLogin = async (event) => {
    event.preventDefault();
    window.location.href = "/";
  };

  return (
    <div>
      <div id="alertDangerDiv">
        <p></p>
      </div>
      <div id="alertSuccessDiv">
        <p>
          Thank you for signing up! Please check your email for a verification
          link! <button onClick={closeAlert}> x </button>
        </p>
      </div>
      <div id="signUpDiv">
        <img src={logo} alt="OnlyTrips Logo" id="SignUpLogo"></img>
        <form id="SignUpForm">
          <input
            style={{ marginTop: "50px" }}
            type="text"
            id="textbox"
            placeholder="Email"
            ref={(c) => (loginEmail = c)}
          />
          <br />
          <input
            type="text"
            id="textbox"
            placeholder="Confirm Email"
            ref={(c) => (confirmEmail = c)}
          />
          <br />
          <input
            type="text"
            id="textbox"
            placeholder="First Name"
            ref={(c) => (firstLastName = c)}
          />
          <br />
          <input
            type="password"
            id="textbox"
            placeholder="Create Password"
            ref={(c) => (loginPassword = c)}
          />
          <br />
          <input
            type="password"
            id="textbox"
            placeholder="Confirm Password"
            ref={(c) => (confirmPassword = c)}
          />
          <br />
          <input
            type="number"
            id="textbox"
            placeholder="age"
            ref={(c) => (age = c)}
          />
          <br />
          <p>Location information</p>
          <br />
          <input
            type="text"
            id="textbox"
            placeholder="State"
            ref={(c) => (locationState = c)}
          />
          <input
            type="text"
            id="textbox"
            placeholder="City"
            ref={(c) => (locationCity = c)}
          />
          <input
            type="text"
            id="textbox"
            placeholder="Country"
            ref={(c) => (locationCountry = c)}
          />
          <input
            type="text"
            id="textbox"
            placeholder="ZipCode"
            ref={(c) => (locationZip = c)}
          />
          <br />
          {/* SECURITY QUESTIONS */}
          {/*
          <p>Security Questions</p>
          <div className="dropdown">
            <input
              className="dropbtn1"
              id="secQ1"
              value="Security Question 1"
              ref={(c) => (secQ1 = c)}
            /> 

            <div id="ddown1" className="dropdown-content1">
              <a href="#" onClick={()=> saveQuestion(1)}>What is your mother's maiden name?</a>
              <a href="#" onClick={()=> saveQuestion(2)}>What is the name of your first pet?</a>
              <a href="#" onClick={()=> saveQuestion(3)}>What make was your first car?</a>
            </div>
            
            <input
              type="text"
              id="textbox"
              placeholder="Answer"
              ref={(c) => (ans1 = c)}
            />

          </div> 
          <div className="dropdown">
            <input
              className="dropbtn2"
              id="secQ2"
              value="Security Question 2"
              ref={(c) => (secQ2 = c)}
            />

            <div className="dropdown-content2">
              <a href="#" onClick={()=> saveQuestion(4)}>What middle school did you attend?</a>
              <a href="#" onClick={()=> saveQuestion(5)}>Where would you like to travel to?</a>
              <a href="#" onClick={()=> saveQuestion(6)}>What is your favorite color?</a>
            </div>

            <input
              type="text"
              id="textbox"
              placeholder="Answer"
              ref={(c) => (ans2 = c)}
            />
          </div> 
          
          <div className="dropdown">
            <input
                className="dropbtn3"
                id="secQ3"
                value="Security Question 3"
                ref={(c) => (secQ3 = c)}
              />
              
              <div className="dropdown-content3">
                <a href="#" onClick={()=> saveQuestion(7)}>What is your favorite TV show?</a>
                <a href="#" onClick={()=> saveQuestion(8)}>What did you want to be growing up?</a>
                <a href="#" onClick={()=> saveQuestion(9)}>What month was your father born in?</a>
              </div>

              <input
                type="text"
                id="textbox"
                placeholder="Answer"
                ref={(c) => (ans3 = c)}
              />
          </div>
          <br /> */}
          <br />

          <Button id="SignUpButton" type="button" onClick={doSignUp}>
            Sign Up
          </Button>
        </form>
        <p id="loginLink">
          {" "}
          Have an account?{" "}
          <a id="Link" href="/" /*onClick={goToLogin}*/>
            Log In!
          </a>
        </p>
      </div>
    </div>
  );
}

export default SignUp;
