import css from "../css/chat_app.css"

import "phoenix_html"

import socket from "./chat_socket"

import React from 'react';
import ReactDOM from 'react-dom';
import ChatApp from './components/chat_app';

ReactDOM.render(<ChatApp />, document.getElementById('root'));
