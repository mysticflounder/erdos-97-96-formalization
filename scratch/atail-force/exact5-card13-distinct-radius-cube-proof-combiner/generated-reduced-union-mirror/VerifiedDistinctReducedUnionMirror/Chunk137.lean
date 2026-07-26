import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk137Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 3, bvar 7, bvar 109, bvar 113]),
    bnot (bands [bvar 3, bvar 8, bvar 109, bvar 114]),
    bnot (bands [bvar 3, bvar 9, bvar 109, bvar 115]),
    bnot (bands [bvar 3, bvar 10, bvar 109, bvar 116]),
    bnot (bands [bvar 3, bvar 11, bvar 109, bvar 117]),
    bnot (bands [bvar 3, bvar 12, bvar 109, bvar 118]),
    bnot (bands [bvar 7, bvar 9, bvar 113, bvar 115]),
    bnot (bands [bvar 7, bvar 10, bvar 113, bvar 116]),
    bnot (bands [bvar 7, bvar 11, bvar 113, bvar 117]),
    bnot (bands [bvar 7, bvar 12, bvar 113, bvar 118]),
    bnot (bands [bvar 8, bvar 9, bvar 114, bvar 115]),
    bnot (bands [bvar 8, bvar 10, bvar 114, bvar 116]),
    bnot (bands [bvar 8, bvar 11, bvar 114, bvar 117]),
    bnot (bands [bvar 8, bvar 12, bvar 114, bvar 118]),
    bnot (bands [bvar 9, bvar 10, bvar 115, bvar 116]),
    bnot (bands [bvar 9, bvar 11, bvar 115, bvar 117]),
    bnot (bands [bvar 10, bvar 11, bvar 116, bvar 117]),
    bnot (bands [bvar 10, bvar 12, bvar 116, bvar 118]),
    bnot (bands [bvar 11, bvar 12, bvar 117, bvar 118]),
    bnot (bands [bvar 0, bvar 8, bvar 119, bvar 127]),
    bnot (bands [bvar 0, bvar 9, bvar 119, bvar 128]),
    bnot (bands [bvar 0, bvar 10, bvar 119, bvar 129]),
    bnot (bands [bvar 1, bvar 11, bvar 120, bvar 130]),
    bnot (bands [bvar 2, bvar 8, bvar 121, bvar 127]),
    bnot (bands [bvar 2, bvar 9, bvar 121, bvar 128]),
    bnot (bands [bvar 2, bvar 10, bvar 121, bvar 129]),
    bnot (bands [bvar 2, bvar 11, bvar 121, bvar 130]),
    bnot (bands [bvar 2, bvar 12, bvar 121, bvar 131]),
    bnot (bands [bvar 3, bvar 8, bvar 122, bvar 127]),
    bnot (bands [bvar 3, bvar 9, bvar 122, bvar 128]),
    bnot (bands [bvar 3, bvar 10, bvar 122, bvar 129]),
    bnot (bands [bvar 3, bvar 11, bvar 122, bvar 130]),
    bnot (bands [bvar 3, bvar 12, bvar 122, bvar 131]),
    bnot (bands [bvar 8, bvar 9, bvar 127, bvar 128]),
    bnot (bands [bvar 8, bvar 10, bvar 127, bvar 129]),
    bnot (bands [bvar 8, bvar 11, bvar 127, bvar 130]),
    bnot (bands [bvar 8, bvar 12, bvar 127, bvar 131]),
    bnot (bands [bvar 9, bvar 10, bvar 128, bvar 129]),
    bnot (bands [bvar 11, bvar 12, bvar 130, bvar 131]),
    bnot (bands [bvar 0, bvar 3, bvar 132, bvar 135]),
    bnot (bands [bvar 0, bvar 9, bvar 132, bvar 141]),
    bnot (bands [bvar 0, bvar 10, bvar 132, bvar 142]),
    bnot (bands [bvar 0, bvar 11, bvar 132, bvar 143]),
    bnot (bands [bvar 0, bvar 12, bvar 132, bvar 144]),
    bnot (bands [bvar 1, bvar 12, bvar 133, bvar 144]),
    bnot (bands [bvar 3, bvar 9, bvar 135, bvar 141]),
    bnot (bands [bvar 3, bvar 10, bvar 135, bvar 142]),
    bnot (bands [bvar 3, bvar 11, bvar 135, bvar 143]),
    bnot (bands [bvar 3, bvar 12, bvar 135, bvar 144]),
    bnot (bands [bvar 9, bvar 10, bvar 141, bvar 142]),
    bnot (bands [bvar 9, bvar 11, bvar 141, bvar 143]),
    bnot (bands [bvar 9, bvar 12, bvar 141, bvar 144]),
    bnot (bands [bvar 10, bvar 11, bvar 142, bvar 143]),
    bnot (bands [bvar 10, bvar 12, bvar 142, bvar 144]),
    bnot (bands [bvar 11, bvar 12, bvar 143, bvar 144]),
    bnot (bands [bvar 0, bvar 1, bvar 145, bvar 146]),
    bnot (bands [bvar 0, bvar 2, bvar 145, bvar 147]),
    bnot (bands [bvar 0, bvar 3, bvar 145, bvar 148]),
    bnot (bands [bvar 0, bvar 10, bvar 145, bvar 155]),
    bnot (bands [bvar 0, bvar 11, bvar 145, bvar 156]),
    bnot (bands [bvar 0, bvar 12, bvar 145, bvar 157]),
    bnot (bands [bvar 1, bvar 10, bvar 146, bvar 155]),
    bnot (bands [bvar 1, bvar 11, bvar 146, bvar 156]),
    bnot (bands [bvar 1, bvar 12, bvar 146, bvar 157]) ]

def reducedUnionChunk137 : BVLogicalExpr :=
  bands reducedUnionChunk137Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
