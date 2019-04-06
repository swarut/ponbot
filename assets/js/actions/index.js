import socket from '../chat_socket';
let channel = socket.channel("line:lobby", {})

export const JOIN_CHAT = 'JOIN_CHAT'
export const joinChat = () => {
  return (dispatch) => {
    channel.join()
      .receive("ok", resp => {
        dispatch({type: JOIN_CHAT})
      })
      .receive("error", resp => {
        dispatch({type: JOIN_CHAT})
      });
  }
}
