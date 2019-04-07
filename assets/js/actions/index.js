import socket from '../chat_socket';
let channel = socket.channel("line:lobby", {})

export const joinChat = (status) => {
  return {type: JOIN_CHAT, status: status};
}

export const JOIN_CHAT = 'JOIN_CHAT'
export const joinChatAsync = () => {
  return (dispatch) => {
    channel.join()
      .receive("ok", resp => {
        dispatch(joinChat('success'));
      })
      .receive("error", resp => {
        dispatch(joinChat('fail'));
      });
  }
}
