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

  return (
    <div id="navBar">
      <Nav variant="tabs" navbar>
        <img src={logo} alt="OnlyTrips Logo" id="navBarLogo"></img>
        <Button variant="danger" id="LogOutButton" onClick={LogOut}>
          Log Out
        </Button>
      </Nav>
    </div>
  );
}

export default NavBar;
