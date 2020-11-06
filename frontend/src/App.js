import React from 'react';
import { BrowserRouter as Router, Route, Redirect, Switch } from 'react-router-dom';
import './App.css';

import LoginPage from './pages/LoginPage';
import CardPage from './pages/tripView';
import SignUpPage from './pages/SignUpPage';

function App() {
  return (
    <Router >
      <Switch>
        <Route path="/" exact>
          <SignUpPage/>
        </Route>
        <Route path="/cards" exact>
          <CardPage />
        </Route>
        <Redirect to="/" />
      </Switch>  
    </Router>
  );
}

export default App;