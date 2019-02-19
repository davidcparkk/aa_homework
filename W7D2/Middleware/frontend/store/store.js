import { createStore, applyMiddleware} from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(
    rootReducer, 
    preloadedState,
  
    applyMiddleware(addLoggingToDispatch,bonusMiddleware)
  );
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}



const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  console.log(next);
  next(action);
  console.log(store.getState());
}

// const applyMiddlewares = (store,...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach(middleware => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, {dispatch});
// }

const bonusMiddleware = store => next => action => {
  console.log("Bonus");
  console.log(next);
  next(action);
};

export default configureStore;