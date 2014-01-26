mkdir public
mkdir public/javascript
mkdir public/javascript/libs
mkdir public/javascript/libs/select2
curl http://code.jquery.com/jquery-2.0.3.js > public/javascript/libs/jquery2.js
curl https://raw.github.com/mbostock/d3/master/d3.js > public/javascript/libs/d3.js
curl -L http://preludels.com/prelude-browser.js > public/javascript/libs/prelude-browser.js
curl -L https://raw.github.com/ivaynberg/select2/master/select2.js > public/javascript/libs/select2/select2.min.js
curl -L https://raw.github.com/ivaynberg/select2/master/select2.css > public/javascript/libs/select2/select2.css
curl -o  public/javascript/libs/select2/select2-spinner.gif https://raw.github.com/ivaynberg/select2/master/select2-spinner.gif 
curl -o  public/javascript/libs/select2/select2.png https://raw.github.com/ivaynberg/select2/master/select2.png