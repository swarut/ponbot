import {
  JOIN_CHAT
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

    default:
      return state
  }
}

export default reducer
