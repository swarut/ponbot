import {
  JOIN_CHAT
} from '../actions/index'

const defaultState = {
  name: 'taiko',
  joined: false
}

import socket from '../chat_socket';

const reducer = (state = defaultState, action) => {
  switch(action.type) {
    case JOIN_CHAT:
      let channel = socket.channel("line:lobby", {})

      channel.join()
        .receive("ok", resp => {
          return Object.assign({}, state, {
            joined: true
          });
        })
        .receive("error", resp => {
          return Object.assign({}, state, {
            joined: false
          });
        });

    default:
      return state
  }
}

export default reducer
