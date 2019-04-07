import React, { Component } from 'react';
import { connect } from 'react-redux';

import { joinChatAsync, sendMessageAsync } from '../actions/index';

class ChatUi extends Component {
  componentDidMount() {
    this.props.onMount();
  }

  renderMessagesForUser(user, messages) {
    let messageDivs = messages.map((m, index) => {
      return <div className='message' key={index}>
        {m}
      </div>
    })
    return (
      <div className='user' key={user}>
        <h3>{user}</h3>
        {messageDivs}
      </div>
    );
  }

  render() {
    let text;
    if (this.props.joined) {
      text = (<b>JOINED {this.props.joined}</b>);
    }
    else {
      text = (<b>NOT YET JOINED</b>);
    }

    return (
      <div className='chat-ui'>
        this is a chat ui. {text}
        <div>
          {Object.keys(this.props.messages).map((user) => {
            return this.renderMessagesForUser(user, this.props.messages[user]);
          })}
        </div>
        <button onClick={this.props.sendMessageOnClick} >Send message</button>
      </div>
    );
  }
}

const mapStateToProps = (state, ownProps) => {
  return {
    joined: state.joined,
    messages: state.conversations
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    onMount: () => {
      dispatch(joinChatAsync())
    },
    sendMessageOnClick: () => {
      dispatch(sendMessageAsync())
    }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(ChatUi);
