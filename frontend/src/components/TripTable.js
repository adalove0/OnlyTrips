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
    const request = await fetch("http://localhost:5000/singleTrip", {
      method: "POST",
      body: js,
      headers: { "Content-Type": "application/json" },
    });
    var res = await request.json();

    // Res is my trip
    const singletripData = res.trip;
    // add this to a global array
    // then call renderTable in JSX
    tripData.push(singletripData);
    console.log("MY DATA");
    console.log(singletripData);
  };

  const renderTable = async () => {
    console.log(tripData);
    console.log("thats my array");

    tripData.map((trip) => {
      console.log(trip);
      console.log("YAYYYYYYY");
    });
  };

  getArrayData();
  renderTable();

  return (
    <div id="tripTable">
      <Table responsive="lg" striped bordered hover id="myTable"></Table>
    </div>
  );
}

export default TripView;
