# About

   This small elm app just spins up a json-server to server up a list of repair-orders from a file and then launch the app with webapck dev server (watch files), the webpage displays the list of the repair-orders with a REFRESH button, which pulls the json results with count limited to the RANDOMly generated number.

This app covers the following Elm Language features: Random generator, 2 level Jason DECODERS and Webdata/remotedata.

# Elm setup
Once you get this repo downloaded, just running "npm install" should get you going in most cases, but if you are behind the firewall,
run the next set of commands individually after disconnecting and connecting to a public network, to escape 
from the firewall situations.

- elm-package install

- npm install elm-webpack-loader --save-dev

  Note: This requires node.js pre-installed.

# Using azure function url to fetch test data from a .json file

Just replace the localhost:5000 url with the below url in commands.elm file and rebuild the code, then you should get the same results! as before.

https://testfuncappsuresh.azurewebsites.net/api/loadInProcessROs?code=kCigay9kCfy2nr0ui7yzI0jDinaC0TiBmBTcBEawoPzPxyNMCbTsug==

# Demo

https://elmlangdemoapp.azurewebsites.net/

