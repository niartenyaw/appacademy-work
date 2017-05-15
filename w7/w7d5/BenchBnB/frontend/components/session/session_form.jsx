import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
                  username: "",
                  password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user)
      .then(() => this.props.history.push("/"));

  }

  handleChange(type) {
    return (e) => this.setState({ [type]: e.target.value });
  }

  render() {
    const path = this.props.formType;
    const otherPath = path === "/signup" ? "/signin" : "/signup";
    const text = path === "/signin" ? "Sign In" : "Sign Up";
    const other = path === "/signin" ? "Sign Up!" : "Sign In!";
    return(
      <div>
        <h1>{ text }</h1>
        <Link to={ otherPath }>
          { other }
        </Link>

        <form onSubmit={(e) => this.handleSubmit(e)}>
          <input type="text"
            onChange={this.handleChange("username")}
            value={this.state.username} />
          <input type="password"
            onChange={this.handleChange("password")}
            value={this.state.password} />
          <input type="submit" value={ text } />
        </form>

        { this.props.errors.map(er => <p key={er}>{er}</p>) }

      </div>
    );
  }
}

export default SessionForm;
