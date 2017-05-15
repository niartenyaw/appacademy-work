import { connect } from 'react-redux';
import { signin, signup } from '../../actions/session_actions';
import SessionForm from './session_form';

const mapStateToProps = (state, ownProps) => ({
  loggedIn: Boolean(state.session.currentUser),
  errors: state.session.errors,
  formType: ownProps.location.pathname
});

const mapDispatchToProps = (dispatch, ownProps) => ({
  processForm: ownProps.location.pathname === "/signup" ?
    (user) => dispatch(signup(user)) :
    (user) => dispatch(signin(user))
});

export default connect(mapStateToProps,
                      mapDispatchToProps)(SessionForm);
