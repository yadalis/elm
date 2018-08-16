# About the app

   This small app built in fairly new SPA language called Elm. Just spins up a json-server to server up a list of repair-orders from a file and then launch the app with webapck dev server (watch files), the webpage displays the list of the repair-orders with a REFRESH button, which pulls the json results with count limited to the RANDOMly generated number.

This app covers the following Elm Language features: Random generator, 2 level Jason DECODERS and Webdata/remotedata.


# Demo

https://elmlangdemoapp.azurewebsites.net/

Note: Do view-source on the page and download the api.js file to look at the compiled Elm app code and the Elm runtime.

# About Elm

   Elm is a fairly new language to build SPA (Single page apps), and in my opinion this language beats React.js, Angualar.js or any other SPA language hands down with its unique functional programmign approach, where every thing is a function, including DOM elements). Please browse src folder for all of the Elm code, but here is a small snippet
   
      module RPWeb.Views.View exposing (..)
      import Html exposing (..)
      import RPWeb.Msgs as RPWebMessages
      import RPWeb.Models as RPWebModels
      import RPWeb.Views.List as RPWebList
      import Html exposing (..)
      import Html.Attributes exposing (..)
      import Html.Events exposing (..)

      view : RPWebModels.Model -> Html RPWebMessages.Msg
      view model =
              page model

      page : RPWebModels.Model -> Html RPWebMessages.Msg
      page model =
              div [class "dashboard-legend"]
              [
                      p[][text <| " Total rows: " ++ toString model.ranNumb ]
                      ,button [onClick RPWebMessages.Roll ][text "Refresh"]
                      --,RPWebList.view model.inProcessROs
                      ,RPWebList.view  model -- passing full model instead of just inProcessROs list
              ]

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


