import React, { useEffect, useState } from "react";
import App from "../App";
import LoggedInName from "../components/LoggedInName";
import NavBar from "../components/NavBar";
import UserProfile from "../components/UserProfile";
import Alert from "react-bootstrap/Alert";
import Table from "react-bootstrap/Table";
import Button from "react-bootstrap/Button";

function TripView() {
  const LogOut = async (event) => {
    event.preventDefault();
    window.location.href = "/";
  };

  // Table Header: Trip Name
  // Table data: Price, Start Date, End Date, # Of People?

  const create = async (event) => {
    // Get Json with Trip array
    // var js = JSON.stringify(localStorage.getItem("user_data"))._id;
    // console.log(js);
    // const responseArray = await fetch("http://localhost:3000/travelPage", {
    //   method: "POST",
    //   body: js,
    //   headers: { "Content-Type": "application/json" },
    // });

    const responseArrayTest = ["PooPoo", "Peepee", "ahahaha", "yeet", "dab"];

    return (
      <tr>
        {responseArrayTest.map((testSubjects) => {
          return <td>{testSubjects}</td>;
        })}
      </tr>
    );
  };

  return (
    <div id="tripTable">
      <Table responsive="lg" striped bordered hover>
        <thead>
          <tr>
            <th>Paris Trip</th>
            <td>Price: 100$</td>
            <td>Start Date: 10/15</td>
            <td>End Date: 11/3</td>
          </tr>
          <tr>
            <th>Florida Trip</th>
            <td>Price: 300$</td>
            <td>Start Date: 11/15</td>
            <td>End Date: 12/3</td>
          </tr>
        </thead>
      </Table>
      <Button variant="primary" onClick={create}>
        Add To Table test
      </Button>
    </div>
  );
}

export default TripView;
