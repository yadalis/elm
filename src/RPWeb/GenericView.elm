module RPWeb.GenericView exposing (..)

import Html exposing (..)
import RPWeb.GenericMsgs as RPWebMessages
import RPWeb.GenericModels as RPWebModels
--import RPWeb.Views.GenericList as RPWebList
import Html exposing (..)
import Html.Attributes exposing (..)
-- import Html.Events exposing (..)
-- import RPWeb.RollMsgs as RollMsgs

view : (RPWebModels.ROListModel a) -> Html RPWebMessages.Msg
view model =
        page model

page :  (RPWebModels.ROListModel a) -> Html RPWebMessages.Msg
page model =
        div [class "dashboard-legend"]
        [
                p[]
                [text <| " Total rows: " ++ toString model.ranNumb]
                -- ,button [onClick (RPWebMessages.Roll RollMsgs.InProcessROsMsg) ][text "Refresh in process ro list"]
                -- ,button [onClick (RPWebMessages.Roll RollMsgs.ActionRequiredROsMsg) ][text "Refresh action required ro list"]
                -- ,div[] [ (case model.rollMsg of
                --                 RollMsgs.InProcessROsMsg ->
                --                         text "In Process ROs"
                --                 RollMsgs.ActionRequiredROsMsg ->
                --                         text "Action Required ROs") ]
                --,RPWebList.view model.inProcessROs
                --,RPWebList.view  model -- passing full model instead of just inProcessROs list
        ]
    