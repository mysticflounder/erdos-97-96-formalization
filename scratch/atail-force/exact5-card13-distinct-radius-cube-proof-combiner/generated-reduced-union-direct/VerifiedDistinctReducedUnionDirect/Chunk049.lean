import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk049Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1048, bvar 1053, bvar 73, bvar 78]),
    bnot (bands [bvar 1048, bvar 1054, bvar 73, bvar 79]),
    bnot (bands [bvar 1049, bvar 1050, bvar 74, bvar 75]),
    bnot (bands [bvar 1049, bvar 1051, bvar 74, bvar 76]),
    bnot (bands [bvar 1049, bvar 1053, bvar 74, bvar 78]),
    bnot (bands [bvar 1049, bvar 1054, bvar 74, bvar 79]),
    bnot (bands [bvar 1050, bvar 1053, bvar 75, bvar 78]),
    bnot (bands [bvar 1050, bvar 1054, bvar 75, bvar 79]),
    bnot (bands [bvar 32, bvar 33, bvar 1085, bvar 1086]),
    bnot (bands [bvar 32, bvar 34, bvar 1085, bvar 1087]),
    bnot (bands [bvar 32, bvar 35, bvar 1085, bvar 1088]),
    bnot (bands [bvar 32, bvar 36, bvar 1085, bvar 1089]),
    bnot (bands [bvar 33, bvar 34, bvar 1086, bvar 1087]),
    bnot (bands [bvar 33, bvar 35, bvar 1086, bvar 1088]),
    bnot (bands [bvar 33, bvar 36, bvar 1086, bvar 1089]),
    bnot (bands [bvar 33, bvar 37, bvar 1086, bvar 1090]),
    bnot (bands [bvar 33, bvar 38, bvar 1086, bvar 1091]),
    bnot (bands [bvar 33, bvar 39, bvar 1086, bvar 1092]),
    bnot (bands [bvar 34, bvar 35, bvar 1087, bvar 1088]),
    bnot (bands [bvar 34, bvar 36, bvar 1087, bvar 1089]),
    bnot (bands [bvar 34, bvar 39, bvar 1087, bvar 1092]),
    bnot (bands [bvar 35, bvar 36, bvar 1088, bvar 1089]),
    bnot (bands [bvar 35, bvar 37, bvar 1088, bvar 1090]),
    bnot (bands [bvar 35, bvar 38, bvar 1088, bvar 1091]),
    bnot (bands [bvar 35, bvar 39, bvar 1088, bvar 1092]),
    bnot (bands [bvar 1047, bvar 1049, bvar 85, bvar 87]),
    bnot (bands [bvar 1047, bvar 1051, bvar 85, bvar 89]),
    bnot (bands [bvar 1047, bvar 1052, bvar 85, bvar 90]),
    bnot (bands [bvar 1047, bvar 1053, bvar 85, bvar 91]),
    bnot (bands [bvar 1048, bvar 1049, bvar 86, bvar 87]),
    bnot (bands [bvar 1048, bvar 1051, bvar 86, bvar 89]),
    bnot (bands [bvar 1048, bvar 1054, bvar 86, bvar 92]),
    bnot (bands [bvar 1049, bvar 1051, bvar 87, bvar 89]),
    bnot (bands [bvar 1049, bvar 1052, bvar 87, bvar 90]),
    bnot (bands [bvar 1049, bvar 1053, bvar 87, bvar 91]),
    bnot (bands [bvar 33, bvar 34, bvar 1099, bvar 1100]),
    bnot (bands [bvar 33, bvar 35, bvar 1099, bvar 1101]),
    bnot (bands [bvar 33, bvar 36, bvar 1099, bvar 1102]),
    bnot (bands [bvar 33, bvar 37, bvar 1099, bvar 1103]),
    bnot (bands [bvar 33, bvar 38, bvar 1099, bvar 1104]),
    bnot (bands [bvar 33, bvar 39, bvar 1099, bvar 1105]),
    bnot (bands [bvar 33, bvar 40, bvar 1099, bvar 1106]),
    bnot (bands [bvar 34, bvar 35, bvar 1100, bvar 1101]),
    bnot (bands [bvar 34, bvar 36, bvar 1100, bvar 1102]),
    bnot (bands [bvar 34, bvar 37, bvar 1100, bvar 1103]),
    bnot (bands [bvar 34, bvar 38, bvar 1100, bvar 1104]),
    bnot (bands [bvar 34, bvar 39, bvar 1100, bvar 1105]),
    bnot (bands [bvar 34, bvar 40, bvar 1100, bvar 1106]),
    bnot (bands [bvar 35, bvar 36, bvar 1101, bvar 1102]),
    bnot (bands [bvar 35, bvar 37, bvar 1101, bvar 1103]),
    bnot (bands [bvar 35, bvar 38, bvar 1101, bvar 1104]),
    bnot (bands [bvar 35, bvar 39, bvar 1101, bvar 1105]),
    bnot (bands [bvar 35, bvar 40, bvar 1101, bvar 1106]),
    bnot (bands [bvar 36, bvar 38, bvar 1102, bvar 1104]),
    bnot (bands [bvar 36, bvar 40, bvar 1102, bvar 1106]),
    bnot (bands [bvar 37, bvar 38, bvar 1103, bvar 1104]),
    bnot (bands [bvar 37, bvar 39, bvar 1103, bvar 1105]),
    bnot (bands [bvar 37, bvar 40, bvar 1103, bvar 1106]),
    bnot (bands [bvar 38, bvar 39, bvar 1104, bvar 1105]),
    bnot (bands [bvar 38, bvar 40, bvar 1104, bvar 1106]),
    bnot (bands [bvar 39, bvar 40, bvar 1105, bvar 1106]),
    atMost [bands [bvar 1042, bvar 93], bands [bvar 1043, bvar 94], bands [bvar 1044, bvar 95], bands [bvar 1045, bvar 96], bands [bvar 1046, bvar 97], bands [bvar 1047, bvar 98], bands [bvar 1048, bvar 99], bands [bvar 1049, bvar 100], bands [bvar 1050, bvar 101], bands [bvar 1051, bvar 102], bands [bvar 1052, bvar 103], bands [bvar 1053, bvar 104], bands [bvar 1054, bvar 105]] 2,
    bnot (bands [bvar 1043, bvar 1046, bvar 94, bvar 97]),
    bnot (bands [bvar 1045, bvar 1046, bvar 96, bvar 97]) ]

def reducedUnionChunk049 : BVLogicalExpr :=
  bands reducedUnionChunk049Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
