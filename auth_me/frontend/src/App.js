import {Route, Switch} from 'react'
import LoginFormPage from './components/LoginFormPage';
import SignupFormPage from './components/SignupPage';
import React from 'react'

function App() {
  return (
    <Switch>
      <Route path="/login">
        <LoginFormPage />
      </Route>
      <Route path='/signup'>
        <SignupFormPage />
      </Route>
    </Switch>
  );
}

export default App;
