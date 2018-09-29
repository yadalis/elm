module ActionRequired exposing (..)

import Html exposing (program)
import RPWeb.Msgs as RPWebMessages
import RPWeb.Models as RPWebModels
import RPWeb.Update as RPWebUpdate
import RPWeb.Views.View as RPWebView
import RPWeb.ActionRequiredCommand as RPWebActionRequiredCommand

init : ( RPWebModels.ROListModel RPWebModels.ActionRequiredRO, Cmd RPWebMessages.Msg )
init =
    ( (RPWebModels.actionRequiredInitialModel), RPWebActionRequiredCommand.startRandomActionRequiredROsFetch )
    --( RPWebModels.initialModel, Cmd.none )

subscriptions : (RPWebModels.ROListModel RPWebModels.ActionRequiredRO) -> Sub RPWebMessages.Msg
subscriptions model =
    Sub.none

-- MAIN

main : Program Never (RPWebModels.ROListModel RPWebModels.ActionRequiredRO) RPWebMessages.Msg
main =
    program
        { init = init
        , view = RPWebView.view
        , update = RPWebUpdate.update
        , subscriptions = subscriptions
        }