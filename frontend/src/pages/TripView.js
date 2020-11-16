import React, { useEffect, useState } from "react";
import App from "../App";
import logo from "../images/OnlyTrips.svg";
import LoggedInName from "../components/LoggedInName";
import NavBar from "../components/NavBar";
import UserProfile from "../components/UserProfile";
import Alert from "react-bootstrap/Alert";
import Table from "react-bootstrap/Table";

function TripView() {
  var something;

  /*const tView = () => 
  {
    return <div class>                    </div>;
  };*/

  const LogOut = async (event) => {
    event.preventDefault();
    window.location.href = "/";
  };

  // Table Header: Trip Name
  // Table data: Price, Start Date, End Date, # Of People?

  const createTableRow = () => {
    // Get Json with Trip array
    //for(no of trips)
    // Call Second api with trip id tripArray[i]
    // Fill table header with trip // th
    // Fill table data with trip information // td
  };

  return (
    <div id="page">
      <div id="TopPart">
        <img src={logo} alt="OnlyTrips Logo" id="TripViewLogo"></img>
        <button id="LogOutButton" onClick={LogOut}>
          Log Out
        </button>
      </div>
      <div id="tripTable">
        <Table responsive="lg" variant="dark">
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
      </div>
    </div>
  );
}

export default TripView;
