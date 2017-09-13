import React, { Component } from 'react';

class ResultDisplay extends Component {
  render() {
    return (
      <div>
        { this.props.result }
      </div>
    );
  }
}

export default ResultDisplay;
