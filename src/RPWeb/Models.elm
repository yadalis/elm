--module Models exposing (ActionRequiredRO, InProcessRO, CommonROFields, BaseRO)
module Models exposing (..)
import InProcessTypes exposing (..)
--import RemoteData exposing (WebData)

type ActionRequiredRO =
     ActionRequiredRO String String

type InProcessRO = 
     InProcessRO UnitNumber

type alias CommonROFields =
    {
        repairOrderNumber : Int
       ,customerName : String    
    }

type BaseRO a =
    BaseRO CommonROFields a
    
-- type Msg
--     =  Refresh Int
--     |  ClickedROView ROViewName

-- type ROViewName
--     = ActionRequiredROView
--     | InProcessROView



-- type UnitNumber =
--         UnitNumber String

-- type UnitVehicleIdNumber =
--         UnitVehicleIdNumber String







-- type alias RODashboardViewModel anyType =
--     { 
--         url : String
--         ,ro : BaseRO anyType
--         ,ranNumb: Int
--         ,selectedROViewName : ROViewName
--     }

-- inProcessinitialModel : RODashboardViewModel InProcessRO
-- inProcessinitialModel =
--     { 
--          --roList = RemoteData.Loading
--         url = "inprocess >> url"
--         ,ro = BaseRO ({ repairOrderNumber = 03456, customerName = "Liberty Fruit Company" }) (InProcessRO (UnitNumber "in-process unit# 12345"))
--         ,ranNumb = 5
--         ,selectedROViewName = InProcessROView
--     }

    
-- actionRequiredInitialModel : RODashboardViewModel ActionRequiredRO
-- actionRequiredInitialModel =
--     { 
--          --roList = RemoteData.Loading
--         url = ""
--         ro = {}
--         ,ranNumb = 5
--         ,selectedROViewName = ActionRequiredROView
--     }

-- inProcessinitialModel : ROListModel anyType
-- inProcessinitialModel =
--     { 
--         roList = RemoteData.Loading
--         ,ranNumb = 8
--         ,rollMsg = InProcessROsMsg
--     }