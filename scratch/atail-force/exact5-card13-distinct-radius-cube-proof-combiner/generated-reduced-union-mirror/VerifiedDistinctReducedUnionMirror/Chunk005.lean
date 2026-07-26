import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk005Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1045, bvar 1047, bvar 1201, bvar 1203]),
    bnot (bands [bvar 1045, bvar 1048, bvar 1201, bvar 1204]),
    bnot (bands [bvar 1045, bvar 1049, bvar 1201, bvar 1205]),
    bnot (bands [bvar 1045, bvar 1050, bvar 1201, bvar 1206]),
    bnot (bands [bvar 1045, bvar 1052, bvar 1201, bvar 1208]),
    bnot (bands [bvar 1045, bvar 1053, bvar 1201, bvar 1209]),
    bnot (bands [bvar 1046, bvar 1047, bvar 1202, bvar 1203]),
    bnot (bands [bvar 1046, bvar 1048, bvar 1202, bvar 1204]),
    bnot (bands [bvar 1046, bvar 1049, bvar 1202, bvar 1205]),
    bnot (bands [bvar 1046, bvar 1050, bvar 1202, bvar 1206]),
    bnot (bands [bvar 1046, bvar 1051, bvar 1202, bvar 1207]),
    bnot (bands [bvar 1046, bvar 1052, bvar 1202, bvar 1208]),
    bnot (bands [bvar 1046, bvar 1053, bvar 1202, bvar 1209]),
    bnot (bands [bvar 1047, bvar 1048, bvar 1203, bvar 1204]),
    bnot (bands [bvar 1047, bvar 1049, bvar 1203, bvar 1205]),
    bnot (bands [bvar 1047, bvar 1050, bvar 1203, bvar 1206]),
    bnot (bands [bvar 1047, bvar 1051, bvar 1203, bvar 1207]),
    bnot (bands [bvar 1047, bvar 1052, bvar 1203, bvar 1208]),
    bnot (bands [bvar 1047, bvar 1053, bvar 1203, bvar 1209]),
    bnot (bands [bvar 1048, bvar 1049, bvar 1204, bvar 1205]),
    bnot (bands [bvar 1048, bvar 1050, bvar 1204, bvar 1206]),
    bnot (bands [bvar 1048, bvar 1051, bvar 1204, bvar 1207]),
    bnot (bands [bvar 1048, bvar 1052, bvar 1204, bvar 1208]),
    bnot (bands [bvar 1048, bvar 1053, bvar 1204, bvar 1209]),
    bnot (bands [bvar 1049, bvar 1050, bvar 1205, bvar 1206]),
    bnot (bands [bvar 1049, bvar 1051, bvar 1205, bvar 1207]),
    bnot (bands [bvar 1049, bvar 1052, bvar 1205, bvar 1208]),
    bnot (bands [bvar 1049, bvar 1053, bvar 1205, bvar 1209]),
    bnot (bands [bvar 1051, bvar 1052, bvar 1207, bvar 1208]),
    bnot (bands [bvar 1058, bvar 1060, bvar 1071, bvar 1073]),
    bnot (bands [bvar 1058, bvar 1061, bvar 1071, bvar 1074]),
    bnot (bands [bvar 1058, bvar 1062, bvar 1071, bvar 1075]),
    bnot (bands [bvar 1058, bvar 1063, bvar 1071, bvar 1076]),
    bnot (bands [bvar 1058, bvar 1064, bvar 1071, bvar 1077]),
    bnot (bands [bvar 1058, bvar 1065, bvar 1071, bvar 1078]),
    bnot (bands [bvar 1058, bvar 1067, bvar 1071, bvar 1080]),
    bnot (bands [bvar 1060, bvar 1065, bvar 1073, bvar 1078]),
    bnot (bands [bvar 1061, bvar 1065, bvar 1074, bvar 1078]),
    bnot (bands [bvar 1061, bvar 1067, bvar 1074, bvar 1080]),
    bnot (bands [bvar 1062, bvar 1064, bvar 1075, bvar 1077]),
    bnot (bands [bvar 1063, bvar 1064, bvar 1076, bvar 1077]),
    bnot (bands [bvar 1055, bvar 1059, bvar 1081, bvar 1085]),
    bnot (bands [bvar 1055, bvar 1060, bvar 1081, bvar 1086]),
    bnot (bands [bvar 1055, bvar 1061, bvar 1081, bvar 1087]),
    bnot (bands [bvar 1055, bvar 1062, bvar 1081, bvar 1088]),
    bnot (bands [bvar 1055, bvar 1063, bvar 1081, bvar 1089]),
    bnot (bands [bvar 1055, bvar 1064, bvar 1081, bvar 1090]),
    bnot (bands [bvar 1055, bvar 1065, bvar 1081, bvar 1091]),
    bnot (bands [bvar 1055, bvar 1066, bvar 1081, bvar 1092]),
    bnot (bands [bvar 1055, bvar 1067, bvar 1081, bvar 1093]),
    bnot (bands [bvar 1059, bvar 1060, bvar 1085, bvar 1086]),
    bnot (bands [bvar 1059, bvar 1061, bvar 1085, bvar 1087]),
    bnot (bands [bvar 1059, bvar 1062, bvar 1085, bvar 1088]),
    bnot (bands [bvar 1059, bvar 1063, bvar 1085, bvar 1089]),
    bnot (bands [bvar 1059, bvar 1064, bvar 1085, bvar 1090]),
    bnot (bands [bvar 1059, bvar 1065, bvar 1085, bvar 1091]),
    bnot (bands [bvar 1059, bvar 1066, bvar 1085, bvar 1092]),
    bnot (bands [bvar 1059, bvar 1067, bvar 1085, bvar 1093]),
    bnot (bands [bvar 1060, bvar 1062, bvar 1086, bvar 1088]),
    bnot (bands [bvar 1060, bvar 1063, bvar 1086, bvar 1089]),
    bnot (bands [bvar 1060, bvar 1064, bvar 1086, bvar 1090]),
    bnot (bands [bvar 1060, bvar 1065, bvar 1086, bvar 1091]),
    bnot (bands [bvar 1060, bvar 1066, bvar 1086, bvar 1092]),
    bnot (bands [bvar 1061, bvar 1063, bvar 1087, bvar 1089]) ]

def reducedUnionChunk005 : BVLogicalExpr :=
  bands reducedUnionChunk005Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
