module InProcess exposing (..)

import Html exposing (program)
import RPWeb.Msgs as RPWebMessages
import RPWeb.Models as RPWebModels
import RPWeb.Update as RPWebUpdate
import RPWeb.Views.View as RPWebView
import RPWeb.InProcessCommand as RPWebInProcessCommand

init : ( RPWebModels.InProcessROModel, Cmd RPWebMessages.Msg )
init =
    ( RPWebModels.inProcessinitialModel, RPWebInProcessCommand.startRandomInProcessROsFetch )
    --( RPWebModels.initialModel, Cmd.none )

subscriptions : RPWebModels.InProcessROModel -> Sub RPWebMessages.Msg
subscriptions model =
    Sub.none

-- MAIN

main : Program Never RPWebModels.InProcessROModel RPWebMessages.Msg
main =
    program
        { init = init
        , view = RPWebView.view
        , update = RPWebUpdate.update
        , subscriptions = subscriptions
        }