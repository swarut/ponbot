import React, { Component } from 'react';
import { createStore } from 'redux'
import { Provider } from 'react-redux'
import reducer from '../reducers/index'

let store = createStore(
  reducer,
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()
);
// import '../../css/chat.css';

class ChatApp extends Component {
  constructor(props) {
    super();
  }
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

export default ChatApp;
