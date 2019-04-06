import {
  JOIN_CHAT
} from '../actions/index'

const defaultState = {
  name: 'taiko',
  joined: false
}



const reducer = (state = defaultState, action) => {
  switch(action.type) {
    case JOIN_CHAT:
      return Object.assign({}, state, {joined: true});

    default:
      return state
  }
}

export default reducer
