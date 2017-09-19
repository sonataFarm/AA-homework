import { connect } from 'react-redux';
import SearchBar from './giphys_search';
import { fetchSearchGiphys } from '../actions/giphy_actions';

const mapStateToProps = state => ({
  giphys: state.giphys
});

const mapDispatchToProps = dispatch => ({
  fetchSearchGiphys: (query) => dispatch(fetchSearchGiphys(query))
});

export default connect(mapStateToProps, mapDispatchToProps)(SearchBar);
