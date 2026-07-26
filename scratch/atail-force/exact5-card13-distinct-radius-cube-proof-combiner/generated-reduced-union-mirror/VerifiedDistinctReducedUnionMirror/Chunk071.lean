import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk071Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 159, bvar 163, bvar 1186, bvar 1190]),
    bnot (bands [bvar 159, bvar 164, bvar 1186, bvar 1191]),
    bnot (bands [bvar 159, bvar 165, bvar 1186, bvar 1192]),
    bnot (bands [bvar 159, bvar 166, bvar 1186, bvar 1193]),
    bnot (bands [bvar 159, bvar 167, bvar 1186, bvar 1194]),
    bnot (bands [bvar 159, bvar 170, bvar 1186, bvar 1197]),
    bnot (bands [bvar 160, bvar 164, bvar 1187, bvar 1191]),
    bnot (bands [bvar 161, bvar 165, bvar 1188, bvar 1192]),
    bnot (bands [bvar 161, bvar 167, bvar 1188, bvar 1194]),
    bnot (bands [bvar 162, bvar 163, bvar 1189, bvar 1190]),
    bnot (bands [bvar 162, bvar 164, bvar 1189, bvar 1191]),
    bnot (bands [bvar 162, bvar 165, bvar 1189, bvar 1192]),
    bnot (bands [bvar 162, bvar 166, bvar 1189, bvar 1193]),
    bnot (bands [bvar 162, bvar 167, bvar 1189, bvar 1194]),
    bnot (bands [bvar 162, bvar 170, bvar 1189, bvar 1197]),
    bnot (bands [bvar 163, bvar 166, bvar 1190, bvar 1193]),
    bnot (bands [bvar 163, bvar 167, bvar 1190, bvar 1194]),
    bnot (bands [bvar 164, bvar 166, bvar 1191, bvar 1193]),
    bnot (bands [bvar 164, bvar 167, bvar 1191, bvar 1194]),
    bnot (bands [bvar 164, bvar 170, bvar 1191, bvar 1197]),
    bnot (bands [bvar 165, bvar 166, bvar 1192, bvar 1193]),
    bnot (bands [bvar 165, bvar 167, bvar 1192, bvar 1194]),
    bnot (bands [bvar 165, bvar 170, bvar 1192, bvar 1197]),
    bnot (bands [bvar 166, bvar 167, bvar 1193, bvar 1194]),
    bnot (bands [bvar 1172, bvar 1173, bvar 184, bvar 185]),
    bnot (bands [bvar 1172, bvar 1174, bvar 184, bvar 186]),
    bnot (bands [bvar 1172, bvar 1175, bvar 184, bvar 187]),
    bnot (bands [bvar 1172, bvar 1176, bvar 184, bvar 188]),
    bnot (bands [bvar 1172, bvar 1177, bvar 184, bvar 189]),
    bnot (bands [bvar 1172, bvar 1178, bvar 184, bvar 190]),
    bnot (bands [bvar 1172, bvar 1179, bvar 184, bvar 191]),
    bnot (bands [bvar 1172, bvar 1180, bvar 184, bvar 192]),
    bnot (bands [bvar 1172, bvar 1181, bvar 184, bvar 193]),
    bnot (bands [bvar 1173, bvar 1176, bvar 185, bvar 188]),
    bnot (bands [bvar 1173, bvar 1178, bvar 185, bvar 190]),
    bnot (bands [bvar 1173, bvar 1179, bvar 185, bvar 191]),
    bnot (bands [bvar 1173, bvar 1180, bvar 185, bvar 192]),
    bnot (bands [bvar 1173, bvar 1181, bvar 185, bvar 193]),
    bnot (bands [bvar 1174, bvar 1176, bvar 186, bvar 188]),
    bnot (bands [bvar 1174, bvar 1178, bvar 186, bvar 190]),
    bnot (bands [bvar 1174, bvar 1179, bvar 186, bvar 191]),
    bnot (bands [bvar 1174, bvar 1180, bvar 186, bvar 192]),
    bnot (bands [bvar 1174, bvar 1181, bvar 186, bvar 193]),
    bnot (bands [bvar 1175, bvar 1176, bvar 187, bvar 188]),
    bnot (bands [bvar 1175, bvar 1178, bvar 187, bvar 190]),
    bnot (bands [bvar 1175, bvar 1179, bvar 187, bvar 191]),
    bnot (bands [bvar 1175, bvar 1180, bvar 187, bvar 192]),
    bnot (bands [bvar 1175, bvar 1181, bvar 187, bvar 193]),
    bnot (bands [bvar 1176, bvar 1177, bvar 188, bvar 189]),
    bnot (bands [bvar 1176, bvar 1178, bvar 188, bvar 190]),
    bnot (bands [bvar 1176, bvar 1179, bvar 188, bvar 191]),
    bnot (bands [bvar 1176, bvar 1180, bvar 188, bvar 192]),
    bnot (bands [bvar 1176, bvar 1181, bvar 188, bvar 193]),
    bnot (bands [bvar 1177, bvar 1178, bvar 189, bvar 190]),
    bnot (bands [bvar 1177, bvar 1179, bvar 189, bvar 191]),
    bnot (bands [bvar 1177, bvar 1180, bvar 189, bvar 192]),
    bnot (bands [bvar 1177, bvar 1181, bvar 189, bvar 193]),
    bnot (bands [bvar 1178, bvar 1179, bvar 190, bvar 191]),
    bnot (bands [bvar 1178, bvar 1180, bvar 190, bvar 192]),
    bnot (bands [bvar 1178, bvar 1181, bvar 190, bvar 193]),
    bnot (bands [bvar 1179, bvar 1180, bvar 191, bvar 192]),
    bnot (bands [bvar 1179, bvar 1181, bvar 191, bvar 193]),
    bnot (bands [bvar 1180, bvar 1181, bvar 192, bvar 193]),
    bnot (bands [bvar 158, bvar 162, bvar 1198, bvar 1202]) ]

def reducedUnionChunk071 : BVLogicalExpr :=
  bands reducedUnionChunk071Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
