import React, { Component } from 'react';
import { createStore, applyMiddleware, compose } from 'redux';
import { Provider } from 'react-redux';
import reducer from '../reducers/index';
import thunk from 'redux-thunk';

import ChatUi from './chat_ui'

const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;

let store = createStore(
  reducer,
  composeEnhancers(applyMiddleware(thunk))
);

class ChatApp extends Component {
  constructor(props) {
    super();
  }
  render() {
    return (
      <Provider store={store}>
        <div className="chat">
          <ChatUi />
        </div>
      </Provider>
    );
  }
}

export default ChatApp;
