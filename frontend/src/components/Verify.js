import React, { useEffect, useState } from "react";
import App from "../App";
import SignUpPage from "../pages/SignUpPage.js";
import Alert from "react-bootstrap/Alert";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/esm/Modal";
import logo from "../images/updated-logo.PNG";

function Verify() {

  const doVerify = async (event) => {
    var tokenVal = new URLSearchParams(window.location.search).get('token');
    var obj = {token: tokenVal};
    var js = JSON.stringify(obj);
    alert(js);

    const appName = "onlytrips";
    function buildPath(route) {
      if (process.env.NODE_ENV === "production") {
        return "http://" + appName + ".herokuapp.com/" + route;
      } else {
        return "http://localhost:5000/verify";
      }
    }
    try {
      const response = await fetch(buildPath("verify"), {
        method: "POST",
        body: js,
        headers: { "Content-Type": "application/json" },
      });

      var res = await response.json();
      console.log(res);
      window.location.href = "/";
    } catch (e) {
      alert(e.toString());
      return;
    }
  };

  return (
    <div id="VerifyTable">
    <div className ="header"><h1>WELCOME TO ONLY TRIPS</h1></div><div className = "text-info"><p id = "congrats-text">Congratulations!</p>
          <p id = "confirm-text"> You're one step away from joining the onlyTrips family, activate your account by clicking on the button below:</p>
          <div>
            <button id = "activate-btn" onClick={doVerify}>ACTIVATE ACCOUNT</button>
        </div>
      </div>
      </div>
  );
}

export default Verify;
