module ROFetchCommand exposing (..)

import Http exposing (..)
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (custom, hardcoded, required, decode)
import Models exposing (..)
import RemoteData
import Random
import TypesAndConversions.ActionRequiredTypes exposing (..)
import TypesAndConversions.InProcessTypes exposing (..)

fetchActionRequiredROs: String -> ROViewCategoryName -> Cmd Msg
fetchActionRequiredROs url selectedROViewName =
        Http.get url actionRequiredRODecoder
                    |> RemoteData.sendRequest
                    |> Cmd.map OnFetchActionRequiredROs
        -- case selectedROViewName of
        --     ActionRequiredROView ->
        --         Http.get url actionRequiredRODecoder
        --             |> RemoteData.sendRequest
        --             |> Cmd.map OnFetchROs
        --     InProcessROView ->
        --         Http.get url inProcessRODecoder
        --             |> RemoteData.sendRequest
        --             |> Cmd.map OnFetchROs

fetchInProcessROs: String -> ROViewCategoryName -> Cmd Msg
fetchInProcessROs url selectedROViewName =
        Http.get url inProcessRODecoder
                    |> RemoteData.sendRequest
                    |> Cmd.map OnFetchInProcessROs

commonFieldsDecoder : Decode.Decoder CommonROFields
commonFieldsDecoder =
    decode CommonROFields
            |> required "repairOrderNumber" Decode.int
            |> required "customerName" Decode.string

actionRequiredRODecoder : Decode.Decoder (BaseRO ActionRequiredRO)
actionRequiredRODecoder =
    decode BaseRO
            |> custom (commonFieldsDecoder)
            |> required "actionRequiredInternalROInfo" actionRequiredInternalROInfoDecoder
            -- case roType of
            --     ActionRequiredRO ->
            --         |> required "actionRequiredROInfo" actionRequiredRODecoder
            --     InProcessRO ->
            --         |> required "inProcessROInfo" inProcessRODecoder

actionRequiredInternalROInfoDecoder : Decode.Decoder ActionRequiredRO
actionRequiredInternalROInfoDecoder =
    decode ActionRequiredRO
            |> required "branchName" (Decode.map BranchName Decode.string)
            |> required "branchLocation" Decode.string

inProcessRODecoder : Decode.Decoder (BaseRO InProcessRO)
inProcessRODecoder =
    decode BaseRO
            |> custom (commonFieldsDecoder)
            |> required "inProcessInternalROInfo" inProcessInternalROInfoDecoder

inProcessInternalROInfoDecoder : Decode.Decoder InProcessRO
inProcessInternalROInfoDecoder =
    decode InProcessRO
            |> required "unitNumber" (Decode.map UnitNumber Decode.string)
            |> required "unitVehicleIdNumber" (Decode.map UnitVehicleIdNumber Decode.string)

-- fetchROs: String -> Cmd Msg
-- fetchROs url =
--         Http.get url roDecoder
--             |> RemoteData.sendRequest
--             |> Cmd.map OnFetchROs
         
-- roDecoder :  Decode.Decoder (BaseRO ActionRequiredRO)
-- roDecoder  =
--     decode BaseRO
--             |> custom (commonFieldsDecoder)
--             |> required "actionRequiredROInfo" actionRequiredRODecoder

-- commonFieldsDecoder : Decode.Decoder CommonROFields
-- commonFieldsDecoder =
--     decode CommonROFields
--             |> required "repairOrderNumber" Decode.int
--             |> required "customerName" Decode.string

-- actionRequiredRODecoder : Decode.Decoder ActionRequiredRO
-- actionRequiredRODecoder =
--     decode ActionRequiredRO
--             |> required "branchName" (Decode.map BranchName Decode.string)
--             |> required "branchLocation" Decode.string