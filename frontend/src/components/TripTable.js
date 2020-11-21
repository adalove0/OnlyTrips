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
      const tripArray = res.trips;
      // Loop Through array and pass every id to second api
      tripArray.map((trips) => {
        getSingleTripData(trips);
      });
    }
    async function getSingleTripData(object) {
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

      // Add to array and set its state
      setTripData(tripData.push(singletripData));
    }
    getArrayData();
    console.log("Array Size" + tripData);
  }, []);

  function testTable() {
    // Test Array
    const array = [
      { name: "Paris Trip", age: "3 People" },
      { name: "Justtin", age: "21" },
      { name: "Justtin", age: "21" },
      { name: "Justtin", age: "21" },
      { name: "Justtin", age: "21" },
      { name: "Justtin", age: "21" },
      { name: "Justtin", age: "21" },
      { name: "Justtin", age: "21" },
      { name: "Justtin", age: "21" },
      { name: "Justtin", age: "21" },
    ];
    // Incude fontawesome icon
    // change array.map to tripData.map to test
    console.log(tripData);
    return array.map((trip) => {
      return (
        <tr>
          <td>{trip.startDate}</td>
          <td>{trip.endDate}</td>
          <td>{trip.numPeople}</td>
          <td>{trip.age}</td>
          <td>{trip.name}</td>
        </tr>
      );
    });
  }

  const LogOut = async (event) => {
    event.preventDefault();
    window.location.href = "/";
  };
  // normal functions getting called before async functions how to change
  return (
    <div>
      <Table id="tripTable" responsive borderless size="md" striped>
        {<tbody>{testTable()}</tbody>}
      </Table>
    </div>
  );
}

export default TripView;
