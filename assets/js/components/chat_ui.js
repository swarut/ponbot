import React, { Component } from 'react';
import { connect } from 'react-redux';

class ChatUi extends Component {
  componentDidMount() {

  }

  render() {
    return (
      <div className='chat-ui'>
        this is a chat ui.
      </div>
    );
  }
}

const mapStateToProps = (state, ownProps) => {
  return {
    joined: state.joined
  }
}

export default connect(mapStateToProps, null)(ChatUi);

