module TypesAndConversions.InProcessTypeConversionHelpers exposing (..)

import TypesAndConversions.InProcessTypes exposing (..)
import Models exposing (..)

-- IN-PROCESS wrappers
unWrapUnitNumberValue : UnitNumber -> String
unWrapUnitNumberValue (UnitNumber unitNumberValue) =
        unitNumberValue

unWrapUnitNumber : BaseRO InProcessRO -> UnitNumber
unWrapUnitNumber (BaseRO _ (InProcessRO unitNumber) )  =
        unitNumber