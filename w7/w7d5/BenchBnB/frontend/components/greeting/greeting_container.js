import { connect } from 'react-redux';
import { signin, signout, signup } from '../../actions/session_actions';
import Greeting from './greeting';

const mapStateToProps = (state) => {
  return {
    currentUser: state.session.currentUser
  };
};


const mapDispatchToProps = dispatch => ({
  signin: (user) => dispatch(signin(user)),
  signout: () => dispatch(signout()),
  signup: (user) => dispatch(signup(user))
});

export default connect(mapStateToProps, mapDispatchToProps)(Greeting);
