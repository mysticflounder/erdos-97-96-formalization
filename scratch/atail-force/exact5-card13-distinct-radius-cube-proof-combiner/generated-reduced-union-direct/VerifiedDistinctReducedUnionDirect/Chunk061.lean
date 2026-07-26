import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk061Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1097, bvar 1101, bvar 96, bvar 100]),
    bnot (bands [bvar 1097, bvar 1102, bvar 96, bvar 101]),
    bnot (bands [bvar 1097, bvar 1103, bvar 96, bvar 102]),
    bnot (bands [bvar 1097, bvar 1104, bvar 96, bvar 103]),
    bnot (bands [bvar 1097, bvar 1105, bvar 96, bvar 104]),
    bnot (bands [bvar 1097, bvar 1106, bvar 96, bvar 105]),
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
    bnot (bands [bvar 1104, bvar 1106, bvar 103, bvar 105]),
    bnot (bands [bvar 82, bvar 87, bvar 1109, bvar 1114]),
    bnot (bands [bvar 82, bvar 92, bvar 1109, bvar 1119]),
    bnot (bands [bvar 83, bvar 92, bvar 1110, bvar 1119]),
    bnot (bands [bvar 87, bvar 92, bvar 1114, bvar 1119]),
    bnot (bands [bvar 1094, bvar 1106, bvar 106, bvar 118]),
    bnot (bands [bvar 1096, bvar 1102, bvar 108, bvar 114]),
    bnot (bands [bvar 1097, bvar 1102, bvar 109, bvar 114]),
    bnot (bands [bvar 1097, bvar 1104, bvar 109, bvar 116]),
    bnot (bands [bvar 1101, bvar 1103, bvar 113, bvar 115]),
    bnot (bands [bvar 1101, bvar 1105, bvar 113, bvar 117]),
    bnot (bands [bvar 1102, bvar 1104, bvar 114, bvar 116]),
    bnot (bands [bvar 1102, bvar 1105, bvar 114, bvar 117]),
    bnot (bands [bvar 1102, bvar 1106, bvar 114, bvar 118]),
    bnot (bands [bvar 1103, bvar 1106, bvar 115, bvar 118]),
    bnot (bands [bvar 1104, bvar 1105, bvar 116, bvar 117]),
    bnot (bands [bvar 1094, bvar 1103, bvar 119, bvar 128]),
    bnot (bands [bvar 1094, bvar 1104, bvar 119, bvar 129]),
    bnot (bands [bvar 1096, bvar 1106, bvar 121, bvar 131]),
    bnot (bands [bvar 1097, bvar 1103, bvar 122, bvar 128]),
    bnot (bands [bvar 1097, bvar 1104, bvar 122, bvar 129]),
    bnot (bands [bvar 1097, bvar 1105, bvar 122, bvar 130]),
    bnot (bands [bvar 1097, bvar 1106, bvar 122, bvar 131]),
    bnot (bands [bvar 1102, bvar 1103, bvar 127, bvar 128]),
    bnot (bands [bvar 1102, bvar 1104, bvar 127, bvar 129]),
    bnot (bands [bvar 1102, bvar 1105, bvar 127, bvar 130]),
    bnot (bands [bvar 1102, bvar 1106, bvar 127, bvar 131]),
    bnot (bands [bvar 1103, bvar 1104, bvar 128, bvar 129]),
    bnot (bands [bvar 1103, bvar 1105, bvar 128, bvar 130]),
    bnot (bands [bvar 1103, bvar 1106, bvar 128, bvar 131]),
    bnot (bands [bvar 1104, bvar 1105, bvar 129, bvar 130]),
    bnot (bands [bvar 1104, bvar 1106, bvar 129, bvar 131]),
    bnot (bands [bvar 1094, bvar 1097, bvar 132, bvar 135]),
    bnot (bands [bvar 1097, bvar 1103, bvar 135, bvar 141]),
    bnot (bands [bvar 1097, bvar 1104, bvar 135, bvar 142]),
    bnot (bands [bvar 1097, bvar 1105, bvar 135, bvar 143]),
    bnot (bands [bvar 1097, bvar 1106, bvar 135, bvar 144]),
    bnot (bands [bvar 1094, bvar 1095, bvar 145, bvar 146]),
    bnot (bands [bvar 1094, bvar 1104, bvar 145, bvar 155]),
    bnot (bands [bvar 1094, bvar 1105, bvar 145, bvar 156]),
    bnot (bands [bvar 1094, bvar 1106, bvar 145, bvar 157]),
    bnot (bands [bvar 1095, bvar 1104, bvar 146, bvar 155]),
    bnot (bands [bvar 1095, bvar 1105, bvar 146, bvar 156]) ]

def reducedUnionChunk061 : BVLogicalExpr :=
  bands reducedUnionChunk061Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
