import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk026Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 67, bvar 77, bvar 132, bvar 142]),
    bnot (bands [bvar 67, bvar 78, bvar 132, bvar 143]),
    bnot (bands [bvar 67, bvar 79, bvar 132, bvar 144]),
    bnot (bands [bvar 67, bvar 68, bvar 145, bvar 146]),
    bnot (bands [bvar 67, bvar 77, bvar 145, bvar 155]),
    bnot (bands [bvar 67, bvar 78, bvar 145, bvar 156]),
    bnot (bands [bvar 68, bvar 78, bvar 146, bvar 156]),
    bnot (bands [bvar 69, bvar 78, bvar 147, bvar 156]),
    bnot (bands [bvar 71, bvar 72, bvar 149, bvar 150]),
    bnot (bands [bvar 71, bvar 73, bvar 149, bvar 151]),
    bnot (bands [bvar 71, bvar 74, bvar 149, bvar 152]),
    bnot (bands [bvar 71, bvar 75, bvar 149, bvar 153]),
    bnot (bands [bvar 72, bvar 74, bvar 150, bvar 152]),
    bnot (bands [bvar 72, bvar 75, bvar 150, bvar 153]),
    bnot (bands [bvar 73, bvar 74, bvar 151, bvar 152]),
    bnot (bands [bvar 73, bvar 75, bvar 151, bvar 153]),
    bnot (bands [bvar 74, bvar 75, bvar 152, bvar 153]),
    bnot (bands [bvar 77, bvar 79, bvar 155, bvar 157]),
    bnot (bands [bvar 78, bvar 79, bvar 156, bvar 157]),
    bnot (bands [bvar 67, bvar 68, bvar 158, bvar 159]),
    bnot (bands [bvar 67, bvar 69, bvar 158, bvar 160]),
    bnot (bands [bvar 67, bvar 79, bvar 158, bvar 170]),
    bnot (bands [bvar 68, bvar 79, bvar 159, bvar 170]),
    bnot (bands [bvar 69, bvar 79, bvar 160, bvar 170]),
    bnot (bands [bvar 71, bvar 72, bvar 162, bvar 163]),
    bnot (bands [bvar 71, bvar 73, bvar 162, bvar 164]),
    bnot (bands [bvar 71, bvar 74, bvar 162, bvar 165]),
    bnot (bands [bvar 71, bvar 75, bvar 162, bvar 166]),
    bnot (bands [bvar 71, bvar 76, bvar 162, bvar 167]),
    bnot (bands [bvar 72, bvar 73, bvar 163, bvar 164]),
    bnot (bands [bvar 72, bvar 75, bvar 163, bvar 166]),
    bnot (bands [bvar 72, bvar 76, bvar 163, bvar 167]),
    bnot (bands [bvar 73, bvar 75, bvar 164, bvar 166]),
    bnot (bands [bvar 73, bvar 76, bvar 164, bvar 167]),
    bnot (bands [bvar 74, bvar 75, bvar 165, bvar 166]),
    bnot (bands [bvar 74, bvar 76, bvar 165, bvar 167]),
    bnot (bands [bvar 75, bvar 76, bvar 166, bvar 167]),
    bnot (bands [bvar 78, bvar 79, bvar 169, bvar 170]),
    bnot (bands [bvar 67, bvar 68, bvar 171, bvar 172]),
    bnot (bands [bvar 68, bvar 79, bvar 172, bvar 183]),
    bnot (bands [bvar 73, bvar 76, bvar 177, bvar 180]),
    bnot (bands [bvar 74, bvar 75, bvar 178, bvar 179]),
    bnot (bands [bvar 86, bvar 87, bvar 151, bvar 152]),
    bnot (bands [bvar 93, bvar 94, bvar 106, bvar 107]),
    bnot (bands [bvar 93, bvar 95, bvar 106, bvar 108]),
    bnot (bands [bvar 93, bvar 96, bvar 106, bvar 109]),
    bnot (bands [bvar 93, bvar 97, bvar 106, bvar 110]),
    bnot (bands [bvar 93, bvar 101, bvar 106, bvar 114]),
    bnot (bands [bvar 93, bvar 102, bvar 106, bvar 115]),
    bnot (bands [bvar 93, bvar 103, bvar 106, bvar 116]),
    bnot (bands [bvar 93, bvar 104, bvar 106, bvar 117]),
    bnot (bands [bvar 93, bvar 105, bvar 106, bvar 118]),
    bnot (bands [bvar 94, bvar 97, bvar 107, bvar 110]),
    bnot (bands [bvar 94, bvar 101, bvar 107, bvar 114]),
    bnot (bands [bvar 94, bvar 102, bvar 107, bvar 115]),
    bnot (bands [bvar 94, bvar 104, bvar 107, bvar 117]),
    bnot (bands [bvar 94, bvar 105, bvar 107, bvar 118]),
    bnot (bands [bvar 95, bvar 97, bvar 108, bvar 110]),
    bnot (bands [bvar 95, bvar 101, bvar 108, bvar 114]),
    bnot (bands [bvar 95, bvar 102, bvar 108, bvar 115]),
    bnot (bands [bvar 95, bvar 104, bvar 108, bvar 117]),
    bnot (bands [bvar 95, bvar 105, bvar 108, bvar 118]),
    bnot (bands [bvar 96, bvar 97, bvar 109, bvar 110]),
    bnot (bands [bvar 96, bvar 100, bvar 109, bvar 113]) ]

def reducedUnionChunk026 : BVLogicalExpr :=
  bands reducedUnionChunk026Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
