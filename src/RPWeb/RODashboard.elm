module RODashboard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types.ActionRequired exposing (..)
import Types.InProcess exposing (..)
import ROFetchCommand exposing (..)
import RemoteData exposing (WebData)
import Model exposing(..)

init : (RODashboardViewModel, Cmd Msg)
init =
    (initialActionRequiredModel, Cmd.none)

subscriptions : RODashboardViewModel -> Sub Msg
subscriptions model =
    Sub.none
    
-- VIEW
view : RODashboardViewModel -> Html Msg
view model = 
    div[class "container mx-auto my-auto flex  justify-between"]
    [
        div []
        [
            br[][]
            ,button [style[("border", "0.10em solid"),("border-color","wheat"), ("outline","0")],  class "rounded-r-full rounded-l-full h-12 w-64 hover:bg-blue-light", onClick (ClickedROViewLink ActionRequiredROView) ][text "Refresh action required ro list"]
            ,span [class "p-4"][]
            ,button [style[("border", "0.10em solid"),("border-color","wheat"), ("outline","0")],  class "h-12 w-64 hover:bg-green-lighter", onClick (ClickedROViewLink InProcessROView) ] [text "Refresh in process ro list"]
            ,br[][]
            ,br[][]
            ,br[][]
            ,
            div[]
            [
                let
                    --cName = getCustName  model.ro
                    cName = (\(RepairOrder commonFields _) -> commonFields.customerName ) model.ro
                in
                    div[]
                    [
                         div [][text(" API Url is " ++ model.url)]
                        ,div [][text(" cusotmer name is " ++ cName)]
                        ,case model.ro of
                            RepairOrder commonFields (ActionRequiredRO (BranchName brName) brLocation)  -> 
                                    div[]
                                    [
                                        div [][text(" branch name is " ++ brName)]
                                        ,div [][text(" branch name is " ++ brLocation)]
                                    ]

                            RepairOrder commonFields (InProcessRO (UnitNumber uNumber) (UnitVehicleIdNumber vin))  -> 
                                    div[]
                                    [
                                        div [][text(" unit number  is " ++ uNumber)]
                                        ,div [][text(" vin is " ++ vin)]
                                    ]
                    ]
            ]
        ]
    ]
-- UPDATE
update : Msg -> RODashboardViewModel -> (RODashboardViewModel, Cmd Msg)
update msg model =
    case msg of
        Refresh randomNumber ->
                (model, Cmd.none)

        ClickedROViewLink viewName ->
            let
                newModel =
                    case viewName of
                        ActionRequiredROView ->
                            {model| url = "http://localhost:5004/actionrequired_ro", selectedROViewName = viewName}                           
                        InProcessROView ->
                            {model| url = "http://localhost:5004/inprocess_ro", selectedROViewName = viewName}
                        
            in
                (newModel , fetchRO newModel.url newModel.selectedROViewName )

        OnFetchRO response ->
            case response of
                RemoteData.NotAsked ->
                    (model, Cmd.none)

                RemoteData.Loading ->
                    (model, Cmd.none)

                RemoteData.Success repairOrder ->
                    ( {model | ro = repairOrder } , Cmd.none )

                RemoteData.Failure error ->
                    (model, Cmd.none)

-- MAIN
main : Program Never RODashboardViewModel Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }