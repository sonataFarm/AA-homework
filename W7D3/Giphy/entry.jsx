import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';

import { configureStore } from './store/store';

// debugging and testing
import { fetchGiphys } from './util/api_util';
import { giphysReducer } from
 './reducers/giphys_reducer';
import { fetchSearchGiphys } from './actions/giphy_actions';
// end

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  // debugging and testing
  window.store = store;
  window.fetchGiphys = fetchGiphys;
  window.giphysReducer = giphysReducer;
  window.fetchSearchGiphys = fetchSearchGiphys;
  // end

  ReactDOM.render(
    <Root store={store} />,
    document.getElementById('root')
  );
});
