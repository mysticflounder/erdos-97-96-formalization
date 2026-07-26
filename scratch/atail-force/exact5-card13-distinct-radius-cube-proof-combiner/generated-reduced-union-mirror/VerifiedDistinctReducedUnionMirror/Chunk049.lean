import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk049Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 30, bvar 33, bvar 1122, bvar 1125]),
    bnot (bands [bvar 31, bvar 33, bvar 1123, bvar 1125]),
    bnot (bands [bvar 32, bvar 33, bvar 1124, bvar 1125]),
    bnot (bands [bvar 35, bvar 36, bvar 1127, bvar 1128]),
    bnot (bands [bvar 35, bvar 37, bvar 1127, bvar 1129]),
    bnot (bands [bvar 35, bvar 38, bvar 1127, bvar 1130]),
    bnot (bands [bvar 35, bvar 39, bvar 1127, bvar 1131]),
    bnot (bands [bvar 35, bvar 40, bvar 1127, bvar 1132]),
    bnot (bands [bvar 29, bvar 33, bvar 1134, bvar 1138]),
    bnot (bands [bvar 29, bvar 34, bvar 1134, bvar 1139]),
    bnot (bands [bvar 30, bvar 32, bvar 1135, bvar 1137]),
    bnot (bands [bvar 30, bvar 33, bvar 1135, bvar 1138]),
    bnot (bands [bvar 30, bvar 34, bvar 1135, bvar 1139]),
    bnot (bands [bvar 31, bvar 33, bvar 1136, bvar 1138]),
    bnot (bands [bvar 31, bvar 34, bvar 1136, bvar 1139]),
    bnot (bands [bvar 32, bvar 33, bvar 1137, bvar 1138]),
    bnot (bands [bvar 32, bvar 34, bvar 1137, bvar 1139]),
    bnot (bands [bvar 33, bvar 34, bvar 1138, bvar 1139]),
    bnot (bands [bvar 38, bvar 39, bvar 1143, bvar 1144]),
    bnot (bands [bvar 1045, bvar 1046, bvar 135, bvar 136]),
    bnot (bands [bvar 1045, bvar 1048, bvar 135, bvar 138]),
    bnot (bands [bvar 1045, bvar 1049, bvar 135, bvar 139]),
    bnot (bands [bvar 1046, bvar 1048, bvar 136, bvar 138]),
    bnot (bands [bvar 1046, bvar 1049, bvar 136, bvar 139]),
    bnot (bands [bvar 1043, bvar 1046, bvar 146, bvar 149]),
    bnot (bands [bvar 1043, bvar 1047, bvar 146, bvar 150]),
    bnot (bands [bvar 1043, bvar 1048, bvar 146, bvar 151]),
    bnot (bands [bvar 1043, bvar 1049, bvar 146, bvar 152]),
    bnot (bands [bvar 1043, bvar 1050, bvar 146, bvar 153]),
    bnot (bands [bvar 1044, bvar 1047, bvar 147, bvar 150]),
    bnot (bands [bvar 1044, bvar 1048, bvar 147, bvar 151]),
    bnot (bands [bvar 1044, bvar 1049, bvar 147, bvar 152]),
    bnot (bands [bvar 1045, bvar 1047, bvar 148, bvar 150]),
    bnot (bands [bvar 1045, bvar 1048, bvar 148, bvar 151]),
    bnot (bands [bvar 1045, bvar 1049, bvar 148, bvar 152]),
    bnot (bands [bvar 1046, bvar 1047, bvar 149, bvar 150]),
    bnot (bands [bvar 1046, bvar 1048, bvar 149, bvar 151]),
    bnot (bands [bvar 1046, bvar 1049, bvar 149, bvar 152]),
    bnot (bands [bvar 1046, bvar 1050, bvar 149, bvar 153]),
    bnot (bands [bvar 1047, bvar 1048, bvar 150, bvar 151]),
    bnot (bands [bvar 1047, bvar 1049, bvar 150, bvar 152]),
    bnot (bands [bvar 1047, bvar 1050, bvar 150, bvar 153]),
    bnot (bands [bvar 1048, bvar 1049, bvar 151, bvar 152]),
    bnot (bands [bvar 1048, bvar 1050, bvar 151, bvar 153]),
    bnot (bands [bvar 1049, bvar 1050, bvar 152, bvar 153]),
    bnot (bands [bvar 29, bvar 34, bvar 1160, bvar 1165]),
    bnot (bands [bvar 29, bvar 35, bvar 1160, bvar 1166]),
    bnot (bands [bvar 29, bvar 36, bvar 1160, bvar 1167]),
    bnot (bands [bvar 30, bvar 34, bvar 1161, bvar 1165]),
    bnot (bands [bvar 30, bvar 35, bvar 1161, bvar 1166]),
    bnot (bands [bvar 30, bvar 36, bvar 1161, bvar 1167]),
    bnot (bands [bvar 31, bvar 34, bvar 1162, bvar 1165]),
    bnot (bands [bvar 31, bvar 35, bvar 1162, bvar 1166]),
    bnot (bands [bvar 31, bvar 36, bvar 1162, bvar 1167]),
    bnot (bands [bvar 32, bvar 33, bvar 1163, bvar 1164]),
    bnot (bands [bvar 32, bvar 34, bvar 1163, bvar 1165]),
    bnot (bands [bvar 32, bvar 35, bvar 1163, bvar 1166]),
    bnot (bands [bvar 32, bvar 36, bvar 1163, bvar 1167]),
    bnot (bands [bvar 33, bvar 34, bvar 1164, bvar 1165]),
    bnot (bands [bvar 33, bvar 35, bvar 1164, bvar 1166]),
    bnot (bands [bvar 33, bvar 36, bvar 1164, bvar 1167]),
    bnot (bands [bvar 34, bvar 35, bvar 1165, bvar 1166]),
    bnot (bands [bvar 34, bvar 36, bvar 1165, bvar 1167]),
    bnot (bands [bvar 35, bvar 36, bvar 1166, bvar 1167]) ]

def reducedUnionChunk049 : BVLogicalExpr :=
  bands reducedUnionChunk049Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
