import React, { Component } from 'react';

import ResultDisplay from './result-display';
import InputBar from './input-bar';
import OperatorBar from './operator-bar';

const operators = {
  '+': (a, b) => a + b,
  '-': (a, b) => a - b,
  '*': (a, b) => a * b,
  '/': (a, b) => a/ b
};

class Calculator extends Component {

  constructor() {
    super();
    this.state = {
      num1: '',
      num2: '',
      result: 0
    }

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.reset = this.reset.bind(this);
    this.calculate = this.calculate.bind(this);
  }

  reset(event) {
    this.setState({
      num1: '',
      num2: '',
      result: 0
    });
  }

  setNum1(event) {
    event.preventDefault();

    let inputField = event.currentTarget;
    let input = inputField.value;
    let updatedValue = (input === '' ? input : parseInt(input));

    this.setState({num1: input});
  }

  setNum2(event) {
    event.preventDefault();

    let inputField = event.currentTarget;
    let input = inputField.value;
    let updatedValue = (input === '' ? 0 : parseInt(input));

    this.setState({num2: input});
  }

  calculate(event) {
    console.log('in calculate')
    let result;
    let operator = event.currentTarget.value;

    if (this.state.num1 === '' || this.state.num2 === '') {
      result = 0;
    } else {
      result = operators[operator](this.state.num1, this.state.num2);
    }

    this.setState({ result });
  }

  render() {
    return (
      <div>
        <ResultDisplay result={ this.state.result } />
        <InputBar
          num1={ this.state.num1 }
          num2={ this.state.num2 }
          operands={ this.props.operands }
          setNum1={ this.setNum1 }
          setNum2={ this.setNum2 }
          reset={ this.reset }
        />
        <OperatorBar calculate={ this.calculate } />
      </div>
    );
  }
}

export default Calculator;
