import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk027Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 96, bvar 101, bvar 109, bvar 114]),
    bnot (bands [bvar 96, bvar 102, bvar 109, bvar 115]),
    bnot (bands [bvar 96, bvar 103, bvar 109, bvar 116]),
    bnot (bands [bvar 96, bvar 104, bvar 109, bvar 117]),
    bnot (bands [bvar 96, bvar 105, bvar 109, bvar 118]),
    bnot (bands [bvar 97, bvar 100, bvar 110, bvar 113]),
    bnot (bands [bvar 97, bvar 101, bvar 110, bvar 114]),
    bnot (bands [bvar 97, bvar 102, bvar 110, bvar 115]),
    bnot (bands [bvar 97, bvar 103, bvar 110, bvar 116]),
    bnot (bands [bvar 97, bvar 104, bvar 110, bvar 117]),
    bnot (bands [bvar 97, bvar 105, bvar 110, bvar 118]),
    bnot (bands [bvar 100, bvar 101, bvar 113, bvar 114]),
    bnot (bands [bvar 100, bvar 102, bvar 113, bvar 115]),
    bnot (bands [bvar 100, bvar 104, bvar 113, bvar 117]),
    bnot (bands [bvar 100, bvar 105, bvar 113, bvar 118]),
    bnot (bands [bvar 101, bvar 102, bvar 114, bvar 115]),
    bnot (bands [bvar 101, bvar 103, bvar 114, bvar 116]),
    bnot (bands [bvar 101, bvar 104, bvar 114, bvar 117]),
    bnot (bands [bvar 101, bvar 105, bvar 114, bvar 118]),
    bnot (bands [bvar 102, bvar 103, bvar 115, bvar 116]),
    bnot (bands [bvar 102, bvar 104, bvar 115, bvar 117]),
    bnot (bands [bvar 102, bvar 105, bvar 115, bvar 118]),
    bnot (bands [bvar 103, bvar 104, bvar 116, bvar 117]),
    bnot (bands [bvar 103, bvar 105, bvar 116, bvar 118]),
    bnot (bands [bvar 104, bvar 105, bvar 117, bvar 118]),
    bnot (bands [bvar 93, bvar 96, bvar 132, bvar 135]),
    bnot (bands [bvar 93, bvar 97, bvar 132, bvar 136]),
    bnot (bands [bvar 93, bvar 102, bvar 132, bvar 141]),
    bnot (bands [bvar 93, bvar 104, bvar 132, bvar 143]),
    bnot (bands [bvar 93, bvar 105, bvar 132, bvar 144]),
    bnot (bands [bvar 95, bvar 97, bvar 134, bvar 136]),
    bnot (bands [bvar 96, bvar 97, bvar 135, bvar 136]),
    bnot (bands [bvar 96, bvar 102, bvar 135, bvar 141]),
    bnot (bands [bvar 96, bvar 104, bvar 135, bvar 143]),
    bnot (bands [bvar 96, bvar 105, bvar 135, bvar 144]),
    bnot (bands [bvar 97, bvar 102, bvar 136, bvar 141]),
    bnot (bands [bvar 97, bvar 104, bvar 136, bvar 143]),
    bnot (bands [bvar 97, bvar 105, bvar 136, bvar 144]),
    bnot (bands [bvar 93, bvar 94, bvar 145, bvar 146]),
    bnot (bands [bvar 93, bvar 95, bvar 145, bvar 147]),
    bnot (bands [bvar 93, bvar 97, bvar 145, bvar 149]),
    bnot (bands [bvar 93, bvar 103, bvar 145, bvar 155]),
    bnot (bands [bvar 93, bvar 104, bvar 145, bvar 156]),
    bnot (bands [bvar 93, bvar 105, bvar 145, bvar 157]),
    bnot (bands [bvar 94, bvar 97, bvar 146, bvar 149]),
    bnot (bands [bvar 94, bvar 104, bvar 146, bvar 156]),
    bnot (bands [bvar 94, bvar 105, bvar 146, bvar 157]),
    bnot (bands [bvar 95, bvar 97, bvar 147, bvar 149]),
    bnot (bands [bvar 95, bvar 103, bvar 147, bvar 155]),
    bnot (bands [bvar 95, bvar 104, bvar 147, bvar 156]),
    bnot (bands [bvar 95, bvar 105, bvar 147, bvar 157]),
    bnot (bands [bvar 96, bvar 97, bvar 148, bvar 149]),
    bnot (bands [bvar 96, bvar 103, bvar 148, bvar 155]),
    bnot (bands [bvar 96, bvar 104, bvar 148, bvar 156]),
    bnot (bands [bvar 96, bvar 105, bvar 148, bvar 157]),
    bnot (bands [bvar 97, bvar 103, bvar 149, bvar 155]),
    bnot (bands [bvar 97, bvar 104, bvar 149, bvar 156]),
    bnot (bands [bvar 97, bvar 105, bvar 149, bvar 157]),
    bnot (bands [bvar 99, bvar 100, bvar 151, bvar 152]),
    bnot (bands [bvar 99, bvar 101, bvar 151, bvar 153]),
    bnot (bands [bvar 100, bvar 101, bvar 152, bvar 153]),
    bnot (bands [bvar 103, bvar 104, bvar 155, bvar 156]),
    bnot (bands [bvar 103, bvar 105, bvar 155, bvar 157]),
    bnot (bands [bvar 104, bvar 105, bvar 156, bvar 157]) ]

def reducedUnionChunk027 : BVLogicalExpr :=
  bands reducedUnionChunk027Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
