import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk063Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 96, bvar 103, bvar 1123, bvar 1130]),
    bnot (bands [bvar 96, bvar 104, bvar 1123, bvar 1131]),
    bnot (bands [bvar 96, bvar 105, bvar 1123, bvar 1132]),
    bnot (bands [bvar 97, bvar 100, bvar 1124, bvar 1127]),
    bnot (bands [bvar 97, bvar 101, bvar 1124, bvar 1128]),
    bnot (bands [bvar 97, bvar 102, bvar 1124, bvar 1129]),
    bnot (bands [bvar 97, bvar 103, bvar 1124, bvar 1130]),
    bnot (bands [bvar 97, bvar 104, bvar 1124, bvar 1131]),
    bnot (bands [bvar 97, bvar 105, bvar 1124, bvar 1132]),
    bnot (bands [bvar 100, bvar 101, bvar 1127, bvar 1128]),
    bnot (bands [bvar 100, bvar 102, bvar 1127, bvar 1129]),
    bnot (bands [bvar 100, bvar 103, bvar 1127, bvar 1130]),
    bnot (bands [bvar 100, bvar 104, bvar 1127, bvar 1131]),
    bnot (bands [bvar 100, bvar 105, bvar 1127, bvar 1132]),
    bnot (bands [bvar 101, bvar 102, bvar 1128, bvar 1129]),
    bnot (bands [bvar 101, bvar 103, bvar 1128, bvar 1130]),
    bnot (bands [bvar 101, bvar 105, bvar 1128, bvar 1132]),
    bnot (bands [bvar 102, bvar 103, bvar 1129, bvar 1130]),
    bnot (bands [bvar 102, bvar 104, bvar 1129, bvar 1131]),
    bnot (bands [bvar 102, bvar 105, bvar 1129, bvar 1132]),
    bnot (bands [bvar 103, bvar 104, bvar 1130, bvar 1131]),
    bnot (bands [bvar 103, bvar 105, bvar 1130, bvar 1132]),
    bnot (bands [bvar 104, bvar 105, bvar 1131, bvar 1132]),
    bnot (bands [bvar 1107, bvar 1111, bvar 119, bvar 123]),
    bnot (bands [bvar 1107, bvar 1115, bvar 119, bvar 127]),
    bnot (bands [bvar 1107, bvar 1116, bvar 119, bvar 128]),
    bnot (bands [bvar 1107, bvar 1119, bvar 119, bvar 131]),
    bnot (bands [bvar 1108, bvar 1111, bvar 120, bvar 123]),
    bnot (bands [bvar 1109, bvar 1111, bvar 121, bvar 123]),
    bnot (bands [bvar 1109, bvar 1116, bvar 121, bvar 128]),
    bnot (bands [bvar 1109, bvar 1117, bvar 121, bvar 129]),
    bnot (bands [bvar 1109, bvar 1119, bvar 121, bvar 131]),
    bnot (bands [bvar 1110, bvar 1111, bvar 122, bvar 123]),
    bnot (bands [bvar 1110, bvar 1115, bvar 122, bvar 127]),
    bnot (bands [bvar 1110, bvar 1117, bvar 122, bvar 129]),
    bnot (bands [bvar 1110, bvar 1118, bvar 122, bvar 130]),
    bnot (bands [bvar 1110, bvar 1119, bvar 122, bvar 131]),
    bnot (bands [bvar 1111, bvar 1116, bvar 123, bvar 128]),
    bnot (bands [bvar 1111, bvar 1117, bvar 123, bvar 129]),
    bnot (bands [bvar 1111, bvar 1118, bvar 123, bvar 130]),
    bnot (bands [bvar 1111, bvar 1119, bvar 123, bvar 131]),
    bnot (bands [bvar 1115, bvar 1116, bvar 127, bvar 128]),
    bnot (bands [bvar 1115, bvar 1118, bvar 127, bvar 130]),
    bnot (bands [bvar 1115, bvar 1119, bvar 127, bvar 131]),
    bnot (bands [bvar 1116, bvar 1117, bvar 128, bvar 129]),
    bnot (bands [bvar 1116, bvar 1118, bvar 128, bvar 130]),
    bnot (bands [bvar 1116, bvar 1119, bvar 128, bvar 131]),
    bnot (bands [bvar 1117, bvar 1118, bvar 129, bvar 130]),
    bnot (bands [bvar 1117, bvar 1119, bvar 129, bvar 131]),
    bnot (bands [bvar 93, bvar 94, bvar 1133, bvar 1134]),
    bnot (bands [bvar 93, bvar 95, bvar 1133, bvar 1135]),
    bnot (bands [bvar 93, bvar 96, bvar 1133, bvar 1136]),
    bnot (bands [bvar 93, bvar 97, bvar 1133, bvar 1137]),
    bnot (bands [bvar 93, bvar 101, bvar 1133, bvar 1141]),
    bnot (bands [bvar 93, bvar 102, bvar 1133, bvar 1142]),
    bnot (bands [bvar 93, bvar 103, bvar 1133, bvar 1143]),
    bnot (bands [bvar 93, bvar 104, bvar 1133, bvar 1144]),
    bnot (bands [bvar 93, bvar 105, bvar 1133, bvar 1145]),
    bnot (bands [bvar 94, bvar 97, bvar 1134, bvar 1137]),
    bnot (bands [bvar 94, bvar 101, bvar 1134, bvar 1141]),
    bnot (bands [bvar 94, bvar 102, bvar 1134, bvar 1142]),
    bnot (bands [bvar 94, bvar 103, bvar 1134, bvar 1143]),
    bnot (bands [bvar 94, bvar 105, bvar 1134, bvar 1145]),
    bnot (bands [bvar 95, bvar 97, bvar 1135, bvar 1137]) ]

def reducedUnionChunk063 : BVLogicalExpr :=
  bands reducedUnionChunk063Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
