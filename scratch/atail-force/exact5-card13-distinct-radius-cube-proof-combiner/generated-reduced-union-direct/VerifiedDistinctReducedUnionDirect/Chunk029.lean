import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk029Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 106, bvar 108, bvar 158, bvar 160]),
    bnot (bands [bvar 106, bvar 110, bvar 158, bvar 162]),
    bnot (bands [bvar 106, bvar 111, bvar 158, bvar 163]),
    bnot (bands [bvar 107, bvar 110, bvar 159, bvar 162]),
    bnot (bands [bvar 107, bvar 111, bvar 159, bvar 163]),
    bnot (bands [bvar 107, bvar 117, bvar 159, bvar 169]),
    bnot (bands [bvar 108, bvar 110, bvar 160, bvar 162]),
    bnot (bands [bvar 108, bvar 111, bvar 160, bvar 163]),
    bnot (bands [bvar 109, bvar 111, bvar 161, bvar 163]),
    bnot (bands [bvar 109, bvar 117, bvar 161, bvar 169]),
    bnot (bands [bvar 109, bvar 118, bvar 161, bvar 170]),
    bnot (bands [bvar 110, bvar 111, bvar 162, bvar 163]),
    bnot (bands [bvar 110, bvar 117, bvar 162, bvar 169]),
    bnot (bands [bvar 110, bvar 118, bvar 162, bvar 170]),
    bnot (bands [bvar 111, bvar 117, bvar 163, bvar 169]),
    bnot (bands [bvar 111, bvar 118, bvar 163, bvar 170]),
    bnot (bands [bvar 113, bvar 114, bvar 165, bvar 166]),
    bnot (bands [bvar 113, bvar 115, bvar 165, bvar 167]),
    bnot (bands [bvar 114, bvar 115, bvar 166, bvar 167]),
    bnot (bands [bvar 117, bvar 118, bvar 169, bvar 170]),
    bnot (bands [bvar 119, bvar 122, bvar 132, bvar 135]),
    bnot (bands [bvar 119, bvar 123, bvar 132, bvar 136]),
    bnot (bands [bvar 119, bvar 124, bvar 132, bvar 137]),
    bnot (bands [bvar 119, bvar 125, bvar 132, bvar 138]),
    bnot (bands [bvar 122, bvar 123, bvar 135, bvar 136]),
    bnot (bands [bvar 122, bvar 125, bvar 135, bvar 138]),
    bnot (bands [bvar 122, bvar 128, bvar 135, bvar 141]),
    bnot (bands [bvar 122, bvar 130, bvar 135, bvar 143]),
    bnot (bands [bvar 122, bvar 131, bvar 135, bvar 144]),
    bnot (bands [bvar 123, bvar 125, bvar 136, bvar 138]),
    bnot (bands [bvar 124, bvar 128, bvar 137, bvar 141]),
    bnot (bands [bvar 124, bvar 130, bvar 137, bvar 143]),
    bnot (bands [bvar 124, bvar 131, bvar 137, bvar 144]),
    bnot (bands [bvar 119, bvar 120, bvar 145, bvar 146]),
    bnot (bands [bvar 119, bvar 122, bvar 145, bvar 148]),
    bnot (bands [bvar 119, bvar 123, bvar 145, bvar 149]),
    bnot (bands [bvar 119, bvar 124, bvar 145, bvar 150]),
    bnot (bands [bvar 119, bvar 125, bvar 145, bvar 151]),
    bnot (bands [bvar 119, bvar 129, bvar 145, bvar 155]),
    bnot (bands [bvar 119, bvar 130, bvar 145, bvar 156]),
    bnot (bands [bvar 119, bvar 131, bvar 145, bvar 157]),
    bnot (bands [bvar 120, bvar 123, bvar 146, bvar 149]),
    bnot (bands [bvar 120, bvar 124, bvar 146, bvar 150]),
    bnot (bands [bvar 120, bvar 125, bvar 146, bvar 151]),
    bnot (bands [bvar 120, bvar 129, bvar 146, bvar 155]),
    bnot (bands [bvar 120, bvar 130, bvar 146, bvar 156]),
    bnot (bands [bvar 120, bvar 131, bvar 146, bvar 157]),
    bnot (bands [bvar 121, bvar 123, bvar 147, bvar 149]),
    bnot (bands [bvar 121, bvar 124, bvar 147, bvar 150]),
    bnot (bands [bvar 121, bvar 129, bvar 147, bvar 155]),
    bnot (bands [bvar 121, bvar 130, bvar 147, bvar 156]),
    bnot (bands [bvar 122, bvar 123, bvar 148, bvar 149]),
    bnot (bands [bvar 122, bvar 124, bvar 148, bvar 150]),
    bnot (bands [bvar 122, bvar 129, bvar 148, bvar 155]),
    bnot (bands [bvar 122, bvar 131, bvar 148, bvar 157]),
    bnot (bands [bvar 123, bvar 124, bvar 149, bvar 150]),
    bnot (bands [bvar 123, bvar 125, bvar 149, bvar 151]),
    bnot (bands [bvar 123, bvar 129, bvar 149, bvar 155]),
    bnot (bands [bvar 123, bvar 130, bvar 149, bvar 156]),
    bnot (bands [bvar 123, bvar 131, bvar 149, bvar 157]),
    bnot (bands [bvar 124, bvar 125, bvar 150, bvar 151]),
    bnot (bands [bvar 124, bvar 129, bvar 150, bvar 155]),
    bnot (bands [bvar 124, bvar 130, bvar 150, bvar 156]),
    bnot (bands [bvar 124, bvar 131, bvar 150, bvar 157]) ]

def reducedUnionChunk029 : BVLogicalExpr :=
  bands reducedUnionChunk029Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
