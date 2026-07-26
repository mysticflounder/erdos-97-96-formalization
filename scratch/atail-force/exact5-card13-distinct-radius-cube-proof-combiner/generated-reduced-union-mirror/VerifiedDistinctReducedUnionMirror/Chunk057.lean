import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk057Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1089, bvar 1090, bvar 101, bvar 102]),
    bnot (bands [bvar 1089, bvar 1091, bvar 101, bvar 103]),
    bnot (bands [bvar 1089, bvar 1092, bvar 101, bvar 104]),
    bnot (bands [bvar 1089, bvar 1093, bvar 101, bvar 105]),
    bnot (bands [bvar 1090, bvar 1091, bvar 102, bvar 103]),
    bnot (bands [bvar 1090, bvar 1092, bvar 102, bvar 104]),
    bnot (bands [bvar 1092, bvar 1093, bvar 104, bvar 105]),
    bnot (bands [bvar 1082, bvar 1088, bvar 107, bvar 113]),
    bnot (bands [bvar 1082, bvar 1089, bvar 107, bvar 114]),
    bnot (bands [bvar 1088, bvar 1089, bvar 113, bvar 114]),
    bnot (bands [bvar 1088, bvar 1091, bvar 113, bvar 116]),
    bnot (bands [bvar 1088, bvar 1092, bvar 113, bvar 117]),
    bnot (bands [bvar 1088, bvar 1093, bvar 113, bvar 118]),
    bnot (bands [bvar 1089, bvar 1091, bvar 114, bvar 116]),
    atMost [bands [bvar 67, bvar 1120], bands [bvar 68, bvar 1121], bands [bvar 69, bvar 1122], bands [bvar 70, bvar 1123], bands [bvar 71, bvar 1124], bands [bvar 72, bvar 1125], bands [bvar 73, bvar 1126], bands [bvar 74, bvar 1127], bands [bvar 75, bvar 1128], bands [bvar 76, bvar 1129], bands [bvar 77, bvar 1130], bands [bvar 78, bvar 1131], bands [bvar 79, bvar 1132]] 2,
    bnot (bands [bvar 67, bvar 77, bvar 1120, bvar 1130]),
    bnot (bands [bvar 67, bvar 78, bvar 1120, bvar 1131]),
    bnot (bands [bvar 67, bvar 79, bvar 1120, bvar 1132]),
    bnot (bands [bvar 68, bvar 74, bvar 1121, bvar 1127]),
    bnot (bands [bvar 68, bvar 75, bvar 1121, bvar 1128]),
    bnot (bands [bvar 68, bvar 76, bvar 1121, bvar 1129]),
    bnot (bands [bvar 68, bvar 77, bvar 1121, bvar 1130]),
    bnot (bands [bvar 68, bvar 78, bvar 1121, bvar 1131]),
    bnot (bands [bvar 69, bvar 74, bvar 1122, bvar 1127]),
    bnot (bands [bvar 69, bvar 76, bvar 1122, bvar 1129]),
    bnot (bands [bvar 71, bvar 72, bvar 1124, bvar 1125]),
    bnot (bands [bvar 74, bvar 75, bvar 1127, bvar 1128]),
    bnot (bands [bvar 74, bvar 76, bvar 1127, bvar 1129]),
    bnot (bands [bvar 74, bvar 77, bvar 1127, bvar 1130]),
    bnot (bands [bvar 74, bvar 78, bvar 1127, bvar 1131]),
    bnot (bands [bvar 74, bvar 79, bvar 1127, bvar 1132]),
    bnot (bands [bvar 75, bvar 76, bvar 1128, bvar 1129]),
    bnot (bands [bvar 75, bvar 77, bvar 1128, bvar 1130]),
    bnot (bands [bvar 75, bvar 78, bvar 1128, bvar 1131]),
    bnot (bands [bvar 75, bvar 79, bvar 1128, bvar 1132]),
    bnot (bands [bvar 76, bvar 77, bvar 1129, bvar 1130]),
    bnot (bands [bvar 76, bvar 78, bvar 1129, bvar 1131]),
    bnot (bands [bvar 76, bvar 79, bvar 1129, bvar 1132]),
    bnot (bands [bvar 77, bvar 78, bvar 1130, bvar 1131]),
    bnot (bands [bvar 77, bvar 79, bvar 1130, bvar 1132]),
    atMost [bands [bvar 67, bvar 1133], bands [bvar 68, bvar 1134], bands [bvar 69, bvar 1135], bands [bvar 70, bvar 1136], bands [bvar 71, bvar 1137], bands [bvar 72, bvar 1138], bands [bvar 73, bvar 1139], bands [bvar 74, bvar 1140], bands [bvar 75, bvar 1141], bands [bvar 76, bvar 1142], bands [bvar 77, bvar 1143], bands [bvar 78, bvar 1144], bands [bvar 79, bvar 1145]] 2,
    bnot (bands [bvar 67, bvar 75, bvar 1133, bvar 1141]),
    bnot (bands [bvar 67, bvar 76, bvar 1133, bvar 1142]),
    bnot (bands [bvar 67, bvar 77, bvar 1133, bvar 1143]),
    bnot (bands [bvar 67, bvar 78, bvar 1133, bvar 1144]),
    bnot (bands [bvar 67, bvar 79, bvar 1133, bvar 1145]),
    bnot (bands [bvar 68, bvar 75, bvar 1134, bvar 1141]),
    bnot (bands [bvar 68, bvar 76, bvar 1134, bvar 1142]),
    bnot (bands [bvar 68, bvar 77, bvar 1134, bvar 1143]),
    bnot (bands [bvar 68, bvar 78, bvar 1134, bvar 1144]),
    bnot (bands [bvar 71, bvar 72, bvar 1137, bvar 1138]),
    bnot (bands [bvar 71, bvar 73, bvar 1137, bvar 1139]),
    bnot (bands [bvar 75, bvar 76, bvar 1141, bvar 1142]),
    bnot (bands [bvar 75, bvar 77, bvar 1141, bvar 1143]),
    bnot (bands [bvar 75, bvar 78, bvar 1141, bvar 1144]),
    bnot (bands [bvar 75, bvar 79, bvar 1141, bvar 1145]),
    bnot (bands [bvar 76, bvar 77, bvar 1142, bvar 1143]),
    bnot (bands [bvar 76, bvar 78, bvar 1142, bvar 1144]),
    bnot (bands [bvar 76, bvar 79, bvar 1142, bvar 1145]),
    bnot (bands [bvar 77, bvar 78, bvar 1143, bvar 1144]),
    bnot (bands [bvar 78, bvar 79, bvar 1144, bvar 1145]),
    bnot (bands [bvar 1081, bvar 1090, bvar 132, bvar 141]),
    bnot (bands [bvar 1085, bvar 1088, bvar 136, bvar 139]),
    bnot (bands [bvar 67, bvar 78, bvar 1159, bvar 1170]) ]

def reducedUnionChunk057 : BVLogicalExpr :=
  bands reducedUnionChunk057Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
