module TypesAndConversions.CommonTypeConversionHelpers exposing (..)

import Models exposing (..)

customerName : BaseRO a-> String
customerName (BaseRO commonFields _) =
    commonFields.customerName