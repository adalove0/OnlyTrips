import React from "react";
import {
  BrowserRouter as Router,
  Route,
  Redirect,
  Switch,
} from "react-router-dom";
import "./App.css";

import LoginPage from "./pages/LoginPage";
import CardPage from "./pages/tripView";
import SignUpPage from "./pages/SignUpPage";

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
        <Redirect to="/" />
      </Switch>
    </Router>
  );
}

export default App;
