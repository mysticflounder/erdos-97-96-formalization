import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk048Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 33, bvar 39, bvar 1099, bvar 1105]),
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
    bnot (bands [bvar 36, bvar 37, bvar 1102, bvar 1103]),
    bnot (bands [bvar 36, bvar 39, bvar 1102, bvar 1105]),
    bnot (bands [bvar 36, bvar 40, bvar 1102, bvar 1106]),
    bnot (bands [bvar 37, bvar 38, bvar 1103, bvar 1104]),
    bnot (bands [bvar 37, bvar 39, bvar 1103, bvar 1105]),
    bnot (bands [bvar 37, bvar 40, bvar 1103, bvar 1106]),
    bnot (bands [bvar 38, bvar 39, bvar 1104, bvar 1105]),
    bnot (bands [bvar 38, bvar 40, bvar 1104, bvar 1106]),
    bnot (bands [bvar 39, bvar 40, bvar 1105, bvar 1106]),
    bnot (bands [bvar 1043, bvar 1046, bvar 94, bvar 97]),
    bnot (bands [bvar 1048, bvar 1049, bvar 99, bvar 100]),
    bnot (bands [bvar 1048, bvar 1050, bvar 99, bvar 101]),
    bnot (bands [bvar 1048, bvar 1051, bvar 99, bvar 102]),
    bnot (bands [bvar 1048, bvar 1052, bvar 99, bvar 103]),
    bnot (bands [bvar 1048, bvar 1053, bvar 99, bvar 104]),
    bnot (bands [bvar 1048, bvar 1054, bvar 99, bvar 105]),
    bnot (bands [bvar 1049, bvar 1050, bvar 100, bvar 101]),
    bnot (bands [bvar 1049, bvar 1051, bvar 100, bvar 102]),
    bnot (bands [bvar 1049, bvar 1052, bvar 100, bvar 103]),
    bnot (bands [bvar 1049, bvar 1053, bvar 100, bvar 104]),
    bnot (bands [bvar 1049, bvar 1054, bvar 100, bvar 105]),
    bnot (bands [bvar 1050, bvar 1051, bvar 101, bvar 102]),
    bnot (bands [bvar 1050, bvar 1053, bvar 101, bvar 104]),
    bnot (bands [bvar 1050, bvar 1054, bvar 101, bvar 105]),
    bnot (bands [bvar 1051, bvar 1053, bvar 102, bvar 104]),
    bnot (bands [bvar 1051, bvar 1054, bvar 102, bvar 105]),
    bnot (bands [bvar 1052, bvar 1054, bvar 103, bvar 105]),
    bnot (bands [bvar 1053, bvar 1054, bvar 104, bvar 105]),
    bnot (bands [bvar 34, bvar 35, bvar 1113, bvar 1114]),
    bnot (bands [bvar 34, bvar 36, bvar 1113, bvar 1115]),
    bnot (bands [bvar 34, bvar 38, bvar 1113, bvar 1117]),
    bnot (bands [bvar 34, bvar 39, bvar 1113, bvar 1118]),
    bnot (bands [bvar 34, bvar 40, bvar 1113, bvar 1119]),
    bnot (bands [bvar 35, bvar 36, bvar 1114, bvar 1115]),
    bnot (bands [bvar 35, bvar 37, bvar 1114, bvar 1116]),
    bnot (bands [bvar 35, bvar 38, bvar 1114, bvar 1117]),
    bnot (bands [bvar 35, bvar 39, bvar 1114, bvar 1118]),
    bnot (bands [bvar 35, bvar 40, bvar 1114, bvar 1119]),
    bnot (bands [bvar 39, bvar 40, bvar 1118, bvar 1119]),
    bnot (bands [bvar 1043, bvar 1047, bvar 107, bvar 111]),
    bnot (bands [bvar 1044, bvar 1047, bvar 108, bvar 111]),
    bnot (bands [bvar 1045, bvar 1047, bvar 109, bvar 111]),
    bnot (bands [bvar 1049, bvar 1050, bvar 113, bvar 114]),
    bnot (bands [bvar 1049, bvar 1051, bvar 113, bvar 115]),
    bnot (bands [bvar 1049, bvar 1052, bvar 113, bvar 116]),
    bnot (bands [bvar 1049, bvar 1053, bvar 113, bvar 117]),
    bnot (bands [bvar 1049, bvar 1054, bvar 113, bvar 118]),
    bnot (bands [bvar 1051, bvar 1052, bvar 115, bvar 116]),
    bnot (bands [bvar 1052, bvar 1053, bvar 116, bvar 117]),
    atMost [bands [bvar 28, bvar 1120], bands [bvar 29, bvar 1121], bands [bvar 30, bvar 1122], bands [bvar 31, bvar 1123], bands [bvar 32, bvar 1124], bands [bvar 33, bvar 1125], bands [bvar 34, bvar 1126], bands [bvar 35, bvar 1127], bands [bvar 36, bvar 1128], bands [bvar 37, bvar 1129], bands [bvar 38, bvar 1130], bands [bvar 39, bvar 1131], bands [bvar 40, bvar 1132]] 2,
    bnot (bands [bvar 29, bvar 33, bvar 1121, bvar 1125]) ]

def reducedUnionChunk048 : BVLogicalExpr :=
  bands reducedUnionChunk048Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
