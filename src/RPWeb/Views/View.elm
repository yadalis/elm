module RPWeb.Views.View exposing (..)

import Html exposing (..)
import RPWeb.Msgs as RPWebMessages
import RPWeb.Models as RPWebModels
import RPWeb.Views.List as RPWebList
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import RPWeb.RollMsgs as RollMsgs

view : RPWebModels.InProcessROModel -> Html RPWebMessages.Msg
view model =
        page model

page : RPWebModels.InProcessROModel -> Html RPWebMessages.Msg
page model =
        div [class "dashboard-legend"]
        [
                p[]
                [text <| " Total rows: " ++ toString model.ranNumb ]
                ,button [onClick (RPWebMessages.Roll RollMsgs.InProcessROsMsg) ][text "Refresh in process ro list"]
                ,button [onClick (RPWebMessages.Roll RollMsgs.ActionRequiredROsMsg) ][text "Refresh action required ro list"]
                --,div[][text("roll num is " ++ toString model.rollNum)]
                ,div[] [ (case model.rollMsg of
                                RollMsgs.InProcessROsMsg ->
                                        text "In Process ROs"
                                RollMsgs.ActionRequiredROsMsg ->
                                        text "Action Required ROs") ]
                --,RPWebList.view model.inProcessROs
                ,RPWebList.view  model -- passing full model instead of just inProcessROs list
        ]
    