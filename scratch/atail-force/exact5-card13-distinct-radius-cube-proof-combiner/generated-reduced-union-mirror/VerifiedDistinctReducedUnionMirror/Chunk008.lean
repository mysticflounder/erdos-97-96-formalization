import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk008Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1083, bvar 1092, bvar 1096, bvar 1105]),
    bnot (bands [bvar 1083, bvar 1093, bvar 1096, bvar 1106]),
    bnot (bands [bvar 1086, bvar 1088, bvar 1099, bvar 1101]),
    bnot (bands [bvar 1086, bvar 1089, bvar 1099, bvar 1102]),
    bnot (bands [bvar 1086, bvar 1090, bvar 1099, bvar 1103]),
    bnot (bands [bvar 1086, bvar 1091, bvar 1099, bvar 1104]),
    bnot (bands [bvar 1086, bvar 1092, bvar 1099, bvar 1105]),
    bnot (bands [bvar 1086, bvar 1093, bvar 1099, bvar 1106]),
    bnot (bands [bvar 1087, bvar 1091, bvar 1100, bvar 1104]),
    bnot (bands [bvar 1087, bvar 1092, bvar 1100, bvar 1105]),
    bnot (bands [bvar 1087, bvar 1093, bvar 1100, bvar 1106]),
    bnot (bands [bvar 1088, bvar 1089, bvar 1101, bvar 1102]),
    bnot (bands [bvar 1088, bvar 1090, bvar 1101, bvar 1103]),
    bnot (bands [bvar 1088, bvar 1091, bvar 1101, bvar 1104]),
    bnot (bands [bvar 1088, bvar 1092, bvar 1101, bvar 1105]),
    bnot (bands [bvar 1088, bvar 1093, bvar 1101, bvar 1106]),
    bnot (bands [bvar 1089, bvar 1090, bvar 1102, bvar 1103]),
    bnot (bands [bvar 1089, bvar 1091, bvar 1102, bvar 1104]),
    bnot (bands [bvar 1089, bvar 1092, bvar 1102, bvar 1105]),
    bnot (bands [bvar 1089, bvar 1093, bvar 1102, bvar 1106]),
    bnot (bands [bvar 1090, bvar 1091, bvar 1103, bvar 1104]),
    bnot (bands [bvar 1090, bvar 1092, bvar 1103, bvar 1105]),
    bnot (bands [bvar 1090, bvar 1093, bvar 1103, bvar 1106]),
    bnot (bands [bvar 1091, bvar 1092, bvar 1104, bvar 1105]),
    bnot (bands [bvar 1091, bvar 1093, bvar 1104, bvar 1106]),
    bnot (bands [bvar 1092, bvar 1093, bvar 1105, bvar 1106]),
    bnot (bands [bvar 1081, bvar 1088, bvar 1107, bvar 1114]),
    bnot (bands [bvar 1081, bvar 1089, bvar 1107, bvar 1115]),
    bnot (bands [bvar 1081, bvar 1090, bvar 1107, bvar 1116]),
    bnot (bands [bvar 1081, bvar 1091, bvar 1107, bvar 1117]),
    bnot (bands [bvar 1081, bvar 1092, bvar 1107, bvar 1118]),
    bnot (bands [bvar 1081, bvar 1093, bvar 1107, bvar 1119]),
    bnot (bands [bvar 1082, bvar 1087, bvar 1108, bvar 1113]),
    bnot (bands [bvar 1082, bvar 1088, bvar 1108, bvar 1114]),
    bnot (bands [bvar 1082, bvar 1089, bvar 1108, bvar 1115]),
    bnot (bands [bvar 1082, bvar 1090, bvar 1108, bvar 1116]),
    bnot (bands [bvar 1082, bvar 1091, bvar 1108, bvar 1117]),
    bnot (bands [bvar 1082, bvar 1092, bvar 1108, bvar 1118]),
    bnot (bands [bvar 1083, bvar 1088, bvar 1109, bvar 1114]),
    bnot (bands [bvar 1083, bvar 1090, bvar 1109, bvar 1116]),
    bnot (bands [bvar 1083, bvar 1091, bvar 1109, bvar 1117]),
    bnot (bands [bvar 1083, bvar 1092, bvar 1109, bvar 1118]),
    bnot (bands [bvar 1087, bvar 1088, bvar 1113, bvar 1114]),
    bnot (bands [bvar 1087, bvar 1089, bvar 1113, bvar 1115]),
    bnot (bands [bvar 1087, bvar 1090, bvar 1113, bvar 1116]),
    bnot (bands [bvar 1087, bvar 1091, bvar 1113, bvar 1117]),
    bnot (bands [bvar 1087, bvar 1092, bvar 1113, bvar 1118]),
    bnot (bands [bvar 1087, bvar 1093, bvar 1113, bvar 1119]),
    bnot (bands [bvar 1088, bvar 1089, bvar 1114, bvar 1115]),
    bnot (bands [bvar 1088, bvar 1090, bvar 1114, bvar 1116]),
    bnot (bands [bvar 1088, bvar 1091, bvar 1114, bvar 1117]),
    bnot (bands [bvar 1088, bvar 1092, bvar 1114, bvar 1118]),
    bnot (bands [bvar 1088, bvar 1093, bvar 1114, bvar 1119]),
    bnot (bands [bvar 1089, bvar 1090, bvar 1115, bvar 1116]),
    bnot (bands [bvar 1089, bvar 1091, bvar 1115, bvar 1117]),
    bnot (bands [bvar 1089, bvar 1092, bvar 1115, bvar 1118]),
    bnot (bands [bvar 1089, bvar 1093, bvar 1115, bvar 1119]),
    bnot (bands [bvar 1090, bvar 1091, bvar 1116, bvar 1117]),
    bnot (bands [bvar 1090, bvar 1092, bvar 1116, bvar 1118]),
    bnot (bands [bvar 1091, bvar 1092, bvar 1117, bvar 1118]),
    bnot (bands [bvar 1091, bvar 1093, bvar 1117, bvar 1119]),
    bnot (bands [bvar 1092, bvar 1093, bvar 1118, bvar 1119]),
    bnot (bands [bvar 1081, bvar 1083, bvar 1120, bvar 1122]),
    bnot (bands [bvar 1081, bvar 1088, bvar 1120, bvar 1127]) ]

def reducedUnionChunk008 : BVLogicalExpr :=
  bands reducedUnionChunk008Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
