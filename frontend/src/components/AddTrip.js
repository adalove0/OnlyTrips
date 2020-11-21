import React, {Component, useEffect, useState, useRef } from "react";
import App from "../App";
import logo from "../images/OnlyTrips.svg";
import Modal from "react-bootstrap/Modal";
import Button from "react-bootstrap/Button";
import DateCalender from "../components/DateCalender";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'react-dates/initialize';
import 'react-dates/lib/css/_datepicker.css';
import LoggedInName from "../components/LoggedInName"
import UserProfile from "../components/UserProfile";
//import CounterInput from "react-counter-input";
import { DateRangePicker, SingleDatePicker, DayPickerRangeController} from 'react-dates';
import axios from 'axios';

import CounterInput from 'react-bootstrap-personalized-counter';

class AddTrip extends Component {
  constructor(props){
    super(props);
    this.state = {
      count: 1,
      passengerNoun : "Traveler",
      startDate : null,
      endDate : null,
      destination :["orlando", "florida"]
    };
    
    this.handleChange = this.handleChange.bind(this);
    this.doAddTrip = this.doAddTrip.bind(this);
  }
  handleChange(event) {
    this.setState({value: event.target.value});
  }
  increment = () => {
    this.setState({ count: this.state.count + 1});
    if(this.state.count > 1)
      this.setState({ passengerNoun : "Travelers"});
  }
  decrement = () => {
    if (this.state.count != 1)
      this.setState({ count: this.state.count - 1});
    if(this.state.count == 1)
      this.setState({ passengerNoun : "Traveler"});
  }

  async doAddTrip(e){
    const userObj = localStorage.getItem("user_data");
    const localUser = JSON.parse(userObj);  
    const destinationLoc = ["orlando","florida"];   //Test destination: needs to be fixed
    var obj = '{"creator" :"'+localUser+'", "numPeople" :"' +this.state.count+'", "startDate" :"' +this.state.startDate + '", "endDate" :"' +this.state.endDate+ '", "destination" : "' + destinationLoc + '"}';
    /*var obj = {
      "creator": localUser,
      "numPeople": this.state.count,
      "startDate": this.state.startDate,
      "endDate": this.state.endDate,
      "destination": ["orlando","florida"]
      };*/
      alert(obj);
      try {
        const response = await fetch("http://localhost:3000/addtrip", {
          method: "POST",
          body: JSON.stringify(obj),
          headers: { "Content-Type": "application/json" },
        });
  
        var res = await response.text();
        console.log(res);
    }catch (e) {
    alert(e.toString());
    return;
  }
};
  render(){
  return (
    <div class = "addTrip">
    <div id = "addTrip1" className = "row">
      <div className = "column1">
        <img src={logo} alt="OnlyTrips Logo" id="logo1"></img>
      </div>
      <div  class = "column2">
        <h1 id= "add-title">ADD TRIP</h1>
        <form id="add-trip-form">
              {" "}
          <input
            type="text" 
            id ="dest-input"
            placeholder="Destination"
            onChange={this.handleChange}
					  //value={this.state.destination}
            />
          <br />       {" "}
          <DateRangePicker cssClass="e-custom-style"
            startDate = {this.state.startDate}
            startDateId = "your_unique_start_date_id"
            endDate = {this.state.endDate}
            endDateId = "your_unique_end_date_id"
            onDatesChange = {({ startDate, endDate }) => this.setState({ startDate, endDate})}
            focusedInput = {this.state.focusedInput}
            onFocusChange = {focusedInput => this.setState({ focusedInput})}
          />
          <br/>
          <div className="number">
	          <div className="minus"  onClick={this.decrement}>-</div>
	          <div className ="input-text-counter"><input type="text" value={`${this.state.count} ${this.state.passengerNoun}`} onChange={this.handleChange} min={0}/></div>
	          <div className="plus"  onClick={this.increment}>+</div>
          </div>
        </form>
        <button className ="submit-btn" onClick = {this.doAddTrip}>Submit</button>
      </div>
    </div>
    </div>
    );
  }
}

export default AddTrip;
