import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk124Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 0, bvar 8, bvar 1081, bvar 1089]),
    bnot (bands [bvar 0, bvar 9, bvar 1081, bvar 1090]),
    bnot (bands [bvar 0, bvar 10, bvar 1081, bvar 1091]),
    bnot (bands [bvar 0, bvar 11, bvar 1081, bvar 1092]),
    bnot (bands [bvar 0, bvar 12, bvar 1081, bvar 1093]),
    bnot (bands [bvar 1, bvar 5, bvar 1082, bvar 1086]),
    bnot (bands [bvar 1, bvar 6, bvar 1082, bvar 1087]),
    bnot (bands [bvar 1, bvar 7, bvar 1082, bvar 1088]),
    bnot (bands [bvar 1, bvar 8, bvar 1082, bvar 1089]),
    bnot (bands [bvar 1, bvar 9, bvar 1082, bvar 1090]),
    bnot (bands [bvar 1, bvar 10, bvar 1082, bvar 1091]),
    bnot (bands [bvar 1, bvar 11, bvar 1082, bvar 1092]),
    bnot (bands [bvar 1, bvar 12, bvar 1082, bvar 1093]),
    bnot (bands [bvar 2, bvar 6, bvar 1083, bvar 1087]),
    bnot (bands [bvar 2, bvar 7, bvar 1083, bvar 1088]),
    bnot (bands [bvar 2, bvar 9, bvar 1083, bvar 1090]),
    bnot (bands [bvar 2, bvar 10, bvar 1083, bvar 1091]),
    bnot (bands [bvar 5, bvar 6, bvar 1086, bvar 1087]),
    bnot (bands [bvar 5, bvar 8, bvar 1086, bvar 1089]),
    bnot (bands [bvar 5, bvar 9, bvar 1086, bvar 1090]),
    bnot (bands [bvar 5, bvar 11, bvar 1086, bvar 1092]),
    bnot (bands [bvar 5, bvar 12, bvar 1086, bvar 1093]),
    bnot (bands [bvar 6, bvar 9, bvar 1087, bvar 1090]),
    bnot (bands [bvar 6, bvar 10, bvar 1087, bvar 1091]),
    bnot (bands [bvar 6, bvar 11, bvar 1087, bvar 1092]),
    bnot (bands [bvar 6, bvar 12, bvar 1087, bvar 1093]),
    bnot (bands [bvar 7, bvar 9, bvar 1088, bvar 1090]),
    bnot (bands [bvar 7, bvar 10, bvar 1088, bvar 1091]),
    bnot (bands [bvar 7, bvar 11, bvar 1088, bvar 1092]),
    bnot (bands [bvar 7, bvar 12, bvar 1088, bvar 1093]),
    bnot (bands [bvar 8, bvar 9, bvar 1089, bvar 1090]),
    bnot (bands [bvar 8, bvar 10, bvar 1089, bvar 1091]),
    bnot (bands [bvar 8, bvar 11, bvar 1089, bvar 1092]),
    bnot (bands [bvar 8, bvar 12, bvar 1089, bvar 1093]),
    bnot (bands [bvar 9, bvar 10, bvar 1090, bvar 1091]),
    bnot (bands [bvar 9, bvar 11, bvar 1090, bvar 1092]),
    bnot (bands [bvar 9, bvar 12, bvar 1090, bvar 1093]),
    bnot (bands [bvar 10, bvar 11, bvar 1091, bvar 1092]),
    bnot (bands [bvar 10, bvar 12, bvar 1091, bvar 1093]),
    bnot (bands [bvar 11, bvar 12, bvar 1092, bvar 1093]),
    bnot (bands [bvar 0, bvar 9, bvar 1107, bvar 1116]),
    bnot (bands [bvar 0, bvar 10, bvar 1107, bvar 1117]),
    bnot (bands [bvar 0, bvar 11, bvar 1107, bvar 1118]),
    bnot (bands [bvar 0, bvar 12, bvar 1107, bvar 1119]),
    bnot (bands [bvar 1, bvar 9, bvar 1108, bvar 1116]),
    bnot (bands [bvar 1, bvar 10, bvar 1108, bvar 1117]),
    bnot (bands [bvar 1, bvar 11, bvar 1108, bvar 1118]),
    bnot (bands [bvar 2, bvar 9, bvar 1109, bvar 1116]),
    bnot (bands [bvar 2, bvar 10, bvar 1109, bvar 1117]),
    bnot (bands [bvar 2, bvar 11, bvar 1109, bvar 1118]),
    bnot (bands [bvar 2, bvar 12, bvar 1109, bvar 1119]),
    bnot (bands [bvar 3, bvar 6, bvar 1110, bvar 1113]),
    bnot (bands [bvar 3, bvar 7, bvar 1110, bvar 1114]),
    bnot (bands [bvar 3, bvar 9, bvar 1110, bvar 1116]),
    bnot (bands [bvar 3, bvar 10, bvar 1110, bvar 1117]),
    bnot (bands [bvar 3, bvar 11, bvar 1110, bvar 1118]),
    bnot (bands [bvar 3, bvar 12, bvar 1110, bvar 1119]),
    bnot (bands [bvar 6, bvar 9, bvar 1113, bvar 1116]),
    bnot (bands [bvar 6, bvar 10, bvar 1113, bvar 1117]),
    bnot (bands [bvar 6, bvar 11, bvar 1113, bvar 1118]),
    bnot (bands [bvar 6, bvar 12, bvar 1113, bvar 1119]),
    bnot (bands [bvar 7, bvar 9, bvar 1114, bvar 1116]),
    bnot (bands [bvar 7, bvar 10, bvar 1114, bvar 1117]),
    bnot (bands [bvar 7, bvar 11, bvar 1114, bvar 1118]) ]

def reducedUnionChunk124 : BVLogicalExpr :=
  bands reducedUnionChunk124Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
