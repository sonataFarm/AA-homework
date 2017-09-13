import React, { Component } from 'react';
import ReactDOM from 'react-dom';

import Calculator from './calculator';

const operands = [7, 2];
const operator = '+';
const result = 9;

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Calculator
      operands={ operands }
      operator={ operator }
      result={ result }
    />,
    document.getElementById('main')
  )
});
