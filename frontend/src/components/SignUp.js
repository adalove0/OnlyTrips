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
    };

    var js = JSON.stringify(obj);
    //alert(js);
<<<<<<< HEAD
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
=======
    const appName = "onlytrips"
    function buildPathSignUp(route){
      if(process.ENV.NODE_ENV === "production"){
        return "https://" + appName + ".herokuapp.com/" + route;
      } else {
        return "https://localhost:5000/signup";
      }
    }
    try {
      const response = await fetch(buildPathSingUp("signup"), {
>>>>>>> 65f9e5a3c12ba90ab28e0de04e3a5b0f5952e724
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
