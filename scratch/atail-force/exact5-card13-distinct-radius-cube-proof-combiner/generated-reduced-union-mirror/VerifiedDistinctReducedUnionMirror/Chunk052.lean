import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk052Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 36, bvar 37, bvar 1193, bvar 1194]),
    bnot (bands [bvar 36, bvar 38, bvar 1193, bvar 1195]),
    bnot (bands [bvar 37, bvar 38, bvar 1194, bvar 1195]),
    bnot (bands [bvar 1043, bvar 1048, bvar 185, bvar 190]),
    bnot (bands [bvar 1043, bvar 1049, bvar 185, bvar 191]),
    bnot (bands [bvar 1043, bvar 1050, bvar 185, bvar 192]),
    bnot (bands [bvar 1043, bvar 1051, bvar 185, bvar 193]),
    bnot (bands [bvar 1043, bvar 1052, bvar 185, bvar 194]),
    bnot (bands [bvar 1044, bvar 1046, bvar 186, bvar 188]),
    bnot (bands [bvar 1044, bvar 1048, bvar 186, bvar 190]),
    bnot (bands [bvar 1044, bvar 1049, bvar 186, bvar 191]),
    bnot (bands [bvar 1044, bvar 1050, bvar 186, bvar 192]),
    bnot (bands [bvar 1044, bvar 1051, bvar 186, bvar 193]),
    bnot (bands [bvar 1044, bvar 1052, bvar 186, bvar 194]),
    bnot (bands [bvar 1046, bvar 1047, bvar 188, bvar 189]),
    bnot (bands [bvar 1046, bvar 1048, bvar 188, bvar 190]),
    bnot (bands [bvar 1046, bvar 1049, bvar 188, bvar 191]),
    bnot (bands [bvar 1046, bvar 1050, bvar 188, bvar 192]),
    bnot (bands [bvar 1046, bvar 1051, bvar 188, bvar 193]),
    bnot (bands [bvar 1046, bvar 1052, bvar 188, bvar 194]),
    bnot (bands [bvar 1047, bvar 1049, bvar 189, bvar 191]),
    bnot (bands [bvar 1048, bvar 1049, bvar 190, bvar 191]),
    bnot (bands [bvar 1048, bvar 1050, bvar 190, bvar 192]),
    bnot (bands [bvar 1048, bvar 1051, bvar 190, bvar 193]),
    bnot (bands [bvar 1048, bvar 1052, bvar 190, bvar 194]),
    bnot (bands [bvar 1049, bvar 1050, bvar 191, bvar 192]),
    bnot (bands [bvar 1049, bvar 1051, bvar 191, bvar 193]),
    bnot (bands [bvar 1049, bvar 1052, bvar 191, bvar 194]),
    bnot (bands [bvar 1050, bvar 1051, bvar 192, bvar 193]),
    bnot (bands [bvar 29, bvar 34, bvar 1199, bvar 1204]),
    bnot (bands [bvar 29, bvar 35, bvar 1199, bvar 1205]),
    bnot (bands [bvar 29, bvar 36, bvar 1199, bvar 1206]),
    bnot (bands [bvar 29, bvar 38, bvar 1199, bvar 1208]),
    bnot (bands [bvar 29, bvar 39, bvar 1199, bvar 1209]),
    bnot (bands [bvar 30, bvar 34, bvar 1200, bvar 1204]),
    bnot (bands [bvar 30, bvar 35, bvar 1200, bvar 1205]),
    bnot (bands [bvar 30, bvar 36, bvar 1200, bvar 1206]),
    bnot (bands [bvar 30, bvar 37, bvar 1200, bvar 1207]),
    bnot (bands [bvar 30, bvar 38, bvar 1200, bvar 1208]),
    bnot (bands [bvar 30, bvar 39, bvar 1200, bvar 1209]),
    bnot (bands [bvar 32, bvar 33, bvar 1202, bvar 1203]),
    bnot (bands [bvar 32, bvar 34, bvar 1202, bvar 1204]),
    bnot (bands [bvar 32, bvar 35, bvar 1202, bvar 1205]),
    bnot (bands [bvar 32, bvar 36, bvar 1202, bvar 1206]),
    bnot (bands [bvar 32, bvar 37, bvar 1202, bvar 1207]),
    bnot (bands [bvar 32, bvar 38, bvar 1202, bvar 1208]),
    bnot (bands [bvar 32, bvar 39, bvar 1202, bvar 1209]),
    bnot (bands [bvar 33, bvar 35, bvar 1203, bvar 1205]),
    bnot (bands [bvar 33, bvar 36, bvar 1203, bvar 1206]),
    bnot (bands [bvar 34, bvar 35, bvar 1204, bvar 1205]),
    bnot (bands [bvar 34, bvar 36, bvar 1204, bvar 1206]),
    bnot (bands [bvar 34, bvar 37, bvar 1204, bvar 1207]),
    bnot (bands [bvar 34, bvar 38, bvar 1204, bvar 1208]),
    bnot (bands [bvar 34, bvar 39, bvar 1204, bvar 1209]),
    bnot (bands [bvar 35, bvar 36, bvar 1205, bvar 1206]),
    bnot (bands [bvar 35, bvar 37, bvar 1205, bvar 1207]),
    bnot (bands [bvar 35, bvar 38, bvar 1205, bvar 1208]),
    bnot (bands [bvar 35, bvar 39, bvar 1205, bvar 1209]),
    bnot (bands [bvar 36, bvar 38, bvar 1206, bvar 1208]),
    bnot (bands [bvar 37, bvar 38, bvar 1207, bvar 1208]),
    bnot (bands [bvar 37, bvar 39, bvar 1207, bvar 1209]),
    bnot (bands [bvar 38, bvar 39, bvar 1208, bvar 1209]),
    bnot (bands [bvar 1058, bvar 1064, bvar 57, bvar 63]),
    bnot (bands [bvar 1058, bvar 1065, bvar 57, bvar 64]) ]

def reducedUnionChunk052 : BVLogicalExpr :=
  bands reducedUnionChunk052Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
