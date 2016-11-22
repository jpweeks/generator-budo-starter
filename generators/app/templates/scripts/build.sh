PATH=$(npm bin):$PATH
export NODE_ENV=production
node ./scripts/preprocess.js src/index.js > src/index.prod.js
browserify -t [ rollupify --config rollup.config.js ] src/index.prod.js | uglifyjs -cn > build/index.js
rm src/index.prod.js
terminal-notifier -title "<%= title %>" -message "Build Complete"
