import {
  JOIN_CHAT,
  SEND_MESSAGE,
  RECEIVED_MESSAGE
} from '../actions/index'

const defaultState = {
  name: 'taiko',
  joined: false,
  conversations: {}
}

const reducer = (state = defaultState, action) => {
  switch(action.type) {
    case JOIN_CHAT:
      if (action.status === 'success') {
        return Object.assign({}, state, {joined: true});
      }
      else {
        return Object.assign({}, state, {joined: false});
      }

    case RECEIVED_MESSAGE:
      let userConversion = state.conversations[action.from_user];
      if (!userConversion) {
        userConversion = [action.message];
      }
      else {
        userConversion.push(action.message)
      }
      let conversation = Object.assign({}, state.conversations, {[action.from_user]: userConversion});
      return Object.assign({}, state, {conversations: conversation});
    case SEND_MESSAGE:

    default:
      return state
  }
}

export default reducer
