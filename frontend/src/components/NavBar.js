import React, { useEffect, useState } from "react";
import App from "../App";
import Nav from "react-bootstrap/Nav";
import logo from "../images/OnlyTrips.svg";
import Button from "react-bootstrap/Button";

function NavBar() {
  const LogOut = async (event) => {
    event.preventDefault();
    localStorage.removeItem("user_data");
    window.location.href = "/";
  };

  const addTrip = async (event) => {
    event.preventDefault();
    window.location.href = "/addTrip";
  };

  const userObj = localStorage.getItem("user_data");
  const localUser = JSON.parse(userObj);
  if (localUser === null) {
    window.location.href = "/";
    return;
  }
  const fullName = localUser.fullName;

  return (
    <Nav variant="tabs" justify>
      <p> Welcome! {fullName}</p>
      <img src={logo} alt="OnlyTrips Logo" id="navBarLogo"></img>
      <Button variant="danger" id="LogOutButton" onClick={LogOut}>
        Log Out
      </Button>
      <Button variant="success" id="addTripButtopn" onClick={addTrip}>
        Add A Trip!
      </Button>
    </Nav>
  );
}

export default NavBar;
