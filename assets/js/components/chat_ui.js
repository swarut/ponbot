import React, { Component } from 'react';
import { connect } from 'react-redux';

import { joinChat } from '../actions/index';

class ChatUi extends Component {
  componentDidMount() {
    this.props.onMount();
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
      </div>
    );
  }
}

const mapStateToProps = (state, ownProps) => {
  return {
    joined: state.joined
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    onMount: () => {
      dispatch(joinChat())
    }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(ChatUi);
