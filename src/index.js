//'use strict';

// require('ace-css/css/ace.css');
// require('font-awesome/css/font-awesome.css');
// require('bootstrap/dist/css/bootstrap.css')


// Require index.html so it gets copied to dist
// import './index.html';

//window.Elm = require('./RPWeb/InProcess.elm');

 //window.Elm = require('./RPWeb/ActionRequired.elm');

window.Elm = require('./RPWeb/RODashboard.elm');

// (function mountElmNode() {
//     var mountNode = document.getElementById('dashboard-results');    
//     Elm.Main.embed(mountNode);
// })();

// function mountElmNode() {
//     var mountNode = document.getElementById('dashboard-results');    
//     Elm.Main.embed(mountNode);
// };

//mountElmNode();



// .embed() can take an optional second argument. This would be an object describing the data we need to start a program, i.e. a userID or some token
//var app = Elm.Main.embed(mountNode);

//Elm.Main.embed(mountNode);