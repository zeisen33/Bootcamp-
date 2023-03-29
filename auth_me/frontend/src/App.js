import {Route, Switch} from 'react-router'
import LoginFormPage from './components/LoginFormPage';
import SignupFormPage from './components/SignupPage';
import React from 'react'
import Navigation from './components/Navigation';

function App() {
  return (
    <>
      <Navigation />
      <Switch>
        <Route path="/login">
          <LoginFormPage />
        </Route>
        <Route path='/signup'>
          <SignupFormPage />
        </Route>
      </Switch>
    </>
  );
}

export default App;
