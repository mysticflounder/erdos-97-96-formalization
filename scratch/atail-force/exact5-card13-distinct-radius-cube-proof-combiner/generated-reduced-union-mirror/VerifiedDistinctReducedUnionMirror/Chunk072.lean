import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk072Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 158, bvar 163, bvar 1198, bvar 1203]),
    bnot (bands [bvar 158, bvar 164, bvar 1198, bvar 1204]),
    bnot (bands [bvar 158, bvar 166, bvar 1198, bvar 1206]),
    bnot (bands [bvar 159, bvar 162, bvar 1199, bvar 1202]),
    bnot (bands [bvar 159, bvar 163, bvar 1199, bvar 1203]),
    bnot (bands [bvar 159, bvar 164, bvar 1199, bvar 1204]),
    bnot (bands [bvar 159, bvar 165, bvar 1199, bvar 1205]),
    bnot (bands [bvar 159, bvar 166, bvar 1199, bvar 1206]),
    bnot (bands [bvar 159, bvar 167, bvar 1199, bvar 1207]),
    bnot (bands [bvar 160, bvar 163, bvar 1200, bvar 1203]),
    bnot (bands [bvar 160, bvar 164, bvar 1200, bvar 1204]),
    bnot (bands [bvar 160, bvar 165, bvar 1200, bvar 1205]),
    bnot (bands [bvar 160, bvar 166, bvar 1200, bvar 1206]),
    bnot (bands [bvar 160, bvar 167, bvar 1200, bvar 1207]),
    bnot (bands [bvar 161, bvar 163, bvar 1201, bvar 1203]),
    bnot (bands [bvar 161, bvar 164, bvar 1201, bvar 1204]),
    bnot (bands [bvar 161, bvar 165, bvar 1201, bvar 1205]),
    bnot (bands [bvar 161, bvar 166, bvar 1201, bvar 1206]),
    bnot (bands [bvar 161, bvar 167, bvar 1201, bvar 1207]),
    bnot (bands [bvar 162, bvar 163, bvar 1202, bvar 1203]),
    bnot (bands [bvar 162, bvar 164, bvar 1202, bvar 1204]),
    bnot (bands [bvar 162, bvar 165, bvar 1202, bvar 1205]),
    bnot (bands [bvar 162, bvar 166, bvar 1202, bvar 1206]),
    bnot (bands [bvar 162, bvar 167, bvar 1202, bvar 1207]),
    bnot (bands [bvar 163, bvar 164, bvar 1203, bvar 1204]),
    bnot (bands [bvar 163, bvar 165, bvar 1203, bvar 1205]),
    bnot (bands [bvar 163, bvar 166, bvar 1203, bvar 1206]),
    bnot (bands [bvar 163, bvar 167, bvar 1203, bvar 1207]),
    bnot (bands [bvar 164, bvar 165, bvar 1204, bvar 1205]),
    bnot (bands [bvar 164, bvar 166, bvar 1204, bvar 1206]),
    bnot (bands [bvar 164, bvar 167, bvar 1204, bvar 1207]),
    bnot (bands [bvar 165, bvar 166, bvar 1205, bvar 1206]),
    bnot (bands [bvar 165, bvar 167, bvar 1205, bvar 1207]),
    bnot (bands [bvar 166, bvar 167, bvar 1206, bvar 1207]),
    bnot (bands [bvar 1186, bvar 1191, bvar 185, bvar 190]),
    bnot (bands [bvar 1194, bvar 1195, bvar 193, bvar 194]),
    bnot (bands [bvar 171, bvar 172, bvar 1198, bvar 1199]),
    bnot (bands [bvar 171, bvar 179, bvar 1198, bvar 1206]),
    bnot (bands [bvar 171, bvar 180, bvar 1198, bvar 1207]),
    bnot (bands [bvar 171, bvar 181, bvar 1198, bvar 1208]),
    bnot (bands [bvar 172, bvar 177, bvar 1199, bvar 1204]),
    bnot (bands [bvar 172, bvar 179, bvar 1199, bvar 1206]),
    bnot (bands [bvar 172, bvar 180, bvar 1199, bvar 1207]),
    bnot (bands [bvar 172, bvar 181, bvar 1199, bvar 1208]),
    bnot (bands [bvar 174, bvar 180, bvar 1201, bvar 1207]),
    bnot (bands [bvar 176, bvar 179, bvar 1203, bvar 1206]),
    bnot (bands [bvar 177, bvar 179, bvar 1204, bvar 1206]),
    bnot (bands [bvar 177, bvar 180, bvar 1204, bvar 1207]),
    bnot (bands [bvar 179, bvar 180, bvar 1206, bvar 1207]),
    bnot (bands [bvar 179, bvar 181, bvar 1206, bvar 1208]),
    bnot (bands [bvar 180, bvar 181, bvar 1207, bvar 1208]),
    bnot (bands [bvar 1103, bvar 1105, bvar 115, bvar 117]),
    bnot (bands [bvar 1097, bvar 1103, bvar 135, bvar 141]),
    bnot (bands [bvar 1097, bvar 1104, bvar 135, bvar 142]),
    bnot (bands [bvar 1097, bvar 1105, bvar 135, bvar 143]),
    bnot (bands [bvar 1097, bvar 1106, bvar 135, bvar 144]),
    bnot (bands [bvar 1110, bvar 1119, bvar 109, bvar 118]),
    bnot (bands [bvar 1110, bvar 1119, bvar 122, bvar 131]),
    bnot (bands [bvar 1107, bvar 1110, bvar 132, bvar 135]),
    bnot (bands [bvar 1110, bvar 1117, bvar 135, bvar 142]),
    bnot (bands [bvar 1110, bvar 1118, bvar 135, bvar 143]),
    bnot (bands [bvar 1120, bvar 1123, bvar 132, bvar 135]),
    bnot (bands [bvar 1121, bvar 1123, bvar 133, bvar 135]),
    bnot (bands [bvar 1123, bvar 1129, bvar 135, bvar 141]) ]

def reducedUnionChunk072 : BVLogicalExpr :=
  bands reducedUnionChunk072Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
