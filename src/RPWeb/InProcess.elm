module InProcess exposing (..)

import Html exposing (..)
import RPWeb.Models exposing(..)
import RPWeb.Update exposing(..)
--import RPWeb.Views.View
--import RPWeb.ActionRequiredCommand


-- init : (String, Cmd Msg)
-- init =
--     ("", Cmd.none)

init : ( RODashboardViewModel InProcessRO, Cmd Msg )
init =
    --( (inProcessinitialModel), startRandomActionRequiredROsFetch )
    ( (inProcessinitialModel), Cmd.none )

subscriptions : (RODashboardViewModel InProcessRO) -> Sub Msg
subscriptions model =
    Sub.none


--subscriptions : (ROListModel ActionRequiredRO) -> Sub Msg
--subscriptions model =
    --Sub.none

-- unitNumberValue1 : BaseRO InProcessRO -> String
-- unitNumberValue1 (BaseRO _ (InProcessRO (UnitNumber unitNumber)  ) ) =
--         unitNumber

unitNumberValue : UnitNumber -> String
unitNumberValue (UnitNumber unitNumber) =
        unitNumber

unitNumber : BaseRO InProcessRO -> UnitNumber
unitNumber (BaseRO _ (InProcessRO unitNumber) )  =
        unitNumber

customerName : BaseRO a-> String
customerName (BaseRO commonFields _) =
    commonFields.customerName

-- view : RODashboardViewModel InProcessRO -> Html Msg
-- view model = 
--     div []
--     [
--         div [][text(model.url ++ "  " ++ (customerName model.ro) )]

--         ,div [][text(model.url ++ "  " ++ (unitNumberValue (unitNumber model.ro)) )] -- the below line is same as this
--         ,div [] [text(model.url ++ "  " ++ (model.ro
--                                                 |> unitNumber
--                                                 |> unitNumberValue   ) )]
--     ]

-- MAIN

--main : Program Never (ROListModel RO a) Msg
main : Program Never (RODashboardViewModel InProcessRO) Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }