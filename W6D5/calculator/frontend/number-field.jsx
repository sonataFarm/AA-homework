import React, { Component } from 'react';

class NumberField extends Component {
  render() {
    return (
      <div>
        <input type="text" value={ this.props.number } onChange={ this.updateValue.bind(this) }/>
      </div>
    );
  }

  updateValue(event) {
    if (this.props.fieldNumber === 1) {
      this.props.setNum1(event);
    } else {
      this.props.setNum2(event);
    }
  }
}

export default NumberField;
