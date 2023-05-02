const { environment } = require('@rails/webpacker')

const babelLoader = environment.loaders.get('babel')
babelLoader.test = /\.(js|jsx)$/i
babelLoader.exclude = /node_modules/

module.exports = environment
