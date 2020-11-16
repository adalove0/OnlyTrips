import React, { useEffect, useState, useRef } from "react";
import App from "../App";
import logo from "../images/OnlyTrips.svg";
import Modal from "react-bootstrap/Modal";
import Button from "react-bootstrap/Button";

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

  const [message, setMessage] = useState("");

  const doSignUp = async (event) => {
    event.preventDefault();
    if (loginEmail.value != confirmEmail.value) {
      alert("Login Emails dont match");
      return;
    }

    if (loginPassword.value != confirmPassword.value) {
      alert("Passwords dont match");
      return;
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
    alert(js);
    try {
      const response = await fetch("http://localhost:3000/signup", {
        method: "POST",
        body: js,
        headers: { "Content-Type": "application/json" },
      });

      var res = await response.json();
      alert(res);

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
      alert(e.toString());
      return;
    }
  };

  const goToLogin = async (event) => {
    event.preventDefault();
    window.location.href = "/";
  };

  return (
    <div id="signUpDiv">
      <Modal.Dialog>
        <Modal.Header closeButton>
          <Modal.Title>Modal title</Modal.Title>
        </Modal.Header>

        <Modal.Body>
          <p>Modal body text goes here.</p>
        </Modal.Body>

        <Modal.Footer>
          <Button variant="secondary">Close</Button>
          <Button variant="primary">Save changes</Button>
        </Modal.Footer>
      </Modal.Dialog>
      <img src={logo} alt="OnlyTrips Logo" id="logo"></img>
      <form id="SignUpForm">
        <input
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
        <br />

        <button id="SignUpButton" type="button" onClick={doSignUp}>
          Sign Up
        </button>
      </form>
      <p id="loginLink">
        {" "}
        Have an account?{" "}
        <a id="Link" onClick={goToLogin}>
          {" "}
          Log In!{" "}
        </a>
      </p>
    </div>
  );
}

export default SignUp;
