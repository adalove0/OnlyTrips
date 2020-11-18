import React, { Component } from "react";
import App from "../App";
import LoggedInName from "../components/LoggedInName";
import NavBar from "../components/NavBar";
import UserProfile from "../components/UserProfile";
import Alert from "react-bootstrap/Alert";
import Table from "react-bootstrap/Table";
import Button from "react-bootstrap/Button";

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
    return this.res.map((objID, index) => {
      // const {tripName, tripStart, tripEnd} = objID
      console.log({ objID });
      return (
        <tr>
          <td>{objID}</td>
        </tr>
      );
    });
  };

  return (
    <div id="tripTable">
      <Table responsive="lg" striped bordered hover>
        <tbody></tbody>
        <Button onClick={renderTable}>Get the user info -TEST-</Button>
      </Table>
    </div>
  );
}

export default TripView;
