import React from 'react';
import ReactDOM from 'react-dom';
import ClickCounter from './frontend/click-counter';
import Congrats from './congrats';

document.addEventListener("DOMContentLoaded", () => {
	const root = document.getElementById("root");
	// ReactDOM.render(<Congrats/>, root);
	ReactDOM.render(<ClickCounter/>, root);
});
