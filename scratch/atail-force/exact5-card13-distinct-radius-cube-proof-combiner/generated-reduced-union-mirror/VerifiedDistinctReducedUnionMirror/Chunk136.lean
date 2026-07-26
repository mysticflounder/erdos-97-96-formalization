import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk136Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 2, bvar 7, bvar 69, bvar 74]),
    bnot (bands [bvar 2, bvar 9, bvar 69, bvar 76]),
    bnot (bands [bvar 2, bvar 10, bvar 69, bvar 77]),
    bnot (bands [bvar 2, bvar 11, bvar 69, bvar 78]),
    bnot (bands [bvar 5, bvar 9, bvar 72, bvar 76]),
    bnot (bands [bvar 5, bvar 10, bvar 72, bvar 77]),
    bnot (bands [bvar 5, bvar 11, bvar 72, bvar 78]),
    bnot (bands [bvar 5, bvar 12, bvar 72, bvar 79]),
    bnot (bands [bvar 6, bvar 10, bvar 73, bvar 77]),
    bnot (bands [bvar 6, bvar 11, bvar 73, bvar 78]),
    bnot (bands [bvar 7, bvar 10, bvar 74, bvar 77]),
    bnot (bands [bvar 7, bvar 11, bvar 74, bvar 78]),
    bnot (bands [bvar 8, bvar 9, bvar 75, bvar 76]),
    bnot (bands [bvar 8, bvar 11, bvar 75, bvar 78]),
    bnot (bands [bvar 9, bvar 10, bvar 76, bvar 77]),
    bnot (bands [bvar 9, bvar 11, bvar 76, bvar 78]),
    bnot (bands [bvar 9, bvar 12, bvar 76, bvar 79]),
    bnot (bands [bvar 10, bvar 11, bvar 77, bvar 78]),
    bnot (bands [bvar 10, bvar 12, bvar 77, bvar 79]),
    bnot (bands [bvar 11, bvar 12, bvar 78, bvar 79]),
    bnot (bands [bvar 0, bvar 6, bvar 93, bvar 99]),
    bnot (bands [bvar 0, bvar 8, bvar 93, bvar 101]),
    bnot (bands [bvar 0, bvar 9, bvar 93, bvar 102]),
    bnot (bands [bvar 0, bvar 11, bvar 93, bvar 104]),
    bnot (bands [bvar 0, bvar 12, bvar 93, bvar 105]),
    bnot (bands [bvar 1, bvar 9, bvar 94, bvar 102]),
    bnot (bands [bvar 1, bvar 12, bvar 94, bvar 105]),
    bnot (bands [bvar 2, bvar 6, bvar 95, bvar 99]),
    bnot (bands [bvar 2, bvar 7, bvar 95, bvar 100]),
    bnot (bands [bvar 2, bvar 8, bvar 95, bvar 101]),
    bnot (bands [bvar 2, bvar 9, bvar 95, bvar 102]),
    bnot (bands [bvar 2, bvar 10, bvar 95, bvar 103]),
    bnot (bands [bvar 2, bvar 11, bvar 95, bvar 104]),
    bnot (bands [bvar 2, bvar 12, bvar 95, bvar 105]),
    bnot (bands [bvar 3, bvar 6, bvar 96, bvar 99]),
    bnot (bands [bvar 3, bvar 7, bvar 96, bvar 100]),
    bnot (bands [bvar 3, bvar 8, bvar 96, bvar 101]),
    bnot (bands [bvar 3, bvar 9, bvar 96, bvar 102]),
    bnot (bands [bvar 3, bvar 10, bvar 96, bvar 103]),
    bnot (bands [bvar 3, bvar 11, bvar 96, bvar 104]),
    bnot (bands [bvar 3, bvar 12, bvar 96, bvar 105]),
    bnot (bands [bvar 6, bvar 9, bvar 99, bvar 102]),
    bnot (bands [bvar 6, bvar 10, bvar 99, bvar 103]),
    bnot (bands [bvar 6, bvar 11, bvar 99, bvar 104]),
    bnot (bands [bvar 6, bvar 12, bvar 99, bvar 105]),
    bnot (bands [bvar 7, bvar 9, bvar 100, bvar 102]),
    bnot (bands [bvar 7, bvar 11, bvar 100, bvar 104]),
    bnot (bands [bvar 7, bvar 12, bvar 100, bvar 105]),
    bnot (bands [bvar 8, bvar 9, bvar 101, bvar 102]),
    bnot (bands [bvar 8, bvar 10, bvar 101, bvar 103]),
    bnot (bands [bvar 8, bvar 11, bvar 101, bvar 104]),
    bnot (bands [bvar 8, bvar 12, bvar 101, bvar 105]),
    bnot (bands [bvar 9, bvar 10, bvar 102, bvar 103]),
    bnot (bands [bvar 9, bvar 11, bvar 102, bvar 104]),
    bnot (bands [bvar 9, bvar 12, bvar 102, bvar 105]),
    bnot (bands [bvar 10, bvar 11, bvar 103, bvar 104]),
    bnot (bands [bvar 10, bvar 12, bvar 103, bvar 105]),
    bnot (bands [bvar 11, bvar 12, bvar 104, bvar 105]),
    bnot (bands [bvar 0, bvar 7, bvar 106, bvar 113]),
    bnot (bands [bvar 2, bvar 7, bvar 108, bvar 113]),
    bnot (bands [bvar 2, bvar 8, bvar 108, bvar 114]),
    bnot (bands [bvar 2, bvar 10, bvar 108, bvar 116]),
    bnot (bands [bvar 2, bvar 11, bvar 108, bvar 117]),
    bnot (bands [bvar 2, bvar 12, bvar 108, bvar 118]) ]

def reducedUnionChunk136 : BVLogicalExpr :=
  bands reducedUnionChunk136Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
