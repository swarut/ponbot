import socket from '../chat_socket';
let channel = socket.channel("line:lobby", {})

export const RECEIVED_MESSAGE = 'RECIEVED_MESSAGE';
export const receivedMessage = (message) => {
  return {type: RECEIVED_MESSAGE, message: message.message, from_user: message.from_user};
}

export const JOIN_CHAT = 'JOIN_CHAT';
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
    channel.on('receive_message', (message) => {
      console.log('received: ', message);
      dispatch(receivedMessage(message));
    });
  }
}

export const SEND_MESSAGE = 'SEND_MESSAGE';
export const sendMessage = (message) => {
  return {type: SEND_MESSAGE, message: message}
}
export const sendMessageAsync = () => {
  return (dispatch) => {
    channel.push('shout', {})
      .receive('ok', response => {
        console.log('message sent', response);
        dispatch(sendMessage(response.message))
      })
      .receive('error', error => {
        console.error(error);
      });
  }
}