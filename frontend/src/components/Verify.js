import React, { useEffect, useState } from "react";
import App from "../App";
import SignUpPage from "../pages/SignUpPage.js";
import Alert from "react-bootstrap/Alert";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/esm/Modal";
import logo from "../images/OnlyTrips.svg";

function Verify() {
  const userObj = localStorage.getItem("user_data");
  const localUser = JSON.parse(userObj);
  const name = localUser.fullName;
  const doVerify = async (event) => {
    var data = { __id: localUser.id };
    var js = new URLSearchParams(window.location.hash).get('access_token');
    alert(js);

    const appName = "onlytrips";
    function buildPath(route) {
      if (process.env.NODE_ENV === "production") {
        return "https://" + appName + ".herokuapp.com/" + route;
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
    } catch (e) {
      alert(e.toString());
      return;
    }
  };

  return (
    <div id="VerifyTable">
      <div className="header">
        <img src={logo} alt="OnlyTrips Logo" id="logo21"></img>
      </div>
      <div className="text-info">
        <p id="congrats-text">Congratulations, {name}</p>
        <p id="confirm-text">
          {" "}
          You're one step away from joining the onlyTrips family, activate your
          account by clicking on the button below:
        </p>
        <div>
          <button id="activate-btn">Activate account</button>
        </div>
      </div>
    </div>
  );
}

export default Verify;
