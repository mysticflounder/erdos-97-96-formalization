import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk054Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1047, bvar 1050, bvar 189, bvar 192]),
    bnot (bands [bvar 1047, bvar 1051, bvar 189, bvar 193]),
    bnot (bands [bvar 1047, bvar 1052, bvar 189, bvar 194]),
    bnot (bands [bvar 1047, bvar 1053, bvar 189, bvar 195]),
    bnot (bands [bvar 1048, bvar 1049, bvar 190, bvar 191]),
    bnot (bands [bvar 1048, bvar 1050, bvar 190, bvar 192]),
    bnot (bands [bvar 1048, bvar 1051, bvar 190, bvar 193]),
    bnot (bands [bvar 1048, bvar 1052, bvar 190, bvar 194]),
    bnot (bands [bvar 1048, bvar 1053, bvar 190, bvar 195]),
    bnot (bands [bvar 1049, bvar 1050, bvar 191, bvar 192]),
    bnot (bands [bvar 1049, bvar 1051, bvar 191, bvar 193]),
    bnot (bands [bvar 1049, bvar 1052, bvar 191, bvar 194]),
    bnot (bands [bvar 1049, bvar 1053, bvar 191, bvar 195]),
    bnot (bands [bvar 1050, bvar 1053, bvar 192, bvar 195]),
    bnot (bands [bvar 1051, bvar 1053, bvar 193, bvar 195]),
    bnot (bands [bvar 29, bvar 33, bvar 1199, bvar 1203]),
    bnot (bands [bvar 29, bvar 34, bvar 1199, bvar 1204]),
    bnot (bands [bvar 29, bvar 35, bvar 1199, bvar 1205]),
    bnot (bands [bvar 29, bvar 36, bvar 1199, bvar 1206]),
    bnot (bands [bvar 29, bvar 38, bvar 1199, bvar 1208]),
    bnot (bands [bvar 29, bvar 39, bvar 1199, bvar 1209]),
    bnot (bands [bvar 30, bvar 32, bvar 1200, bvar 1202]),
    bnot (bands [bvar 30, bvar 33, bvar 1200, bvar 1203]),
    bnot (bands [bvar 30, bvar 34, bvar 1200, bvar 1204]),
    bnot (bands [bvar 30, bvar 35, bvar 1200, bvar 1205]),
    bnot (bands [bvar 30, bvar 36, bvar 1200, bvar 1206]),
    bnot (bands [bvar 30, bvar 38, bvar 1200, bvar 1208]),
    bnot (bands [bvar 30, bvar 39, bvar 1200, bvar 1209]),
    bnot (bands [bvar 32, bvar 33, bvar 1202, bvar 1203]),
    bnot (bands [bvar 32, bvar 34, bvar 1202, bvar 1204]),
    bnot (bands [bvar 32, bvar 35, bvar 1202, bvar 1205]),
    bnot (bands [bvar 32, bvar 36, bvar 1202, bvar 1206]),
    bnot (bands [bvar 32, bvar 38, bvar 1202, bvar 1208]),
    bnot (bands [bvar 32, bvar 39, bvar 1202, bvar 1209]),
    bnot (bands [bvar 33, bvar 34, bvar 1203, bvar 1204]),
    bnot (bands [bvar 33, bvar 35, bvar 1203, bvar 1205]),
    bnot (bands [bvar 33, bvar 36, bvar 1203, bvar 1206]),
    bnot (bands [bvar 33, bvar 37, bvar 1203, bvar 1207]),
    bnot (bands [bvar 33, bvar 38, bvar 1203, bvar 1208]),
    bnot (bands [bvar 33, bvar 39, bvar 1203, bvar 1209]),
    bnot (bands [bvar 34, bvar 35, bvar 1204, bvar 1205]),
    bnot (bands [bvar 34, bvar 36, bvar 1204, bvar 1206]),
    bnot (bands [bvar 34, bvar 37, bvar 1204, bvar 1207]),
    bnot (bands [bvar 34, bvar 38, bvar 1204, bvar 1208]),
    bnot (bands [bvar 34, bvar 39, bvar 1204, bvar 1209]),
    bnot (bands [bvar 35, bvar 36, bvar 1205, bvar 1206]),
    bnot (bands [bvar 35, bvar 37, bvar 1205, bvar 1207]),
    bnot (bands [bvar 35, bvar 38, bvar 1205, bvar 1208]),
    bnot (bands [bvar 35, bvar 39, bvar 1205, bvar 1209]),
    bnot (bands [bvar 36, bvar 39, bvar 1206, bvar 1209]),
    bnot (bands [bvar 1058, bvar 1060, bvar 57, bvar 59]),
    bnot (bands [bvar 1058, bvar 1064, bvar 57, bvar 63]),
    bnot (bands [bvar 44, bvar 46, bvar 1071, bvar 1073]),
    bnot (bands [bvar 1055, bvar 1059, bvar 67, bvar 71]),
    bnot (bands [bvar 1055, bvar 1061, bvar 67, bvar 73]),
    bnot (bands [bvar 1055, bvar 1062, bvar 67, bvar 74]),
    bnot (bands [bvar 1055, bvar 1063, bvar 67, bvar 75]),
    bnot (bands [bvar 1055, bvar 1064, bvar 67, bvar 76]),
    bnot (bands [bvar 1055, bvar 1065, bvar 67, bvar 77]),
    bnot (bands [bvar 1055, bvar 1066, bvar 67, bvar 78]),
    bnot (bands [bvar 1055, bvar 1067, bvar 67, bvar 79]),
    bnot (bands [bvar 1059, bvar 1060, bvar 71, bvar 72]),
    bnot (bands [bvar 1059, bvar 1061, bvar 71, bvar 73]),
    bnot (bands [bvar 1059, bvar 1062, bvar 71, bvar 74]) ]

def reducedUnionChunk054 : BVLogicalExpr :=
  bands reducedUnionChunk054Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
