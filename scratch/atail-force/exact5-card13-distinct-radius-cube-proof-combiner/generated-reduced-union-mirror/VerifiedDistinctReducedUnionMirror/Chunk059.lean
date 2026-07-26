import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk059Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1087, bvar 1092, bvar 190, bvar 195]),
    bnot (bands [bvar 1089, bvar 1091, bvar 192, bvar 194]),
    bnot (bands [bvar 1089, bvar 1092, bvar 192, bvar 195]),
    bnot (bands [bvar 1090, bvar 1091, bvar 193, bvar 194]),
    bnot (bands [bvar 1090, bvar 1092, bvar 193, bvar 195]),
    bnot (bands [bvar 1094, bvar 1095, bvar 93, bvar 94]),
    bnot (bands [bvar 1094, bvar 1100, bvar 93, bvar 99]),
    bnot (bands [bvar 1094, bvar 1102, bvar 93, bvar 101]),
    bnot (bands [bvar 1094, bvar 1103, bvar 93, bvar 102]),
    bnot (bands [bvar 1094, bvar 1104, bvar 93, bvar 103]),
    bnot (bands [bvar 1094, bvar 1105, bvar 93, bvar 104]),
    bnot (bands [bvar 1094, bvar 1106, bvar 93, bvar 105]),
    bnot (bands [bvar 1095, bvar 1102, bvar 94, bvar 101]),
    bnot (bands [bvar 1095, bvar 1103, bvar 94, bvar 102]),
    bnot (bands [bvar 1095, bvar 1105, bvar 94, bvar 104]),
    bnot (bands [bvar 1095, bvar 1106, bvar 94, bvar 105]),
    bnot (bands [bvar 1096, bvar 1100, bvar 95, bvar 99]),
    bnot (bands [bvar 1096, bvar 1101, bvar 95, bvar 100]),
    bnot (bands [bvar 1096, bvar 1102, bvar 95, bvar 101]),
    bnot (bands [bvar 1096, bvar 1103, bvar 95, bvar 102]),
    bnot (bands [bvar 1096, bvar 1104, bvar 95, bvar 103]),
    bnot (bands [bvar 1096, bvar 1105, bvar 95, bvar 104]),
    bnot (bands [bvar 1096, bvar 1106, bvar 95, bvar 105]),
    bnot (bands [bvar 1097, bvar 1100, bvar 96, bvar 99]),
    bnot (bands [bvar 1097, bvar 1101, bvar 96, bvar 100]),
    bnot (bands [bvar 1097, bvar 1102, bvar 96, bvar 101]),
    bnot (bands [bvar 1097, bvar 1103, bvar 96, bvar 102]),
    bnot (bands [bvar 1097, bvar 1104, bvar 96, bvar 103]),
    bnot (bands [bvar 1097, bvar 1105, bvar 96, bvar 104]),
    bnot (bands [bvar 1097, bvar 1106, bvar 96, bvar 105]),
    bnot (bands [bvar 1100, bvar 1102, bvar 99, bvar 101]),
    bnot (bands [bvar 1100, bvar 1103, bvar 99, bvar 102]),
    bnot (bands [bvar 1100, bvar 1104, bvar 99, bvar 103]),
    bnot (bands [bvar 1100, bvar 1105, bvar 99, bvar 104]),
    bnot (bands [bvar 1100, bvar 1106, bvar 99, bvar 105]),
    bnot (bands [bvar 1101, bvar 1103, bvar 100, bvar 102]),
    bnot (bands [bvar 1101, bvar 1104, bvar 100, bvar 103]),
    bnot (bands [bvar 1101, bvar 1105, bvar 100, bvar 104]),
    bnot (bands [bvar 1101, bvar 1106, bvar 100, bvar 105]),
    bnot (bands [bvar 1102, bvar 1103, bvar 101, bvar 102]),
    bnot (bands [bvar 1102, bvar 1104, bvar 101, bvar 103]),
    bnot (bands [bvar 1102, bvar 1105, bvar 101, bvar 104]),
    bnot (bands [bvar 1102, bvar 1106, bvar 101, bvar 105]),
    bnot (bands [bvar 1103, bvar 1104, bvar 102, bvar 103]),
    bnot (bands [bvar 1103, bvar 1105, bvar 102, bvar 104]),
    bnot (bands [bvar 1103, bvar 1106, bvar 102, bvar 105]),
    bnot (bands [bvar 1104, bvar 1105, bvar 103, bvar 104]),
    bnot (bands [bvar 1104, bvar 1106, bvar 103, bvar 105]),
    bnot (bands [bvar 1105, bvar 1106, bvar 104, bvar 105]),
    bnot (bands [bvar 1094, bvar 1101, bvar 106, bvar 113]),
    bnot (bands [bvar 1094, bvar 1103, bvar 106, bvar 115]),
    bnot (bands [bvar 1094, bvar 1104, bvar 106, bvar 116]),
    bnot (bands [bvar 1096, bvar 1101, bvar 108, bvar 113]),
    bnot (bands [bvar 1096, bvar 1102, bvar 108, bvar 114]),
    bnot (bands [bvar 1096, bvar 1104, bvar 108, bvar 116]),
    bnot (bands [bvar 1096, bvar 1105, bvar 108, bvar 117]),
    bnot (bands [bvar 1096, bvar 1106, bvar 108, bvar 118]),
    bnot (bands [bvar 1097, bvar 1101, bvar 109, bvar 113]),
    bnot (bands [bvar 1097, bvar 1102, bvar 109, bvar 114]),
    bnot (bands [bvar 1097, bvar 1103, bvar 109, bvar 115]),
    bnot (bands [bvar 1097, bvar 1104, bvar 109, bvar 116]),
    bnot (bands [bvar 1097, bvar 1105, bvar 109, bvar 117]),
    bnot (bands [bvar 1097, bvar 1106, bvar 109, bvar 118]),
    bnot (bands [bvar 1101, bvar 1103, bvar 113, bvar 115]) ]

def reducedUnionChunk059 : BVLogicalExpr :=
  bands reducedUnionChunk059Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
