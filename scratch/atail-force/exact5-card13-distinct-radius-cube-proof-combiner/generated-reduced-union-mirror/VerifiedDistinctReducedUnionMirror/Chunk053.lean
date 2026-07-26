import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk053Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1058, bvar 1067, bvar 57, bvar 66]),
    bnot (bands [bvar 44, bvar 46, bvar 1071, bvar 1073]),
    bnot (bands [bvar 1055, bvar 1059, bvar 67, bvar 71]),
    bnot (bands [bvar 1055, bvar 1061, bvar 67, bvar 73]),
    bnot (bands [bvar 1055, bvar 1062, bvar 67, bvar 74]),
    bnot (bands [bvar 1055, bvar 1063, bvar 67, bvar 75]),
    bnot (bands [bvar 1055, bvar 1064, bvar 67, bvar 76]),
    bnot (bands [bvar 1055, bvar 1065, bvar 67, bvar 77]),
    bnot (bands [bvar 1055, bvar 1066, bvar 67, bvar 78]),
    bnot (bands [bvar 1055, bvar 1067, bvar 67, bvar 79]),
    bnot (bands [bvar 1059, bvar 1060, bvar 71, bvar 72]),
    bnot (bands [bvar 1059, bvar 1061, bvar 71, bvar 73]),
    bnot (bands [bvar 1059, bvar 1062, bvar 71, bvar 74]),
    bnot (bands [bvar 1059, bvar 1063, bvar 71, bvar 75]),
    bnot (bands [bvar 1059, bvar 1064, bvar 71, bvar 76]),
    bnot (bands [bvar 1059, bvar 1065, bvar 71, bvar 77]),
    bnot (bands [bvar 1059, bvar 1066, bvar 71, bvar 78]),
    bnot (bands [bvar 1059, bvar 1067, bvar 71, bvar 79]),
    bnot (bands [bvar 1060, bvar 1063, bvar 72, bvar 75]),
    bnot (bands [bvar 1060, bvar 1066, bvar 72, bvar 78]),
    bnot (bands [bvar 1061, bvar 1063, bvar 73, bvar 75]),
    bnot (bands [bvar 1061, bvar 1064, bvar 73, bvar 76]),
    bnot (bands [bvar 1061, bvar 1067, bvar 73, bvar 79]),
    bnot (bands [bvar 1062, bvar 1063, bvar 74, bvar 75]),
    bnot (bands [bvar 1062, bvar 1065, bvar 74, bvar 77]),
    bnot (bands [bvar 1062, bvar 1067, bvar 74, bvar 79]),
    bnot (bands [bvar 1063, bvar 1065, bvar 75, bvar 77]),
    bnot (bands [bvar 1064, bvar 1065, bvar 76, bvar 77]),
    bnot (bands [bvar 1065, bvar 1066, bvar 77, bvar 78]),
    bnot (bands [bvar 1065, bvar 1067, bvar 77, bvar 79]),
    bnot (bands [bvar 1055, bvar 1062, bvar 93, bvar 100]),
    bnot (bands [bvar 1055, bvar 1063, bvar 93, bvar 101]),
    bnot (bands [bvar 1055, bvar 1065, bvar 93, bvar 103]),
    bnot (bands [bvar 1055, bvar 1066, bvar 93, bvar 104]),
    bnot (bands [bvar 1062, bvar 1063, bvar 100, bvar 101]),
    bnot (bands [bvar 1062, bvar 1065, bvar 100, bvar 103]),
    bnot (bands [bvar 1062, bvar 1066, bvar 100, bvar 104]),
    bnot (bands [bvar 1063, bvar 1065, bvar 101, bvar 103]),
    bnot (bands [bvar 1063, bvar 1066, bvar 101, bvar 104]),
    bnot (bands [bvar 1063, bvar 1067, bvar 101, bvar 105]),
    bnot (bands [bvar 1064, bvar 1065, bvar 102, bvar 103]),
    bnot (bands [bvar 1065, bvar 1066, bvar 103, bvar 104]),
    bnot (bands [bvar 1055, bvar 1065, bvar 132, bvar 142]),
    bnot (bands [bvar 1055, bvar 1066, bvar 132, bvar 143]),
    bnot (bands [bvar 1055, bvar 1067, bvar 132, bvar 144]),
    bnot (bands [bvar 1058, bvar 1059, bvar 135, bvar 136]),
    bnot (bands [bvar 1058, bvar 1060, bvar 135, bvar 137]),
    bnot (bands [bvar 1058, bvar 1061, bvar 135, bvar 138]),
    bnot (bands [bvar 1058, bvar 1062, bvar 135, bvar 139]),
    bnot (bands [bvar 1059, bvar 1063, bvar 149, bvar 153]),
    bnot (bands [bvar 1061, bvar 1063, bvar 151, bvar 153]),
    bnot (bands [bvar 1062, bvar 1063, bvar 152, bvar 153]),
    bnot (bands [bvar 43, bvar 47, bvar 1161, bvar 1165]),
    bnot (bands [bvar 44, bvar 45, bvar 1162, bvar 1163]),
    bnot (bands [bvar 44, bvar 47, bvar 1162, bvar 1165]),
    bnot (bands [bvar 45, bvar 46, bvar 1163, bvar 1164]),
    bnot (bands [bvar 45, bvar 47, bvar 1163, bvar 1165]),
    bnot (bands [bvar 45, bvar 48, bvar 1163, bvar 1166]),
    bnot (bands [bvar 45, bvar 49, bvar 1163, bvar 1167]),
    bnot (bands [bvar 46, bvar 47, bvar 1164, bvar 1165]),
    bnot (bands [bvar 47, bvar 49, bvar 1165, bvar 1167]),
    bnot (bands [bvar 48, bvar 49, bvar 1166, bvar 1167]),
    bnot (bands [bvar 1057, bvar 1065, bvar 173, bvar 181]),
    bnot (bands [bvar 1060, bvar 1061, bvar 176, bvar 177]) ]

def reducedUnionChunk053 : BVLogicalExpr :=
  bands reducedUnionChunk053Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
