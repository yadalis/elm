module RPWeb.GenericUpdate exposing (..)

import RPWeb.GenericMsgs as RPWebMessages
import RPWeb.RollMsgs  as RollMsgs
import RPWeb.GenericModels as RPWebModels
import RPWeb.GenericCommand as RPWebGenericCommand 

--update : RPWebMessages.Msg -> (RPWebModels.ROListModel RPWebModels.ActionRequiredRO) -> ( (RPWebModels.ROListModel RPWebModels.ActionRequiredRO), Cmd RPWebMessages.Msg  )
update : RPWebMessages.Msg -> (RPWebModels.ROListModel a) -> ( (RPWebModels.ROListModel a), Cmd RPWebMessages.Msg a )
update msg model =
    case msg of
        RPWebMessages.OnFetchROs response ->
            ( { model | roList = response }, Cmd.none )
        -- RPWebMessages.Roll rollMsg ->
        --     let
        --         mdl = { model | rollMsg = rollMsg }
        --     in
        --         case rollMsg of
        --             RollMsgs.InProcessROsMsg ->
        --                 ( mdl, RPWebGenericCommand.startRandomInProcessROsFetch )
        --             RollMsgs.ActionRequiredROsMsg ->
        --                 ( mdl, RPWebGenericCommand.startRandomActionRequiredROsFetch )
        RPWebMessages.Refresh randomNumber ->
            let
                mdl = { model | ranNumb = randomNumber }
            in
                ( mdl, RPWebGenericCommand.fetchROs )
                -- case model.rollMsg of
                --     RollMsgs.InProcessROsMsg ->
                --         ( mdl, RPWebInProcessCommand.fetchInProcessROs )
                --     RollMsgs.ActionRequiredROsMsg ->
                --         ( mdl, RPWebActionRequiredCommand.fetchActionRequiredROs )