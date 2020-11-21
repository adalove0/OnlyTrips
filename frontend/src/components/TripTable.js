import React, { Component, useState } from "react";
import App from "../App";
import Alert from "react-bootstrap/Alert";
import Table from "react-bootstrap/Table";
import Button from "react-bootstrap/Button";
import { object } from "@hapi/joi";
import { render } from "react-dom";

// Reason for not working:
// renderTable gets called before the array is filled hence not displaying
// I dont know how to stop this from happening - Ahmed

const newTrip = [];
//const newTrip = '{"someTrip":[{"name":"Justtin", "age":"21"}]}';

function TripView() {
  const [tripData, setTripData] = useState([]);

  const userObj = localStorage.getItem("user_data");
  const localUser = JSON.parse(userObj);

  var data = { email: localUser.email };
  var js = JSON.stringify(data);

  React.useEffect(() => {

    // To get trip array with ids
    async function getArrayData() {
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
      const newTripID = res.trips;
      // Loop Through array and pass every id to second api
      newTripID.map((trips) => {
        getSingleTripData(trips);
        console.log("1. current array size: " + trips);
      });

      
    }

    async function getSingleTripData(object) {
      var tripInfo;
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
      tripInfo = JSON.stringify(singletripData);
      console.log("2. Is this the table? " + tripInfo);

      // Add to array and set its state
      setTripData(tripData.push(singletripData));
      newTrip.push(singletripData);
    }

    getArrayData();

  }, []);



  function testTable() {
    // Test Array
    const array = [
      { startDate: "0", endDate: "0", something: "idk" },
      { startDate: "1", endDate: "0", something: "idk" },
      { startDate: "2", endDate: "0", something: "idk" },
      { startDate: "3", endDate: "0", something: "idk" },
      { startDate: "4", endDate: "0", something: "idk" },
      { startDate: "5", endDate: "0", something: "idk" },
      { startDate: "6", endDate: "0", something: "idk" },
      { startDate: "7", endDate: "0", something: "idk" },
      { startDate: "8", endDate: "0", something: "idk" },
    ];

    const array1 = newTrip;
    // Incude fontawesome icon
    // change array.map to tripData.map to test
    console.log("3. this is trip " + tripData);
    console.log(array);
    console.log(newTrip);
    
    return array.map((trip) => {
      console.log("We got "+ JSON.stringify(trip));
      //console.log(newTrip);
      return (
        <tr>
          <td>{trip.startDate}</td>
          <td>{trip.endDate}</td>
          <td>{trip.numPeople}</td>
        </tr>
      );
    });

    
  }

  /*const LogOut = async (event) => {
    event.preventDefault();
    window.location.href = "/";
  };*/

  // normal functions getting called before async functions how to change
  return (
    <div>
      <table id="tripTable">
        {<tbody >{testTable()}</tbody>}
      </table>
    </div>
  );
}

export default TripView;
