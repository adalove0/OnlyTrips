import React, { Component, useEffect, useState, useRef } from "react";
import App from "../App";
import logo from "../images/OnlyTrips.svg";
import Modal from "react-bootstrap/Modal";
import Button from "react-bootstrap/Button";
import "bootstrap/dist/css/bootstrap.min.css";
import "react-dates/initialize";
import "react-dates/lib/css/_datepicker.css";
import LoggedInName from "../components/LoggedInName";
import UserProfile from "../components/UserProfile";
//import CounterInput from "react-counter-input";
import {
  DateRangePicker,
  SingleDatePicker,
  DayPickerRangeController,
} from "react-dates";
import axios from "axios";

import CounterInput from "react-bootstrap-personalized-counter";

class AddTrip extends Component {
  constructor(props) {
    super(props);
    this.state = {
      count: 1,
      passengerNoun: "Traveler",
      startDate: null,
      endDate: null,
      city: "",
      State: "",
      error: "",
    };

    this.handleChange = this.handleChange.bind(this);
    this.doAddTrip = this.doAddTrip.bind(this);
  }
  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  increment = () => {
    this.setState({ count: this.state.count + 1 });
    if (this.state.count > 1) this.setState({ passengerNoun: "Travelers" });
  };
  decrement = () => {
    if (this.state.count != 1) this.setState({ count: this.state.count - 1 });
    if (this.state.count == 1) this.setState({ passengerNoun: "Traveler" });
  };
  getMonth = (c) => {
    if (c == "Jan") return 1;
    else if (c == "Feb") return 2;
    else if (c == "Mar") return 3;
    else if (c == "Apr") return 4;
  };

  async doAddTrip(e) {
    //this.state.error = "";
    const userObj = localStorage.getItem("user_data");
    const localUser = JSON.parse(userObj);
    /*const localUser =  {
      email: "jamila@email.com",
      id: "56789"
    }*/
    const destinationLoc = ["orlando", "florida"]; //Test destination: needs to be fixed
    var obj = {
      email: localUser.email,
      trip: {
        creator: localUser.id,
        numPeople: this.state.count,
        startDate: this.state.startDate,
        endDate: this.state.endDate,
        destination: {
          city: this.state.city,
          state: this.state.State,
        },
      },
    };
    var js = JSON.stringify(obj);
    localStorage.setItem("trip_data", JSON.stringify(js));
    alert(js);
    console.log(js);
    /*if(this.state.startDate == null || this.state.endDate == null ||this.state.city == "" || this.state.State == "")
      {
        this.setState({error : "NO"});
        alert(this.state.error);
        return;
      }*/

    const appName = "onlytrips";
    function buildPath(route) {
      if (process.env.NODE_ENV === "production") {
        return "https://" + appName + ".herokuapp.com/" + route;
      } else {
        return "http://localhost:5000/addtrip";
      }
    }

    try {
      const response = await fetch(buildPath("addtrip"), {
        method: "POST",
        body: js,
        headers: { "Content-Type": "application/json" },
      });

      var res = await response.text();
      console.log(res);
      console.log(res);
    } catch (e) {
      alert(e.toString());
      return;
    }
  }
  render() {
    return (
      <div class="addTrip">
        <div id="circle">
          <a href="#" class="close" />
          <img src={logo} alt="OnlyTrips Logo" id="logo"></img>
        </div>
        <h1 id="add-title">ADD TRIP</h1>
        <form id="add-trip-form">
          {" "}
          <input
            type="text"
            className="inputMaterial"
            onChange={(e) => this.setState({ city: e.target.value })}
            placeholder="City"
            required="required"
          />
          <br />
          <br />
          <input
            type="text"
            className="inputMaterial"
            onChange={(e) => this.setState({ State: e.target.value })}
            placeholder="State"
          />
          <div className="calendar">
            <DateRangePicker
              cssClass="e-custom-style"
              startDate={this.state.startDate}
              startDateId="your_unique_start_date_id"
              endDate={this.state.endDate}
              endDateId="your_unique_end_date_id"
              onDatesChange={({ startDate, endDate }) =>
                this.setState({ startDate, endDate })
              }
              focusedInput={this.state.focusedInput}
              required="required"
              onFocusChange={(focusedInput) => this.setState({ focusedInput })}
            />
          </div>
          <br />
          <div className="number">
            <div className="minus" onClick={this.decrement}>
              -
            </div>
            <div className="input-text-counter">
              <input
                id="numPeople"
                type="text"
                value={`${this.state.count} ${this.state.passengerNoun}`}
                onChange={this.handleChange}
                min={0}
                required="required"
              />
            </div>
            <div className="plus" onClick={this.increment}>
              +
            </div>
          </div>
        </form>
        <button className="submit-btn" onClick={this.doAddTrip}>
          Submit
        </button>
        <p value={this.state.error}></p>
      </div>
    );
  }
}

export default AddTrip;
