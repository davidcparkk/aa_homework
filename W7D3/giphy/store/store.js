import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import combinedRoot from '../reducers/root_reducer';

const configureStore = () => {
    return createStore(combinedRoot,applyMiddleware(thunk));
  };

export default configureStore;