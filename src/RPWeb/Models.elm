module Models exposing (..)
import TypesAndConversions.InProcessTypes exposing (..)
import TypesAndConversions.ActionRequiredTypes exposing (..)
import RemoteData exposing (WebData)

-- Msg
type Msg
    = Refresh Int
    | ClickedROViewLink ROViewCategoryName
    | OnFetchActionRequiredROs  (WebData (BaseRO ActionRequiredRO))
    | OnFetchInProcessROs  (WebData (BaseRO InProcessRO))

type ROViewCategoryName
    = ActionRequiredROView
    | InProcessROView

type ActionRequiredRO =
     ActionRequiredRO BranchName String

type InProcessRO = 
     InProcessRO UnitNumber UnitVehicleIdNumber

type alias CommonROFields =
    {
        repairOrderNumber : Int
       ,customerName : String    
    }

type BaseRO a 
    = BaseRO CommonROFields a