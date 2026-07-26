import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk062Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1095, bvar 1106, bvar 146, bvar 157]),
    bnot (bands [bvar 1096, bvar 1104, bvar 147, bvar 155]),
    bnot (bands [bvar 1096, bvar 1105, bvar 147, bvar 156]),
    bnot (bands [bvar 1096, bvar 1106, bvar 147, bvar 157]),
    bnot (bands [bvar 1097, bvar 1104, bvar 148, bvar 155]),
    bnot (bands [bvar 1097, bvar 1105, bvar 148, bvar 156]),
    bnot (bands [bvar 1097, bvar 1106, bvar 148, bvar 157]),
    bnot (bands [bvar 1099, bvar 1102, bvar 150, bvar 153]),
    bnot (bands [bvar 1100, bvar 1102, bvar 151, bvar 153]),
    bnot (bands [bvar 1104, bvar 1105, bvar 155, bvar 156]),
    bnot (bands [bvar 1104, bvar 1106, bvar 155, bvar 157]),
    bnot (bands [bvar 1094, bvar 1105, bvar 158, bvar 169]),
    bnot (bands [bvar 1094, bvar 1106, bvar 158, bvar 170]),
    bnot (bands [bvar 1095, bvar 1106, bvar 159, bvar 170]),
    bnot (bands [bvar 1096, bvar 1105, bvar 160, bvar 169]),
    bnot (bands [bvar 1096, bvar 1106, bvar 160, bvar 170]),
    bnot (bands [bvar 1097, bvar 1106, bvar 161, bvar 170]),
    bnot (bands [bvar 1100, bvar 1102, bvar 164, bvar 166]),
    bnot (bands [bvar 1100, bvar 1103, bvar 164, bvar 167]),
    bnot (bands [bvar 1101, bvar 1103, bvar 165, bvar 167]),
    bnot (bands [bvar 1102, bvar 1103, bvar 166, bvar 167]),
    bnot (bands [bvar 1105, bvar 1106, bvar 169, bvar 170]),
    bnot (bands [bvar 1094, bvar 1095, bvar 171, bvar 172]),
    bnot (bands [bvar 1095, bvar 1106, bvar 172, bvar 183]),
    bnot (bands [bvar 1096, bvar 1106, bvar 173, bvar 183]),
    bnot (bands [bvar 1099, bvar 1104, bvar 176, bvar 181]),
    bnot (bands [bvar 1100, bvar 1102, bvar 177, bvar 179]),
    bnot (bands [bvar 1100, bvar 1103, bvar 177, bvar 180]),
    bnot (bands [bvar 1100, bvar 1104, bvar 177, bvar 181]),
    bnot (bands [bvar 1101, bvar 1103, bvar 178, bvar 180]),
    bnot (bands [bvar 1101, bvar 1104, bvar 178, bvar 181]),
    bnot (bands [bvar 1102, bvar 1103, bvar 179, bvar 180]),
    bnot (bands [bvar 1102, bvar 1104, bvar 179, bvar 181]),
    bnot (bands [bvar 1103, bvar 1104, bvar 180, bvar 181]),
    bnot (bands [bvar 1100, bvar 1102, bvar 190, bvar 192]),
    bnot (bands [bvar 1100, bvar 1104, bvar 190, bvar 194]),
    bnot (bands [bvar 1100, bvar 1105, bvar 190, bvar 195]),
    bnot (bands [bvar 1101, bvar 1104, bvar 191, bvar 194]),
    bnot (bands [bvar 1101, bvar 1105, bvar 191, bvar 195]),
    bnot (bands [bvar 1102, bvar 1104, bvar 192, bvar 194]),
    bnot (bands [bvar 1103, bvar 1105, bvar 193, bvar 195]),
    bnot (bands [bvar 1104, bvar 1105, bvar 194, bvar 195]),
    bnot (bands [bvar 93, bvar 97, bvar 1120, bvar 1124]),
    bnot (bands [bvar 93, bvar 100, bvar 1120, bvar 1127]),
    bnot (bands [bvar 93, bvar 101, bvar 1120, bvar 1128]),
    bnot (bands [bvar 93, bvar 102, bvar 1120, bvar 1129]),
    bnot (bands [bvar 93, bvar 103, bvar 1120, bvar 1130]),
    bnot (bands [bvar 93, bvar 104, bvar 1120, bvar 1131]),
    bnot (bands [bvar 93, bvar 105, bvar 1120, bvar 1132]),
    bnot (bands [bvar 94, bvar 97, bvar 1121, bvar 1124]),
    bnot (bands [bvar 94, bvar 100, bvar 1121, bvar 1127]),
    bnot (bands [bvar 94, bvar 102, bvar 1121, bvar 1129]),
    bnot (bands [bvar 94, bvar 103, bvar 1121, bvar 1130]),
    bnot (bands [bvar 94, bvar 105, bvar 1121, bvar 1132]),
    bnot (bands [bvar 95, bvar 97, bvar 1122, bvar 1124]),
    bnot (bands [bvar 95, bvar 100, bvar 1122, bvar 1127]),
    bnot (bands [bvar 95, bvar 102, bvar 1122, bvar 1129]),
    bnot (bands [bvar 95, bvar 103, bvar 1122, bvar 1130]),
    bnot (bands [bvar 95, bvar 104, bvar 1122, bvar 1131]),
    bnot (bands [bvar 95, bvar 105, bvar 1122, bvar 1132]),
    bnot (bands [bvar 96, bvar 97, bvar 1123, bvar 1124]),
    bnot (bands [bvar 96, bvar 100, bvar 1123, bvar 1127]),
    bnot (bands [bvar 96, bvar 101, bvar 1123, bvar 1128]),
    bnot (bands [bvar 96, bvar 102, bvar 1123, bvar 1129]) ]

def reducedUnionChunk062 : BVLogicalExpr :=
  bands reducedUnionChunk062Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
