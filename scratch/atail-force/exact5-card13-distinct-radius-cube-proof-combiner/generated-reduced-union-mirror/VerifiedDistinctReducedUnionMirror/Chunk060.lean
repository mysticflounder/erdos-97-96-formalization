import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk060Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1101, bvar 1104, bvar 113, bvar 116]),
    bnot (bands [bvar 1101, bvar 1105, bvar 113, bvar 117]),
    bnot (bands [bvar 1101, bvar 1106, bvar 113, bvar 118]),
    bnot (bands [bvar 1102, bvar 1103, bvar 114, bvar 115]),
    bnot (bands [bvar 1102, bvar 1104, bvar 114, bvar 116]),
    bnot (bands [bvar 1102, bvar 1105, bvar 114, bvar 117]),
    bnot (bands [bvar 1102, bvar 1106, bvar 114, bvar 118]),
    bnot (bands [bvar 1103, bvar 1104, bvar 115, bvar 116]),
    bnot (bands [bvar 1104, bvar 1105, bvar 116, bvar 117]),
    bnot (bands [bvar 1104, bvar 1106, bvar 116, bvar 118]),
    bnot (bands [bvar 1105, bvar 1106, bvar 117, bvar 118]),
    bnot (bands [bvar 1094, bvar 1103, bvar 119, bvar 128]),
    bnot (bands [bvar 1094, bvar 1104, bvar 119, bvar 129]),
    bnot (bands [bvar 1096, bvar 1102, bvar 121, bvar 127]),
    bnot (bands [bvar 1096, bvar 1103, bvar 121, bvar 128]),
    bnot (bands [bvar 1096, bvar 1105, bvar 121, bvar 130]),
    bnot (bands [bvar 1096, bvar 1106, bvar 121, bvar 131]),
    bnot (bands [bvar 1097, bvar 1102, bvar 122, bvar 127]),
    bnot (bands [bvar 1097, bvar 1103, bvar 122, bvar 128]),
    bnot (bands [bvar 1097, bvar 1104, bvar 122, bvar 129]),
    bnot (bands [bvar 1097, bvar 1106, bvar 122, bvar 131]),
    bnot (bands [bvar 1102, bvar 1103, bvar 127, bvar 128]),
    bnot (bands [bvar 1102, bvar 1104, bvar 127, bvar 129]),
    bnot (bands [bvar 1102, bvar 1105, bvar 127, bvar 130]),
    bnot (bands [bvar 1102, bvar 1106, bvar 127, bvar 131]),
    bnot (bands [bvar 1103, bvar 1104, bvar 128, bvar 129]),
    bnot (bands [bvar 1104, bvar 1106, bvar 129, bvar 131]),
    bnot (bands [bvar 1105, bvar 1106, bvar 130, bvar 131]),
    atMost [bands [bvar 1094, bvar 132], bands [bvar 1095, bvar 133], bands [bvar 1096, bvar 134], bands [bvar 1097, bvar 135], bands [bvar 1098, bvar 136], bands [bvar 1099, bvar 137], bands [bvar 1100, bvar 138], bands [bvar 1101, bvar 139], bands [bvar 1102, bvar 140], bands [bvar 1103, bvar 141], bands [bvar 1104, bvar 142], bands [bvar 1105, bvar 143], bands [bvar 1106, bvar 144]] 2,
    bnot (bands [bvar 1094, bvar 1097, bvar 132, bvar 135]),
    bnot (bands [bvar 1094, bvar 1103, bvar 132, bvar 141]),
    bnot (bands [bvar 1094, bvar 1104, bvar 132, bvar 142]),
    bnot (bands [bvar 1094, bvar 1105, bvar 132, bvar 143]),
    bnot (bands [bvar 1094, bvar 1106, bvar 132, bvar 144]),
    bnot (bands [bvar 1095, bvar 1104, bvar 133, bvar 142]),
    bnot (bands [bvar 1096, bvar 1103, bvar 134, bvar 141]),
    bnot (bands [bvar 1096, bvar 1106, bvar 134, bvar 144]),
    bnot (bands [bvar 1097, bvar 1103, bvar 135, bvar 141]),
    bnot (bands [bvar 1097, bvar 1104, bvar 135, bvar 142]),
    bnot (bands [bvar 1097, bvar 1105, bvar 135, bvar 143]),
    bnot (bands [bvar 1097, bvar 1106, bvar 135, bvar 144]),
    bnot (bands [bvar 1103, bvar 1104, bvar 141, bvar 142]),
    bnot (bands [bvar 1103, bvar 1105, bvar 141, bvar 143]),
    bnot (bands [bvar 1103, bvar 1106, bvar 141, bvar 144]),
    bnot (bands [bvar 1104, bvar 1105, bvar 142, bvar 143]),
    bnot (bands [bvar 1104, bvar 1106, bvar 142, bvar 144]),
    bnot (bands [bvar 1105, bvar 1106, bvar 143, bvar 144]),
    bnot (bands [bvar 1094, bvar 1096, bvar 145, bvar 147]),
    bnot (bands [bvar 1094, bvar 1097, bvar 145, bvar 148]),
    bnot (bands [bvar 1094, bvar 1104, bvar 145, bvar 155]),
    bnot (bands [bvar 1094, bvar 1105, bvar 145, bvar 156]),
    bnot (bands [bvar 1094, bvar 1106, bvar 145, bvar 157]),
    bnot (bands [bvar 1095, bvar 1104, bvar 146, bvar 155]),
    bnot (bands [bvar 1095, bvar 1105, bvar 146, bvar 156]),
    bnot (bands [bvar 1095, bvar 1106, bvar 146, bvar 157]),
    bnot (bands [bvar 1096, bvar 1104, bvar 147, bvar 155]),
    bnot (bands [bvar 1096, bvar 1105, bvar 147, bvar 156]),
    bnot (bands [bvar 1096, bvar 1106, bvar 147, bvar 157]),
    bnot (bands [bvar 1097, bvar 1104, bvar 148, bvar 155]),
    bnot (bands [bvar 1097, bvar 1105, bvar 148, bvar 156]),
    bnot (bands [bvar 1097, bvar 1106, bvar 148, bvar 157]),
    bnot (bands [bvar 1099, bvar 1102, bvar 150, bvar 153]),
    bnot (bands [bvar 1101, bvar 1102, bvar 152, bvar 153]),
    bnot (bands [bvar 1104, bvar 1105, bvar 155, bvar 156]) ]

def reducedUnionChunk060 : BVLogicalExpr :=
  bands reducedUnionChunk060Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
