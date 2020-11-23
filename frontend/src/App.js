import React from "react";
import {
  BrowserRouter as Router,
  Route,
  Redirect,
  Switch,
} from "react-router-dom";
import "./App.css";
import "bootstrap/dist/css/bootstrap.min.css";
//THis is what I would like to do --> import "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstra‌​p.min.css";

import LoginPage from "./pages/LoginPage";
import TripView from "./pages/TripView";
import SignUpPage from "./pages/SignUpPage";
import VerifyPage from "./pages/VerifyPage";
//import AddTripPage from "./pages/AddTripPage";

function App() {
  console.log("Starting Front End");
  return (
    <Router>
      <Switch>
        <Route path="/" exact>
          <LoginPage />
        </Route>
        <Route path="/SignUpPage" exact>
          <SignUpPage />
        </Route>
        <Route path="/AddTripPage" exact>
          <AddTripPage />
  </Route>
        <Route path="/TripView" exact>
          <TripView />
        </Route>
        <Route path="/VerifyPage" exact>
          <VerifyPage />
        </Route>
        <Redirect to="/" />
      </Switch>
    </Router>
  );
}

export default App;
