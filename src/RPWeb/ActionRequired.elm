module ActionRequired exposing (..)

import Html exposing (program)
import RPWeb.Msgs as RPWebMessages
import RPWeb.Models as RPWebModels
import RPWeb.Update as RPWebUpdate
import RPWeb.Views.View as RPWebView
import RPWeb.ActionRequiredCommand as RPWebActionRequiredCommand

init : ( RPWebModels.ActionRequiredROModel, Cmd RPWebMessages.Msg )
init =
    ( RPWebModels.actionRequiredInitialModel, RPWebActionRequiredCommand.startRandomActionRequiredROsFetch )
    --( RPWebModels.initialModel, Cmd.none )

subscriptions : RPWebModels.ActionRequiredROModel -> Sub RPWebMessages.Msg
subscriptions model =
    Sub.none

-- MAIN

main : Program Never RPWebModels.ActionRequiredROModel RPWebMessages.Msg
main =
    program
        { init = init
        , view = RPWebView.view
        , update = RPWebUpdate.update
        , subscriptions = subscriptions
        }