import React, { useEffect, useState } from "react";
import App from "../App";
import logo from "../images/OnlyTrips.svg";
import SignUpPage from "../pages/SignUpPage.js";
import Alert from "react-bootstrap/Alert";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/esm/Modal";

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
      const response = await fetch("http://localhost:3000/login", {
        method: "POST",
        body: js,
        headers: { "Content-Type": "application/json" },
      });

      var res = await response.json();
      console.log(res);
      if (!res.success) {
        return (
          <Modal show={show} onHide={handleClose} variant="primary">
            <Modal.Header closeButton>
              <Modal.Title>Modal heading</Modal.Title>
            </Modal.Header>
            <Modal.Body>
              Woohoo, you're reading this text in a modal!
            </Modal.Body>
            <Modal.Footer>
              <Button variant="secondary" onClick={handleClose}>
                Close
              </Button>
            </Modal.Footer>
          </Modal>
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
          class="buttons"
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
