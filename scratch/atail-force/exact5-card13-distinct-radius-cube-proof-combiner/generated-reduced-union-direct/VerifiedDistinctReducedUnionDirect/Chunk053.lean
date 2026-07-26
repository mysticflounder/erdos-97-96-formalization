import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk053Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1048, bvar 1050, bvar 177, bvar 179]),
    bnot (bands [bvar 1048, bvar 1051, bvar 177, bvar 180]),
    bnot (bands [bvar 1048, bvar 1052, bvar 177, bvar 181]),
    bnot (bands [bvar 1049, bvar 1050, bvar 178, bvar 179]),
    bnot (bands [bvar 1049, bvar 1051, bvar 178, bvar 180]),
    bnot (bands [bvar 1049, bvar 1052, bvar 178, bvar 181]),
    bnot (bands [bvar 29, bvar 32, bvar 1186, bvar 1189]),
    bnot (bands [bvar 29, bvar 33, bvar 1186, bvar 1190]),
    bnot (bands [bvar 29, bvar 34, bvar 1186, bvar 1191]),
    bnot (bands [bvar 29, bvar 35, bvar 1186, bvar 1192]),
    bnot (bands [bvar 29, bvar 36, bvar 1186, bvar 1193]),
    bnot (bands [bvar 29, bvar 38, bvar 1186, bvar 1195]),
    bnot (bands [bvar 30, bvar 32, bvar 1187, bvar 1189]),
    bnot (bands [bvar 30, bvar 33, bvar 1187, bvar 1190]),
    bnot (bands [bvar 30, bvar 34, bvar 1187, bvar 1191]),
    bnot (bands [bvar 30, bvar 35, bvar 1187, bvar 1192]),
    bnot (bands [bvar 30, bvar 36, bvar 1187, bvar 1193]),
    bnot (bands [bvar 30, bvar 38, bvar 1187, bvar 1195]),
    bnot (bands [bvar 31, bvar 33, bvar 1188, bvar 1190]),
    bnot (bands [bvar 31, bvar 34, bvar 1188, bvar 1191]),
    bnot (bands [bvar 31, bvar 35, bvar 1188, bvar 1192]),
    bnot (bands [bvar 31, bvar 38, bvar 1188, bvar 1195]),
    bnot (bands [bvar 32, bvar 33, bvar 1189, bvar 1190]),
    bnot (bands [bvar 32, bvar 34, bvar 1189, bvar 1191]),
    bnot (bands [bvar 32, bvar 35, bvar 1189, bvar 1192]),
    bnot (bands [bvar 32, bvar 36, bvar 1189, bvar 1193]),
    bnot (bands [bvar 32, bvar 38, bvar 1189, bvar 1195]),
    bnot (bands [bvar 33, bvar 34, bvar 1190, bvar 1191]),
    bnot (bands [bvar 33, bvar 35, bvar 1190, bvar 1192]),
    bnot (bands [bvar 33, bvar 36, bvar 1190, bvar 1193]),
    bnot (bands [bvar 33, bvar 37, bvar 1190, bvar 1194]),
    bnot (bands [bvar 33, bvar 38, bvar 1190, bvar 1195]),
    bnot (bands [bvar 34, bvar 35, bvar 1191, bvar 1192]),
    bnot (bands [bvar 34, bvar 36, bvar 1191, bvar 1193]),
    bnot (bands [bvar 34, bvar 37, bvar 1191, bvar 1194]),
    bnot (bands [bvar 34, bvar 38, bvar 1191, bvar 1195]),
    bnot (bands [bvar 35, bvar 36, bvar 1192, bvar 1193]),
    bnot (bands [bvar 35, bvar 37, bvar 1192, bvar 1194]),
    bnot (bands [bvar 35, bvar 38, bvar 1192, bvar 1195]),
    bnot (bands [bvar 36, bvar 38, bvar 1193, bvar 1195]),
    bnot (bands [bvar 1043, bvar 1047, bvar 185, bvar 189]),
    bnot (bands [bvar 1043, bvar 1048, bvar 185, bvar 190]),
    bnot (bands [bvar 1043, bvar 1049, bvar 185, bvar 191]),
    bnot (bands [bvar 1043, bvar 1050, bvar 185, bvar 192]),
    bnot (bands [bvar 1043, bvar 1051, bvar 185, bvar 193]),
    bnot (bands [bvar 1043, bvar 1053, bvar 185, bvar 195]),
    bnot (bands [bvar 1044, bvar 1046, bvar 186, bvar 188]),
    bnot (bands [bvar 1044, bvar 1047, bvar 186, bvar 189]),
    bnot (bands [bvar 1044, bvar 1048, bvar 186, bvar 190]),
    bnot (bands [bvar 1044, bvar 1049, bvar 186, bvar 191]),
    bnot (bands [bvar 1044, bvar 1050, bvar 186, bvar 192]),
    bnot (bands [bvar 1044, bvar 1051, bvar 186, bvar 193]),
    bnot (bands [bvar 1044, bvar 1053, bvar 186, bvar 195]),
    bnot (bands [bvar 1045, bvar 1047, bvar 187, bvar 189]),
    bnot (bands [bvar 1045, bvar 1049, bvar 187, bvar 191]),
    bnot (bands [bvar 1045, bvar 1052, bvar 187, bvar 194]),
    bnot (bands [bvar 1046, bvar 1047, bvar 188, bvar 189]),
    bnot (bands [bvar 1046, bvar 1048, bvar 188, bvar 190]),
    bnot (bands [bvar 1046, bvar 1049, bvar 188, bvar 191]),
    bnot (bands [bvar 1046, bvar 1050, bvar 188, bvar 192]),
    bnot (bands [bvar 1046, bvar 1051, bvar 188, bvar 193]),
    bnot (bands [bvar 1046, bvar 1053, bvar 188, bvar 195]),
    bnot (bands [bvar 1047, bvar 1048, bvar 189, bvar 190]),
    bnot (bands [bvar 1047, bvar 1049, bvar 189, bvar 191]) ]

def reducedUnionChunk053 : BVLogicalExpr :=
  bands reducedUnionChunk053Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
