module RPWeb.Views.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import RPWeb.Msgs as RPWebMessages
import RPWeb.Models as RPWebModels
import RemoteData exposing (WebData)


--import Debug exposing (log)

-- refresh : ( Cmd RPWebMessages.Msg )
-- refresh =
--     ( RPWebCommands.fetchInProcessROs )

--view : WebData (List RPWebModels.InProcessRO) -> Html RPWebMessages.Msg
view : RPWebModels.InProcessROModel -> Html RPWebMessages.Msg
view model =
    maybeList model

rolegend : Html RPWebMessages.Msg
rolegend =
    div [class "dashboard-legend"]
    [   
       p [][text "Key:"]
        ,ul[]
         [
             li [ class "dashboard-legend-blue" ]
                [
                    span [][] 
                    ,text " Waiting on Parts/Sublet" 
                ]
            ,li [ class "dashboard-legend-green" ]
                [ span [][] 
                    ,text " Parts/Sublet Arrival Time" ]
            ,li [ class "dashboard-legend-yellow" ]
                [ span [][] 
                    ,text " Work in Process/Over Estimate" ] 
            ,li [ class "dashboard-legend-red" ]
                [ span [][] 
                    ,text " Past ETC" ]
            ,li [ class "dashboard-legend-bolditalic" ]
                [ span [] [ text "Bold Italicized" ]
                  ,text "= Portal User" 
                ]
         ]
    ]

--maybeList : WebData (List RPWebModels.InProcessRO) -> Html RPWebMessages.Msg
maybeList : RPWebModels.InProcessROModel -> Html RPWebMessages.Msg
maybeList model =
    case model.inProcessROs of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success inProcessRORows ->
            buildROstable (List.take model.ranNumb inProcessRORows)

        RemoteData.Failure error ->
            text  <| toString error

buildROstable : List RPWebModels.InProcessRO -> (Html RPWebMessages.Msg)
buildROstable inProcessRORows =

    div [id "searchContainer"]
     [  
        
        rolegend
        ,table [ class "item-list", id "searchList" ]
        [ thead []
            [ tr []
                [ th [ attribute "width" "25px" ]
                    [ text "Priority" ]
                , th [ attribute "width" "25px" ]
                    [ text "Sev"               ]
                , th [ attribute "width" "25px" ]
                    [ text "B"               ]
                , th [ attribute "width" "25px" ]
                    [ text "D"               ]
                , th [ attribute "width" "25px" ]
                    [ text "Bay"               ]
                , th [ attribute "width" "75px" ]
                    [ text "RO#"               ]
                , th [ attribute "width" "30px" ]
                    [ text "Cust#"               ]
                , th [ attribute "width" "220px" ]
                    [ text "Customer"               ]
                , th [ attribute "width" "35px" ]
                    [ text "Unit"               ]
                , th [ attribute "width" "35px" ]
                    [ text "VIN"               ]
                , th [ attribute "width" "100px" ]
                    [ text "Status"               ]
                , th []
                    [ text "Updated"               ]
                , th [ attribute "width" "75px" ]
                    [ text "Tech#1"               ]
                , th [ attribute "width" "50px" ]
                    [ text "#2"               ]
                , th [ attribute "width" "25px" ]
                    [ text "DW"               ]
                , th [ attribute "width" "75px" ]
                    [ text "ETC"               ]
                ]
            ]
        , tbody []  (List.map inProcessRORowView inProcessRORows ) 
        ]
   ]

inProcessRORowView : RPWebModels.InProcessRO -> Html RPWebMessages.Msg
inProcessRORowView inProcessRO  =
    let
        -- _ =
        --          Debug.log inProcessRO.customerName

        dashBoardPriorityColorScheme =
                if inProcessRO.dashboardPriority == 1 then
                    "alert-blue"
                else if inProcessRO.dashboardPriority == 2 then
                    "alert-green"
                else if inProcessRO.dashboardPriority == 3 then
                    "alert-yellow"
                else if inProcessRO.dashboardPriority == 4 then
                    "alert-red"
                else
                    "alt"

        priorityValue =
                if inProcessRO.priority == -1 then
                    span[class "button" ][text "HIGH"]
                else
                    span[][text (toString inProcessRO.priority)] 

        roLinkText =
                if inProcessRO.repairOrderNumber == 0 then
                    "Appt"
                else
                    (toString inProcessRO.repairOrderNumber)

        portalCustomerIndicator =
                if inProcessRO.isPortalUser == 1 then
                    strong [][text ("*" ++ (toString inProcessRO.customerNumber))]
                else
                    span [][text (toString inProcessRO.customerNumber)]

        convertedEstimatedFWorkFinish =
                   case inProcessRO.estimatedWorkFinish of
                     Just ewf -> ewf  
                     Nothing -> toString inProcessRO.timeZoneDisplay

    in
         tr [ class dashBoardPriorityColorScheme ]
            [ 
                td []
                    [ 
                        input [ class "row-id", type_ "hidden", value inProcessRO.aggregateRootId ] []
                        , priorityValue               
                    ]
                , td []
                    [text (toString inProcessRO.dashboardPriority)]
                , td []
                    [text (toString inProcessRO.branchNumber)]
                , td []
                    [text (toString inProcessRO.branchDepartmentNumber)]
                , td []
                    [
                        input [ class "Bay", type_ "text", maxlength 4, attribute "style" "width: 25px",  id ("bay-" ++ inProcessRO.aggregateRootId)  ] []
                    ]
                , td []
                    [
                        a [ ] [text roLinkText ]
                    ]
                , td [ colspan 2]
                    [portalCustomerIndicator
                    ,div [attribute "style" "font-weight: bold" ] [text inProcessRO.customerName] 
                    ]
                , td [colspan 2]
                    [
                        span [] [text inProcessRO.unitNumber]
                        ,div [attribute "style" "font-weight: bold" ] [text inProcessRO.unitVehicleIdNumber] 
                    ]
                , td []
                    [
                        text inProcessRO.internalStatus
                    ]
                , td [width 150]
                    [
                        text ""
                    ]
                , td [colspan 2]
                    [
                        select [ id "roTech1Options", width 30]
                                (List.map roTechnicianOptionBuilder inProcessRO.technicians)  
                                
                       ,select [ id "roTech2Options", width 30]
                                (List.map roTechnicianOptionBuilder inProcessRO.technicians) 
                    ]
                , td []
                    [
                        input [class "DriverWaiting", id  ("dw-" ++ inProcessRO.aggregateRootId), name "DriverWaiting",  type_ "checkbox",  checked inProcessRO.driverWaiting][]
                    ]
                , td []
                    [
                        text convertedEstimatedFWorkFinish
                    ]
            ]

        
roTechnicianOptionBuilder : RPWebModels.Technician -> Html RPWebMessages.Msg
roTechnicianOptionBuilder technician =
    option [value technician.value] [text technician.text]