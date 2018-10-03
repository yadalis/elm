module Models exposing (..)
import TypesAndConversions.InProcessTypes exposing (..)
import TypesAndConversions.ActionRequiredTypes exposing (..)
--import RemoteData exposing (WebData)

type ActionRequiredRO =
     ActionRequiredRO BranchName String

type InProcessRO = 
     InProcessRO UnitNumber

type alias CommonROFields =
    {
        repairOrderNumber : Int
       ,customerName : String    
    }

type BaseRO a =
    BaseRO CommonROFields a