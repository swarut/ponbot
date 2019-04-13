import React, { Component } from 'react';
import { CSSTransition, TransitionGroup } from 'react-transition-group';

class ChatUserMessage extends Component{

  renderMessagesForUser(user, messages) {
    return messages.map((m, index) => {
      return (
        <CSSTransition key={index} timeout={500} className='message-wrapper'>
          <div className='message' key={index}>
            {m}
          </div>
        </CSSTransition>
      );
    });
  }

  render() {
    return (
      <div className='user' key={this.props.user}>
        <h3>{this.props.user}</h3>
        <TransitionGroup>
          {this.renderMessagesForUser(this.props.user, this.props.messages)}
        </TransitionGroup>
      </div>
    );
  }
}

export default ChatUserMessage;