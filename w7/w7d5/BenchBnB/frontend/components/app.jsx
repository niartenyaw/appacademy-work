import React from 'react';
import GreetingContainer from './greeting/greeting_container';
import SessionFormContainer from './session/session_form_container';
import { Route } from 'react-router-dom';

const App =  () => (
  <div>
    <header>
      <h1>BenchBnB</h1>
      <GreetingContainer />
    </header>

    <Route path="/signup" component={SessionFormContainer} />
    <Route path="/signin" component={SessionFormContainer} />
  </div>
);

export default App;
