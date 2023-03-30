import {Route, Switch} from 'react-router'
import LoginFormPage from './components/LoginFormPage';
import SignupFormPage from './components/SignupPage';
import React from 'react'
import Navigation from './components/Navigation';
import BenchIndexPage from './components/BenchIndexPage';
import BenchShowPage from './components/BenchShowPage';
import BenchFormPage from './components/BenchFormPage';

function App() {
  return (
    <>
      <Navigation />
      <Switch>
        <Route path="/benches/new" >
          <BenchFormPage />
        </Route>
        <Route path={'/benches/:benchId'} >
          <BenchShowPage />
        </Route>
        <Route path="/login">
          <LoginFormPage />
        </Route>
        <Route path='/signup'>
          <SignupFormPage />
        </Route>
        <Route exact path='/'>
          <BenchIndexPage />
        </Route>
      </Switch>
    </>
  );
}

export default App;
