module RPWeb.Msgs exposing (..)

import RPWeb.Models as RPWebModels
import RemoteData exposing (WebData)
import RPWeb.RollMsgs  exposing (RollMsg)

type Msg
    = 
        OnFetchActionRequiredROs (WebData (List RPWebModels.InProcessRO))
    |   OnFetchInProcessROs (WebData (List RPWebModels.InProcessRO))
    |   Refresh Int
    |   Roll RollMsg

