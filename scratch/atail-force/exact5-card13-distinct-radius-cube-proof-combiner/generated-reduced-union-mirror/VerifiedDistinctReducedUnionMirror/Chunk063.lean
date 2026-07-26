import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk063Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 103, bvar 105, bvar 1143, bvar 1145]),
    bnot (bands [bvar 104, bvar 105, bvar 1144, bvar 1145]),
    bnot (bands [bvar 1107, bvar 1110, bvar 132, bvar 135]),
    bnot (bands [bvar 1107, bvar 1111, bvar 132, bvar 136]),
    bnot (bands [bvar 1107, bvar 1116, bvar 132, bvar 141]),
    bnot (bands [bvar 1107, bvar 1117, bvar 132, bvar 142]),
    bnot (bands [bvar 1107, bvar 1118, bvar 132, bvar 143]),
    bnot (bands [bvar 1107, bvar 1119, bvar 132, bvar 144]),
    bnot (bands [bvar 1108, bvar 1110, bvar 133, bvar 135]),
    bnot (bands [bvar 1110, bvar 1111, bvar 135, bvar 136]),
    bnot (bands [bvar 1110, bvar 1116, bvar 135, bvar 141]),
    bnot (bands [bvar 1110, bvar 1117, bvar 135, bvar 142]),
    bnot (bands [bvar 1110, bvar 1118, bvar 135, bvar 143]),
    bnot (bands [bvar 1110, bvar 1119, bvar 135, bvar 144]),
    bnot (bands [bvar 1111, bvar 1116, bvar 136, bvar 141]),
    bnot (bands [bvar 1111, bvar 1117, bvar 136, bvar 142]),
    bnot (bands [bvar 1111, bvar 1118, bvar 136, bvar 143]),
    bnot (bands [bvar 1111, bvar 1119, bvar 136, bvar 144]),
    bnot (bands [bvar 1113, bvar 1114, bvar 138, bvar 139]),
    bnot (bands [bvar 1116, bvar 1117, bvar 141, bvar 142]),
    bnot (bands [bvar 1116, bvar 1118, bvar 141, bvar 143]),
    bnot (bands [bvar 1118, bvar 1119, bvar 143, bvar 144]),
    atMost [bands [bvar 1107, bvar 145], bands [bvar 1108, bvar 146], bands [bvar 1109, bvar 147], bands [bvar 1110, bvar 148], bands [bvar 1111, bvar 149], bands [bvar 1112, bvar 150], bands [bvar 1113, bvar 151], bands [bvar 1114, bvar 152], bands [bvar 1115, bvar 153], bands [bvar 1116, bvar 154], bands [bvar 1117, bvar 155], bands [bvar 1118, bvar 156], bands [bvar 1119, bvar 157]] 2,
    bnot (bands [bvar 1110, bvar 1111, bvar 148, bvar 149]),
    bnot (bands [bvar 1110, bvar 1118, bvar 148, bvar 156]),
    bnot (bands [bvar 1111, bvar 1117, bvar 149, bvar 155]),
    bnot (bands [bvar 1111, bvar 1118, bvar 149, bvar 156]),
    bnot (bands [bvar 1111, bvar 1119, bvar 149, bvar 157]),
    bnot (bands [bvar 1113, bvar 1114, bvar 151, bvar 152]),
    bnot (bands [bvar 1113, bvar 1115, bvar 151, bvar 153]),
    bnot (bands [bvar 1114, bvar 1115, bvar 152, bvar 153]),
    bnot (bands [bvar 1117, bvar 1119, bvar 155, bvar 157]),
    bnot (bands [bvar 1118, bvar 1119, bvar 156, bvar 157]),
    bnot (bands [bvar 96, bvar 97, bvar 1162, bvar 1163]),
    bnot (bands [bvar 96, bvar 104, bvar 1162, bvar 1170]),
    bnot (bands [bvar 96, bvar 105, bvar 1162, bvar 1171]),
    bnot (bands [bvar 97, bvar 103, bvar 1163, bvar 1169]),
    bnot (bands [bvar 97, bvar 104, bvar 1163, bvar 1170]),
    bnot (bands [bvar 97, bvar 105, bvar 1163, bvar 1171]),
    bnot (bands [bvar 99, bvar 101, bvar 1165, bvar 1167]),
    bnot (bands [bvar 103, bvar 104, bvar 1169, bvar 1170]),
    bnot (bands [bvar 1107, bvar 1109, bvar 158, bvar 160]),
    bnot (bands [bvar 1109, bvar 1111, bvar 160, bvar 162]),
    bnot (bands [bvar 1110, bvar 1111, bvar 161, bvar 162]),
    bnot (bands [bvar 1110, bvar 1118, bvar 161, bvar 169]),
    bnot (bands [bvar 1111, bvar 1118, bvar 162, bvar 169]),
    bnot (bands [bvar 1111, bvar 1119, bvar 162, bvar 170]),
    bnot (bands [bvar 1113, bvar 1114, bvar 164, bvar 165]),
    bnot (bands [bvar 1113, bvar 1115, bvar 164, bvar 166]),
    bnot (bands [bvar 1114, bvar 1115, bvar 165, bvar 166]),
    bnot (bands [bvar 1114, bvar 1116, bvar 165, bvar 167]),
    bnot (bands [bvar 1118, bvar 1119, bvar 169, bvar 170]),
    bnot (bands [bvar 97, bvar 104, bvar 1176, bvar 1183]),
    bnot (bands [bvar 100, bvar 101, bvar 1179, bvar 1180]),
    bnot (bands [bvar 1107, bvar 1111, bvar 171, bvar 175]),
    bnot (bands [bvar 1107, bvar 1119, bvar 171, bvar 183]),
    bnot (bands [bvar 1109, bvar 1119, bvar 173, bvar 183]),
    bnot (bands [bvar 1110, bvar 1111, bvar 174, bvar 175]),
    bnot (bands [bvar 1110, bvar 1119, bvar 174, bvar 183]),
    bnot (bands [bvar 1111, bvar 1119, bvar 175, bvar 183]),
    bnot (bands [bvar 1113, bvar 1114, bvar 177, bvar 178]),
    bnot (bands [bvar 1113, bvar 1115, bvar 177, bvar 179]),
    bnot (bands [bvar 1113, bvar 1116, bvar 177, bvar 180]),
    bnot (bands [bvar 1113, bvar 1117, bvar 177, bvar 181]) ]

def reducedUnionChunk063 : BVLogicalExpr :=
  bands reducedUnionChunk063Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
