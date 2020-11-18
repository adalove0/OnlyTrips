import React, { Component } from "react";
import App from "../App";
import LoggedInName from "../components/LoggedInName";
import NavBar from "../components/NavBar";
import UserProfile from "../components/UserProfile";
import Alert from "react-bootstrap/Alert";
import Table from "react-bootstrap/Table";
import Button from "react-bootstrap/Button";
import { object } from "@hapi/joi";

function TripView() {
  const userObj = localStorage.getItem("user_data");
  const localUser = JSON.parse(userObj);

  var data = { email: localUser.email };
  var js = JSON.stringify(data);
  console.log(js);

  const LogOut = async (event) => {
    event.preventDefault();
    window.location.href = "/";
  };

  // Maybe component will mount?
  // Component will mount will ask api for array then fill an array with objects
  // Use those objects to fill your table?

  const renderTable = async (event) => {
    try {
      const request = await fetch("http://localhost:5000/travel", {
        method: "POST",
        body: js,
        headers: { "Content-Type": "application/json" },
      });
      var res = await request.json();
      console.log(res);
    } catch (err) {
      console.log(err);
    }

    const tripArray = res.trips;

    tripArray.map((trips) => {
      createTable(trips);
    });
  };

  const createTable = async (object) => {
    var data = { id: object };
    var js = JSON.stringify(data);
    console.log(js);
    const request = await fetch("http://localhost:5000/singleTrip", {
      method: "POST",
      body: js,
      headers: { "Content-Type": "application/json" },
    });
    var res = await request.json();
    console.log(res);
  };

  return (
    <div id="tripTable">
      <Table responsive="lg" striped bordered hover>
        <tbody>{renderTable}</tbody>
        <Button onClick={renderTable}>Get the user info -TEST-</Button>
      </Table>
    </div>
  );
}

export default TripView;
