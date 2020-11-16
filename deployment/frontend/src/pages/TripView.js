import React, { useEffect, useState } from "react";
import App from "../App";
import logo from "../images/OnlyTrips.svg";
import LoggedInName from "../components/LoggedInName";
import NavBar from "../components/NavBar";
import UserProfile from "../components/UserProfile";
import Alert from "react-bootstrap/Alert";

function TripView(){
  var something;

  
  /*const tView = () => 
  {
    return <div class>                    </div>;
  };*/

  const LogOut= async (event) => {
    event.preventDefault();
    window.location.href = "/";
  };

  return (
    <div id="TopPart"> 
      <img src={logo} alt="OnlyTrips Logo" id="TripViewLogo"></img>
      <button id ="LogOutButton" onClick={LogOut}>Log Out</button>
    </div>
  );
}

export default TripView;
