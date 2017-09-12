
1. Initialize NPM:
  ```npm init --yes```

2. Install Dependencies:
`npm install --save package1 package2 ...`

  * `webpack`
  * `react`
  * `react-dom`
  * `babel-core`
  * `babel-loader`
  * `babel-preset-es2015`
  * `babel-preset-react`

3. Add a `webpack` script to enable `npm run webpack`

4. Add a `webpack.config.js` file

```js
// webpack.config.js
var path = require('path');

module.exports = {
  entry: "./frontend/my_app.jsx",
  output: {
      path: path.resolve(__dirname, 'app', 'assets', 'javascripts'),
      filename: "bundle.js"
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/],
        exclude: /(node_modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['es2015', 'react']
        }
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  }
};
```

5. Add a `.gitignore` for node modules and bundled files
