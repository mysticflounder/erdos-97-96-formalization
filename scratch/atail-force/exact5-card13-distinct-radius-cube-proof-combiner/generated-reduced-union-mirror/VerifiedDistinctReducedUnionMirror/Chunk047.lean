import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk047Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 39, bvar 40, bvar 1066, bvar 1067]),
    bnot (bands [bvar 1045, bvar 1047, bvar 57, bvar 59]),
    bnot (bands [bvar 1045, bvar 1048, bvar 57, bvar 60]),
    bnot (bands [bvar 1045, bvar 1049, bvar 57, bvar 61]),
    bnot (bands [bvar 1045, bvar 1054, bvar 57, bvar 66]),
    bnot (bands [bvar 31, bvar 33, bvar 1071, bvar 1073]),
    bnot (bands [bvar 1046, bvar 1047, bvar 71, bvar 72]),
    bnot (bands [bvar 1046, bvar 1048, bvar 71, bvar 73]),
    bnot (bands [bvar 1046, bvar 1049, bvar 71, bvar 74]),
    bnot (bands [bvar 1046, bvar 1050, bvar 71, bvar 75]),
    bnot (bands [bvar 1046, bvar 1051, bvar 71, bvar 76]),
    bnot (bands [bvar 1046, bvar 1052, bvar 71, bvar 77]),
    bnot (bands [bvar 1046, bvar 1053, bvar 71, bvar 78]),
    bnot (bands [bvar 1046, bvar 1054, bvar 71, bvar 79]),
    bnot (bands [bvar 1047, bvar 1048, bvar 72, bvar 73]),
    bnot (bands [bvar 1047, bvar 1049, bvar 72, bvar 74]),
    bnot (bands [bvar 1047, bvar 1050, bvar 72, bvar 75]),
    bnot (bands [bvar 1047, bvar 1051, bvar 72, bvar 76]),
    bnot (bands [bvar 1047, bvar 1052, bvar 72, bvar 77]),
    bnot (bands [bvar 1047, bvar 1054, bvar 72, bvar 79]),
    bnot (bands [bvar 1048, bvar 1049, bvar 73, bvar 74]),
    bnot (bands [bvar 1048, bvar 1051, bvar 73, bvar 76]),
    bnot (bands [bvar 1048, bvar 1052, bvar 73, bvar 77]),
    bnot (bands [bvar 1048, bvar 1053, bvar 73, bvar 78]),
    bnot (bands [bvar 1048, bvar 1054, bvar 73, bvar 79]),
    bnot (bands [bvar 1049, bvar 1050, bvar 74, bvar 75]),
    bnot (bands [bvar 1049, bvar 1051, bvar 74, bvar 76]),
    bnot (bands [bvar 1049, bvar 1052, bvar 74, bvar 77]),
    bnot (bands [bvar 1049, bvar 1053, bvar 74, bvar 78]),
    bnot (bands [bvar 1049, bvar 1054, bvar 74, bvar 79]),
    bnot (bands [bvar 32, bvar 33, bvar 1085, bvar 1086]),
    bnot (bands [bvar 32, bvar 34, bvar 1085, bvar 1087]),
    bnot (bands [bvar 32, bvar 35, bvar 1085, bvar 1088]),
    bnot (bands [bvar 32, bvar 36, bvar 1085, bvar 1089]),
    bnot (bands [bvar 32, bvar 37, bvar 1085, bvar 1090]),
    bnot (bands [bvar 32, bvar 38, bvar 1085, bvar 1091]),
    bnot (bands [bvar 32, bvar 39, bvar 1085, bvar 1092]),
    bnot (bands [bvar 32, bvar 40, bvar 1085, bvar 1093]),
    bnot (bands [bvar 33, bvar 34, bvar 1086, bvar 1087]),
    bnot (bands [bvar 33, bvar 35, bvar 1086, bvar 1088]),
    bnot (bands [bvar 33, bvar 36, bvar 1086, bvar 1089]),
    bnot (bands [bvar 33, bvar 37, bvar 1086, bvar 1090]),
    bnot (bands [bvar 33, bvar 38, bvar 1086, bvar 1091]),
    bnot (bands [bvar 33, bvar 39, bvar 1086, bvar 1092]),
    bnot (bands [bvar 33, bvar 40, bvar 1086, bvar 1093]),
    bnot (bands [bvar 34, bvar 35, bvar 1087, bvar 1088]),
    bnot (bands [bvar 34, bvar 36, bvar 1087, bvar 1089]),
    bnot (bands [bvar 34, bvar 37, bvar 1087, bvar 1090]),
    bnot (bands [bvar 34, bvar 38, bvar 1087, bvar 1091]),
    bnot (bands [bvar 34, bvar 39, bvar 1087, bvar 1092]),
    bnot (bands [bvar 34, bvar 40, bvar 1087, bvar 1093]),
    bnot (bands [bvar 35, bvar 36, bvar 1088, bvar 1089]),
    bnot (bands [bvar 35, bvar 37, bvar 1088, bvar 1090]),
    bnot (bands [bvar 35, bvar 38, bvar 1088, bvar 1091]),
    bnot (bands [bvar 35, bvar 39, bvar 1088, bvar 1092]),
    bnot (bands [bvar 35, bvar 40, bvar 1088, bvar 1093]),
    bnot (bands [bvar 36, bvar 37, bvar 1089, bvar 1090]),
    bnot (bands [bvar 36, bvar 38, bvar 1089, bvar 1091]),
    bnot (bands [bvar 37, bvar 38, bvar 1090, bvar 1091]),
    bnot (bands [bvar 33, bvar 34, bvar 1099, bvar 1100]),
    bnot (bands [bvar 33, bvar 35, bvar 1099, bvar 1101]),
    bnot (bands [bvar 33, bvar 36, bvar 1099, bvar 1102]),
    bnot (bands [bvar 33, bvar 37, bvar 1099, bvar 1103]),
    bnot (bands [bvar 33, bvar 38, bvar 1099, bvar 1104]) ]

def reducedUnionChunk047 : BVLogicalExpr :=
  bands reducedUnionChunk047Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
