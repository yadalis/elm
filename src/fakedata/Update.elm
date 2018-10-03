--module RPWeb.Update exposing (..)

--import RPWeb.Models exposing (..)
--import RPWeb.InProcessCommand as RPWebInProcessCommand 
--import RPWeb.ActionRequiredCommand as RPWebActionRequiredCommand

-- update : Msg -> String -> ( String, Cmd Msg  )
-- update msg model =
--     ("", Cmd.none)


-- initialModel : RODashboardViewModel InProcessRO
-- initialModel =
--     { 
--          --roList = RemoteData.Loading
--         url = "inprocess >> url"
--         ,ro = BaseRO ({ repairOrderNumber = 03456, customerName = "Liberty Fruit Company" }) (InProcessRO (UnitNumber "in-process unit# 12345"))
--         ,ranNumb = 5
--         ,selectedROViewName = InProcessROView
--     }

-- update : Msg -> (RODashboardViewModel a) -> ( (RODashboardViewModel a), Cmd Msg  )
-- update msg model =
--     (initialModel, Cmd.none)
    -- case msg of
    --     RPWebMessages.OnFetchInProcessROs response ->
    --         ( { model | roList = response }, Cmd.none )
    --     RPWebMessages.OnFetchActionRequiredROs response ->
    --         ( { model | roList = response }, Cmd.none )
    --     RPWebMessages.Roll rollMsg ->
    --         let
    --             mdl = { model | rollMsg = rollMsg }
    --         in
    --             case rollMsg of
    --                 RollMsgs.InProcessROsMsg ->
    --                     ( mdl, RPWebInProcessCommand.startRandomInProcessROsFetch )
    --                 RollMsgs.ActionRequiredROsMsg ->
    --                     ( mdl, RPWebActionRequiredCommand.startRandomActionRequiredROsFetch )
    --     RPWebMessages.Refresh randomNumber ->
    --         let
    --             mdl = { model | ranNumb = randomNumber }
    --         in
    --             case model.rollMsg of
    --                 RollMsgs.InProcessROsMsg ->
    --                     ( mdl, RPWebInProcessCommand.fetchInProcessROs )
    --                 RollMsgs.ActionRequiredROsMsg ->
    --                     ( mdl, RPWebActionRequiredCommand.fetchActionRequiredROs )