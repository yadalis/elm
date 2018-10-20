module Model exposing (..)
import Types.ActionRequired  exposing (..)
import Types.InProcess exposing (..)
import RemoteData exposing (WebData)

-- Msg
type Msg
    = Refresh Int
    | ClickedROViewLink ROViewCategoryName
    | OnFetchRO  (WebData RepairOrder)

-- Model
type alias RODashboardViewModel
    =
    { 
        url : String
        ,ro : RepairOrder
        --,roList : List BaseRO
        ,ranNumb: Int
        ,selectedROViewName : ROViewCategoryName
    }
type ROViewCategoryName
    = ActionRequiredROView
    | InProcessROView

type RepairOrderVariants
    = ActionRequiredRO BranchName String 
    | InProcessRO UnitNumber UnitVehicleIdNumber

type alias CommonROFields =
    {
        repairOrderNumber : Int
       ,customerName : String    
    }

type RepairOrder
     = RepairOrder CommonROFields RepairOrderVariants

initialActionRequiredModel : RODashboardViewModel
initialActionRequiredModel =
            { 
                --roList = RemoteData.Loading
                url = "http://localhost:13627/api/repairorder/actionrequired"
                ,ro = RepairOrder ( { repairOrderNumber = 03456, customerName = "Fed-Ex" } ) (ActionRequiredRO (BranchName "a-c Branch Name MHC Olathe") "a-c KS-State")
                ,ranNumb = 5
                ,selectedROViewName = ActionRequiredROView
            }

initialInProcessModel : RODashboardViewModel
initialInProcessModel =
            { 
                --roList = RemoteData.Loading
                url = "http://localhost:13627/api/repairorder/getinprocess/370"
                ,ro = RepairOrder ({ repairOrderNumber = 67343, customerName = "Liberty Fruit Company" }) (InProcessRO (UnitNumber "in-process unit# 12345")(UnitVehicleIdNumber "in-process VIN# 12345"))
                ,ranNumb = 5
                ,selectedROViewName = InProcessROView
            }