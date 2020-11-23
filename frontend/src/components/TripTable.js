import React, { useEffect, Component, useState } from "react";
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
const lastData = [];
//const newTrip = '{"someTrip":[{"name":"Justtin", "age":"21"}]}';

function TripView() {
  var trash = [{ startDate: "0", endDate: "0" }];

  const [tripData, setTripData] = useState([]);
  const [isLoading, setLoading] = useState(true);

  const userObj = localStorage.getItem("user_data");
  const localUser = JSON.parse(userObj);

  var data = { email: localUser.email };
  var js = JSON.stringify(data);

  const array1 = newTrip;
  // Incude fontawesome icon
  // change array.map to tripData.map to test
  console.log(newTrip);
  console.log(1);

  React.useEffect(() => {
    // To get trip array with ids
    const appName = "onlytrips";
    function buildPathTravel(route) {
      if (process.env.NODE_ENV === "production") {
        return "https://" + appName + ".herokuapp.com/" + route;
      } else {
        return "http://localhost:5000/travel";
      }
    }
    const appName2 = "onlytrips";
    function buildPathSingleTrip(route) {
      if (process.env.NODE_ENV === "production") {
        return "https://" + appName2 + ".herokuapp.com/" + route;
      } else {
        return "http://localhost:5000/singleTrip";
      }
    }
    async function getArrayData() {
      setLoading(true);
      try {
        const request = await fetch(buildPathTravel("singleTrip"), {
          method: "POST",
          body: js,
          headers: { "Content-Type": "application/json" },
        });
        var res = await request.json();
        const newTripID = res.trips;
        // Loop Through array and pass every id to second api
        newTripID.map((trips) => {
          console.log("2. current trip ID " + trips);
          getSingleTripData(trips);
        });
        setLoading(false);

        console.log(newTrip[newTrip.length - 1]);
        lastData.push(newTrip[newTrip.length - 1]);
        console.log("afidjwoeifjw");
        console.log(lastData);
      } catch (err) {
        console.log(err);
      }
    }
    async function getSingleTripData(object) {
      var tripInfo;
      var data = { id: object };
      var js = JSON.stringify(data);
      try {
        const request = await fetch(buildPathSingleTrip("singleTrip"), {
          method: "POST",
          body: js,
          headers: { "Content-Type": "application/json" },
        });
        var res = await request.json();

        // Res is my trip
        const singletripData = res.trip;
        tripInfo = JSON.stringify(singletripData);

        // Add to array and set its state
        setTripData(tripData.push(singletripData));
        newTrip.push(singletripData);
        console.log("MY OTHER API");
        console.log(newTrip);
      } catch (err) {
        console.log(err);
      }
    }
    getArrayData();
  }, []);

  // normal functions getting called before async functions how to change
  return (
    <div>
      <Table id="tripTable" reponsive striped bordered hover size="sm">
        <thead>
          <tr>
            <th>City</th>
            <th>State</th>
            <th>Number of People</th>
            <th>State Date</th>
            <th>End Time</th>
          </tr>
        </thead>
        <tbody>
          {isLoading ? (
            <h1>Loading...</h1>
          ) : (
            newTrip.map((trip, key) => (
              <tr key={key}>
                <td>{trip.destination[trip.destination.length - 1].city}</td>
                <td>{trip.destination[trip.destination.length - 1].state}</td>
                <td>{trip.numPeople}</td>
                <td>{trip.startDate}</td>
                <td>{trip.endDate}</td>
                {/* <td>DELETE ICON</td>
                <td>EDIT ICON</td> */}
              </tr>
            ))
          )}
        </tbody>
      </Table>
    </div>
  );
}

export default TripView;
