module ActionRequired exposing (..)

import Html exposing (..)
import RPWeb.Models exposing(..)
import RPWeb.Update exposing(..)
--import RPWeb.Views.View
--import RPWeb.ActionRequiredCommand


-- init : (String, Cmd Msg)
-- init =
--     ("", Cmd.none)

init : ( BaseRO ActionRequiredRO, Cmd Msg )
init =
    ( (actionRequiredInitialModel), startRandomActionRequiredROsFetch )

subscriptions : (String) -> Sub Msg
subscriptions model =
    Sub.none


--subscriptions : (ROListModel ActionRequiredRO) -> Sub Msg
--subscriptions model =
    --Sub.none

view : String -> Html Msg
view str = 
    div [][text("test.....")]
-- MAIN

--main : Program Never (ROListModel RO a) Msg
main : Program Never (String) Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }