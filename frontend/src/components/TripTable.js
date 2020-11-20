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
  const tripData = [];

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

  const getArrayData = async () => {
    try {
      const request = await fetch("http://localhost:5000/travel", {
        method: "POST",
        body: js,
        headers: { "Content-Type": "application/json" },
      });
      var res = await request.json();
    } catch (err) {
      console.log(err);
    }

    const tripArray = res.trips;
    tripArray.map((trips) => {
      getSingleTripData(trips);
    });
  };

  const getSingleTripData = async (object) => {
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

    // Res is my trip
    const singletripData = res.trip;
    // add this to a global array
    // then call renderTable in JSX
    tripData.push(singletripData);
    console.log("MY DATA");
    console.log(tripData);
  };

  function renderTable() {
    tripData.map((trip) => {
      var table = document.getElementById("myTable");
      var row = table.insertRow();
      var cellName = row.insertCell(tripData);
    });
  }

  getArrayData();

  // How to change my function from async event to call when page loads?
  return (
    <div id="tripTable">
      <Table responsive="lg" striped bordered hover id="myTable">
        <tbody>{renderTable}</tbody>
      </Table>
    </div>
  );
}

export default TripView;
