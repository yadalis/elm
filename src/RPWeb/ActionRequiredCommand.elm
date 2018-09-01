module RPWeb.ActionRequiredCommand exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import RPWeb.Msgs as RPWebMessages
import RPWeb.Models as RPWebModels
import RemoteData
import Random

startRandomActionRequiredROsFetch: Cmd RPWebMessages.Msg
startRandomActionRequiredROsFetch =
        Random.generate RPWebMessages.Refresh (Random.int 1 4)

fetchActionRequiredROs: Cmd RPWebMessages.Msg
fetchActionRequiredROs =
    Http.get fetchhActionRequiredUrl fetchhActionRequiredDecoder
        |> RemoteData.sendRequest
        |> Cmd.map RPWebMessages.OnFetchActionRequiredROs

fetchhActionRequiredUrl: String
fetchhActionRequiredUrl =
    --"http://localhost:13627/api/repairorder/getinprocess/75"
    --"http://localhost:5000/ros"
    "https://testfuncappsuresh.azurewebsites.net/api/loadInProcessROs?code=kCigay9kCfy2nr0ui7yzI0jDinaC0TiBmBTcBEawoPzPxyNMCbTsug=="

fetchhActionRequiredDecoder: Decode.Decoder (List RPWebModels.ActionRequiredRO)
fetchhActionRequiredDecoder = 
    Decode.list actionRequiredDecoder
          
actionRequiredDecoder :  Decode.Decoder RPWebModels.ActionRequiredRO
actionRequiredDecoder  =
    decode RPWebModels.ActionRequiredRO  
        |> required "repairOrderNumber" Decode.int
        |> required "aggregateRootId" Decode.string
        |> required "customerNumber" Decode.int
        |> required "customerName" Decode.string
        |> required "branchNumber" Decode.int
        |> required "branchDepartmentNumber" Decode.int
        |> required "bay" (Decode.nullable Decode.string)
        |> required "dashboardPriority" Decode.int
        |> required "priority" Decode.int
        |> required "unitNumber" Decode.string
        |> required "unitVehicleIdNumber" Decode.string
        |> required "internalStatus" Decode.string
        |> required "technicians" (Decode.list techniciansDecoder)
        |> required "driverWaiting" Decode.bool
        |> required "isPortalUser" Decode.int
        |> required "timeZoneDisplay" Decode.string
        |> required "estimatedWorkFinish" (Decode.nullable Decode.string)

techniciansDecoder :  Decode.Decoder RPWebModels.Technician
techniciansDecoder  =
    decode RPWebModels.Technician  
        |> required "text" Decode.string
        |> required "value" Decode.string