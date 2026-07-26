import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk023Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 31, bvar 39, bvar 57, bvar 65]),
    bnot (bands [bvar 31, bvar 40, bvar 57, bvar 66]),
    bnot (bands [bvar 33, bvar 34, bvar 59, bvar 60]),
    bnot (bands [bvar 34, bvar 36, bvar 60, bvar 62]),
    bnot (bands [bvar 34, bvar 37, bvar 60, bvar 63]),
    bnot (bands [bvar 34, bvar 38, bvar 60, bvar 64]),
    bnot (bands [bvar 34, bvar 40, bvar 60, bvar 66]),
    bnot (bands [bvar 35, bvar 39, bvar 61, bvar 65]),
    bnot (bands [bvar 36, bvar 37, bvar 62, bvar 63]),
    bnot (bands [bvar 36, bvar 38, bvar 62, bvar 64]),
    bnot (bands [bvar 36, bvar 39, bvar 62, bvar 65]),
    bnot (bands [bvar 37, bvar 38, bvar 63, bvar 64]),
    bnot (bands [bvar 38, bvar 39, bvar 64, bvar 65]),
    bnot (bands [bvar 39, bvar 40, bvar 65, bvar 66]),
    bnot (bands [bvar 32, bvar 33, bvar 71, bvar 72]),
    bnot (bands [bvar 32, bvar 34, bvar 71, bvar 73]),
    bnot (bands [bvar 32, bvar 36, bvar 71, bvar 75]),
    bnot (bands [bvar 32, bvar 39, bvar 71, bvar 78]),
    bnot (bands [bvar 32, bvar 40, bvar 71, bvar 79]),
    bnot (bands [bvar 33, bvar 34, bvar 72, bvar 73]),
    bnot (bands [bvar 33, bvar 36, bvar 72, bvar 75]),
    bnot (bands [bvar 33, bvar 39, bvar 72, bvar 78]),
    bnot (bands [bvar 33, bvar 40, bvar 72, bvar 79]),
    bnot (bands [bvar 34, bvar 35, bvar 73, bvar 74]),
    bnot (bands [bvar 34, bvar 36, bvar 73, bvar 75]),
    bnot (bands [bvar 34, bvar 39, bvar 73, bvar 78]),
    bnot (bands [bvar 34, bvar 40, bvar 73, bvar 79]),
    bnot (bands [bvar 35, bvar 39, bvar 74, bvar 78]),
    bnot (bands [bvar 35, bvar 40, bvar 74, bvar 79]),
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
    bnot (bands [bvar 37, bvar 40, bvar 102, bvar 105]),
    bnot (bands [bvar 29, bvar 33, bvar 107, bvar 111]),
    bnot (bands [bvar 30, bvar 33, bvar 108, bvar 111]),
    bnot (bands [bvar 31, bvar 33, bvar 109, bvar 111]),
    bnot (bands [bvar 32, bvar 33, bvar 110, bvar 111]),
    bnot (bands [bvar 35, bvar 36, bvar 113, bvar 114]),
    bnot (bands [bvar 35, bvar 37, bvar 113, bvar 115]),
    bnot (bands [bvar 35, bvar 38, bvar 113, bvar 116]),
    bnot (bands [bvar 35, bvar 39, bvar 113, bvar 117]),
    bnot (bands [bvar 35, bvar 40, bvar 113, bvar 118]),
    bnot (bands [bvar 38, bvar 40, bvar 116, bvar 118]),
    bnot (bands [bvar 29, bvar 32, bvar 120, bvar 123]),
    bnot (bands [bvar 29, bvar 34, bvar 120, bvar 125]),
    bnot (bands [bvar 30, bvar 33, bvar 121, bvar 124]),
    bnot (bands [bvar 30, bvar 34, bvar 121, bvar 125]),
    bnot (bands [bvar 31, bvar 33, bvar 122, bvar 124]),
    bnot (bands [bvar 31, bvar 34, bvar 122, bvar 125]),
    bnot (bands [bvar 32, bvar 33, bvar 123, bvar 124]),
    bnot (bands [bvar 32, bvar 34, bvar 123, bvar 125]),
    bnot (bands [bvar 33, bvar 34, bvar 124, bvar 125]),
    bnot (bands [bvar 36, bvar 37, bvar 127, bvar 128]),
    bnot (bands [bvar 36, bvar 39, bvar 127, bvar 130]),
    bnot (bands [bvar 36, bvar 40, bvar 127, bvar 131]),
    bnot (bands [bvar 37, bvar 38, bvar 128, bvar 129]) ]

def reducedUnionChunk023 : BVLogicalExpr :=
  bands reducedUnionChunk023Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
