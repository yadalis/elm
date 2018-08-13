# elm
npm install - Once you get this repo downloaded, just running "npm install" should get you going in most cases, but if you are behind the firewall, run the next commands individually after disconnecting and connecting to a public network, to escape from the firewall sitations.

- elm-package install

- npm install elm-webpack-loader --save-dev

# About

This small elm app just spins up a json-server to server up a list of repair-orders from a file and then spin up the actual app with webapck dev server, where you can view the list of the repair-orders with a REFRESH button, which pulls the json results based on the RANDOM generated number 

This app covers: Random generator, 2 level Jason DECODERS and Webdata/remotedata language features..

# Using azure function url to fetch test data from a .json file

Just replace the localhost:5000 url with the below url in commands.elm file and you will get the same results!
https://testfuncappsuresh.azurewebsites.net/api/loadInProcessROs?code=kCigay9kCfy2nr0ui7yzI0jDinaC0TiBmBTcBEawoPzPxyNMCbTsug==
