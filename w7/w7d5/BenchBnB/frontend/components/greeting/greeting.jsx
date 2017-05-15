import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component {
  constructor(props) {
    super(props);
  }

  signout(e) {
    e.preventDefault();
    this.props.signout();
  }

  render() {
    const user = this.props.currentUser;
    console.log(user);
    if (user === null) {
      return (
        <div>
          <Link to="/signup">Sign Up</Link>
          <br/>
          <Link to="/signin">Sign In</Link>
        </div>
      );
    }
    else {
      return (
        <div>
          <h1>Welcome {user.username}</h1>
          <button onClick={ (e) => this.signout(e) }>Sign Out</button>
        </div>
      );
    }

  }
}

export default Greeting;
