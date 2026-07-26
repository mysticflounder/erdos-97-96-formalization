import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk050Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1048, bvar 1049, bvar 99, bvar 100]),
    bnot (bands [bvar 1048, bvar 1050, bvar 99, bvar 101]),
    bnot (bands [bvar 1048, bvar 1051, bvar 99, bvar 102]),
    bnot (bands [bvar 1048, bvar 1052, bvar 99, bvar 103]),
    bnot (bands [bvar 1048, bvar 1053, bvar 99, bvar 104]),
    bnot (bands [bvar 1048, bvar 1054, bvar 99, bvar 105]),
    bnot (bands [bvar 1049, bvar 1050, bvar 100, bvar 101]),
    bnot (bands [bvar 1049, bvar 1051, bvar 100, bvar 102]),
    bnot (bands [bvar 1049, bvar 1052, bvar 100, bvar 103]),
    bnot (bands [bvar 1049, bvar 1053, bvar 100, bvar 104]),
    bnot (bands [bvar 1049, bvar 1054, bvar 100, bvar 105]),
    bnot (bands [bvar 1050, bvar 1051, bvar 101, bvar 102]),
    bnot (bands [bvar 1050, bvar 1052, bvar 101, bvar 103]),
    bnot (bands [bvar 1051, bvar 1052, bvar 102, bvar 103]),
    bnot (bands [bvar 1052, bvar 1053, bvar 103, bvar 104]),
    bnot (bands [bvar 1052, bvar 1054, bvar 103, bvar 105]),
    atMost [bands [bvar 28, bvar 1120], bands [bvar 29, bvar 1121], bands [bvar 30, bvar 1122], bands [bvar 31, bvar 1123], bands [bvar 32, bvar 1124], bands [bvar 33, bvar 1125], bands [bvar 34, bvar 1126], bands [bvar 35, bvar 1127], bands [bvar 36, bvar 1128], bands [bvar 37, bvar 1129], bands [bvar 38, bvar 1130], bands [bvar 39, bvar 1131], bands [bvar 40, bvar 1132]] 2,
    bnot (bands [bvar 29, bvar 32, bvar 1121, bvar 1124]),
    bnot (bands [bvar 29, bvar 33, bvar 1121, bvar 1125]),
    bnot (bands [bvar 30, bvar 32, bvar 1122, bvar 1124]),
    bnot (bands [bvar 30, bvar 33, bvar 1122, bvar 1125]),
    bnot (bands [bvar 31, bvar 33, bvar 1123, bvar 1125]),
    bnot (bands [bvar 32, bvar 33, bvar 1124, bvar 1125]),
    bnot (bands [bvar 35, bvar 36, bvar 1127, bvar 1128]),
    bnot (bands [bvar 35, bvar 37, bvar 1127, bvar 1129]),
    bnot (bands [bvar 35, bvar 38, bvar 1127, bvar 1130]),
    bnot (bands [bvar 35, bvar 39, bvar 1127, bvar 1131]),
    bnot (bands [bvar 35, bvar 40, bvar 1127, bvar 1132]),
    bnot (bands [bvar 38, bvar 39, bvar 1130, bvar 1131]),
    bnot (bands [bvar 38, bvar 40, bvar 1130, bvar 1132]),
    atMost [bands [bvar 1042, bvar 119], bands [bvar 1043, bvar 120], bands [bvar 1044, bvar 121], bands [bvar 1045, bvar 122], bands [bvar 1046, bvar 123], bands [bvar 1047, bvar 124], bands [bvar 1048, bvar 125], bands [bvar 1049, bvar 126], bands [bvar 1050, bvar 127], bands [bvar 1051, bvar 128], bands [bvar 1052, bvar 129], bands [bvar 1053, bvar 130], bands [bvar 1054, bvar 131]] 2,
    bnot (bands [bvar 1043, bvar 1048, bvar 120, bvar 125]),
    bnot (bands [bvar 1044, bvar 1046, bvar 121, bvar 123]),
    bnot (bands [bvar 1044, bvar 1048, bvar 121, bvar 125]),
    bnot (bands [bvar 1045, bvar 1046, bvar 122, bvar 123]),
    bnot (bands [bvar 1045, bvar 1047, bvar 122, bvar 124]),
    bnot (bands [bvar 1045, bvar 1048, bvar 122, bvar 125]),
    bnot (bands [bvar 1046, bvar 1047, bvar 123, bvar 124]),
    bnot (bands [bvar 1046, bvar 1048, bvar 123, bvar 125]),
    bnot (bands [bvar 1047, bvar 1048, bvar 124, bvar 125]),
    bnot (bands [bvar 1050, bvar 1051, bvar 127, bvar 128]),
    bnot (bands [bvar 1050, bvar 1052, bvar 127, bvar 129]),
    bnot (bands [bvar 1051, bvar 1052, bvar 128, bvar 129]),
    bnot (bands [bvar 1051, bvar 1053, bvar 128, bvar 130]),
    bnot (bands [bvar 1051, bvar 1054, bvar 128, bvar 131]),
    bnot (bands [bvar 29, bvar 32, bvar 1134, bvar 1137]),
    bnot (bands [bvar 29, bvar 33, bvar 1134, bvar 1138]),
    bnot (bands [bvar 29, bvar 34, bvar 1134, bvar 1139]),
    bnot (bands [bvar 30, bvar 33, bvar 1135, bvar 1138]),
    bnot (bands [bvar 30, bvar 34, bvar 1135, bvar 1139]),
    bnot (bands [bvar 31, bvar 33, bvar 1136, bvar 1138]),
    bnot (bands [bvar 31, bvar 34, bvar 1136, bvar 1139]),
    bnot (bands [bvar 32, bvar 33, bvar 1137, bvar 1138]),
    bnot (bands [bvar 32, bvar 34, bvar 1137, bvar 1139]),
    bnot (bands [bvar 33, bvar 34, bvar 1138, bvar 1139]),
    bnot (bands [bvar 36, bvar 37, bvar 1141, bvar 1142]),
    bnot (bands [bvar 36, bvar 39, bvar 1141, bvar 1144]),
    bnot (bands [bvar 37, bvar 38, bvar 1142, bvar 1143]),
    bnot (bands [bvar 37, bvar 39, bvar 1142, bvar 1144]),
    bnot (bands [bvar 1043, bvar 1049, bvar 133, bvar 139]),
    bnot (bands [bvar 1044, bvar 1048, bvar 134, bvar 138]),
    bnot (bands [bvar 1044, bvar 1049, bvar 134, bvar 139]),
    bnot (bands [bvar 1045, bvar 1046, bvar 135, bvar 136]),
    bnot (bands [bvar 1045, bvar 1047, bvar 135, bvar 137]) ]

def reducedUnionChunk050 : BVLogicalExpr :=
  bands reducedUnionChunk050Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
