import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk065Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1124, bvar 1131, bvar 136, bvar 143]),
    bnot (bands [bvar 1124, bvar 1132, bvar 136, bvar 144]),
    bnot (bands [bvar 1125, bvar 1129, bvar 137, bvar 141]),
    bnot (bands [bvar 1129, bvar 1131, bvar 141, bvar 143]),
    bnot (bands [bvar 1120, bvar 1121, bvar 145, bvar 146]),
    bnot (bands [bvar 1120, bvar 1124, bvar 145, bvar 149]),
    bnot (bands [bvar 1120, bvar 1125, bvar 145, bvar 150]),
    bnot (bands [bvar 1120, bvar 1132, bvar 145, bvar 157]),
    bnot (bands [bvar 1121, bvar 1124, bvar 146, bvar 149]),
    bnot (bands [bvar 1121, bvar 1125, bvar 146, bvar 150]),
    bnot (bands [bvar 1121, bvar 1132, bvar 146, bvar 157]),
    bnot (bands [bvar 1122, bvar 1124, bvar 147, bvar 149]),
    bnot (bands [bvar 1123, bvar 1124, bvar 148, bvar 149]),
    bnot (bands [bvar 1123, bvar 1125, bvar 148, bvar 150]),
    bnot (bands [bvar 1123, bvar 1131, bvar 148, bvar 156]),
    bnot (bands [bvar 1123, bvar 1132, bvar 148, bvar 157]),
    bnot (bands [bvar 1124, bvar 1125, bvar 149, bvar 150]),
    bnot (bands [bvar 1124, bvar 1130, bvar 149, bvar 155]),
    bnot (bands [bvar 1124, bvar 1131, bvar 149, bvar 156]),
    bnot (bands [bvar 1124, bvar 1132, bvar 149, bvar 157]),
    bnot (bands [bvar 1125, bvar 1130, bvar 150, bvar 155]),
    bnot (bands [bvar 1125, bvar 1131, bvar 150, bvar 156]),
    bnot (bands [bvar 1125, bvar 1132, bvar 150, bvar 157]),
    bnot (bands [bvar 1127, bvar 1128, bvar 152, bvar 153]),
    bnot (bands [bvar 1130, bvar 1131, bvar 155, bvar 156]),
    bnot (bands [bvar 1130, bvar 1132, bvar 155, bvar 157]),
    bnot (bands [bvar 1131, bvar 1132, bvar 156, bvar 157]),
    bnot (bands [bvar 110, bvar 117, bvar 1163, bvar 1170]),
    bnot (bands [bvar 110, bvar 118, bvar 1163, bvar 1171]),
    atMost [bands [bvar 1120, bvar 158], bands [bvar 1121, bvar 159], bands [bvar 1122, bvar 160], bands [bvar 1123, bvar 161], bands [bvar 1124, bvar 162], bands [bvar 1125, bvar 163], bands [bvar 1126, bvar 164], bands [bvar 1127, bvar 165], bands [bvar 1128, bvar 166], bands [bvar 1129, bvar 167], bands [bvar 1130, bvar 168], bands [bvar 1131, bvar 169], bands [bvar 1132, bvar 170]] 2,
    bnot (bands [bvar 1120, bvar 1121, bvar 158, bvar 159]),
    bnot (bands [bvar 1120, bvar 1124, bvar 158, bvar 162]),
    bnot (bands [bvar 1120, bvar 1125, bvar 158, bvar 163]),
    bnot (bands [bvar 1120, bvar 1131, bvar 158, bvar 169]),
    bnot (bands [bvar 1120, bvar 1132, bvar 158, bvar 170]),
    bnot (bands [bvar 1121, bvar 1124, bvar 159, bvar 162]),
    bnot (bands [bvar 1121, bvar 1125, bvar 159, bvar 163]),
    bnot (bands [bvar 1121, bvar 1131, bvar 159, bvar 169]),
    bnot (bands [bvar 1122, bvar 1124, bvar 160, bvar 162]),
    bnot (bands [bvar 1122, bvar 1125, bvar 160, bvar 163]),
    bnot (bands [bvar 1123, bvar 1124, bvar 161, bvar 162]),
    bnot (bands [bvar 1123, bvar 1125, bvar 161, bvar 163]),
    bnot (bands [bvar 1123, bvar 1131, bvar 161, bvar 169]),
    bnot (bands [bvar 1123, bvar 1132, bvar 161, bvar 170]),
    bnot (bands [bvar 1124, bvar 1125, bvar 162, bvar 163]),
    bnot (bands [bvar 1124, bvar 1131, bvar 162, bvar 169]),
    bnot (bands [bvar 1124, bvar 1132, bvar 162, bvar 170]),
    bnot (bands [bvar 1125, bvar 1131, bvar 163, bvar 169]),
    bnot (bands [bvar 1125, bvar 1132, bvar 163, bvar 170]),
    bnot (bands [bvar 1127, bvar 1128, bvar 165, bvar 166]),
    bnot (bands [bvar 1127, bvar 1129, bvar 165, bvar 167]),
    bnot (bands [bvar 1128, bvar 1129, bvar 166, bvar 167]),
    bnot (bands [bvar 1131, bvar 1132, bvar 169, bvar 170]),
    atMost [bands [bvar 1120, bvar 171], bands [bvar 1121, bvar 172], bands [bvar 1122, bvar 173], bands [bvar 1123, bvar 174], bands [bvar 1124, bvar 175], bands [bvar 1125, bvar 176], bands [bvar 1126, bvar 177], bands [bvar 1127, bvar 178], bands [bvar 1128, bvar 179], bands [bvar 1129, bvar 180], bands [bvar 1130, bvar 181], bands [bvar 1131, bvar 182], bands [bvar 1132, bvar 183]] 2,
    bnot (bands [bvar 1120, bvar 1121, bvar 171, bvar 172]),
    bnot (bands [bvar 1120, bvar 1122, bvar 171, bvar 173]),
    bnot (bands [bvar 1120, bvar 1123, bvar 171, bvar 174]),
    bnot (bands [bvar 1120, bvar 1124, bvar 171, bvar 175]),
    bnot (bands [bvar 1120, bvar 1125, bvar 171, bvar 176]),
    bnot (bands [bvar 1120, bvar 1132, bvar 171, bvar 183]),
    bnot (bands [bvar 1121, bvar 1124, bvar 172, bvar 175]),
    bnot (bands [bvar 1121, bvar 1125, bvar 172, bvar 176]),
    bnot (bands [bvar 1121, bvar 1132, bvar 172, bvar 183]),
    bnot (bands [bvar 1122, bvar 1124, bvar 173, bvar 175]) ]

def reducedUnionChunk065 : BVLogicalExpr :=
  bands reducedUnionChunk065Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
