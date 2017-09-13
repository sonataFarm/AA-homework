import React, { Component } from 'react';

import OperatorButton from './operator-button';

class OperatorBar extends Component {
  render() {
    return (
      <div>
        <OperatorButton operator='+' calculate={ this.props.calculate } />
        <OperatorButton operator='-' calculate={ this.props.calculate } />
        <OperatorButton operator='*' calculate={ this.props.calculate } />
        <OperatorButton operator='/' calculate={ this.props.calculate } />
      </div>
    );

  }
}

export default OperatorBar;
