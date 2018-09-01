module RPWeb.Update exposing (..)

import RPWeb.Msgs as RPWebMessages
import RPWeb.RollMsgs  as RollMsgs
import RPWeb.Models as RPWebModels
import RPWeb.Commands as RPWebCommands
import RPWeb.ActionRequiredCommand as RPWebActionRequiredCommand

update : RPWebMessages.Msg -> RPWebModels.InProcessROModel -> ( RPWebModels.InProcessROModel, Cmd RPWebMessages.Msg  )
update msg model =
    case msg of
        RPWebMessages.OnFetchInProcessROs response ->
            ( { model | inProcessROs = response }, Cmd.none )
        RPWebMessages.OnFetchActionRequiredROs response ->
            ( { model | inProcessROs = response }, Cmd.none )
        RPWebMessages.Roll rollMsg ->
            let
                mdl = { model | rollMsg = rollMsg }
            in
                -- if (msg == RPWeb.RollMsgs.InProcessROsMsg) then
                --     ( mdl, RPWebCommands.startRandomInProcessROsFetch )
                -- else
                --     ( mdl, RPWebActionRequiredCommand.startRandomActionRequiredROsFetch )
                case rollMsg of
                    RollMsgs.InProcessROsMsg ->
                        ( mdl, RPWebCommands.startRandomInProcessROsFetch )
                    RollMsgs.ActionRequiredROsMsg ->
                        ( mdl, RPWebActionRequiredCommand.startRandomActionRequiredROsFetch )
        RPWebMessages.Refresh randomNumber ->
            let
                mdl = { model | ranNumb = randomNumber }
            in
                -- if (model.rollMsg == RPWeb.RollMsgs.InProcessROsMsg) then
                --     ( mdl, RPWebCommands.fetchInProcessROs )
                -- else
                --     ( mdl, RPWebActionRequiredCommand.fetchActionRequiredROs )
                case model.rollMsg of
                    RollMsgs.InProcessROsMsg ->
                        ( mdl, RPWebCommands.fetchInProcessROs )
                    RollMsgs.ActionRequiredROsMsg ->
                        ( mdl, RPWebActionRequiredCommand.fetchActionRequiredROs )