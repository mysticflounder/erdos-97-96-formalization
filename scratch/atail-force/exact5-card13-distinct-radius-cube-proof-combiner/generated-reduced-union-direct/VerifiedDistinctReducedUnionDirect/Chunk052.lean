import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk052Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1047, bvar 1050, bvar 163, bvar 166]),
    bnot (bands [bvar 1047, bvar 1051, bvar 163, bvar 167]),
    bnot (bands [bvar 1048, bvar 1049, bvar 164, bvar 165]),
    bnot (bands [bvar 1048, bvar 1050, bvar 164, bvar 166]),
    bnot (bands [bvar 1048, bvar 1051, bvar 164, bvar 167]),
    bnot (bands [bvar 1049, bvar 1050, bvar 165, bvar 166]),
    bnot (bands [bvar 1049, bvar 1051, bvar 165, bvar 167]),
    bnot (bands [bvar 29, bvar 32, bvar 1173, bvar 1176]),
    bnot (bands [bvar 29, bvar 33, bvar 1173, bvar 1177]),
    bnot (bands [bvar 29, bvar 34, bvar 1173, bvar 1178]),
    bnot (bands [bvar 29, bvar 35, bvar 1173, bvar 1179]),
    bnot (bands [bvar 29, bvar 36, bvar 1173, bvar 1180]),
    bnot (bands [bvar 29, bvar 37, bvar 1173, bvar 1181]),
    bnot (bands [bvar 30, bvar 33, bvar 1174, bvar 1177]),
    bnot (bands [bvar 30, bvar 34, bvar 1174, bvar 1178]),
    bnot (bands [bvar 30, bvar 35, bvar 1174, bvar 1179]),
    bnot (bands [bvar 30, bvar 36, bvar 1174, bvar 1180]),
    bnot (bands [bvar 30, bvar 37, bvar 1174, bvar 1181]),
    bnot (bands [bvar 31, bvar 33, bvar 1175, bvar 1177]),
    bnot (bands [bvar 31, bvar 34, bvar 1175, bvar 1178]),
    bnot (bands [bvar 31, bvar 35, bvar 1175, bvar 1179]),
    bnot (bands [bvar 32, bvar 33, bvar 1176, bvar 1177]),
    bnot (bands [bvar 32, bvar 34, bvar 1176, bvar 1178]),
    bnot (bands [bvar 32, bvar 35, bvar 1176, bvar 1179]),
    bnot (bands [bvar 32, bvar 36, bvar 1176, bvar 1180]),
    bnot (bands [bvar 32, bvar 37, bvar 1176, bvar 1181]),
    bnot (bands [bvar 33, bvar 34, bvar 1177, bvar 1178]),
    bnot (bands [bvar 33, bvar 35, bvar 1177, bvar 1179]),
    bnot (bands [bvar 33, bvar 36, bvar 1177, bvar 1180]),
    bnot (bands [bvar 33, bvar 37, bvar 1177, bvar 1181]),
    bnot (bands [bvar 34, bvar 35, bvar 1178, bvar 1179]),
    bnot (bands [bvar 34, bvar 36, bvar 1178, bvar 1180]),
    bnot (bands [bvar 34, bvar 37, bvar 1178, bvar 1181]),
    bnot (bands [bvar 35, bvar 36, bvar 1179, bvar 1180]),
    bnot (bands [bvar 35, bvar 37, bvar 1179, bvar 1181]),
    bnot (bands [bvar 39, bvar 40, bvar 1183, bvar 1184]),
    bnot (bands [bvar 1043, bvar 1046, bvar 172, bvar 175]),
    bnot (bands [bvar 1043, bvar 1047, bvar 172, bvar 176]),
    bnot (bands [bvar 1043, bvar 1048, bvar 172, bvar 177]),
    bnot (bands [bvar 1043, bvar 1049, bvar 172, bvar 178]),
    bnot (bands [bvar 1043, bvar 1050, bvar 172, bvar 179]),
    bnot (bands [bvar 1043, bvar 1051, bvar 172, bvar 180]),
    bnot (bands [bvar 1044, bvar 1046, bvar 173, bvar 175]),
    bnot (bands [bvar 1044, bvar 1047, bvar 173, bvar 176]),
    bnot (bands [bvar 1044, bvar 1048, bvar 173, bvar 177]),
    bnot (bands [bvar 1044, bvar 1049, bvar 173, bvar 178]),
    bnot (bands [bvar 1044, bvar 1050, bvar 173, bvar 179]),
    bnot (bands [bvar 1044, bvar 1051, bvar 173, bvar 180]),
    bnot (bands [bvar 1044, bvar 1052, bvar 173, bvar 181]),
    bnot (bands [bvar 1045, bvar 1047, bvar 174, bvar 176]),
    bnot (bands [bvar 1045, bvar 1049, bvar 174, bvar 178]),
    bnot (bands [bvar 1045, bvar 1050, bvar 174, bvar 179]),
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
    bnot (bands [bvar 1048, bvar 1049, bvar 177, bvar 178]) ]

def reducedUnionChunk052 : BVLogicalExpr :=
  bands reducedUnionChunk052Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
