import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk054Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1060, bvar 1062, bvar 176, bvar 178]),
    bnot (bands [bvar 1062, bvar 1065, bvar 178, bvar 181]),
    bnot (bands [bvar 48, bvar 50, bvar 1192, bvar 1194]),
    bnot (bands [bvar 48, bvar 51, bvar 1192, bvar 1195]),
    bnot (bands [bvar 1057, bvar 1061, bvar 186, bvar 190]),
    bnot (bands [bvar 1058, bvar 1061, bvar 187, bvar 190]),
    bnot (bands [bvar 1058, bvar 1065, bvar 187, bvar 194]),
    bnot (bands [bvar 1061, bvar 1065, bvar 190, bvar 194]),
    bnot (bands [bvar 1061, bvar 1066, bvar 190, bvar 195]),
    bnot (bands [bvar 1069, bvar 1079, bvar 68, bvar 78]),
    bnot (bands [bvar 55, bvar 59, bvar 1082, bvar 1086]),
    bnot (bands [bvar 55, bvar 60, bvar 1082, bvar 1087]),
    bnot (bands [bvar 55, bvar 61, bvar 1082, bvar 1088]),
    bnot (bands [bvar 55, bvar 62, bvar 1082, bvar 1089]),
    bnot (bands [bvar 55, bvar 63, bvar 1082, bvar 1090]),
    bnot (bands [bvar 55, bvar 64, bvar 1082, bvar 1091]),
    bnot (bands [bvar 55, bvar 65, bvar 1082, bvar 1092]),
    bnot (bands [bvar 55, bvar 66, bvar 1082, bvar 1093]),
    bnot (bands [bvar 60, bvar 63, bvar 1087, bvar 1090]),
    bnot (bands [bvar 60, bvar 64, bvar 1087, bvar 1091]),
    bnot (bands [bvar 60, bvar 66, bvar 1087, bvar 1093]),
    bnot (bands [bvar 61, bvar 63, bvar 1088, bvar 1090]),
    bnot (bands [bvar 61, bvar 65, bvar 1088, bvar 1092]),
    bnot (bands [bvar 62, bvar 65, bvar 1089, bvar 1092]),
    bnot (bands [bvar 55, bvar 59, bvar 1095, bvar 1099]),
    bnot (bands [bvar 55, bvar 60, bvar 1095, bvar 1100]),
    bnot (bands [bvar 55, bvar 61, bvar 1095, bvar 1101]),
    bnot (bands [bvar 55, bvar 62, bvar 1095, bvar 1102]),
    bnot (bands [bvar 55, bvar 63, bvar 1095, bvar 1103]),
    bnot (bands [bvar 55, bvar 64, bvar 1095, bvar 1104]),
    bnot (bands [bvar 55, bvar 65, bvar 1095, bvar 1105]),
    bnot (bands [bvar 55, bvar 66, bvar 1095, bvar 1106]),
    bnot (bands [bvar 59, bvar 60, bvar 1099, bvar 1100]),
    bnot (bands [bvar 59, bvar 62, bvar 1099, bvar 1102]),
    bnot (bands [bvar 59, bvar 64, bvar 1099, bvar 1104]),
    bnot (bands [bvar 59, bvar 65, bvar 1099, bvar 1105]),
    bnot (bands [bvar 59, bvar 66, bvar 1099, bvar 1106]),
    bnot (bands [bvar 60, bvar 61, bvar 1100, bvar 1101]),
    bnot (bands [bvar 60, bvar 62, bvar 1100, bvar 1102]),
    bnot (bands [bvar 60, bvar 63, bvar 1100, bvar 1103]),
    bnot (bands [bvar 60, bvar 64, bvar 1100, bvar 1104]),
    bnot (bands [bvar 60, bvar 65, bvar 1100, bvar 1105]),
    bnot (bands [bvar 60, bvar 66, bvar 1100, bvar 1106]),
    bnot (bands [bvar 61, bvar 62, bvar 1101, bvar 1102]),
    bnot (bands [bvar 61, bvar 63, bvar 1101, bvar 1103]),
    bnot (bands [bvar 61, bvar 64, bvar 1101, bvar 1104]),
    bnot (bands [bvar 61, bvar 65, bvar 1101, bvar 1105]),
    bnot (bands [bvar 61, bvar 66, bvar 1101, bvar 1106]),
    bnot (bands [bvar 62, bvar 63, bvar 1102, bvar 1103]),
    bnot (bands [bvar 62, bvar 64, bvar 1102, bvar 1104]),
    bnot (bands [bvar 62, bvar 65, bvar 1102, bvar 1105]),
    bnot (bands [bvar 62, bvar 66, bvar 1102, bvar 1106]),
    bnot (bands [bvar 63, bvar 64, bvar 1103, bvar 1104]),
    bnot (bands [bvar 63, bvar 65, bvar 1103, bvar 1105]),
    bnot (bands [bvar 63, bvar 66, bvar 1103, bvar 1106]),
    bnot (bands [bvar 64, bvar 65, bvar 1104, bvar 1105]),
    bnot (bands [bvar 64, bvar 66, bvar 1104, bvar 1106]),
    bnot (bands [bvar 65, bvar 66, bvar 1105, bvar 1106]),
    bnot (bands [bvar 55, bvar 60, bvar 1108, bvar 1113]),
    bnot (bands [bvar 55, bvar 61, bvar 1108, bvar 1114]),
    bnot (bands [bvar 55, bvar 62, bvar 1108, bvar 1115]),
    bnot (bands [bvar 55, bvar 63, bvar 1108, bvar 1116]),
    bnot (bands [bvar 55, bvar 64, bvar 1108, bvar 1117]),
    bnot (bands [bvar 55, bvar 65, bvar 1108, bvar 1118]) ]

def reducedUnionChunk054 : BVLogicalExpr :=
  bands reducedUnionChunk054Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
