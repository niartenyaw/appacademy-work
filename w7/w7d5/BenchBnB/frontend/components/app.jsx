import React from 'react';
import GreetingContainer from './greeting/greeting_container';
import SessionFormContainer from './session/session_form_container';
import { Route } from 'react-router-dom';
import { AuthRoute } from '../util/route_util';

const App =  () => (
  <div>
    <header>
      <h1>BenchBnB</h1>
      <GreetingContainer />
    </header>

    <AuthRoute path="/signup" component={SessionFormContainer} />
    <AuthRoute path="/signin" component={SessionFormContainer} />
  </div>
);

export default App;
