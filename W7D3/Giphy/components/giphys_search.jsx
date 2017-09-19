import React from 'react';

import GiphysIndex from './giphys_index';

export default class SearchBar extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      term: ''
    }

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    event.preventDefault();
    this.setState({term: event.currentTarget.value});
  }

  handleSubmit(event) {
    event.preventDefault();
    
    this.props.fetchSearchGiphys(this.state.term);
    this.setState({term: ''});
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <input type="text" value={this.state.term} onChange={this.handleChange} />
        <input type="submit" />
      </form>
    );
  }
}
