import React from 'react';
import { createRoot } from 'react-dom/client'
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { BrowserRouter } from 'react-router-dom';
import './index.css';
import App from './App';
import configureStore from './store';
import csrfFetch from './store/csrf';
import { restoreCSRF } from './store/csrf';
import * as sessionActions from '../src/store/session'
import * as benchActions from './store/benches';


const store = configureStore();

if (process.env.NODE_ENV !== 'production') {
  window.store = store;
  window.csrfFetch = csrfFetch;
  window.sessionActions = sessionActions;
  window.benchActions = benchActions;
}

function Root() {
  return (
    <Provider store={store}>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </Provider>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'))


const renderApplication = () => {
  root.render(
    <React.StrictMode>
      <Root />
    </React.StrictMode>
  );
}

if (sessionStorage.getItem("X-CSRF-Token") === null || 
  sessionStorage.getItem('currentUser') === null) {
    store.dispatch(sessionActions.restoreSession()).then(renderApplication)
}  else {
  renderApplication();
}
