import {
  JOIN_CHAT
} from '../actions/index'

const defaultState = {
  name: 'taiko',
  joined: false
}

const reducer = (state = defaultState, action) => {
  let arr, min, max, med;
  switch(action.type) {
    case JOIN_CHAT:
      let channel = socket.channel("line:lobby", {})
      let joined;
      channel.join()
        .receive("ok", resp => {
          console.log("Joined successfully", resp);
          joined = true;
        })
        .receive("error", resp => {
          console.log("Unable to join", resp);
          joined = false;
        })
      return Object.assign({}, state, {
        joined: joined
      });

    default:
      return state
  }
}

export default reducer
