import {Route, Switch} from 'react'
import LoginFormPage from './components/LoginFormPage';
import React from 'react'

function App() {
  return (
    <Switch>
      <Route path="/login">
        <LoginFormPage />
      </Route>
    </Switch>
  );
}

export default App;
