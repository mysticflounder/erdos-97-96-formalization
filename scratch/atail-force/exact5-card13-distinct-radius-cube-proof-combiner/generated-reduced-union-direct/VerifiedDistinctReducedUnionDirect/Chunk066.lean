import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk066Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1123, bvar 1129, bvar 122, bvar 128]),
    bnot (bands [bvar 1123, bvar 1130, bvar 122, bvar 129]),
    bnot (bands [bvar 1123, bvar 1131, bvar 122, bvar 130]),
    bnot (bands [bvar 1123, bvar 1132, bvar 122, bvar 131]),
    bnot (bands [bvar 1124, bvar 1125, bvar 123, bvar 124]),
    bnot (bands [bvar 1124, bvar 1128, bvar 123, bvar 127]),
    bnot (bands [bvar 1124, bvar 1129, bvar 123, bvar 128]),
    bnot (bands [bvar 1124, bvar 1130, bvar 123, bvar 129]),
    bnot (bands [bvar 1124, bvar 1131, bvar 123, bvar 130]),
    bnot (bands [bvar 1124, bvar 1132, bvar 123, bvar 131]),
    bnot (bands [bvar 1125, bvar 1128, bvar 124, bvar 127]),
    bnot (bands [bvar 1125, bvar 1129, bvar 124, bvar 128]),
    bnot (bands [bvar 1125, bvar 1130, bvar 124, bvar 129]),
    bnot (bands [bvar 1125, bvar 1131, bvar 124, bvar 130]),
    bnot (bands [bvar 1125, bvar 1132, bvar 124, bvar 131]),
    bnot (bands [bvar 1128, bvar 1129, bvar 127, bvar 128]),
    bnot (bands [bvar 1128, bvar 1130, bvar 127, bvar 129]),
    bnot (bands [bvar 1128, bvar 1131, bvar 127, bvar 130]),
    bnot (bands [bvar 1128, bvar 1132, bvar 127, bvar 131]),
    bnot (bands [bvar 1129, bvar 1130, bvar 128, bvar 129]),
    bnot (bands [bvar 1129, bvar 1131, bvar 128, bvar 130]),
    bnot (bands [bvar 1129, bvar 1132, bvar 128, bvar 131]),
    bnot (bands [bvar 1130, bvar 1132, bvar 129, bvar 131]),
    bnot (bands [bvar 1131, bvar 1132, bvar 130, bvar 131]),
    bnot (bands [bvar 1120, bvar 1123, bvar 132, bvar 135]),
    bnot (bands [bvar 1120, bvar 1124, bvar 132, bvar 136]),
    bnot (bands [bvar 1123, bvar 1124, bvar 135, bvar 136]),
    bnot (bands [bvar 1123, bvar 1125, bvar 135, bvar 137]),
    bnot (bands [bvar 1123, bvar 1129, bvar 135, bvar 141]),
    bnot (bands [bvar 1123, bvar 1130, bvar 135, bvar 142]),
    bnot (bands [bvar 1123, bvar 1131, bvar 135, bvar 143]),
    bnot (bands [bvar 1123, bvar 1132, bvar 135, bvar 144]),
    bnot (bands [bvar 1124, bvar 1129, bvar 136, bvar 141]),
    bnot (bands [bvar 1124, bvar 1130, bvar 136, bvar 142]),
    bnot (bands [bvar 1124, bvar 1131, bvar 136, bvar 143]),
    bnot (bands [bvar 1124, bvar 1132, bvar 136, bvar 144]),
    bnot (bands [bvar 1125, bvar 1129, bvar 137, bvar 141]),
    bnot (bands [bvar 1125, bvar 1131, bvar 137, bvar 143]),
    bnot (bands [bvar 1125, bvar 1132, bvar 137, bvar 144]),
    bnot (bands [bvar 1129, bvar 1130, bvar 141, bvar 142]),
    bnot (bands [bvar 1129, bvar 1131, bvar 141, bvar 143]),
    bnot (bands [bvar 1130, bvar 1132, bvar 142, bvar 144]),
    atMost [bands [bvar 1120, bvar 145], bands [bvar 1121, bvar 146], bands [bvar 1122, bvar 147], bands [bvar 1123, bvar 148], bands [bvar 1124, bvar 149], bands [bvar 1125, bvar 150], bands [bvar 1126, bvar 151], bands [bvar 1127, bvar 152], bands [bvar 1128, bvar 153], bands [bvar 1129, bvar 154], bands [bvar 1130, bvar 155], bands [bvar 1131, bvar 156], bands [bvar 1132, bvar 157]] 2,
    bnot (bands [bvar 1120, bvar 1121, bvar 145, bvar 146]),
    bnot (bands [bvar 1120, bvar 1123, bvar 145, bvar 148]),
    bnot (bands [bvar 1120, bvar 1124, bvar 145, bvar 149]),
    bnot (bands [bvar 1120, bvar 1125, bvar 145, bvar 150]),
    bnot (bands [bvar 1120, bvar 1130, bvar 145, bvar 155]),
    bnot (bands [bvar 1120, bvar 1132, bvar 145, bvar 157]),
    bnot (bands [bvar 1121, bvar 1124, bvar 146, bvar 149]),
    bnot (bands [bvar 1121, bvar 1125, bvar 146, bvar 150]),
    bnot (bands [bvar 1121, bvar 1130, bvar 146, bvar 155]),
    bnot (bands [bvar 1121, bvar 1131, bvar 146, bvar 156]),
    bnot (bands [bvar 1121, bvar 1132, bvar 146, bvar 157]),
    bnot (bands [bvar 1122, bvar 1124, bvar 147, bvar 149]),
    bnot (bands [bvar 1122, bvar 1125, bvar 147, bvar 150]),
    bnot (bands [bvar 1122, bvar 1130, bvar 147, bvar 155]),
    bnot (bands [bvar 1122, bvar 1131, bvar 147, bvar 156]),
    bnot (bands [bvar 1122, bvar 1132, bvar 147, bvar 157]),
    bnot (bands [bvar 1123, bvar 1124, bvar 148, bvar 149]),
    bnot (bands [bvar 1123, bvar 1125, bvar 148, bvar 150]),
    bnot (bands [bvar 1123, bvar 1130, bvar 148, bvar 155]),
    bnot (bands [bvar 1123, bvar 1131, bvar 148, bvar 156]),
    bnot (bands [bvar 1123, bvar 1132, bvar 148, bvar 157]) ]

def reducedUnionChunk066 : BVLogicalExpr :=
  bands reducedUnionChunk066Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
