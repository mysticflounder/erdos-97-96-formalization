import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk025Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 33, bvar 34, bvar 189, bvar 190]),
    bnot (bands [bvar 33, bvar 35, bvar 189, bvar 191]),
    bnot (bands [bvar 33, bvar 36, bvar 189, bvar 192]),
    bnot (bands [bvar 33, bvar 38, bvar 189, bvar 194]),
    bnot (bands [bvar 33, bvar 39, bvar 189, bvar 195]),
    bnot (bands [bvar 34, bvar 35, bvar 190, bvar 191]),
    bnot (bands [bvar 34, bvar 36, bvar 190, bvar 192]),
    bnot (bands [bvar 34, bvar 38, bvar 190, bvar 194]),
    bnot (bands [bvar 34, bvar 39, bvar 190, bvar 195]),
    bnot (bands [bvar 35, bvar 36, bvar 191, bvar 192]),
    bnot (bands [bvar 35, bvar 37, bvar 191, bvar 193]),
    bnot (bands [bvar 35, bvar 38, bvar 191, bvar 194]),
    bnot (bands [bvar 35, bvar 39, bvar 191, bvar 195]),
    bnot (bands [bvar 36, bvar 38, bvar 192, bvar 194]),
    bnot (bands [bvar 36, bvar 39, bvar 192, bvar 195]),
    bnot (bands [bvar 44, bvar 47, bvar 57, bvar 60]),
    bnot (bands [bvar 44, bvar 48, bvar 57, bvar 61]),
    bnot (bands [bvar 44, bvar 49, bvar 57, bvar 62]),
    bnot (bands [bvar 44, bvar 50, bvar 57, bvar 63]),
    bnot (bands [bvar 44, bvar 51, bvar 57, bvar 64]),
    bnot (bands [bvar 44, bvar 52, bvar 57, bvar 65]),
    bnot (bands [bvar 44, bvar 53, bvar 57, bvar 66]),
    bnot (bands [bvar 47, bvar 51, bvar 60, bvar 64]),
    bnot (bands [bvar 47, bvar 52, bvar 60, bvar 65]),
    bnot (bands [bvar 47, bvar 53, bvar 60, bvar 66]),
    bnot (bands [bvar 48, bvar 50, bvar 61, bvar 63]),
    bnot (bands [bvar 49, bvar 53, bvar 62, bvar 66]),
    bnot (bands [bvar 45, bvar 49, bvar 71, bvar 75]),
    bnot (bands [bvar 46, bvar 50, bvar 72, bvar 76]),
    bnot (bands [bvar 49, bvar 50, bvar 75, bvar 76]),
    bnot (bands [bvar 47, bvar 53, bvar 99, bvar 105]),
    bnot (bands [bvar 44, bvar 45, bvar 135, bvar 136]),
    bnot (bands [bvar 44, bvar 48, bvar 135, bvar 139]),
    bnot (bands [bvar 41, bvar 51, bvar 145, bvar 155]),
    bnot (bands [bvar 43, bvar 45, bvar 147, bvar 149]),
    bnot (bands [bvar 44, bvar 45, bvar 148, bvar 149]),
    bnot (bands [bvar 45, bvar 46, bvar 149, bvar 150]),
    bnot (bands [bvar 45, bvar 47, bvar 149, bvar 151]),
    bnot (bands [bvar 45, bvar 48, bvar 149, bvar 152]),
    bnot (bands [bvar 45, bvar 49, bvar 149, bvar 153]),
    bnot (bands [bvar 47, bvar 48, bvar 151, bvar 152]),
    bnot (bands [bvar 47, bvar 49, bvar 151, bvar 153]),
    bnot (bands [bvar 48, bvar 49, bvar 152, bvar 153]),
    bnot (bands [bvar 45, bvar 48, bvar 175, bvar 178]),
    bnot (bands [bvar 45, bvar 50, bvar 175, bvar 180]),
    bnot (bands [bvar 45, bvar 51, bvar 175, bvar 181]),
    bnot (bands [bvar 48, bvar 50, bvar 178, bvar 180]),
    bnot (bands [bvar 48, bvar 51, bvar 178, bvar 181]),
    bnot (bands [bvar 50, bvar 51, bvar 180, bvar 181]),
    bnot (bands [bvar 55, bvar 59, bvar 68, bvar 72]),
    bnot (bands [bvar 55, bvar 66, bvar 68, bvar 79]),
    bnot (bands [bvar 59, bvar 66, bvar 72, bvar 79]),
    bnot (bands [bvar 57, bvar 59, bvar 109, bvar 111]),
    bnot (bands [bvar 74, bvar 77, bvar 100, bvar 103]),
    bnot (bands [bvar 75, bvar 77, bvar 101, bvar 103]),
    bnot (bands [bvar 75, bvar 79, bvar 101, bvar 105]),
    bnot (bands [bvar 77, bvar 78, bvar 103, bvar 104]),
    bnot (bands [bvar 77, bvar 79, bvar 103, bvar 105]),
    bnot (bands [bvar 71, bvar 72, bvar 123, bvar 124]),
    bnot (bands [bvar 71, bvar 73, bvar 123, bvar 125]),
    bnot (bands [bvar 72, bvar 73, bvar 124, bvar 125]),
    bnot (bands [bvar 78, bvar 79, bvar 130, bvar 131]),
    bnot (bands [bvar 67, bvar 69, bvar 132, bvar 134]),
    bnot (bands [bvar 67, bvar 76, bvar 132, bvar 141]) ]

def reducedUnionChunk025 : BVLogicalExpr :=
  bands reducedUnionChunk025Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
