import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk004Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1046, bvar 1051, bvar 1176, bvar 1181]),
    bnot (bands [bvar 1047, bvar 1048, bvar 1177, bvar 1178]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1177, bvar 1179]),
    bnot (bands [bvar 1047, bvar 1050, bvar 1177, bvar 1180]),
    bnot (bands [bvar 1047, bvar 1051, bvar 1177, bvar 1181]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1178, bvar 1179]),
    bnot (bands [bvar 1048, bvar 1050, bvar 1178, bvar 1180]),
    bnot (bands [bvar 1048, bvar 1051, bvar 1178, bvar 1181]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1179, bvar 1180]),
    bnot (bands [bvar 1049, bvar 1051, bvar 1179, bvar 1181]),
    bnot (bands [bvar 1050, bvar 1051, bvar 1180, bvar 1181]),
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
    bnot (bands [bvar 1045, bvar 1048, bvar 1188, bvar 1191]),
    bnot (bands [bvar 1045, bvar 1049, bvar 1188, bvar 1192]),
    bnot (bands [bvar 1045, bvar 1050, bvar 1188, bvar 1193]),
    bnot (bands [bvar 1045, bvar 1051, bvar 1188, bvar 1194]),
    bnot (bands [bvar 1045, bvar 1052, bvar 1188, bvar 1195]),
    bnot (bands [bvar 1046, bvar 1047, bvar 1189, bvar 1190]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1189, bvar 1191]),
    bnot (bands [bvar 1046, bvar 1049, bvar 1189, bvar 1192]),
    bnot (bands [bvar 1046, bvar 1050, bvar 1189, bvar 1193]),
    bnot (bands [bvar 1046, bvar 1051, bvar 1189, bvar 1194]),
    bnot (bands [bvar 1046, bvar 1052, bvar 1189, bvar 1195]),
    bnot (bands [bvar 1047, bvar 1048, bvar 1190, bvar 1191]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1190, bvar 1192]),
    bnot (bands [bvar 1047, bvar 1050, bvar 1190, bvar 1193]),
    bnot (bands [bvar 1047, bvar 1051, bvar 1190, bvar 1194]),
    bnot (bands [bvar 1047, bvar 1052, bvar 1190, bvar 1195]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1191, bvar 1192]),
    bnot (bands [bvar 1048, bvar 1050, bvar 1191, bvar 1193]),
    bnot (bands [bvar 1048, bvar 1051, bvar 1191, bvar 1194]),
    bnot (bands [bvar 1048, bvar 1052, bvar 1191, bvar 1195]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1192, bvar 1193]),
    bnot (bands [bvar 1049, bvar 1051, bvar 1192, bvar 1194]),
    bnot (bands [bvar 1049, bvar 1052, bvar 1192, bvar 1195]),
    bnot (bands [bvar 1050, bvar 1051, bvar 1193, bvar 1194]),
    bnot (bands [bvar 1043, bvar 1047, bvar 1199, bvar 1203]),
    bnot (bands [bvar 1043, bvar 1048, bvar 1199, bvar 1204]),
    bnot (bands [bvar 1043, bvar 1049, bvar 1199, bvar 1205]),
    bnot (bands [bvar 1043, bvar 1050, bvar 1199, bvar 1206]),
    bnot (bands [bvar 1043, bvar 1051, bvar 1199, bvar 1207]),
    bnot (bands [bvar 1043, bvar 1052, bvar 1199, bvar 1208]),
    bnot (bands [bvar 1043, bvar 1053, bvar 1199, bvar 1209]),
    bnot (bands [bvar 1044, bvar 1047, bvar 1200, bvar 1203]),
    bnot (bands [bvar 1044, bvar 1048, bvar 1200, bvar 1204]),
    bnot (bands [bvar 1044, bvar 1049, bvar 1200, bvar 1205]),
    bnot (bands [bvar 1044, bvar 1050, bvar 1200, bvar 1206]),
    bnot (bands [bvar 1044, bvar 1051, bvar 1200, bvar 1207]),
    bnot (bands [bvar 1044, bvar 1052, bvar 1200, bvar 1208]),
    bnot (bands [bvar 1044, bvar 1053, bvar 1200, bvar 1209]) ]

def reducedUnionChunk004 : BVLogicalExpr :=
  bands reducedUnionChunk004Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
