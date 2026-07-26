import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk051Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 35, bvar 37, bvar 1179, bvar 1181]),
    bnot (bands [bvar 1043, bvar 1046, bvar 172, bvar 175]),
    bnot (bands [bvar 1043, bvar 1047, bvar 172, bvar 176]),
    bnot (bands [bvar 1043, bvar 1048, bvar 172, bvar 177]),
    bnot (bands [bvar 1043, bvar 1049, bvar 172, bvar 178]),
    bnot (bands [bvar 1043, bvar 1050, bvar 172, bvar 179]),
    bnot (bands [bvar 1043, bvar 1051, bvar 172, bvar 180]),
    bnot (bands [bvar 1043, bvar 1052, bvar 172, bvar 181]),
    bnot (bands [bvar 1044, bvar 1046, bvar 173, bvar 175]),
    bnot (bands [bvar 1044, bvar 1047, bvar 173, bvar 176]),
    bnot (bands [bvar 1044, bvar 1048, bvar 173, bvar 177]),
    bnot (bands [bvar 1044, bvar 1049, bvar 173, bvar 178]),
    bnot (bands [bvar 1044, bvar 1050, bvar 173, bvar 179]),
    bnot (bands [bvar 1044, bvar 1051, bvar 173, bvar 180]),
    bnot (bands [bvar 1044, bvar 1052, bvar 173, bvar 181]),
    bnot (bands [bvar 1045, bvar 1047, bvar 174, bvar 176]),
    bnot (bands [bvar 1045, bvar 1048, bvar 174, bvar 177]),
    bnot (bands [bvar 1045, bvar 1049, bvar 174, bvar 178]),
    bnot (bands [bvar 1046, bvar 1047, bvar 175, bvar 176]),
    bnot (bands [bvar 1046, bvar 1048, bvar 175, bvar 177]),
    bnot (bands [bvar 1046, bvar 1049, bvar 175, bvar 178]),
    bnot (bands [bvar 1046, bvar 1050, bvar 175, bvar 179]),
    bnot (bands [bvar 1046, bvar 1051, bvar 175, bvar 180]),
    bnot (bands [bvar 1046, bvar 1052, bvar 175, bvar 181]),
    bnot (bands [bvar 1047, bvar 1048, bvar 176, bvar 177]),
    bnot (bands [bvar 1047, bvar 1049, bvar 176, bvar 178]),
    bnot (bands [bvar 1047, bvar 1050, bvar 176, bvar 179]),
    bnot (bands [bvar 1047, bvar 1051, bvar 176, bvar 180]),
    bnot (bands [bvar 1047, bvar 1052, bvar 176, bvar 181]),
    bnot (bands [bvar 1048, bvar 1049, bvar 177, bvar 178]),
    bnot (bands [bvar 1048, bvar 1050, bvar 177, bvar 179]),
    bnot (bands [bvar 1048, bvar 1051, bvar 177, bvar 180]),
    bnot (bands [bvar 1048, bvar 1052, bvar 177, bvar 181]),
    bnot (bands [bvar 1049, bvar 1050, bvar 178, bvar 179]),
    bnot (bands [bvar 1049, bvar 1051, bvar 178, bvar 180]),
    bnot (bands [bvar 1049, bvar 1052, bvar 178, bvar 181]),
    bnot (bands [bvar 1050, bvar 1051, bvar 179, bvar 180]),
    bnot (bands [bvar 1050, bvar 1052, bvar 179, bvar 181]),
    bnot (bands [bvar 1051, bvar 1052, bvar 180, bvar 181]),
    bnot (bands [bvar 29, bvar 32, bvar 1186, bvar 1189]),
    bnot (bands [bvar 29, bvar 34, bvar 1186, bvar 1191]),
    bnot (bands [bvar 29, bvar 35, bvar 1186, bvar 1192]),
    bnot (bands [bvar 29, bvar 36, bvar 1186, bvar 1193]),
    bnot (bands [bvar 29, bvar 37, bvar 1186, bvar 1194]),
    bnot (bands [bvar 29, bvar 38, bvar 1186, bvar 1195]),
    bnot (bands [bvar 30, bvar 34, bvar 1187, bvar 1191]),
    bnot (bands [bvar 30, bvar 35, bvar 1187, bvar 1192]),
    bnot (bands [bvar 30, bvar 36, bvar 1187, bvar 1193]),
    bnot (bands [bvar 30, bvar 37, bvar 1187, bvar 1194]),
    bnot (bands [bvar 30, bvar 38, bvar 1187, bvar 1195]),
    bnot (bands [bvar 32, bvar 33, bvar 1189, bvar 1190]),
    bnot (bands [bvar 32, bvar 34, bvar 1189, bvar 1191]),
    bnot (bands [bvar 32, bvar 35, bvar 1189, bvar 1192]),
    bnot (bands [bvar 32, bvar 36, bvar 1189, bvar 1193]),
    bnot (bands [bvar 32, bvar 37, bvar 1189, bvar 1194]),
    bnot (bands [bvar 32, bvar 38, bvar 1189, bvar 1195]),
    bnot (bands [bvar 33, bvar 35, bvar 1190, bvar 1192]),
    bnot (bands [bvar 34, bvar 35, bvar 1191, bvar 1192]),
    bnot (bands [bvar 34, bvar 36, bvar 1191, bvar 1193]),
    bnot (bands [bvar 34, bvar 37, bvar 1191, bvar 1194]),
    bnot (bands [bvar 34, bvar 38, bvar 1191, bvar 1195]),
    bnot (bands [bvar 35, bvar 36, bvar 1192, bvar 1193]),
    bnot (bands [bvar 35, bvar 37, bvar 1192, bvar 1194]),
    bnot (bands [bvar 35, bvar 38, bvar 1192, bvar 1195]) ]

def reducedUnionChunk051 : BVLogicalExpr :=
  bands reducedUnionChunk051Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
