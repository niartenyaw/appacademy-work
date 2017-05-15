import { connect } from 'react-redux';
import { signin, signup } from '../../actions/session_actions';
import SessionForm from './session_form';
import { withRouter } from 'react-router';

const mapStateToProps = (state, { match }) => {
  return {
    loggedIn: Boolean(state.session.currentUser),
    errors: state.session.errors,
    formType: match.path
  };
};

const mapDispatchToProps = (dispatch, ownProps) => ({
  processForm: ownProps.location.pathname === "/signup" ?
    (user) => dispatch(signup(user)) :
    (user) => dispatch(signin(user))
});

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(SessionForm));
