module InProcess exposing (..)

import Html exposing (program)
import RPWeb.Msgs as RPWebMessages
import RPWeb.Models as RPWebModels
import RPWeb.Update as RPWebUpdate
import RPWeb.Views.View as RPWebView
import RPWeb.Commands as RPWebCommands

init : ( RPWebModels.Model, Cmd RPWebMessages.Msg )
init =
    --( RPWebModels.initialModel, RPWebCommands.fetchInProcessROs )
    ( RPWebModels.initialModel, Cmd.none )

subscriptions : RPWebModels.Model -> Sub RPWebMessages.Msg
subscriptions model =
    Sub.none

-- MAIN

main : Program Never RPWebModels.Model RPWebMessages.Msg
main =
    program
        { init = init
        , view = RPWebView.view
        , update = RPWebUpdate.update
        , subscriptions = subscriptions
        }