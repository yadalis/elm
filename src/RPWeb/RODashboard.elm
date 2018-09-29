module RODashboard exposing (..)

import Html exposing (program)
import RPWeb.GenericModels as RPWebModels
import RPWeb.GenericMsgs as RPWebMessages
import RPWeb.GenericUpdate as RPWebUpdate
import RPWeb.GenericView as RPWebView
import RPWeb.GenericCommand as RPWebGenericCommand

init : ( RPWebModels.ROListModel RPWebModels.ActionRequiredRO, Cmd RPWebMessages.Msg RPWebModels.ActionRequiredRO)
init =
    ( (RPWebModels.actionRequiredInitialModel), RPWebGenericCommand.startRandomROsFetch )

subscriptions model =
    Sub.none

-- MAIN

main : Program Never (RPWebModels.ROListModel RPWebModels.ActionRequiredRO) (RPWebMessages.Msg RPWebModels.ActionRequiredRO)
main =
    program
        { init = init
        , view = RPWebView.view (RPWebModels.ActionRequiredRO)
        , update = RPWebUpdate.update (RPWebModels.ActionRequiredRO)
        , subscriptions = subscriptions
        }