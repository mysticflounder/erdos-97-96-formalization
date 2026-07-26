import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk070Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 151, bvar 152, bvar 1191, bvar 1192]),
    bnot (bands [bvar 151, bvar 153, bvar 1191, bvar 1193]),
    bnot (bands [bvar 151, bvar 157, bvar 1191, bvar 1197]),
    bnot (bands [bvar 152, bvar 153, bvar 1192, bvar 1193]),
    bnot (bands [bvar 152, bvar 157, bvar 1192, bvar 1197]),
    bnot (bands [bvar 153, bvar 157, bvar 1193, bvar 1197]),
    atMost [bands [bvar 1159, bvar 184], bands [bvar 1160, bvar 185], bands [bvar 1161, bvar 186], bands [bvar 1162, bvar 187], bands [bvar 1163, bvar 188], bands [bvar 1164, bvar 189], bands [bvar 1165, bvar 190], bands [bvar 1166, bvar 191], bands [bvar 1167, bvar 192], bands [bvar 1168, bvar 193], bands [bvar 1169, bvar 194], bands [bvar 1170, bvar 195], bands [bvar 1171, bvar 196]] 2,
    bnot (bands [bvar 1159, bvar 1160, bvar 184, bvar 185]),
    bnot (bands [bvar 1159, bvar 1161, bvar 184, bvar 186]),
    bnot (bands [bvar 1159, bvar 1163, bvar 184, bvar 188]),
    bnot (bands [bvar 1159, bvar 1165, bvar 184, bvar 190]),
    bnot (bands [bvar 1159, bvar 1166, bvar 184, bvar 191]),
    bnot (bands [bvar 1159, bvar 1167, bvar 184, bvar 192]),
    bnot (bands [bvar 1160, bvar 1163, bvar 185, bvar 188]),
    bnot (bands [bvar 1160, bvar 1165, bvar 185, bvar 190]),
    bnot (bands [bvar 1160, bvar 1166, bvar 185, bvar 191]),
    bnot (bands [bvar 1160, bvar 1167, bvar 185, bvar 192]),
    bnot (bands [bvar 1161, bvar 1163, bvar 186, bvar 188]),
    bnot (bands [bvar 1161, bvar 1165, bvar 186, bvar 190]),
    bnot (bands [bvar 1161, bvar 1166, bvar 186, bvar 191]),
    bnot (bands [bvar 1161, bvar 1167, bvar 186, bvar 192]),
    bnot (bands [bvar 1162, bvar 1163, bvar 187, bvar 188]),
    bnot (bands [bvar 1162, bvar 1166, bvar 187, bvar 191]),
    bnot (bands [bvar 1162, bvar 1167, bvar 187, bvar 192]),
    bnot (bands [bvar 1163, bvar 1164, bvar 188, bvar 189]),
    bnot (bands [bvar 1163, bvar 1165, bvar 188, bvar 190]),
    bnot (bands [bvar 1163, bvar 1166, bvar 188, bvar 191]),
    bnot (bands [bvar 1163, bvar 1167, bvar 188, bvar 192]),
    bnot (bands [bvar 1164, bvar 1165, bvar 189, bvar 190]),
    bnot (bands [bvar 1164, bvar 1166, bvar 189, bvar 191]),
    bnot (bands [bvar 1164, bvar 1167, bvar 189, bvar 192]),
    bnot (bands [bvar 1165, bvar 1166, bvar 190, bvar 191]),
    bnot (bands [bvar 1165, bvar 1167, bvar 190, bvar 192]),
    bnot (bands [bvar 1166, bvar 1167, bvar 191, bvar 192]),
    bnot (bands [bvar 1169, bvar 1170, bvar 194, bvar 195]),
    bnot (bands [bvar 145, bvar 146, bvar 1198, bvar 1199]),
    bnot (bands [bvar 145, bvar 149, bvar 1198, bvar 1202]),
    bnot (bands [bvar 145, bvar 151, bvar 1198, bvar 1204]),
    bnot (bands [bvar 145, bvar 152, bvar 1198, bvar 1205]),
    bnot (bands [bvar 145, bvar 153, bvar 1198, bvar 1206]),
    bnot (bands [bvar 146, bvar 149, bvar 1199, bvar 1202]),
    bnot (bands [bvar 146, bvar 151, bvar 1199, bvar 1204]),
    bnot (bands [bvar 146, bvar 152, bvar 1199, bvar 1205]),
    bnot (bands [bvar 146, bvar 153, bvar 1199, bvar 1206]),
    bnot (bands [bvar 147, bvar 149, bvar 1200, bvar 1202]),
    bnot (bands [bvar 148, bvar 149, bvar 1201, bvar 1202]),
    bnot (bands [bvar 148, bvar 153, bvar 1201, bvar 1206]),
    bnot (bands [bvar 149, bvar 150, bvar 1202, bvar 1203]),
    bnot (bands [bvar 149, bvar 151, bvar 1202, bvar 1204]),
    bnot (bands [bvar 149, bvar 152, bvar 1202, bvar 1205]),
    bnot (bands [bvar 149, bvar 153, bvar 1202, bvar 1206]),
    bnot (bands [bvar 150, bvar 153, bvar 1203, bvar 1206]),
    bnot (bands [bvar 151, bvar 153, bvar 1204, bvar 1206]),
    bnot (bands [bvar 152, bvar 153, bvar 1205, bvar 1206]),
    bnot (bands [bvar 155, bvar 156, bvar 1208, bvar 1209]),
    bnot (bands [bvar 158, bvar 159, bvar 1185, bvar 1186]),
    bnot (bands [bvar 158, bvar 161, bvar 1185, bvar 1188]),
    bnot (bands [bvar 158, bvar 162, bvar 1185, bvar 1189]),
    bnot (bands [bvar 158, bvar 163, bvar 1185, bvar 1190]),
    bnot (bands [bvar 158, bvar 164, bvar 1185, bvar 1191]),
    bnot (bands [bvar 158, bvar 165, bvar 1185, bvar 1192]),
    bnot (bands [bvar 158, bvar 166, bvar 1185, bvar 1193]),
    bnot (bands [bvar 158, bvar 167, bvar 1185, bvar 1194]),
    bnot (bands [bvar 159, bvar 162, bvar 1186, bvar 1189]) ]

def reducedUnionChunk070 : BVLogicalExpr :=
  bands reducedUnionChunk070Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
