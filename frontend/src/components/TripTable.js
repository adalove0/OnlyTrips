import React, { useEffect, Component, useState } from "react";
import App from "../App";
import Alert from "react-bootstrap/Alert";
import Table from "react-bootstrap/Table";
import Button from "react-bootstrap/Button";
import logo from "../images/updated-logo.PNG";
import { object } from "@hapi/joi";
import { render } from "react-dom";

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
    const LogOut = async (event) => {
    event.preventDefault();
    localStorage.removeItem("user_data");
    window.location.href = "/";
  };
  
    const addTrip = async (event) => {
    event.preventDefault();
    window.location.href = "/AddTripPage";
  };
     const doDeleteTrip = async (event) => {
      //this.state.error = "";
      const userObj = localStorage.getItem("user_data");
      const localUser = JSON.parse(userObj); 
      if(window.confirm("Are you sure you want to delete this trip?"))
      {
        var obj = {
          email: localUser.email,
          id: event,
        };
          var js = JSON.stringify(obj);
          alert(js);
        /*if(this.state.startDate == null || this.state.endDate == null ||this.state.city == "" || this.state.State == "")
        {
          this.setState({error : "NO"});
          alert(this.state.error);
          return;
        }*/
          try {
              const response = await fetch("http://localhost:3000/deletetrip", {
              method: "POST",
              body: js,
              headers: { "Content-Type": "application/json" },
            });
            var res = await response.text();
            console.log(res);
           }catch (e) {
           alert(e.toString());
          return;
        }
      }
  };
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
        const request = await fetch(buildPathTravel("travel"), {
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
    <div className = "trip-table">
    <div class="container-header">
      <div className="img-div"><img src={logo} alt="OnlyTrips Logo" id="navBarLogo"></img></div>
        <div className="search-div">
          <div className = "search">
          <input type="text" className="searchTerm" placeholder="Search"/>
          <button type="submit" className="searchButton">
            <i className = "fa fa-search"></i>
          </button>
          </div>
        </div>
       <div className="add-div"><Button  className = "addButton" onClick={addTrip}>Add</Button></div>
       <div className="log-div"><Button  className = "LogOutButton" onClick={LogOut}>Logout</Button></div>
    </div>
    <div className = "trip-tables-generated">
      {isLoading ? (<h1>Loading...</h1>
          ) : (
            newTrip.map((trip, key) => (
            <div className = "TripTable">
              <div className = "buttons">
                <div className="right-icons">
                 <div className = "edit-icon" onClick={() => doDeleteTrip(trip.id)}>
                    <i className="fa">&#xf044;</i>
                  </div>
                  <div className = "delete-icon">
                    <i className="fa">&#xf014;</i>
                    </div>
              </div>
              </div>
              <div className="one">
                <label>City</label>
                <input value={trip.destination[trip.destination.length - 1].city}/>
              </div>
              <div className="one">
                <label>State</label>
                <input value={trip.destination[trip.destination.length - 1].state}/>
              </div>
              <div className="one">
                <label>Start Date</label>
                <input value={trip.startDate.split('T')[0]}/>
              </div>
              <div className="one">
                <label>End Date</label>
                <input value={trip.endDate.split('T')[0]}/>
              </div>
              <div className="one">
                <label>Number of travelers</label>
                <input value={trip.numPeople}/>
              </div>
                {/* <td>DELETE ICON</td>
                <td>EDIT ICON</td> */}
          </div>
       ))
      )}
      </div>
    </div>
    );
}

export default TripView;
