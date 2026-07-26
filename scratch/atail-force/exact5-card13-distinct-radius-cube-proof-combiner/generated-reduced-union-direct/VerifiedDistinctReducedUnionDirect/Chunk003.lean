import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk003Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1044, bvar 1049, bvar 1161, bvar 1166]),
    bnot (bands [bvar 1044, bvar 1050, bvar 1161, bvar 1167]),
    bnot (bands [bvar 1045, bvar 1047, bvar 1162, bvar 1164]),
    bnot (bands [bvar 1045, bvar 1048, bvar 1162, bvar 1165]),
    bnot (bands [bvar 1045, bvar 1049, bvar 1162, bvar 1166]),
    bnot (bands [bvar 1046, bvar 1047, bvar 1163, bvar 1164]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1163, bvar 1165]),
    bnot (bands [bvar 1046, bvar 1049, bvar 1163, bvar 1166]),
    bnot (bands [bvar 1046, bvar 1050, bvar 1163, bvar 1167]),
    bnot (bands [bvar 1047, bvar 1048, bvar 1164, bvar 1165]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1164, bvar 1166]),
    bnot (bands [bvar 1047, bvar 1050, bvar 1164, bvar 1167]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1165, bvar 1166]),
    bnot (bands [bvar 1048, bvar 1050, bvar 1165, bvar 1167]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1166, bvar 1167]),
    bnot (bands [bvar 1052, bvar 1054, bvar 1169, bvar 1171]),
    bnot (bands [bvar 1043, bvar 1046, bvar 1173, bvar 1176]),
    bnot (bands [bvar 1043, bvar 1047, bvar 1173, bvar 1177]),
    bnot (bands [bvar 1043, bvar 1048, bvar 1173, bvar 1178]),
    bnot (bands [bvar 1043, bvar 1049, bvar 1173, bvar 1179]),
    bnot (bands [bvar 1043, bvar 1050, bvar 1173, bvar 1180]),
    bnot (bands [bvar 1043, bvar 1051, bvar 1173, bvar 1181]),
    bnot (bands [bvar 1044, bvar 1047, bvar 1174, bvar 1177]),
    bnot (bands [bvar 1044, bvar 1048, bvar 1174, bvar 1178]),
    bnot (bands [bvar 1044, bvar 1049, bvar 1174, bvar 1179]),
    bnot (bands [bvar 1044, bvar 1050, bvar 1174, bvar 1180]),
    bnot (bands [bvar 1044, bvar 1051, bvar 1174, bvar 1181]),
    bnot (bands [bvar 1045, bvar 1046, bvar 1175, bvar 1176]),
    bnot (bands [bvar 1045, bvar 1047, bvar 1175, bvar 1177]),
    bnot (bands [bvar 1045, bvar 1048, bvar 1175, bvar 1178]),
    bnot (bands [bvar 1045, bvar 1049, bvar 1175, bvar 1179]),
    bnot (bands [bvar 1045, bvar 1050, bvar 1175, bvar 1180]),
    bnot (bands [bvar 1045, bvar 1051, bvar 1175, bvar 1181]),
    bnot (bands [bvar 1046, bvar 1047, bvar 1176, bvar 1177]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1176, bvar 1178]),
    bnot (bands [bvar 1046, bvar 1049, bvar 1176, bvar 1179]),
    bnot (bands [bvar 1046, bvar 1050, bvar 1176, bvar 1180]),
    bnot (bands [bvar 1046, bvar 1051, bvar 1176, bvar 1181]),
    bnot (bands [bvar 1047, bvar 1048, bvar 1177, bvar 1178]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1177, bvar 1179]),
    bnot (bands [bvar 1047, bvar 1050, bvar 1177, bvar 1180]),
    bnot (bands [bvar 1047, bvar 1051, bvar 1177, bvar 1181]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1178, bvar 1179]),
    bnot (bands [bvar 1048, bvar 1050, bvar 1178, bvar 1180]),
    bnot (bands [bvar 1048, bvar 1051, bvar 1178, bvar 1181]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1179, bvar 1180]),
    bnot (bands [bvar 1049, bvar 1051, bvar 1179, bvar 1181]),
    bnot (bands [bvar 1053, bvar 1054, bvar 1183, bvar 1184]),
    bnot (bands [bvar 1043, bvar 1046, bvar 1186, bvar 1189]),
    bnot (bands [bvar 1043, bvar 1047, bvar 1186, bvar 1190]),
    bnot (bands [bvar 1043, bvar 1048, bvar 1186, bvar 1191]),
    bnot (bands [bvar 1043, bvar 1049, bvar 1186, bvar 1192]),
    bnot (bands [bvar 1043, bvar 1050, bvar 1186, bvar 1193]),
    bnot (bands [bvar 1043, bvar 1051, bvar 1186, bvar 1194]),
    bnot (bands [bvar 1043, bvar 1052, bvar 1186, bvar 1195]),
    bnot (bands [bvar 1044, bvar 1046, bvar 1187, bvar 1189]),
    bnot (bands [bvar 1044, bvar 1047, bvar 1187, bvar 1190]),
    bnot (bands [bvar 1044, bvar 1048, bvar 1187, bvar 1191]),
    bnot (bands [bvar 1044, bvar 1049, bvar 1187, bvar 1192]),
    bnot (bands [bvar 1044, bvar 1050, bvar 1187, bvar 1193]),
    bnot (bands [bvar 1044, bvar 1051, bvar 1187, bvar 1194]),
    bnot (bands [bvar 1044, bvar 1052, bvar 1187, bvar 1195]),
    bnot (bands [bvar 1045, bvar 1047, bvar 1188, bvar 1190]),
    bnot (bands [bvar 1045, bvar 1048, bvar 1188, bvar 1191]) ]

def reducedUnionChunk003 : BVLogicalExpr :=
  bands reducedUnionChunk003Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
