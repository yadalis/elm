module RPWeb.Update exposing (..)

import RPWeb.Msgs as RPWebMessages
import RPWeb.Models as RPWebModels
import RPWeb.Commands as RPWebCommands
import Random

update : RPWebMessages.Msg -> RPWebModels.Model -> ( RPWebModels.Model, Cmd RPWebMessages.Msg  )
update msg model =
    case msg of
        RPWebMessages.OnFetchInProcessROs response ->
            ( { model | inProcessROs = response }, Cmd.none )
        RPWebMessages.Roll ->
             (model, Random.generate RPWebMessages.Refresh (Random.int 1 6))
        RPWebMessages.Refresh rn ->
            ( { model | ranNumb = rn } , RPWebCommands.fetchInProcessROs )