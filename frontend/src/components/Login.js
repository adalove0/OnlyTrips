import React, { useEffect, useState } from "react";
import App from "../App";
import logo from "../images/OnlyTrips.svg";
import Alert from "react-bootstrap/Alert";
import Button from "react-bootstrap/Button";

function Login() {
  var loginEmail;
  var loginPassword;

  const [message, setMessage] = useState("");
  const [show, setShow] = useState(true);

  const doLogin = async (event) => {
    var visAlertDanger = document.getElementById("alertDanger");
    event.preventDefault();

    var data = { email: loginEmail.value, password: loginPassword.value };
    var js = JSON.stringify(data);

    if (loginEmail.value === "" || loginPassword.value === "") {
      visAlertDanger.style.visibility = "visible";
      visAlertDanger.innerHTML = "Please enter credentials";
    }

    const appName = "onlytrips";
    function buildPath(route) {
      if (process.env.NODE_ENV === "production") {
        return "https://" + appName + ".herokuapp.com/" + route;
      } else {
        return "http://localhost:5000/login";
      }
    }
    try {
      const response = await fetch(buildPath("login"), {
        method: "POST",
        body: js,
        headers: { "Content-Type": "application/json" },
      });

      var res = await response.json();
      console.log(res);
      if (
        res.success !== true &&
        loginEmail.value !== "" &&
        loginPassword.value !== ""
      ) {
        //console.log(res.success);
        visAlertDanger.style.visibility = "visible";

        visAlertDanger.innerHTML = res.message;
      } else {
        var user = {
          fullName: res.user.name,
          email: res.user.email,
          id: res.user._id,
        };
        localStorage.setItem("user_data", JSON.stringify(user));
        alert(JSON.stringify(user));
        setMessage("");
        window.location.href = "/TripView";
      }
    } catch (e) {
      //alert(e.toString());
      return;
    }
  };

  return (
    <div>
      <Alert variant="danger" id="alertDanger">
        <p></p>
        <div></div>
      </Alert>
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
          <br />       {" "}
          <input
            type="password"
            id="textbox"
            placeholder="Password"
            ref={(c) => (loginPassword = c)}
          />
          <br />
                  
          <Button
            type="submit"
            variant="success"
            value="Do It"
            onClick={doLogin}
          >
            Login!
          </Button>
                  
        </form>
        <p id="signUpLink">
          {" "}
          Dont have an account?{" "}
          <a href="/SignUpPage" id="Link" /*onClick={goToSignUp}*/>
            Sign Up
          </a>
        </p>
             
      </div>
    </div>
  );
}

export default Login;
