import React, { useEffect, useState } from "react";
import App from "../App";
import logo from "../images/OnlyTrips.svg";
import Navbar from "react-bootstrap/Navbar";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";

function NavigationBar() {
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

  const searchFunction = async () => {
    console.log("Searching");
  };
  return (
    <Navbar variant="dark" fixed="top">
      <h1> Welcome! {fullName}</h1>
      <img
        src={logo}
        alt="OnlyTrips Logo"
        width="60"
        height="60"
        style={{ position: "center" }}
      ></img>
      <Button variant="success" id="addTripButton" onClick={addTrip}>
        Add A Trip!
      </Button>
      <Button variant="danger" id="LogOutButton" onClick={LogOut}>
        Log Out
      </Button>
      <Form className="mb-3">
        <Button variant="outline-secondary" onKeyUp={searchFunction}>
          Search
        </Button>
      </Form>
      <Form.Control type="text" placeholder="Search By City...." />
    </Navbar>
  );
}

export default NavigationBar;
