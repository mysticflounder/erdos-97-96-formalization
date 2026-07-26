import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk125Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 7, bvar 12, bvar 1114, bvar 1119]),
    bnot (bands [bvar 8, bvar 9, bvar 1115, bvar 1116]),
    bnot (bands [bvar 8, bvar 10, bvar 1115, bvar 1117]),
    bnot (bands [bvar 8, bvar 12, bvar 1115, bvar 1119]),
    bnot (bands [bvar 9, bvar 10, bvar 1116, bvar 1117]),
    bnot (bands [bvar 9, bvar 11, bvar 1116, bvar 1118]),
    bnot (bands [bvar 9, bvar 12, bvar 1116, bvar 1119]),
    bnot (bands [bvar 10, bvar 11, bvar 1117, bvar 1118]),
    bnot (bands [bvar 10, bvar 12, bvar 1117, bvar 1119]),
    bnot (bands [bvar 0, bvar 7, bvar 1120, bvar 1127]),
    bnot (bands [bvar 0, bvar 8, bvar 1120, bvar 1128]),
    bnot (bands [bvar 0, bvar 9, bvar 1120, bvar 1129]),
    bnot (bands [bvar 0, bvar 10, bvar 1120, bvar 1130]),
    bnot (bands [bvar 0, bvar 12, bvar 1120, bvar 1132]),
    bnot (bands [bvar 1, bvar 9, bvar 1121, bvar 1129]),
    bnot (bands [bvar 1, bvar 10, bvar 1121, bvar 1130]),
    bnot (bands [bvar 1, bvar 11, bvar 1121, bvar 1131]),
    bnot (bands [bvar 1, bvar 12, bvar 1121, bvar 1132]),
    bnot (bands [bvar 2, bvar 7, bvar 1122, bvar 1127]),
    bnot (bands [bvar 2, bvar 8, bvar 1122, bvar 1128]),
    bnot (bands [bvar 2, bvar 9, bvar 1122, bvar 1129]),
    bnot (bands [bvar 2, bvar 10, bvar 1122, bvar 1130]),
    bnot (bands [bvar 2, bvar 11, bvar 1122, bvar 1131]),
    bnot (bands [bvar 2, bvar 12, bvar 1122, bvar 1132]),
    bnot (bands [bvar 3, bvar 7, bvar 1123, bvar 1127]),
    bnot (bands [bvar 3, bvar 8, bvar 1123, bvar 1128]),
    bnot (bands [bvar 3, bvar 9, bvar 1123, bvar 1129]),
    bnot (bands [bvar 3, bvar 10, bvar 1123, bvar 1130]),
    bnot (bands [bvar 3, bvar 11, bvar 1123, bvar 1131]),
    bnot (bands [bvar 3, bvar 12, bvar 1123, bvar 1132]),
    bnot (bands [bvar 7, bvar 9, bvar 1127, bvar 1129]),
    bnot (bands [bvar 7, bvar 10, bvar 1127, bvar 1130]),
    bnot (bands [bvar 7, bvar 11, bvar 1127, bvar 1131]),
    bnot (bands [bvar 7, bvar 12, bvar 1127, bvar 1132]),
    bnot (bands [bvar 8, bvar 9, bvar 1128, bvar 1129]),
    bnot (bands [bvar 8, bvar 10, bvar 1128, bvar 1130]),
    bnot (bands [bvar 8, bvar 11, bvar 1128, bvar 1131]),
    bnot (bands [bvar 8, bvar 12, bvar 1128, bvar 1132]),
    bnot (bands [bvar 9, bvar 10, bvar 1129, bvar 1130]),
    bnot (bands [bvar 9, bvar 11, bvar 1129, bvar 1131]),
    bnot (bands [bvar 9, bvar 12, bvar 1129, bvar 1132]),
    bnot (bands [bvar 10, bvar 11, bvar 1130, bvar 1131]),
    bnot (bands [bvar 10, bvar 12, bvar 1130, bvar 1132]),
    bnot (bands [bvar 11, bvar 12, bvar 1131, bvar 1132]),
    bnot (bands [bvar 0, bvar 8, bvar 1133, bvar 1141]),
    bnot (bands [bvar 0, bvar 9, bvar 1133, bvar 1142]),
    bnot (bands [bvar 0, bvar 10, bvar 1133, bvar 1143]),
    bnot (bands [bvar 0, bvar 11, bvar 1133, bvar 1144]),
    bnot (bands [bvar 0, bvar 12, bvar 1133, bvar 1145]),
    bnot (bands [bvar 1, bvar 10, bvar 1134, bvar 1143]),
    bnot (bands [bvar 2, bvar 8, bvar 1135, bvar 1141]),
    bnot (bands [bvar 2, bvar 9, bvar 1135, bvar 1142]),
    bnot (bands [bvar 2, bvar 10, bvar 1135, bvar 1143]),
    bnot (bands [bvar 2, bvar 12, bvar 1135, bvar 1145]),
    bnot (bands [bvar 3, bvar 8, bvar 1136, bvar 1141]),
    bnot (bands [bvar 3, bvar 9, bvar 1136, bvar 1142]),
    bnot (bands [bvar 3, bvar 10, bvar 1136, bvar 1143]),
    bnot (bands [bvar 3, bvar 11, bvar 1136, bvar 1144]),
    bnot (bands [bvar 3, bvar 12, bvar 1136, bvar 1145]),
    bnot (bands [bvar 8, bvar 9, bvar 1141, bvar 1142]),
    bnot (bands [bvar 8, bvar 10, bvar 1141, bvar 1143]),
    bnot (bands [bvar 8, bvar 11, bvar 1141, bvar 1144]),
    bnot (bands [bvar 8, bvar 12, bvar 1141, bvar 1145]),
    bnot (bands [bvar 9, bvar 10, bvar 1142, bvar 1143]) ]

def reducedUnionChunk125 : BVLogicalExpr :=
  bands reducedUnionChunk125Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
