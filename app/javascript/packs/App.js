import React, { Component } from 'react';
import { Route, Switch, Link } from 'react-router-dom';
import { withRouter } from 'react-router';
import axios from 'axios';

// Views
import Home from './Home';
import SignIn from './SignIn';
import SignUp from './SignUp';
import ForgotPassword from './ForgotPassword';
import Terms from './Terms';

class App extends Component {

  constructor() {
    super();
    this.state = {
      currentUser: null
    }
    this.updateCurrentUser = this.updateCurrentUser.bind(this);
  }

  componentDidMount() {
    let that = this
    axios.get('/users/check_for_user', {
    })
      .then(function(response){
        if(response.data.email){
          that.setState({
            currentUser: response.data.email
          })
        } else {
          that.setState({
            currentUser: null
          })
        }
      })
      .catch(function(error){
        console.log(error);
      })
  }

  updateCurrentUser(email) {
    this.setState({
      currentUser: email
    })
  }

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
