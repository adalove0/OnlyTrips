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

  var trash = [
    { startDate: "0", endDate: "0"}
  ];

  const [tripData, setTripData] = useState([]);
  

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
    async function getArrayData() {
      try {
        const request = await fetch("http://localhost:5000/travel", {
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
      } catch (err) {
        console.log(err);
      }
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
      console.log("3. This row contains " + tripInfo);

      // Add to array and set its state
      setTripData(tripData.push(singletripData));
      newTrip.push(singletripData);
    }

    getArrayData();
    console.log("newTrip length is now "+newTrip.length);

  }, []);


  /* THIS IS TEST*/
/* END TEST*/

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
    console.log("newTrip length is "+newTrip.length +" but array length is "+ array.length);
    console.log(newTrip);
   

    return newTrip.map((trip, index) => {
      //console.log("We got "+ JSON.stringify(trip));
      console.log("pushing in "+ JSON.stringify(trip));
      return (
        <tr key= {index}>

          <td > {trip.startDate}</td>
          {/*<td >{trip.endDate}</td>
          <td >{trip.numPeople}</td>*/}
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
        {/*{<tbody >{testTable()}</tbody>}*/ }{<tbody >{testTable()}</tbody>}
        
      </table>
    </div>
  );
}

export default TripView;
