import React, { useEffect, useState } from "react";
import App from "../App";
import logo from "../images/OnlyTrips.svg";
import SignUpPage from "../pages/SignUpPage.js";
import Alert from "react-bootstrap/Alert";

function Login() {
  var loginEmail;
  var loginPassword;

  const [message, setMessage] = useState("");
  const [show, setShow] = useState(true);

  const doLogin = async (event) => {
    event.preventDefault();

    var data = { email: loginEmail.value, password: loginPassword.value };
    var js = JSON.stringify(data);
    alert(js);

    try {
      const response = await fetch("http://localhost:3000", {
        method: "POST",
        body: js,
        headers: { "Content-Type": "application/json" },
      });

      var res = await response.json();
      console.log(res);
      alert({ res });
      if (res.id <= 0) {
        setMessage("User/Password combination incorrect");
      } else {
        var user = {
          firstName: res.firstName,
          lastName: res.lastName,
          id: res.id,
        };
        localStorage.setItem("user_data", JSON.stringify(user));

        setMessage("");
        window.location.href = "/TripView";
      }
    } catch (e) {
      alert(e.toString());
      return;
    }
  };

  const goToSignUp = async (event) => {
    event.preventDefault();
    window.location.href = "/SignUpPage";
  };

  return (
    <div id="loginDiv">
      <img src={logo} alt="OnlyTrips Logo" id="logo"></img>
              
      <form id="loginForm" onSubmit={doLogin}>
               {" "}
        <input
          type="text"
          id="textbox"
          placeholder="Username"
          ref={(c) => (loginEmail = c)}
        />
        <br />
               {" "}
        <input
          type="password"
          id="textbox"
          placeholder="Password"
          ref={(c) => (loginPassword = c)}
        />
        <br />
                
        <input
          type="submit"
          id="loginButton"
          class="buttons"
          value="Do It"
          onClick={doLogin}
          style={{ cursor: "pointer" }}
        />
                
      </form>
      <p id="signUpLink">
        {" "}
        Dont have an account?{" "}
        <a id="Link" onClick={goToSignUp}>
          Sign Up
        </a>
      </p>
           
    </div>
  );
}

export default Login;
