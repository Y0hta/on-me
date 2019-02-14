import React, { Component } from 'react';
import { Route, Switch, Link } from 'react-router-dom';
import { withRouter } from 'react-router';

// Views
import Home from './Home';
import SignIn from './SignIn';
import SignUp from './SignUp';
import ForgotPassword from './ForgotPassword';
import Terms from './Terms';

class App extends Component {
  render() {
    return (
      <div className="App">
        <Switch>
          <Route exact path="/" component={Home} />
          <Route path="/users/sign_in" component={SignIn} />
          <Route path="/users/sign_up" component={SignUp} />
          <Route path="/forgot-password" component={ForgotPassword} />
          <Route path="/terms" component={Terms} />
        </Switch>
      </div>
    );
  }
}

export default App;
