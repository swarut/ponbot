import React, { Component } from 'react';
import ArrayInput from './components/ArrayInput'

import { createStore } from 'redux'
import { Provider } from 'react-redux'
import reducer from './reducers/index'

let store = createStore(
  reducer,
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()
);


class Chat extends Component {
  render() {
    return (
      <Provider store={store}>
        <div className="chat">
          this is a chat
        </div>
      </Provider>
    );
  }
}

export default Chat;
