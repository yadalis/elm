module TypesAndConversions.InProcessTypeConversionHelpers exposing (..)

import TypesAndConversions.InProcessTypes exposing (..)
import Models exposing (..)

-- IN-PROCESS wrappers
unWrapUnitNumberValue : UnitNumber -> String
unWrapUnitNumberValue (UnitNumber unitNumberValue) =
        unitNumberValue

unWrapUnitNumber : BaseRO InProcessRO -> UnitNumber
unWrapUnitNumber (BaseRO _ (InProcessRO unitNumber _) )  =
        unitNumber

unWrapUnitVehicleIdNumberValue : UnitVehicleIdNumber -> String
unWrapUnitVehicleIdNumberValue (UnitVehicleIdNumber unitVehicleIdNumberValue) =
        unitVehicleIdNumberValue

unWrapUnitVehicleIdNumber : BaseRO InProcessRO -> UnitVehicleIdNumber
unWrapUnitVehicleIdNumber (BaseRO _ (InProcessRO _ unitVehicleIdNumber) )  =
        unitVehicleIdNumber