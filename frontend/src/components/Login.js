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

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  const doLogin = async (event) => {
    event.preventDefault();

    var data = { email: loginEmail.value, password: loginPassword.value };
    var js = JSON.stringify(data);
    alert(js);

    if (loginEmail.value == "" || loginPassword.value == "") {
    }

    try {
      // if(inProduction)
      // {
      //   Post to website
      // }
      const response = await fetch(
        "http://localhost:5000/login" || "http://www.onlytrips.xyz/login",
        {
          method: "POST",
          body: js,
          headers: { "Content-Type": "application/json" },
        }
      );

      var res = await response.json();
      console.log(res);
      console.log(res.success);
      if (res.success != true) {
        return (
          <Alert
            show={show}
            variant="danger"
            onClose={() => setShow(false)}
            dismissible
          >
            <Alert.Heading>Uh Oh!</Alert.Heading>
            <p>
              We ran into an error trying to log you in if you have registered
              an account please check your email to validate it!
            </p>
            <Button onClick={() => setShow(false)} variant="outline-success">
              Exit
            </Button>
          </Alert>
        );
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
                
        <Button
          type="submit"
          variant="success"
          value="Do It"
          onClick={doLogin}
          style={{ cursor: "pointer" }}
        >
          Login!
        </Button>
                
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
