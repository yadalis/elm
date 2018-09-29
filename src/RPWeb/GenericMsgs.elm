module RPWeb.GenericMsgs exposing (..)

--import RPWeb.Models as RPWebModels
import RemoteData exposing (WebData)
--import RPWeb.RollMsgs  exposing (RollMsg)

type Msg a
    = 
        OnFetchROs (WebData (List a))
    |   Refresh Int
    --|   Roll RollMsg

