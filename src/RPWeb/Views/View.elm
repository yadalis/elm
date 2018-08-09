module RPWeb.Views.View exposing (..)

import Html exposing (..)
import RPWeb.Msgs as RPWebMessages
import RPWeb.Models as RPWebModels
import RPWeb.Views.List as RPWebList
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

view : RPWebModels.Model -> Html RPWebMessages.Msg
view model =
        page model

page : RPWebModels.Model -> Html RPWebMessages.Msg
page model =
        div [class "dashboard-legend"]
        [
                p[][text <| " Total rows: " ++ toString model.ranNumb ]
                ,button [onClick RPWebMessages.Roll ][text "Refresh"]
                --,RPWebList.view model.inProcessROs
                ,RPWebList.view  model -- passing full model instead of just inProcessROs list
        ]
    