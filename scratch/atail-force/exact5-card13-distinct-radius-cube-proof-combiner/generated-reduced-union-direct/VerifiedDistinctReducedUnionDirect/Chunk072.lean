import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk072Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1174, bvar 1178, bvar 173, bvar 177]),
    bnot (bands [bvar 1174, bvar 1180, bvar 173, bvar 179]),
    bnot (bands [bvar 1176, bvar 1178, bvar 175, bvar 177]),
    bnot (bands [bvar 1176, bvar 1180, bvar 175, bvar 179]),
    bnot (bands [bvar 1176, bvar 1184, bvar 175, bvar 183]),
    bnot (bands [bvar 1177, bvar 1178, bvar 176, bvar 177]),
    bnot (bands [bvar 1177, bvar 1179, bvar 176, bvar 178]),
    bnot (bands [bvar 1177, bvar 1180, bvar 176, bvar 179]),
    bnot (bands [bvar 1177, bvar 1181, bvar 176, bvar 180]),
    bnot (bands [bvar 1177, bvar 1184, bvar 176, bvar 183]),
    bnot (bands [bvar 1178, bvar 1179, bvar 177, bvar 178]),
    bnot (bands [bvar 1178, bvar 1181, bvar 177, bvar 180]),
    bnot (bands [bvar 1178, bvar 1184, bvar 177, bvar 183]),
    bnot (bands [bvar 1179, bvar 1184, bvar 178, bvar 183]),
    bnot (bands [bvar 158, bvar 166, bvar 1185, bvar 1193]),
    bnot (bands [bvar 159, bvar 162, bvar 1186, bvar 1189]),
    bnot (bands [bvar 159, bvar 166, bvar 1186, bvar 1193]),
    bnot (bands [bvar 159, bvar 167, bvar 1186, bvar 1194]),
    bnot (bands [bvar 161, bvar 166, bvar 1188, bvar 1193]),
    bnot (bands [bvar 161, bvar 167, bvar 1188, bvar 1194]),
    bnot (bands [bvar 162, bvar 165, bvar 1189, bvar 1192]),
    bnot (bands [bvar 162, bvar 166, bvar 1189, bvar 1193]),
    bnot (bands [bvar 162, bvar 167, bvar 1189, bvar 1194]),
    bnot (bands [bvar 165, bvar 166, bvar 1192, bvar 1193]),
    bnot (bands [bvar 166, bvar 167, bvar 1193, bvar 1194]),
    bnot (bands [bvar 1172, bvar 1174, bvar 184, bvar 186]),
    bnot (bands [bvar 1172, bvar 1176, bvar 184, bvar 188]),
    bnot (bands [bvar 1172, bvar 1178, bvar 184, bvar 190]),
    bnot (bands [bvar 1172, bvar 1179, bvar 184, bvar 191]),
    bnot (bands [bvar 1172, bvar 1180, bvar 184, bvar 192]),
    bnot (bands [bvar 1172, bvar 1181, bvar 184, bvar 193]),
    bnot (bands [bvar 1173, bvar 1177, bvar 185, bvar 189]),
    bnot (bands [bvar 1173, bvar 1179, bvar 185, bvar 191]),
    bnot (bands [bvar 1173, bvar 1180, bvar 185, bvar 192]),
    bnot (bands [bvar 1174, bvar 1176, bvar 186, bvar 188]),
    bnot (bands [bvar 1174, bvar 1177, bvar 186, bvar 189]),
    bnot (bands [bvar 1174, bvar 1179, bvar 186, bvar 191]),
    bnot (bands [bvar 1174, bvar 1181, bvar 186, bvar 193]),
    bnot (bands [bvar 1175, bvar 1179, bvar 187, bvar 191]),
    bnot (bands [bvar 1175, bvar 1181, bvar 187, bvar 193]),
    bnot (bands [bvar 1176, bvar 1177, bvar 188, bvar 189]),
    bnot (bands [bvar 1176, bvar 1178, bvar 188, bvar 190]),
    bnot (bands [bvar 1176, bvar 1179, bvar 188, bvar 191]),
    bnot (bands [bvar 1176, bvar 1180, bvar 188, bvar 192]),
    bnot (bands [bvar 1176, bvar 1181, bvar 188, bvar 193]),
    bnot (bands [bvar 1177, bvar 1179, bvar 189, bvar 191]),
    bnot (bands [bvar 1177, bvar 1180, bvar 189, bvar 192]),
    bnot (bands [bvar 1177, bvar 1181, bvar 189, bvar 193]),
    bnot (bands [bvar 1178, bvar 1179, bvar 190, bvar 191]),
    bnot (bands [bvar 1178, bvar 1180, bvar 190, bvar 192]),
    bnot (bands [bvar 1179, bvar 1180, bvar 191, bvar 192]),
    bnot (bands [bvar 1179, bvar 1181, bvar 191, bvar 193]),
    bnot (bands [bvar 1186, bvar 1192, bvar 185, bvar 191]),
    bnot (bands [bvar 1192, bvar 1194, bvar 191, bvar 193]),
    bnot (bands [bvar 1194, bvar 1195, bvar 193, bvar 194]),
    bnot (bands [bvar 171, bvar 172, bvar 1198, bvar 1199]),
    bnot (bands [bvar 171, bvar 173, bvar 1198, bvar 1200]),
    bnot (bands [bvar 171, bvar 175, bvar 1198, bvar 1202]),
    bnot (bands [bvar 171, bvar 176, bvar 1198, bvar 1203]),
    bnot (bands [bvar 171, bvar 177, bvar 1198, bvar 1204]),
    bnot (bands [bvar 171, bvar 178, bvar 1198, bvar 1205]),
    bnot (bands [bvar 171, bvar 179, bvar 1198, bvar 1206]),
    bnot (bands [bvar 171, bvar 181, bvar 1198, bvar 1208]),
    bnot (bands [bvar 172, bvar 175, bvar 1199, bvar 1202]) ]

def reducedUnionChunk072 : BVLogicalExpr :=
  bands reducedUnionChunk072Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
