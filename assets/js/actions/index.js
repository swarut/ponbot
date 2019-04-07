import socket from '../chat_socket';
let channel = socket.channel("line:lobby", {})

channel.on('receive_message', (msg) => {
  console.log('received: ', msg);
});

export const JOIN_CHAT = 'JOIN_CHAT'
export const joinChat = (status) => {
  return {type: JOIN_CHAT, status: status};
}
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

export const SEND_MESSAGE = 'SEND_MESSAGE'
export const sendMessage = () => {
  return {type: SEND_MESSAGE, message: 'Hello'}
}
export const sendMessageAsync = () => {
  return (dispatch) => {
    channel.push('shout', {})
      .receive('ok', response => {
        console.log('message sent', response);
      })
      .receive('error', error => {
        console.error(error);
      });
  }
}