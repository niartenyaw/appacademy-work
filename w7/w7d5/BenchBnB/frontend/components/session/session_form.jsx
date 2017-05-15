import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
                  username: "",
                  password: ""
    };
    this.inputUpdate = this.inputUpdate.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  inputUpdate(type, e) {
    this.setState({ [type]: e.target.value });
  }

  render() {
    const otherPath = this.props.formType === "/signup" ? "/signin" : "/signup";
    const text = otherPath === "/signin" ? "Sign In" : "Sign Up";
    const other = otherPath === "/signin" ? "Sign Up!" : "Sign In!";
    return(
      <div>
        <h1>{ text }</h1>
        <Link to={ otherPath }>
          { other }
        </Link>
        <form>
          <input type="text"
            onChange={(e) => this.inputUpdate("username", e)}
            value={this.state.username} />
          <input type="password"
            onChange={(e) => this.inputUpdate("username", e)}
            value={this.state.password} />
          <input type="submit" value={ text } />
        </form>
      </div>
    );
  }


}

export default SessionForm;
