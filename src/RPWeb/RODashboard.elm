module RODashboard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import TypesAndConversions.InProcessTypes exposing (..)
import TypesAndConversions.ActionRequiredTypes exposing (..)
import TypesAndConversions.InProcessTypeConversionHelpers exposing (..)
import TypesAndConversions.ActionRequiredTypeConversionHelpers exposing (..)
import TypesAndConversions.CommonTypeConversionHelpers exposing (..)

import Models exposing(..)

-- Msg
type Msg
    =  Refresh Int
    |  ClickedROViewLink ROViewCategoryName

type ROViewCategoryName
    = ActionRequiredROView
    | InProcessROView

type ROViewCategoryModel 
    = ActionRequired (BaseRO ActionRequiredRO)
    | InProcess (BaseRO InProcessRO)

-- Model
type alias RODashboardViewModel
    =
    { 
        url : String
        ,ro : ROViewCategoryModel
        ,ranNumb: Int
        ,selectedROViewName : ROViewCategoryName
    }

initialActionRequiredModel : RODashboardViewModel
initialActionRequiredModel =
            { 
                --roList = RemoteData.Loading
                url = "action-required  url -> "
                ,ro = ActionRequired (BaseRO ({ repairOrderNumber = 03456, customerName = "Fed-Ex" }) (ActionRequiredRO (BranchName "a-c Branch Name MHC Olathe") "a-c VIN# 1NXASDFAWERTASDF"))
                ,ranNumb = 5
                ,selectedROViewName = ActionRequiredROView
            }

initialInProcessModel : RODashboardViewModel
initialInProcessModel =
            { 
                --roList = RemoteData.Loading
                url = "inprocess  url -> "
                ,ro = InProcess (BaseRO ({ repairOrderNumber = 03456, customerName = "Liberty Fruit Company" }) (InProcessRO (UnitNumber "in-process unit# 12345")))
                ,ranNumb = 5
                ,selectedROViewName = InProcessROView
            }

init : (RODashboardViewModel, Cmd Msg)
init =
    (initialInProcessModel, Cmd.none)

subscriptions : RODashboardViewModel -> Sub Msg
subscriptions model =
    Sub.none
    
-- VIEW
view : RODashboardViewModel -> Html Msg
view model = 
    div [][
        br[][]
        ,button [onClick (ClickedROViewLink ActionRequiredROView) ][text "Refresh action required ro list"]
        ,span [style [("margin","20px")]][]
        ,button [ onClick (ClickedROViewLink InProcessROView) ] [text "Refresh in process ro list"]
        ,br[][]
        ,case model.ro of
            ActionRequired ro -> 
                div []
                [
                    div [][text(model.url ++ "  " ++ (customerName ro) )]

                    -- ,div [][text(model.url ++ "  " ++ (unWrapBranchNameValue ro) ++ "  " ++  (unWrapVinValue ro))] -- the below line is same as this
                    -- ,div [] [text(model.url ++ "  " ++ (ro
                    --                                         |> unWrapBranchNameValue )
                    --                         ++ "  " ++ (ro
                    --                                         |> unWrapVinValue)
                    --         )]

                    ,div [][text(model.url ++ "  " ++ (unWrapBranchNameValue (unWrapBranchName ro)) )] -- the below line is same as this
                    ,div [] [text(model.url ++ "  " ++ (ro
                                                            |> unWrapBranchName
                                                            |> unWrapBranchNameValue   ) )]
                ]
            InProcess ro -> 
                div []
                [
                    div [][text(model.url ++ "  " ++ (customerName ro) )]

                    ,div [][text(model.url ++ "  " ++ (unWrapUnitNumberValue (unWrapUnitNumber ro)) )] -- the below line is same as this
                    ,div [] [text(model.url ++ "  " ++ (ro
                                                            |> unWrapUnitNumber
                                                            |> unWrapUnitNumberValue   ) )]
                ]
    ]
-- UPDATE
update : Msg -> RODashboardViewModel -> (RODashboardViewModel, Cmd Msg)
update msg model =
    case msg of
        Refresh randomNumber ->
                (initialInProcessModel, Cmd.none)

        ClickedROViewLink viewName ->
            case viewName of
                ActionRequiredROView ->
                    (initialActionRequiredModel, Cmd.none)
                InProcessROView ->
                    (initialInProcessModel, Cmd.none)

-- MAIN

main : Program Never RODashboardViewModel Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }