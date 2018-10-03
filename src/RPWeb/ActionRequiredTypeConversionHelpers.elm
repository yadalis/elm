module ActionRequiredTypeConversionHelpers exposing (..)

import Models exposing (..)

-- ACTION-REQUIRED wrappers
unWrapUnitNumberValue : BaseRO ActionRequiredRO-> String
unWrapUnitNumberValue (BaseRO _ (ActionRequiredRO un _) ) =
        un

unWrapVinValue : BaseRO ActionRequiredRO-> String
unWrapVinValue (BaseRO _ (ActionRequiredRO _ vin) ) =
        vin