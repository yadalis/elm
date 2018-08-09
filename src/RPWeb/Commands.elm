module RPWeb.Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import RPWeb.Msgs as RPWebMessages
import RPWeb.Models as RPWebModels
import RemoteData

fetchInProcessROs: Cmd RPWebMessages.Msg
fetchInProcessROs =
    Http.get fetchInProcessROsUrl fetchInProcessROsDecoder
        |> RemoteData.sendRequest
        |> Cmd.map RPWebMessages.OnFetchInProcessROs

fetchInProcessROsUrl: String
fetchInProcessROsUrl =
    --"http://localhost:13627/api/repairorder/getinprocess/75"
    "http://localhost:5000/ros"

fetchInProcessROsDecoder: Decode.Decoder (List RPWebModels.InProcessRO)
fetchInProcessROsDecoder = 
    Decode.list inProcessROsDecoder
          
inProcessROsDecoder :  Decode.Decoder RPWebModels.InProcessRO
inProcessROsDecoder  =
    decode RPWebModels.InProcessRO  
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