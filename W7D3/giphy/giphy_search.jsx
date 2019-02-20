import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import fetchAPI from './util/api_util';
import * as giphyActions from './actions/giphy_actions';
// import * as giphyActions from './util/api_util';


document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');
    const store = configureStore();
    // window.fetchSearchGiphys = giphyActions.fetchSearchGiphys;
    // window.receiveSearchGiphys = giphyReducers.receiveSearchGiphys;
    // window.fetchSearchGiphys = giphyActions.fetchSearchGiphys;
    window.store = store;
    ReactDOM.render(<Root store={store}/>, root);
});