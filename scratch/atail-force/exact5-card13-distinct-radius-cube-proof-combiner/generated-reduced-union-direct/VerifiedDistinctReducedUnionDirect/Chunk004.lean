import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk004Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1045, bvar 1049, bvar 1188, bvar 1192]),
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
    bnot (bands [bvar 1050, bvar 1052, bvar 1193, bvar 1195]),
    bnot (bands [bvar 1051, bvar 1052, bvar 1194, bvar 1195]),
    bnot (bands [bvar 1043, bvar 1048, bvar 1199, bvar 1204]),
    bnot (bands [bvar 1043, bvar 1049, bvar 1199, bvar 1205]),
    bnot (bands [bvar 1043, bvar 1050, bvar 1199, bvar 1206]),
    bnot (bands [bvar 1043, bvar 1051, bvar 1199, bvar 1207]),
    bnot (bands [bvar 1043, bvar 1052, bvar 1199, bvar 1208]),
    bnot (bands [bvar 1043, bvar 1053, bvar 1199, bvar 1209]),
    bnot (bands [bvar 1044, bvar 1046, bvar 1200, bvar 1202]),
    bnot (bands [bvar 1044, bvar 1048, bvar 1200, bvar 1204]),
    bnot (bands [bvar 1044, bvar 1049, bvar 1200, bvar 1205]),
    bnot (bands [bvar 1044, bvar 1050, bvar 1200, bvar 1206]),
    bnot (bands [bvar 1044, bvar 1051, bvar 1200, bvar 1207]),
    bnot (bands [bvar 1044, bvar 1052, bvar 1200, bvar 1208]),
    bnot (bands [bvar 1044, bvar 1053, bvar 1200, bvar 1209]),
    bnot (bands [bvar 1046, bvar 1047, bvar 1202, bvar 1203]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1202, bvar 1204]),
    bnot (bands [bvar 1046, bvar 1049, bvar 1202, bvar 1205]),
    bnot (bands [bvar 1046, bvar 1050, bvar 1202, bvar 1206]),
    bnot (bands [bvar 1046, bvar 1051, bvar 1202, bvar 1207]),
    bnot (bands [bvar 1046, bvar 1052, bvar 1202, bvar 1208]),
    bnot (bands [bvar 1046, bvar 1053, bvar 1202, bvar 1209]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1203, bvar 1205]),
    bnot (bands [bvar 1047, bvar 1050, bvar 1203, bvar 1206]),
    bnot (bands [bvar 1047, bvar 1051, bvar 1203, bvar 1207]),
    bnot (bands [bvar 1047, bvar 1052, bvar 1203, bvar 1208]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1204, bvar 1205]),
    bnot (bands [bvar 1048, bvar 1050, bvar 1204, bvar 1206]),
    bnot (bands [bvar 1048, bvar 1051, bvar 1204, bvar 1207]),
    bnot (bands [bvar 1048, bvar 1052, bvar 1204, bvar 1208]),
    bnot (bands [bvar 1048, bvar 1053, bvar 1204, bvar 1209]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1205, bvar 1206]),
    bnot (bands [bvar 1049, bvar 1051, bvar 1205, bvar 1207]),
    bnot (bands [bvar 1049, bvar 1052, bvar 1205, bvar 1208]),
    bnot (bands [bvar 1049, bvar 1053, bvar 1205, bvar 1209]),
    bnot (bands [bvar 1058, bvar 1061, bvar 1071, bvar 1074]),
    bnot (bands [bvar 1058, bvar 1063, bvar 1071, bvar 1076]),
    bnot (bands [bvar 1058, bvar 1064, bvar 1071, bvar 1077]),
    bnot (bands [bvar 1058, bvar 1065, bvar 1071, bvar 1078]),
    bnot (bands [bvar 1058, bvar 1067, bvar 1071, bvar 1080]),
    bnot (bands [bvar 1061, bvar 1065, bvar 1074, bvar 1078]),
    bnot (bands [bvar 1061, bvar 1067, bvar 1074, bvar 1080]),
    bnot (bands [bvar 1063, bvar 1064, bvar 1076, bvar 1077]) ]

def reducedUnionChunk004 : BVLogicalExpr :=
  bands reducedUnionChunk004Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
