// import css from "../css/chat.css"

import "phoenix_html"

import socket from "./chat_socket"

import React from 'react';
import ReactDOM from 'react-dom';
import Chat from './components/chat';

ReactDOM.render(<Chat />, document.getElementById('root'));
console.log("hello from chat");
