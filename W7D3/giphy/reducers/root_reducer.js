import { combineReducers } from 'redux';

import giphysReducer from './giphys_reducer';

const combinedRoot = combineReducers({
  giphys: giphysReducer
});

export default combinedRoot;