module TypesAndConversions.ActionRequiredTypeConversionHelpers exposing (..)
import TypesAndConversions.ActionRequiredTypes exposing (..)

import Models exposing (..)

unWrapBranchNameValue : BranchName -> String
unWrapBranchNameValue (BranchName branchNameValue) =
        branchNameValue

unWrapBranchName : BaseRO ActionRequiredRO -> BranchName
unWrapBranchName (BaseRO _ (ActionRequiredRO branchName _) )  =
        branchName

unWrapVinValue : BaseRO ActionRequiredRO-> String
unWrapVinValue (BaseRO _ (ActionRequiredRO _ vin) ) =
        vin

-- ACTION-REQUIRED wrappers - this works if we make first arg to ActionRequriedRO as String (BranchName)
-- unWrapBranchNameValue : BaseRO ActionRequiredRO-> String
-- unWrapBranchNameValue (BaseRO _ (ActionRequiredRO branchName _) ) =
--         branchName

