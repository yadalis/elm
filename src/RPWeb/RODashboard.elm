module RODashboard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import TypesAndConversions.InProcessTypes exposing (..)
import TypesAndConversions.ActionRequiredTypes exposing (..)
import TypesAndConversions.InProcessTypeConversionHelpers exposing (..)
import TypesAndConversions.ActionRequiredTypeConversionHelpers exposing (..)
import TypesAndConversions.CommonTypeConversionHelpers exposing (..)
import ROFetchCommand exposing (..)
import RemoteData exposing (WebData)
import Models exposing(..)


-- Model
type ROViewCategoryModel 
    = ActionRequired (BaseRO ActionRequiredRO)
    | InProcess (BaseRO InProcessRO)

type alias RODashboardViewModel
    =
    { 
        url : String
        ,ro : ROViewCategoryModel
        --,roList : List ROViewCategoryModel
        ,ranNumb: Int
        ,selectedROViewName : ROViewCategoryName
    }

initialActionRequiredModel : RODashboardViewModel
initialActionRequiredModel =
            { 
                --roList = RemoteData.Loading
                url = "http://localhost:13627/api/repairorder/actionrequired"
                ,ro = ActionRequired (BaseRO ({ repairOrderNumber = 03456, customerName = "Fed-Ex" }) (ActionRequiredRO (BranchName "a-c Branch Name MHC Olathe") "a-c KS-State"))
                ,ranNumb = 5
                ,selectedROViewName = ActionRequiredROView
            }

initialInProcessModel : RODashboardViewModel
initialInProcessModel =
            { 
                --roList = RemoteData.Loading
                url = "http://localhost:13627/api/repairorder/getinprocess/370"
                ,ro = InProcess (BaseRO ({ repairOrderNumber = 03456, customerName = "Liberty Fruit Company" }) (InProcessRO (UnitNumber "in-process unit# 12345")(UnitVehicleIdNumber "in-process VIN# 12345")))
                ,ranNumb = 5
                ,selectedROViewName = InProcessROView
            }

init : (RODashboardViewModel, Cmd Msg)
init =
    (initialActionRequiredModel, Cmd.none)

subscriptions : RODashboardViewModel -> Sub Msg
subscriptions model =
    Sub.none
    
-- VIEW
view : RODashboardViewModel -> Html Msg
view model = 
    div[class "container mx-auto my-auto flex  justify-between"][
    div [][
        br[][]
        ,button [style[("border", "0.10em solid"),("border-color","wheat"), ("outline","0")],  class "rounded-r-full rounded-l-full h-12 w-64 hover:bg-blue-light", onClick (ClickedROViewLink ActionRequiredROView) ][text "Refresh action required ro list"]
        ,span [class "p-4"][]
        ,button [style[("border", "0.10em solid"),("border-color","wheat"), ("outline","0")],  class "h-12 w-64 hover:bg-green-lighter", onClick (ClickedROViewLink InProcessROView) ] [text "Refresh in process ro list"]
        ,br[][]
        ,br[][]
        ,br[][]
        ,case model.ro of
            ActionRequired ro -> 
                div []
                [
                    div [][text(model.url ++ "  " ++ (customerName ro) )]

                    -- The below commented code works in case the first arg to ActionRequiredRO is string (BranchName), but
                    -- I have redesigned to make that String as Custom Type BranchName
                    -- ,div [][text(model.url ++ "  " ++ (unWrapBranchNameValue ro) ++ "  " ++  (unWrapVinValue ro))] -- the below line is same as this
                    -- ,div [] [text(model.url ++ "  " ++ (ro
                    --                                         |> unWrapBranchNameValue )
                    --                         ++ "  " ++ (ro
                    --                                         |> unWrapVinValue)
                    --         )]

                    ,div [][text(model.url ++ "  " ++ (unWrapBranchNameValue (unWrapBranchName ro)) ++ " " ++ unWrapBranchLocationValue ro )] -- the below line is same as this
                    ,div [] [text(model.url ++ "  " ++ (ro
                                                            |> unWrapBranchName
                                                            |> unWrapBranchNameValue   )
                                            ++ "  " ++ (ro
                                                            |> unWrapBranchLocationValue) )]
                ]
            InProcess ro -> 
                div []
                [
                    div [][text(model.url ++ "  " ++ (customerName ro) )]

                    ,div [][text(model.url ++ "  " ++ (unWrapUnitNumberValue (unWrapUnitNumber ro)) ++ " " ++ unWrapUnitVehicleIdNumberValue (unWrapUnitVehicleIdNumber ro) )] -- the below line is same as this
                    ,div [] [text(model.url ++ "  " ++ (ro
                                                            |> unWrapUnitNumber
                                                            |> unWrapUnitNumberValue   )
                                            ++ "  " ++ (ro
                                                            |> unWrapUnitVehicleIdNumber
                                                            |> unWrapUnitVehicleIdNumberValue   ) )]
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
            --( {model| selectedROViewName = viewName} , fetchROs model.url model.selectedROViewName)
            case viewName of
                ActionRequiredROView ->
                    let
                        mdl = {model| url = "http://localhost:13627/api/repairorder/actionrequired", selectedROViewName = viewName}                           
                    in
                        (mdl , fetchActionRequiredROs mdl.url mdl.selectedROViewName )
                InProcessROView ->
                    let
                        mdl = {model| url = "http://localhost:13627/api/repairorder/getinprocess/370", selectedROViewName = viewName}
                    in
                        (mdl , fetchInProcessROs mdl.url mdl.selectedROViewName)
        
        OnFetchActionRequiredROs response ->
            case response of
                RemoteData.NotAsked ->
                    (model, Cmd.none)

                RemoteData.Loading ->
                    (model, Cmd.none)

                RemoteData.Success commonRoFields ->
                    --(model, Cmd.none)
                    --( {model | ro = ActionRequired (BaseRO (commonRoFields) (ActionRequiredRO (BranchName "a-c Branch Name MHC Olathe") "a-c VIN# 1NXASDFAWERTASDF"))}, Cmd.none )
                    ( {model | ro = ActionRequired (commonRoFields)}, Cmd.none )

                RemoteData.Failure error ->
                    (model, Cmd.none)

        OnFetchInProcessROs response ->
            case response of
                RemoteData.NotAsked ->
                    (model, Cmd.none)

                RemoteData.Loading ->
                    (model, Cmd.none)

                RemoteData.Success commonRoFields ->
                    --(model, Cmd.none)
                    --( {model | ro = ActionRequired (BaseRO (commonRoFields) (ActionRequiredRO (BranchName "a-c Branch Name MHC Olathe") "a-c VIN# 1NXASDFAWERTASDF"))}, Cmd.none )
                    --( {model | ro = ActionRequired (commonRoFields)}, Cmd.none )
                    ( {model | ro = InProcess (commonRoFields)}, Cmd.none )

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