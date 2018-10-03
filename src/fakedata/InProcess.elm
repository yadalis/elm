module InProcess exposing (..)

import Html exposing (program)
import RPWeb.Msgs as RPWebMessages
import RPWeb.Models as RPWebModels
import RPWeb.Update as RPWebUpdate
import RPWeb.Views.View as RPWebView
import RPWeb.InProcessCommand as RPWebInProcessCommand

init : (  RPWebModels.ROListModel RPWebModels.InProcessRO, Cmd RPWebMessages.Msg )
init =
    ( RPWebModels.  , RPWebInProcessCommand.startRandomInProcessROsFetch )
    --( RPWebModels.initialModel, Cmd.none ) --  if you dont want to load action required ro list upon page load

subscriptions :  RPWebModels.ROListModel RPWebModels.InProcessRO -> Sub RPWebMessages.Msg
subscriptions model =
    Sub.none

-- MAIN

main : Program Never  (RPWebModels.ROListModel RPWebModels.InProcessRO) RPWebMessages.Msg
main =
    program
        { init = init
        , view = RPWebView.view
        , update = RPWebUpdate.update
        , subscriptions = subscriptions
        }