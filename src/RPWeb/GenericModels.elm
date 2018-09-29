module RPWeb.GenericModels exposing (..)

import RemoteData exposing (WebData)
--import RPWeb.RollMsgs as RollMsgs

type alias InProcessRO =
    { 
          repairOrderNumber : Int
        , aggregateRootId: String
        , customerNumber : Int
        , customerName : String
        , branchNumber : Int
        , branchDepartmentNumber: Int
        , bay: Maybe String
        , dashboardPriority: Int
        , priority: Int
        , unitNumber: String
        , unitVehicleIdNumber: String
        , internalStatus: String
        , technicians: List Technician
        , driverWaiting: Bool
        , isPortalUser: Int
        , timeZoneDisplay: String
        , estimatedWorkFinish: Maybe String
    }

type alias ActionRequiredRO =
    { 
          repairOrderNumber : Int
        , aggregateRootId: String
        , customerNumber : Int
        , customerName : String
        , branchNumber : Int
        , branchDepartmentNumber: Int
        , bay: Maybe String
        , dashboardPriority: Int
        , priority: Int
        , unitNumber: String
        , unitVehicleIdNumber: String
        , internalStatus: String
        , technicians: List Technician
        , driverWaiting: Bool
        , isPortalUser: Int
        , timeZoneDisplay: String
        , estimatedWorkFinish: Maybe String
    }

type alias Technician =
    { 
         text : String
        ,value : String
    }

type alias ROListModel anyType =
    { 
         roList : WebData ( List anyType )
        ,ranNumb: Int
        --,rollMsg: RollMsgs.RollMsg
    }

actionRequiredInitialModel : ROListModel anyType
actionRequiredInitialModel =
    { 
         roList = RemoteData.Loading
        ,ranNumb = 5
        --,rollMsg = RollMsgs.ActionRequiredROsMsg
    }

inProcessinitialModel : ROListModel anyType
inProcessinitialModel =
    { 
        roList = RemoteData.Loading
        ,ranNumb = 8
        --,rollMsg = RollMsgs.InProcessROsMsg
    }

-- type alias InProcessROModel =
--     { 
--         roList : WebData ( List InProcessRO )
--         ,ranNumb: Int
--         ,rollMsg: RollMsgs.RollMsg
--     }

-- inProcessinitialModel : InProcessROModel
-- inProcessinitialModel =
--     { 
--         roList = RemoteData.Loading
--         ,ranNumb = 4
--         ,rollMsg = RollMsgs.InProcessROsMsg
--     }

-- type alias ActionRequiredROModel =
--     { 
--         roList : WebData ( List ActionRequiredRO )
--         ,ranNumb: Int
--         ,rollMsg: RollMsgs.RollMsg
--     }

-- actionRequiredInitialModel : ActionRequiredROModel
-- actionRequiredInitialModel =
--     { 
--         roList = RemoteData.Loading
--         ,ranNumb = 5
--         ,rollMsg = RollMsgs.ActionRequiredROsMsg
--     }