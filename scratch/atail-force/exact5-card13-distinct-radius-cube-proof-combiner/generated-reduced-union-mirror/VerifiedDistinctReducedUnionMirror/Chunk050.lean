import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk050Assertions : List BVLogicalExpr :=
  [ atMost [bands [bvar 1042, bvar 158], bands [bvar 1043, bvar 159], bands [bvar 1044, bvar 160], bands [bvar 1045, bvar 161], bands [bvar 1046, bvar 162], bands [bvar 1047, bvar 163], bands [bvar 1048, bvar 164], bands [bvar 1049, bvar 165], bands [bvar 1050, bvar 166], bands [bvar 1051, bvar 167], bands [bvar 1052, bvar 168], bands [bvar 1053, bvar 169], bands [bvar 1054, bvar 170]] 2,
    bnot (bands [bvar 1043, bvar 1046, bvar 159, bvar 162]),
    bnot (bands [bvar 1043, bvar 1047, bvar 159, bvar 163]),
    bnot (bands [bvar 1043, bvar 1048, bvar 159, bvar 164]),
    bnot (bands [bvar 1043, bvar 1049, bvar 159, bvar 165]),
    bnot (bands [bvar 1043, bvar 1050, bvar 159, bvar 166]),
    bnot (bands [bvar 1043, bvar 1051, bvar 159, bvar 167]),
    bnot (bands [bvar 1044, bvar 1046, bvar 160, bvar 162]),
    bnot (bands [bvar 1044, bvar 1047, bvar 160, bvar 163]),
    bnot (bands [bvar 1044, bvar 1048, bvar 160, bvar 164]),
    bnot (bands [bvar 1044, bvar 1049, bvar 160, bvar 165]),
    bnot (bands [bvar 1044, bvar 1050, bvar 160, bvar 166]),
    bnot (bands [bvar 1044, bvar 1051, bvar 160, bvar 167]),
    bnot (bands [bvar 1045, bvar 1046, bvar 161, bvar 162]),
    bnot (bands [bvar 1045, bvar 1047, bvar 161, bvar 163]),
    bnot (bands [bvar 1045, bvar 1048, bvar 161, bvar 164]),
    bnot (bands [bvar 1045, bvar 1049, bvar 161, bvar 165]),
    bnot (bands [bvar 1045, bvar 1050, bvar 161, bvar 166]),
    bnot (bands [bvar 1045, bvar 1051, bvar 161, bvar 167]),
    bnot (bands [bvar 1046, bvar 1047, bvar 162, bvar 163]),
    bnot (bands [bvar 1046, bvar 1048, bvar 162, bvar 164]),
    bnot (bands [bvar 1046, bvar 1049, bvar 162, bvar 165]),
    bnot (bands [bvar 1046, bvar 1050, bvar 162, bvar 166]),
    bnot (bands [bvar 1046, bvar 1051, bvar 162, bvar 167]),
    bnot (bands [bvar 1047, bvar 1048, bvar 163, bvar 164]),
    bnot (bands [bvar 1047, bvar 1049, bvar 163, bvar 165]),
    bnot (bands [bvar 1047, bvar 1050, bvar 163, bvar 166]),
    bnot (bands [bvar 1047, bvar 1051, bvar 163, bvar 167]),
    bnot (bands [bvar 1048, bvar 1049, bvar 164, bvar 165]),
    bnot (bands [bvar 1048, bvar 1050, bvar 164, bvar 166]),
    bnot (bands [bvar 1048, bvar 1051, bvar 164, bvar 167]),
    bnot (bands [bvar 1049, bvar 1050, bvar 165, bvar 166]),
    bnot (bands [bvar 1049, bvar 1051, bvar 165, bvar 167]),
    bnot (bands [bvar 1050, bvar 1051, bvar 166, bvar 167]),
    bnot (bands [bvar 1053, bvar 1054, bvar 169, bvar 170]),
    atMost [bands [bvar 28, bvar 1172], bands [bvar 29, bvar 1173], bands [bvar 30, bvar 1174], bands [bvar 31, bvar 1175], bands [bvar 32, bvar 1176], bands [bvar 33, bvar 1177], bands [bvar 34, bvar 1178], bands [bvar 35, bvar 1179], bands [bvar 36, bvar 1180], bands [bvar 37, bvar 1181], bands [bvar 38, bvar 1182], bands [bvar 39, bvar 1183], bands [bvar 40, bvar 1184]] 2,
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
    bnot (bands [bvar 31, bvar 37, bvar 1175, bvar 1181]),
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
    bnot (bands [bvar 35, bvar 36, bvar 1179, bvar 1180]) ]

def reducedUnionChunk050 : BVLogicalExpr :=
  bands reducedUnionChunk050Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
