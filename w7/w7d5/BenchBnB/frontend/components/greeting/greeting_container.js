import { connect } from 'react-redux';
import { signin, signout, signup } from '../../actions/session_actions';
import { withRouter } from 'react-router';
import Greeting from './greeting';

const mapStateToProps = (state, { match }) => {
  return {
    currentUser: state.session.currentUser,
    match: match
  };
};

const mapDispatchToProps = dispatch => ({
  signin: (user) => dispatch(signin(user)),
  signout: () => dispatch(signout()),
  signup: (user) => dispatch(signup(user))
});

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Greeting));
