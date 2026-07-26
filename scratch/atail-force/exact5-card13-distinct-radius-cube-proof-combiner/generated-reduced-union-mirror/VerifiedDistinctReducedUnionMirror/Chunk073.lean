import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk073Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1123, bvar 1130, bvar 135, bvar 142]),
    bnot (bands [bvar 1123, bvar 1131, bvar 135, bvar 143]),
    bnot (bands [bvar 1123, bvar 1132, bvar 135, bvar 144]),
    bnot (bands [bvar 1133, bvar 1136, bvar 132, bvar 135]),
    bnot (bands [bvar 1136, bvar 1142, bvar 135, bvar 141]),
    bnot (bands [bvar 1136, bvar 1143, bvar 135, bvar 142]),
    bnot (bands [bvar 1136, bvar 1144, bvar 135, bvar 143]),
    bnot (bands [bvar 1045, bvar 1048, bvar 135, bvar 138]),
    bnot (bands [bvar 1045, bvar 1049, bvar 135, bvar 139]),
    bnot (bands [bvar 1044, bvar 1049, bvar 147, bvar 152]),
    bnot (bands [bvar 33, bvar 35, bvar 1177, bvar 1179]),
    bnot (bands [bvar 1043, bvar 1047, bvar 172, bvar 176]),
    bnot (bands [bvar 29, bvar 35, bvar 1186, bvar 1192]),
    bnot (bands [bvar 30, bvar 35, bvar 1187, bvar 1192]),
    bnot (bands [bvar 34, bvar 35, bvar 1191, bvar 1192]),
    bnot (bands [bvar 32, bvar 35, bvar 1202, bvar 1205]),
    bnot (bands [bvar 135, bvar 136, bvar 1188, bvar 1189]),
    bnot (bands [bvar 135, bvar 139, bvar 1188, bvar 1192]),
    bnot (bands [bvar 135, bvar 139, bvar 1201, bvar 1205]),
    bnot (bands [bvar 149, bvar 150, bvar 1176, bvar 1177]),
    bnot (bands [bvar 146, bvar 152, bvar 1186, bvar 1192]),
    bnot (bands [bvar 147, bvar 152, bvar 1187, bvar 1192]),
    bnot (bands [bvar 148, bvar 152, bvar 1188, bvar 1192]),
    bnot (bands [bvar 151, bvar 152, bvar 1191, bvar 1192]),
    bnot (bands [bvar 1161, bvar 1163, bvar 186, bvar 188]),
    bnot (bands [bvar 1162, bvar 1163, bvar 187, bvar 188]),
    bnot (bands [bvar 1047, bvar 1048, bvar 72, bvar 73]),
    bnot (bands [bvar 1047, bvar 1049, bvar 72, bvar 74]),
    bnot (bands [bvar 1047, bvar 1050, bvar 72, bvar 75]),
    bnot (bands [bvar 1047, bvar 1051, bvar 72, bvar 76]),
    bnot (bands [bvar 1047, bvar 1052, bvar 72, bvar 77]),
    bnot (bands [bvar 1047, bvar 1053, bvar 72, bvar 78]),
    bnot (bands [bvar 1048, bvar 1049, bvar 73, bvar 74]),
    bnot (bands [bvar 1048, bvar 1050, bvar 73, bvar 75]),
    bnot (bands [bvar 1048, bvar 1052, bvar 73, bvar 77]),
    bnot (bands [bvar 1049, bvar 1050, bvar 74, bvar 75]),
    bnot (bands [bvar 1049, bvar 1051, bvar 74, bvar 76]),
    bnot (bands [bvar 1049, bvar 1052, bvar 74, bvar 77]),
    bnot (bands [bvar 1049, bvar 1053, bvar 74, bvar 78]),
    bnot (bands [bvar 1049, bvar 1054, bvar 74, bvar 79]),
    bnot (bands [bvar 1060, bvar 1067, bvar 59, bvar 66]),
    bnot (bands [bvar 1060, bvar 1061, bvar 72, bvar 73]),
    bnot (bands [bvar 1060, bvar 1065, bvar 72, bvar 77]),
    bnot (bands [bvar 1061, bvar 1062, bvar 73, bvar 74]),
    bnot (bands [bvar 1061, bvar 1064, bvar 73, bvar 76]),
    bnot (bands [bvar 1061, bvar 1065, bvar 73, bvar 77]),
    bnot (bands [bvar 1061, bvar 1066, bvar 73, bvar 78]),
    bnot (bands [bvar 1062, bvar 1063, bvar 74, bvar 75]),
    bnot (bands [bvar 1062, bvar 1064, bvar 74, bvar 76]),
    bnot (bands [bvar 1062, bvar 1065, bvar 74, bvar 77]),
    bnot (bands [bvar 1062, bvar 1066, bvar 74, bvar 78]),
    bnot (bands [bvar 1062, bvar 1067, bvar 74, bvar 79]),
    bnot (bands [bvar 1063, bvar 1064, bvar 75, bvar 76]),
    bnot (bands [bvar 1063, bvar 1066, bvar 75, bvar 78]),
    bnot (bands [bvar 1063, bvar 1067, bvar 75, bvar 79]),
    bnot (bands [bvar 1064, bvar 1065, bvar 76, bvar 77]),
    bnot (bands [bvar 1064, bvar 1066, bvar 76, bvar 78]),
    bnot (bands [bvar 1064, bvar 1067, bvar 76, bvar 79]),
    bnot (bands [bvar 1066, bvar 1067, bvar 78, bvar 79]),
    bnot (bands [bvar 1073, bvar 1079, bvar 72, bvar 78]),
    bnot (bands [bvar 59, bvar 63, bvar 1099, bvar 1103]),
    bnot (bands [bvar 72, bvar 77, bvar 1099, bvar 1104]),
    bnot (bands [bvar 72, bvar 78, bvar 1099, bvar 1105]),
    bnot (bands [bvar 73, bvar 77, bvar 1100, bvar 1104]) ]

def reducedUnionChunk073 : BVLogicalExpr :=
  bands reducedUnionChunk073Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
