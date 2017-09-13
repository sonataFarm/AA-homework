import React, { Component } from 'react';

import NumberField from './number-field';

class InputBar extends Component {
  render() {
    console.log(this.props)
    return (
      <div>
        <NumberField fieldNumber={ 1 } setNum1={ this.props.setNum1 } number={ this.props.num1 } />
        <NumberField fieldNumber={ 2 } setNum2={ this.props.setNum2 } number={ this.props.num2 } />
        {/* <button onClick={ this.props.reset }>Clear</button> */}
        <button onClick={ this.props.reset }>Clear</button>
      </div>
    )
  }
}

export default InputBar;
