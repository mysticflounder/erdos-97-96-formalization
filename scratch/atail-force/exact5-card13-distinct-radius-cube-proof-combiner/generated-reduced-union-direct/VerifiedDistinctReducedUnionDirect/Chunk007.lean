import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk007Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1087, bvar 1092, bvar 1100, bvar 1105]),
    bnot (bands [bvar 1087, bvar 1093, bvar 1100, bvar 1106]),
    bnot (bands [bvar 1088, bvar 1090, bvar 1101, bvar 1103]),
    bnot (bands [bvar 1088, bvar 1092, bvar 1101, bvar 1105]),
    bnot (bands [bvar 1088, bvar 1093, bvar 1101, bvar 1106]),
    bnot (bands [bvar 1089, bvar 1090, bvar 1102, bvar 1103]),
    bnot (bands [bvar 1089, bvar 1091, bvar 1102, bvar 1104]),
    bnot (bands [bvar 1089, bvar 1092, bvar 1102, bvar 1105]),
    bnot (bands [bvar 1089, bvar 1093, bvar 1102, bvar 1106]),
    bnot (bands [bvar 1090, bvar 1091, bvar 1103, bvar 1104]),
    bnot (bands [bvar 1090, bvar 1093, bvar 1103, bvar 1106]),
    bnot (bands [bvar 1091, bvar 1092, bvar 1104, bvar 1105]),
    bnot (bands [bvar 1091, bvar 1093, bvar 1104, bvar 1106]),
    bnot (bands [bvar 1092, bvar 1093, bvar 1105, bvar 1106]),
    bnot (bands [bvar 1081, bvar 1088, bvar 1120, bvar 1127]),
    bnot (bands [bvar 1081, bvar 1089, bvar 1120, bvar 1128]),
    bnot (bands [bvar 1081, bvar 1093, bvar 1120, bvar 1132]),
    bnot (bands [bvar 1082, bvar 1088, bvar 1121, bvar 1127]),
    bnot (bands [bvar 1082, bvar 1089, bvar 1121, bvar 1128]),
    bnot (bands [bvar 1082, bvar 1090, bvar 1121, bvar 1129]),
    bnot (bands [bvar 1082, bvar 1091, bvar 1121, bvar 1130]),
    bnot (bands [bvar 1082, bvar 1092, bvar 1121, bvar 1131]),
    bnot (bands [bvar 1082, bvar 1093, bvar 1121, bvar 1132]),
    bnot (bands [bvar 1083, bvar 1088, bvar 1122, bvar 1127]),
    bnot (bands [bvar 1083, bvar 1090, bvar 1122, bvar 1129]),
    bnot (bands [bvar 1083, bvar 1091, bvar 1122, bvar 1130]),
    bnot (bands [bvar 1083, bvar 1092, bvar 1122, bvar 1131]),
    bnot (bands [bvar 1085, bvar 1086, bvar 1124, bvar 1125]),
    bnot (bands [bvar 1088, bvar 1089, bvar 1127, bvar 1128]),
    bnot (bands [bvar 1088, bvar 1090, bvar 1127, bvar 1129]),
    bnot (bands [bvar 1088, bvar 1091, bvar 1127, bvar 1130]),
    bnot (bands [bvar 1088, bvar 1092, bvar 1127, bvar 1131]),
    bnot (bands [bvar 1088, bvar 1093, bvar 1127, bvar 1132]),
    bnot (bands [bvar 1089, bvar 1090, bvar 1128, bvar 1129]),
    bnot (bands [bvar 1089, bvar 1091, bvar 1128, bvar 1130]),
    bnot (bands [bvar 1089, bvar 1092, bvar 1128, bvar 1131]),
    bnot (bands [bvar 1089, bvar 1093, bvar 1128, bvar 1132]),
    bnot (bands [bvar 1090, bvar 1091, bvar 1129, bvar 1130]),
    bnot (bands [bvar 1090, bvar 1092, bvar 1129, bvar 1131]),
    bnot (bands [bvar 1090, bvar 1093, bvar 1129, bvar 1132]),
    bnot (bands [bvar 1091, bvar 1092, bvar 1130, bvar 1131]),
    bnot (bands [bvar 1091, bvar 1093, bvar 1130, bvar 1132]),
    bnot (bands [bvar 1092, bvar 1093, bvar 1131, bvar 1132]),
    bnot (bands [bvar 1081, bvar 1089, bvar 1133, bvar 1141]),
    bnot (bands [bvar 1081, bvar 1090, bvar 1133, bvar 1142]),
    bnot (bands [bvar 1081, bvar 1091, bvar 1133, bvar 1143]),
    bnot (bands [bvar 1081, bvar 1092, bvar 1133, bvar 1144]),
    bnot (bands [bvar 1081, bvar 1093, bvar 1133, bvar 1145]),
    bnot (bands [bvar 1082, bvar 1089, bvar 1134, bvar 1141]),
    bnot (bands [bvar 1082, bvar 1090, bvar 1134, bvar 1142]),
    bnot (bands [bvar 1082, bvar 1091, bvar 1134, bvar 1143]),
    bnot (bands [bvar 1085, bvar 1086, bvar 1137, bvar 1138]),
    bnot (bands [bvar 1085, bvar 1087, bvar 1137, bvar 1139]),
    bnot (bands [bvar 1089, bvar 1090, bvar 1141, bvar 1142]),
    bnot (bands [bvar 1089, bvar 1091, bvar 1141, bvar 1143]),
    bnot (bands [bvar 1089, bvar 1092, bvar 1141, bvar 1144]),
    bnot (bands [bvar 1089, bvar 1093, bvar 1141, bvar 1145]),
    bnot (bands [bvar 1090, bvar 1091, bvar 1142, bvar 1143]),
    bnot (bands [bvar 1090, bvar 1092, bvar 1142, bvar 1144]),
    bnot (bands [bvar 1090, bvar 1093, bvar 1142, bvar 1145]),
    bnot (bands [bvar 1091, bvar 1093, bvar 1143, bvar 1145]),
    bnot (bands [bvar 1092, bvar 1093, bvar 1144, bvar 1145]),
    bnot (bands [bvar 1081, bvar 1082, bvar 1172, bvar 1173]),
    bnot (bands [bvar 1081, bvar 1083, bvar 1172, bvar 1174]) ]

def reducedUnionChunk007 : BVLogicalExpr :=
  bands reducedUnionChunk007Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
