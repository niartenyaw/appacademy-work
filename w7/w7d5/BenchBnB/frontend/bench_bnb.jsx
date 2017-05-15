import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import * as Actions from './actions/session_actions';

window.signin = Actions.signin;
window.signup = Actions.signup;
window.signout = Actions.signout;



document.addEventListener('DOMContentLoaded',() => {
  const store = configureStore();
  window.store = store;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={ store }/>, root);
});
