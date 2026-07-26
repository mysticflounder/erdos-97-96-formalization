import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk138Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 2, bvar 10, bvar 147, bvar 155]),
    bnot (bands [bvar 2, bvar 11, bvar 147, bvar 156]),
    bnot (bands [bvar 2, bvar 12, bvar 147, bvar 157]),
    bnot (bands [bvar 3, bvar 10, bvar 148, bvar 155]),
    bnot (bands [bvar 3, bvar 11, bvar 148, bvar 156]),
    bnot (bands [bvar 3, bvar 12, bvar 148, bvar 157]),
    bnot (bands [bvar 5, bvar 6, bvar 150, bvar 151]),
    bnot (bands [bvar 10, bvar 11, bvar 155, bvar 156]),
    bnot (bands [bvar 10, bvar 12, bvar 155, bvar 157]),
    bnot (bands [bvar 11, bvar 12, bvar 156, bvar 157]),
    bnot (bands [bvar 0, bvar 11, bvar 158, bvar 169]),
    bnot (bands [bvar 1, bvar 11, bvar 159, bvar 169]),
    bnot (bands [bvar 1, bvar 12, bvar 159, bvar 170]),
    bnot (bands [bvar 2, bvar 11, bvar 160, bvar 169]),
    bnot (bands [bvar 2, bvar 12, bvar 160, bvar 170]),
    bnot (bands [bvar 3, bvar 11, bvar 161, bvar 169]),
    bnot (bands [bvar 3, bvar 12, bvar 161, bvar 170]),
    bnot (bands [bvar 5, bvar 8, bvar 163, bvar 166]),
    bnot (bands [bvar 5, bvar 9, bvar 163, bvar 167]),
    bnot (bands [bvar 6, bvar 9, bvar 164, bvar 167]),
    bnot (bands [bvar 7, bvar 8, bvar 165, bvar 166]),
    bnot (bands [bvar 7, bvar 9, bvar 165, bvar 167]),
    bnot (bands [bvar 8, bvar 9, bvar 166, bvar 167]),
    bnot (bands [bvar 0, bvar 12, bvar 171, bvar 183]),
    bnot (bands [bvar 1, bvar 12, bvar 172, bvar 183]),
    bnot (bands [bvar 2, bvar 12, bvar 173, bvar 183]),
    bnot (bands [bvar 3, bvar 12, bvar 174, bvar 183]),
    bnot (bands [bvar 5, bvar 9, bvar 176, bvar 180]),
    bnot (bands [bvar 6, bvar 9, bvar 177, bvar 180]),
    bnot (bands [bvar 6, bvar 10, bvar 177, bvar 181]),
    bnot (bands [bvar 7, bvar 9, bvar 178, bvar 180]),
    bnot (bands [bvar 7, bvar 10, bvar 178, bvar 181]),
    bnot (bands [bvar 8, bvar 9, bvar 179, bvar 180]),
    bnot (bands [bvar 8, bvar 10, bvar 179, bvar 181]),
    bnot (bands [bvar 6, bvar 9, bvar 190, bvar 193]),
    bnot (bands [bvar 6, bvar 11, bvar 190, bvar 195]),
    bnot (bands [bvar 7, bvar 10, bvar 191, bvar 194]),
    bnot (bands [bvar 7, bvar 11, bvar 191, bvar 195]),
    bnot (bands [bvar 8, bvar 11, bvar 192, bvar 195]),
    bnot (bands [bvar 10, bvar 11, bvar 194, bvar 195]),
    bnot (bands [bvar 2, bvar 9, bvar 134, bvar 141]),
    bnot (bands [bvar 2, bvar 10, bvar 134, bvar 142]),
    bnot (bands [bvar 3, bvar 10, bvar 135, bvar 142]),
    bnot (bands [bvar 3, bvar 11, bvar 135, bvar 143]),
    bnot (bands [bvar 6, bvar 12, bvar 34, bvar 40]),
    bnot (bands [bvar 7, bvar 12, bvar 61, bvar 66]),
    bnot (bands [bvar 5, bvar 9, bvar 72, bvar 76]),
    bnot (bands [bvar 5, bvar 10, bvar 72, bvar 77]),
    bnot (bands [bvar 5, bvar 11, bvar 72, bvar 78]),
    bnot (bands [bvar 6, bvar 9, bvar 73, bvar 76]),
    bnot (bands [bvar 6, bvar 10, bvar 73, bvar 77]),
    bnot (bands [bvar 6, bvar 11, bvar 73, bvar 78]),
    bnot (bands [bvar 6, bvar 12, bvar 73, bvar 79]),
    bnot (bands [bvar 7, bvar 9, bvar 74, bvar 76]),
    bnot (bands [bvar 7, bvar 10, bvar 74, bvar 77]),
    bnot (bands [bvar 7, bvar 11, bvar 74, bvar 78]),
    bnot (bands [bvar 7, bvar 12, bvar 74, bvar 79]),
    bnot (bands [bvar 8, bvar 9, bvar 75, bvar 76]),
    bnot (bands [bvar 8, bvar 10, bvar 75, bvar 77]),
    bnot (bands [bvar 8, bvar 12, bvar 75, bvar 79]),
    bnot (bands [bvar 9, bvar 11, bvar 76, bvar 78]),
    bnot (bands [bvar 9, bvar 12, bvar 76, bvar 79]),
    bnot (bands [bvar 10, bvar 12, bvar 77, bvar 79]),
    bnot (bands [bvar 11, bvar 12, bvar 78, bvar 79]) ]

def reducedUnionChunk138 : BVLogicalExpr :=
  bands reducedUnionChunk138Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
