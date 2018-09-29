module RPWeb.Update exposing (..)

import RPWeb.Msgs as RPWebMessages
import RPWeb.RollMsgs  as RollMsgs
import RPWeb.Models as RPWebModels
import RPWeb.InProcessCommand as RPWebInProcessCommand 
import RPWeb.ActionRequiredCommand as RPWebActionRequiredCommand

update : RPWebMessages.Msg -> (RPWebModels.ROListModel RPWebModels.ActionRequiredRO) -> ( (RPWebModels.ROListModel RPWebModels.ActionRequiredRO), Cmd RPWebMessages.Msg  )
update msg model =
    case msg of
        RPWebMessages.OnFetchInProcessROs response ->
            ( { model | roList = response }, Cmd.none )
        RPWebMessages.OnFetchActionRequiredROs response ->
            ( { model | roList = response }, Cmd.none )
        RPWebMessages.Roll rollMsg ->
            let
                mdl = { model | rollMsg = rollMsg }
            in
                case rollMsg of
                    RollMsgs.InProcessROsMsg ->
                        ( mdl, RPWebInProcessCommand.startRandomInProcessROsFetch )
                    RollMsgs.ActionRequiredROsMsg ->
                        ( mdl, RPWebActionRequiredCommand.startRandomActionRequiredROsFetch )
        RPWebMessages.Refresh randomNumber ->
            let
                mdl = { model | ranNumb = randomNumber }
            in
                case model.rollMsg of
                    RollMsgs.InProcessROsMsg ->
                        ( mdl, RPWebInProcessCommand.fetchInProcessROs )
                    RollMsgs.ActionRequiredROsMsg ->
                        ( mdl, RPWebActionRequiredCommand.fetchActionRequiredROs )