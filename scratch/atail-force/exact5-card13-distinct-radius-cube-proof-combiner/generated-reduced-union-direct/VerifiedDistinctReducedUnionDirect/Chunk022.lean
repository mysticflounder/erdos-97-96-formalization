import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk022Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 37, bvar 40, bvar 63, bvar 66]),
    bnot (bands [bvar 38, bvar 39, bvar 64, bvar 65]),
    bnot (bands [bvar 39, bvar 40, bvar 65, bvar 66]),
    bnot (bands [bvar 32, bvar 33, bvar 71, bvar 72]),
    bnot (bands [bvar 32, bvar 34, bvar 71, bvar 73]),
    bnot (bands [bvar 32, bvar 35, bvar 71, bvar 74]),
    bnot (bands [bvar 32, bvar 36, bvar 71, bvar 75]),
    bnot (bands [bvar 32, bvar 37, bvar 71, bvar 76]),
    bnot (bands [bvar 32, bvar 38, bvar 71, bvar 77]),
    bnot (bands [bvar 32, bvar 39, bvar 71, bvar 78]),
    bnot (bands [bvar 32, bvar 40, bvar 71, bvar 79]),
    bnot (bands [bvar 33, bvar 34, bvar 72, bvar 73]),
    bnot (bands [bvar 33, bvar 35, bvar 72, bvar 74]),
    bnot (bands [bvar 33, bvar 36, bvar 72, bvar 75]),
    bnot (bands [bvar 33, bvar 37, bvar 72, bvar 76]),
    bnot (bands [bvar 33, bvar 38, bvar 72, bvar 77]),
    bnot (bands [bvar 33, bvar 39, bvar 72, bvar 78]),
    bnot (bands [bvar 33, bvar 40, bvar 72, bvar 79]),
    bnot (bands [bvar 34, bvar 35, bvar 73, bvar 74]),
    bnot (bands [bvar 34, bvar 36, bvar 73, bvar 75]),
    bnot (bands [bvar 34, bvar 37, bvar 73, bvar 76]),
    bnot (bands [bvar 34, bvar 38, bvar 73, bvar 77]),
    bnot (bands [bvar 34, bvar 39, bvar 73, bvar 78]),
    bnot (bands [bvar 34, bvar 40, bvar 73, bvar 79]),
    bnot (bands [bvar 35, bvar 36, bvar 74, bvar 75]),
    bnot (bands [bvar 35, bvar 37, bvar 74, bvar 76]),
    bnot (bands [bvar 35, bvar 38, bvar 74, bvar 77]),
    bnot (bands [bvar 35, bvar 40, bvar 74, bvar 79]),
    bnot (bands [bvar 36, bvar 37, bvar 75, bvar 76]),
    bnot (bands [bvar 36, bvar 38, bvar 75, bvar 77]),
    bnot (bands [bvar 36, bvar 40, bvar 75, bvar 79]),
    bnot (bands [bvar 37, bvar 40, bvar 76, bvar 79]),
    bnot (bands [bvar 38, bvar 40, bvar 77, bvar 79]),
    bnot (bands [bvar 29, bvar 32, bvar 94, bvar 97]),
    bnot (bands [bvar 30, bvar 32, bvar 95, bvar 97]),
    bnot (bands [bvar 31, bvar 32, bvar 96, bvar 97]),
    bnot (bands [bvar 34, bvar 35, bvar 99, bvar 100]),
    bnot (bands [bvar 34, bvar 36, bvar 99, bvar 101]),
    bnot (bands [bvar 34, bvar 37, bvar 99, bvar 102]),
    bnot (bands [bvar 34, bvar 38, bvar 99, bvar 103]),
    bnot (bands [bvar 34, bvar 39, bvar 99, bvar 104]),
    bnot (bands [bvar 34, bvar 40, bvar 99, bvar 105]),
    bnot (bands [bvar 35, bvar 36, bvar 100, bvar 101]),
    bnot (bands [bvar 35, bvar 37, bvar 100, bvar 102]),
    bnot (bands [bvar 35, bvar 38, bvar 100, bvar 103]),
    bnot (bands [bvar 35, bvar 39, bvar 100, bvar 104]),
    bnot (bands [bvar 35, bvar 40, bvar 100, bvar 105]),
    bnot (bands [bvar 36, bvar 37, bvar 101, bvar 102]),
    bnot (bands [bvar 36, bvar 38, bvar 101, bvar 103]),
    bnot (bands [bvar 36, bvar 39, bvar 101, bvar 104]),
    bnot (bands [bvar 36, bvar 40, bvar 101, bvar 105]),
    bnot (bands [bvar 37, bvar 38, bvar 102, bvar 103]),
    bnot (bands [bvar 37, bvar 39, bvar 102, bvar 104]),
    bnot (bands [bvar 37, bvar 40, bvar 102, bvar 105]),
    bnot (bands [bvar 38, bvar 39, bvar 103, bvar 104]),
    bnot (bands [bvar 38, bvar 40, bvar 103, bvar 105]),
    bnot (bands [bvar 39, bvar 40, bvar 104, bvar 105]),
    bnot (bands [bvar 29, bvar 33, bvar 107, bvar 111]),
    bnot (bands [bvar 30, bvar 33, bvar 108, bvar 111]),
    bnot (bands [bvar 31, bvar 33, bvar 109, bvar 111]),
    bnot (bands [bvar 32, bvar 33, bvar 110, bvar 111]),
    bnot (bands [bvar 35, bvar 36, bvar 113, bvar 114]),
    bnot (bands [bvar 35, bvar 37, bvar 113, bvar 115]),
    bnot (bands [bvar 35, bvar 39, bvar 113, bvar 117]) ]

def reducedUnionChunk022 : BVLogicalExpr :=
  bands reducedUnionChunk022Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
