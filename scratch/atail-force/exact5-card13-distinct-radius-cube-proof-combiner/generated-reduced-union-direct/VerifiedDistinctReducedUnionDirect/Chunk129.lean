import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk129Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 7, bvar 11, bvar 100, bvar 104]),
    bnot (bands [bvar 7, bvar 12, bvar 100, bvar 105]),
    bnot (bands [bvar 8, bvar 9, bvar 101, bvar 102]),
    bnot (bands [bvar 8, bvar 10, bvar 101, bvar 103]),
    bnot (bands [bvar 8, bvar 11, bvar 101, bvar 104]),
    bnot (bands [bvar 8, bvar 12, bvar 101, bvar 105]),
    bnot (bands [bvar 9, bvar 10, bvar 102, bvar 103]),
    bnot (bands [bvar 9, bvar 11, bvar 102, bvar 104]),
    bnot (bands [bvar 9, bvar 12, bvar 102, bvar 105]),
    bnot (bands [bvar 10, bvar 12, bvar 103, bvar 105]),
    bnot (bands [bvar 0, bvar 12, bvar 106, bvar 118]),
    bnot (bands [bvar 2, bvar 8, bvar 108, bvar 114]),
    bnot (bands [bvar 3, bvar 8, bvar 109, bvar 114]),
    bnot (bands [bvar 3, bvar 10, bvar 109, bvar 116]),
    bnot (bands [bvar 7, bvar 9, bvar 113, bvar 115]),
    bnot (bands [bvar 7, bvar 11, bvar 113, bvar 117]),
    bnot (bands [bvar 8, bvar 10, bvar 114, bvar 116]),
    bnot (bands [bvar 8, bvar 12, bvar 114, bvar 118]),
    bnot (bands [bvar 9, bvar 12, bvar 115, bvar 118]),
    bnot (bands [bvar 10, bvar 11, bvar 116, bvar 117]),
    bnot (bands [bvar 0, bvar 9, bvar 119, bvar 128]),
    bnot (bands [bvar 0, bvar 10, bvar 119, bvar 129]),
    bnot (bands [bvar 0, bvar 11, bvar 119, bvar 130]),
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
    bnot (bands [bvar 9, bvar 11, bvar 128, bvar 130]),
    bnot (bands [bvar 9, bvar 12, bvar 128, bvar 131]),
    bnot (bands [bvar 10, bvar 11, bvar 129, bvar 130]),
    bnot (bands [bvar 10, bvar 12, bvar 129, bvar 131]),
    bnot (bands [bvar 0, bvar 3, bvar 132, bvar 135]),
    bnot (bands [bvar 0, bvar 9, bvar 132, bvar 141]),
    bnot (bands [bvar 3, bvar 9, bvar 135, bvar 141]),
    bnot (bands [bvar 3, bvar 10, bvar 135, bvar 142]),
    bnot (bands [bvar 3, bvar 11, bvar 135, bvar 143]),
    bnot (bands [bvar 3, bvar 12, bvar 135, bvar 144]),
    bnot (bands [bvar 0, bvar 2, bvar 145, bvar 147]),
    bnot (bands [bvar 0, bvar 3, bvar 145, bvar 148]),
    bnot (bands [bvar 0, bvar 10, bvar 145, bvar 155]),
    bnot (bands [bvar 0, bvar 11, bvar 145, bvar 156]),
    bnot (bands [bvar 0, bvar 12, bvar 145, bvar 157]),
    bnot (bands [bvar 1, bvar 10, bvar 146, bvar 155]),
    bnot (bands [bvar 1, bvar 11, bvar 146, bvar 156]),
    bnot (bands [bvar 1, bvar 12, bvar 146, bvar 157]),
    bnot (bands [bvar 2, bvar 10, bvar 147, bvar 155]),
    bnot (bands [bvar 2, bvar 11, bvar 147, bvar 156]),
    bnot (bands [bvar 2, bvar 12, bvar 147, bvar 157]),
    bnot (bands [bvar 3, bvar 10, bvar 148, bvar 155]),
    bnot (bands [bvar 3, bvar 11, bvar 148, bvar 156]),
    bnot (bands [bvar 3, bvar 12, bvar 148, bvar 157]),
    bnot (bands [bvar 5, bvar 8, bvar 150, bvar 153]),
    bnot (bands [bvar 7, bvar 8, bvar 152, bvar 153]),
    bnot (bands [bvar 10, bvar 11, bvar 155, bvar 156]),
    bnot (bands [bvar 10, bvar 12, bvar 155, bvar 157]),
    bnot (bands [bvar 0, bvar 12, bvar 158, bvar 170]),
    bnot (bands [bvar 1, bvar 12, bvar 159, bvar 170]) ]

def reducedUnionChunk129 : BVLogicalExpr :=
  bands reducedUnionChunk129Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
