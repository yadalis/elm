module RPWeb.Models exposing (..)

import RemoteData exposing (WebData)

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

type alias Technician =
    { 
          text : String
        , value : String
    }
    

type alias Model =
    { 
        inProcessROs : WebData ( List InProcessRO )
        ,ranNumb: Int
    }

initialModel : Model
initialModel =
    { 
        inProcessROs = RemoteData.Loading
        ,ranNumb = 4
    }
