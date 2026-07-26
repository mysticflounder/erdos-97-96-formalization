import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk064Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 95, bvar 101, bvar 1135, bvar 1141]),
    bnot (bands [bvar 95, bvar 102, bvar 1135, bvar 1142]),
    bnot (bands [bvar 95, bvar 103, bvar 1135, bvar 1143]),
    bnot (bands [bvar 95, bvar 105, bvar 1135, bvar 1145]),
    bnot (bands [bvar 96, bvar 97, bvar 1136, bvar 1137]),
    bnot (bands [bvar 96, bvar 101, bvar 1136, bvar 1141]),
    bnot (bands [bvar 96, bvar 102, bvar 1136, bvar 1142]),
    bnot (bands [bvar 96, bvar 103, bvar 1136, bvar 1143]),
    bnot (bands [bvar 96, bvar 104, bvar 1136, bvar 1144]),
    bnot (bands [bvar 96, bvar 105, bvar 1136, bvar 1145]),
    bnot (bands [bvar 97, bvar 101, bvar 1137, bvar 1141]),
    bnot (bands [bvar 97, bvar 102, bvar 1137, bvar 1142]),
    bnot (bands [bvar 97, bvar 103, bvar 1137, bvar 1143]),
    bnot (bands [bvar 97, bvar 104, bvar 1137, bvar 1144]),
    bnot (bands [bvar 97, bvar 105, bvar 1137, bvar 1145]),
    bnot (bands [bvar 101, bvar 102, bvar 1141, bvar 1142]),
    bnot (bands [bvar 101, bvar 103, bvar 1141, bvar 1143]),
    bnot (bands [bvar 101, bvar 104, bvar 1141, bvar 1144]),
    bnot (bands [bvar 101, bvar 105, bvar 1141, bvar 1145]),
    bnot (bands [bvar 102, bvar 103, bvar 1142, bvar 1143]),
    bnot (bands [bvar 102, bvar 104, bvar 1142, bvar 1144]),
    bnot (bands [bvar 102, bvar 105, bvar 1142, bvar 1145]),
    bnot (bands [bvar 103, bvar 104, bvar 1143, bvar 1144]),
    bnot (bands [bvar 103, bvar 105, bvar 1143, bvar 1145]),
    bnot (bands [bvar 104, bvar 105, bvar 1144, bvar 1145]),
    bnot (bands [bvar 1107, bvar 1110, bvar 132, bvar 135]),
    bnot (bands [bvar 1107, bvar 1111, bvar 132, bvar 136]),
    bnot (bands [bvar 1107, bvar 1118, bvar 132, bvar 143]),
    bnot (bands [bvar 1107, bvar 1119, bvar 132, bvar 144]),
    bnot (bands [bvar 1110, bvar 1111, bvar 135, bvar 136]),
    bnot (bands [bvar 1110, bvar 1116, bvar 135, bvar 141]),
    bnot (bands [bvar 1110, bvar 1117, bvar 135, bvar 142]),
    bnot (bands [bvar 1110, bvar 1118, bvar 135, bvar 143]),
    bnot (bands [bvar 1110, bvar 1119, bvar 135, bvar 144]),
    bnot (bands [bvar 1111, bvar 1116, bvar 136, bvar 141]),
    bnot (bands [bvar 1111, bvar 1118, bvar 136, bvar 143]),
    bnot (bands [bvar 1111, bvar 1119, bvar 136, bvar 144]),
    bnot (bands [bvar 1107, bvar 1108, bvar 145, bvar 146]),
    bnot (bands [bvar 1107, bvar 1109, bvar 145, bvar 147]),
    bnot (bands [bvar 1107, bvar 1110, bvar 145, bvar 148]),
    bnot (bands [bvar 1107, bvar 1111, bvar 145, bvar 149]),
    bnot (bands [bvar 1107, bvar 1117, bvar 145, bvar 155]),
    bnot (bands [bvar 1107, bvar 1118, bvar 145, bvar 156]),
    bnot (bands [bvar 1107, bvar 1119, bvar 145, bvar 157]),
    bnot (bands [bvar 1108, bvar 1111, bvar 146, bvar 149]),
    bnot (bands [bvar 1108, bvar 1117, bvar 146, bvar 155]),
    bnot (bands [bvar 1108, bvar 1118, bvar 146, bvar 156]),
    bnot (bands [bvar 1108, bvar 1119, bvar 146, bvar 157]),
    bnot (bands [bvar 1109, bvar 1111, bvar 147, bvar 149]),
    bnot (bands [bvar 1109, bvar 1117, bvar 147, bvar 155]),
    bnot (bands [bvar 1109, bvar 1118, bvar 147, bvar 156]),
    bnot (bands [bvar 1109, bvar 1119, bvar 147, bvar 157]),
    bnot (bands [bvar 1110, bvar 1111, bvar 148, bvar 149]),
    bnot (bands [bvar 1110, bvar 1117, bvar 148, bvar 155]),
    bnot (bands [bvar 1110, bvar 1118, bvar 148, bvar 156]),
    bnot (bands [bvar 1110, bvar 1119, bvar 148, bvar 157]),
    bnot (bands [bvar 1111, bvar 1117, bvar 149, bvar 155]),
    bnot (bands [bvar 1111, bvar 1118, bvar 149, bvar 156]),
    bnot (bands [bvar 1111, bvar 1119, bvar 149, bvar 157]),
    bnot (bands [bvar 1113, bvar 1114, bvar 151, bvar 152]),
    bnot (bands [bvar 1113, bvar 1115, bvar 151, bvar 153]),
    bnot (bands [bvar 1114, bvar 1115, bvar 152, bvar 153]),
    bnot (bands [bvar 1117, bvar 1118, bvar 155, bvar 156]),
    bnot (bands [bvar 1117, bvar 1119, bvar 155, bvar 157]) ]

def reducedUnionChunk064 : BVLogicalExpr :=
  bands reducedUnionChunk064Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
