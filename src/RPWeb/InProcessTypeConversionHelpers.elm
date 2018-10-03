module InProcessTypeConversionHelpers exposing (..)

import InProcessTypes exposing (..)
import Models exposing (..)

-- IN-PROCESS wrappers
unitNumberValue : UnitNumber -> String
unitNumberValue (UnitNumber unitNumber) =
        unitNumber

unitNumber : BaseRO InProcessRO -> UnitNumber
unitNumber (BaseRO _ (InProcessRO unitNumber) )  =
        unitNumber

customerName : BaseRO a-> String
customerName (BaseRO commonFields _) =
    commonFields.customerName