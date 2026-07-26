import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk058Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 57, bvar 60, bvar 1188, bvar 1191]),
    bnot (bands [bvar 57, bvar 61, bvar 1188, bvar 1192]),
    bnot (bands [bvar 57, bvar 62, bvar 1188, bvar 1193]),
    bnot (bands [bvar 57, bvar 63, bvar 1188, bvar 1194]),
    bnot (bands [bvar 57, bvar 64, bvar 1188, bvar 1195]),
    bnot (bands [bvar 60, bvar 64, bvar 1191, bvar 1195]),
    bnot (bands [bvar 61, bvar 63, bvar 1192, bvar 1194]),
    bnot (bands [bvar 62, bvar 63, bvar 1193, bvar 1194]),
    bnot (bands [bvar 63, bvar 64, bvar 1194, bvar 1195]),
    bnot (bands [bvar 1071, bvar 1077, bvar 187, bvar 193]),
    bnot (bands [bvar 57, bvar 59, bvar 1201, bvar 1203]),
    bnot (bands [bvar 57, bvar 60, bvar 1201, bvar 1204]),
    bnot (bands [bvar 57, bvar 61, bvar 1201, bvar 1205]),
    bnot (bands [bvar 57, bvar 62, bvar 1201, bvar 1206]),
    bnot (bands [bvar 57, bvar 63, bvar 1201, bvar 1207]),
    bnot (bands [bvar 57, bvar 64, bvar 1201, bvar 1208]),
    bnot (bands [bvar 57, bvar 65, bvar 1201, bvar 1209]),
    bnot (bands [bvar 59, bvar 62, bvar 1203, bvar 1206]),
    bnot (bands [bvar 59, bvar 65, bvar 1203, bvar 1209]),
    bnot (bands [bvar 60, bvar 63, bvar 1204, bvar 1207]),
    bnot (bands [bvar 60, bvar 64, bvar 1204, bvar 1208]),
    bnot (bands [bvar 60, bvar 65, bvar 1204, bvar 1209]),
    bnot (bands [bvar 61, bvar 63, bvar 1205, bvar 1207]),
    bnot (bands [bvar 67, bvar 68, bvar 1094, bvar 1095]),
    bnot (bands [bvar 67, bvar 72, bvar 1094, bvar 1099]),
    bnot (bands [bvar 67, bvar 73, bvar 1094, bvar 1100]),
    bnot (bands [bvar 67, bvar 74, bvar 1094, bvar 1101]),
    bnot (bands [bvar 67, bvar 75, bvar 1094, bvar 1102]),
    bnot (bands [bvar 67, bvar 76, bvar 1094, bvar 1103]),
    bnot (bands [bvar 67, bvar 77, bvar 1094, bvar 1104]),
    bnot (bands [bvar 67, bvar 78, bvar 1094, bvar 1105]),
    bnot (bands [bvar 67, bvar 79, bvar 1094, bvar 1106]),
    bnot (bands [bvar 68, bvar 74, bvar 1095, bvar 1101]),
    bnot (bands [bvar 68, bvar 75, bvar 1095, bvar 1102]),
    bnot (bands [bvar 68, bvar 76, bvar 1095, bvar 1103]),
    bnot (bands [bvar 68, bvar 77, bvar 1095, bvar 1104]),
    bnot (bands [bvar 68, bvar 78, bvar 1095, bvar 1105]),
    bnot (bands [bvar 68, bvar 79, bvar 1095, bvar 1106]),
    bnot (bands [bvar 69, bvar 72, bvar 1096, bvar 1099]),
    bnot (bands [bvar 69, bvar 73, bvar 1096, bvar 1100]),
    bnot (bands [bvar 69, bvar 74, bvar 1096, bvar 1101]),
    bnot (bands [bvar 69, bvar 76, bvar 1096, bvar 1103]),
    bnot (bands [bvar 69, bvar 77, bvar 1096, bvar 1104]),
    bnot (bands [bvar 69, bvar 78, bvar 1096, bvar 1105]),
    bnot (bands [bvar 69, bvar 79, bvar 1096, bvar 1106]),
    bnot (bands [bvar 72, bvar 76, bvar 1099, bvar 1103]),
    bnot (bands [bvar 72, bvar 78, bvar 1099, bvar 1105]),
    bnot (bands [bvar 72, bvar 79, bvar 1099, bvar 1106]),
    bnot (bands [bvar 73, bvar 76, bvar 1100, bvar 1103]),
    bnot (bands [bvar 73, bvar 77, bvar 1100, bvar 1104]),
    bnot (bands [bvar 73, bvar 78, bvar 1100, bvar 1105]),
    bnot (bands [bvar 73, bvar 79, bvar 1100, bvar 1106]),
    bnot (bands [bvar 74, bvar 75, bvar 1101, bvar 1102]),
    bnot (bands [bvar 74, bvar 77, bvar 1101, bvar 1104]),
    bnot (bands [bvar 74, bvar 78, bvar 1101, bvar 1105]),
    bnot (bands [bvar 74, bvar 79, bvar 1101, bvar 1106]),
    bnot (bands [bvar 75, bvar 76, bvar 1102, bvar 1103]),
    bnot (bands [bvar 75, bvar 77, bvar 1102, bvar 1104]),
    bnot (bands [bvar 75, bvar 78, bvar 1102, bvar 1105]),
    bnot (bands [bvar 75, bvar 79, bvar 1102, bvar 1106]),
    bnot (bands [bvar 76, bvar 77, bvar 1103, bvar 1104]),
    bnot (bands [bvar 76, bvar 78, bvar 1103, bvar 1105]),
    bnot (bands [bvar 76, bvar 79, bvar 1103, bvar 1106]),
    bnot (bands [bvar 77, bvar 78, bvar 1104, bvar 1105]) ]

def reducedUnionChunk058 : BVLogicalExpr :=
  bands reducedUnionChunk058Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
