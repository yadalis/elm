module RPWeb.Msgs exposing (..)

import RPWeb.Models as RPWebModels
import RemoteData exposing (WebData)

type Msg
    = OnFetchInProcessROs (WebData (List RPWebModels.InProcessRO))
        | Refresh Int
        | Roll 