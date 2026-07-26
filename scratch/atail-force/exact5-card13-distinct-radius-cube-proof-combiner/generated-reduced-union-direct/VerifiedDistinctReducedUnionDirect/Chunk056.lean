import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk056Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 49, bvar 51, bvar 1193, bvar 1195]),
    bnot (bands [bvar 50, bvar 51, bvar 1194, bvar 1195]),
    bnot (bands [bvar 43, bvar 48, bvar 1200, bvar 1205]),
    bnot (bands [bvar 43, bvar 51, bvar 1200, bvar 1208]),
    bnot (bands [bvar 44, bvar 45, bvar 1201, bvar 1202]),
    bnot (bands [bvar 44, bvar 48, bvar 1201, bvar 1205]),
    bnot (bands [bvar 45, bvar 47, bvar 1202, bvar 1204]),
    bnot (bands [bvar 45, bvar 48, bvar 1202, bvar 1205]),
    bnot (bands [bvar 45, bvar 49, bvar 1202, bvar 1206]),
    bnot (bands [bvar 45, bvar 50, bvar 1202, bvar 1207]),
    bnot (bands [bvar 45, bvar 51, bvar 1202, bvar 1208]),
    bnot (bands [bvar 45, bvar 52, bvar 1202, bvar 1209]),
    bnot (bands [bvar 47, bvar 48, bvar 1204, bvar 1205]),
    bnot (bands [bvar 47, bvar 49, bvar 1204, bvar 1206]),
    bnot (bands [bvar 47, bvar 50, bvar 1204, bvar 1207]),
    bnot (bands [bvar 47, bvar 51, bvar 1204, bvar 1208]),
    bnot (bands [bvar 47, bvar 52, bvar 1204, bvar 1209]),
    bnot (bands [bvar 48, bvar 49, bvar 1205, bvar 1206]),
    bnot (bands [bvar 48, bvar 50, bvar 1205, bvar 1207]),
    bnot (bands [bvar 48, bvar 51, bvar 1205, bvar 1208]),
    bnot (bands [bvar 49, bvar 50, bvar 1206, bvar 1207]),
    bnot (bands [bvar 49, bvar 51, bvar 1206, bvar 1208]),
    bnot (bands [bvar 50, bvar 51, bvar 1207, bvar 1208]),
    bnot (bands [bvar 50, bvar 52, bvar 1207, bvar 1209]),
    bnot (bands [bvar 55, bvar 59, bvar 1082, bvar 1086]),
    bnot (bands [bvar 55, bvar 60, bvar 1082, bvar 1087]),
    bnot (bands [bvar 55, bvar 61, bvar 1082, bvar 1088]),
    bnot (bands [bvar 55, bvar 62, bvar 1082, bvar 1089]),
    bnot (bands [bvar 55, bvar 63, bvar 1082, bvar 1090]),
    bnot (bands [bvar 55, bvar 64, bvar 1082, bvar 1091]),
    bnot (bands [bvar 55, bvar 66, bvar 1082, bvar 1093]),
    bnot (bands [bvar 60, bvar 63, bvar 1087, bvar 1090]),
    bnot (bands [bvar 60, bvar 64, bvar 1087, bvar 1091]),
    bnot (bands [bvar 61, bvar 66, bvar 1088, bvar 1093]),
    bnot (bands [bvar 62, bvar 64, bvar 1089, bvar 1091]),
    bnot (bands [bvar 62, bvar 66, bvar 1089, bvar 1093]),
    bnot (bands [bvar 55, bvar 59, bvar 1095, bvar 1099]),
    bnot (bands [bvar 55, bvar 60, bvar 1095, bvar 1100]),
    bnot (bands [bvar 55, bvar 61, bvar 1095, bvar 1101]),
    bnot (bands [bvar 55, bvar 62, bvar 1095, bvar 1102]),
    bnot (bands [bvar 55, bvar 63, bvar 1095, bvar 1103]),
    bnot (bands [bvar 55, bvar 64, bvar 1095, bvar 1104]),
    bnot (bands [bvar 55, bvar 65, bvar 1095, bvar 1105]),
    bnot (bands [bvar 55, bvar 66, bvar 1095, bvar 1106]),
    bnot (bands [bvar 59, bvar 60, bvar 1099, bvar 1100]),
    bnot (bands [bvar 59, bvar 61, bvar 1099, bvar 1101]),
    bnot (bands [bvar 59, bvar 62, bvar 1099, bvar 1102]),
    bnot (bands [bvar 59, bvar 64, bvar 1099, bvar 1104]),
    bnot (bands [bvar 60, bvar 62, bvar 1100, bvar 1102]),
    bnot (bands [bvar 60, bvar 63, bvar 1100, bvar 1103]),
    bnot (bands [bvar 60, bvar 64, bvar 1100, bvar 1104]),
    bnot (bands [bvar 60, bvar 65, bvar 1100, bvar 1105]),
    bnot (bands [bvar 60, bvar 66, bvar 1100, bvar 1106]),
    bnot (bands [bvar 61, bvar 62, bvar 1101, bvar 1102]),
    bnot (bands [bvar 61, bvar 63, bvar 1101, bvar 1103]),
    bnot (bands [bvar 61, bvar 64, bvar 1101, bvar 1104]),
    bnot (bands [bvar 61, bvar 65, bvar 1101, bvar 1105]),
    bnot (bands [bvar 61, bvar 66, bvar 1101, bvar 1106]),
    bnot (bands [bvar 62, bvar 63, bvar 1102, bvar 1103]),
    bnot (bands [bvar 62, bvar 64, bvar 1102, bvar 1104]),
    bnot (bands [bvar 62, bvar 65, bvar 1102, bvar 1105]),
    bnot (bands [bvar 62, bvar 66, bvar 1102, bvar 1106]),
    bnot (bands [bvar 63, bvar 64, bvar 1103, bvar 1104]),
    bnot (bands [bvar 63, bvar 65, bvar 1103, bvar 1105]) ]

def reducedUnionChunk056 : BVLogicalExpr :=
  bands reducedUnionChunk056Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
