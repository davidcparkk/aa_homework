import { createNewUser } from '../../actions/session';
import { connect } from 'react-redux';
import Signup from './signup';

const mapDispatchToProps = dispatch => ({
    createNewUser: newUser => dispatch(createNewUser(newUser))
});

export default connect(null, mapDispatchToProps)(Signup);