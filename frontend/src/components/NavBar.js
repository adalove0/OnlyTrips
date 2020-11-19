import React, { useEffect, useState } from "react";
import App from "../App";
import Navbar from "react-bootstrap/Navbar";
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
    <Navbar variant="tabs" sticky="top">
      <Navbar.Brand> Welcome! {fullName}</Navbar.Brand>
      <img src={logo} alt="OnlyTrips Logo" width="60" height="60"></img>
      <Button variant="success" id="addTripButton" onClick={addTrip}>
        Add A Trip!
      </Button>
      <Button variant="danger" id="LogOutButton" onClick={LogOut}>
        Log Out
      </Button>
    </Navbar>
  );
}

export default NavBar;
