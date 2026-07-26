import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk025Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 33, bvar 34, bvar 176, bvar 177]),
    bnot (bands [bvar 33, bvar 35, bvar 176, bvar 178]),
    bnot (bands [bvar 34, bvar 35, bvar 177, bvar 178]),
    bnot (bands [bvar 34, bvar 36, bvar 177, bvar 179]),
    bnot (bands [bvar 34, bvar 37, bvar 177, bvar 180]),
    bnot (bands [bvar 34, bvar 38, bvar 177, bvar 181]),
    bnot (bands [bvar 35, bvar 36, bvar 178, bvar 179]),
    bnot (bands [bvar 35, bvar 37, bvar 178, bvar 180]),
    bnot (bands [bvar 35, bvar 38, bvar 178, bvar 181]),
    bnot (bands [bvar 29, bvar 34, bvar 185, bvar 190]),
    bnot (bands [bvar 29, bvar 35, bvar 185, bvar 191]),
    bnot (bands [bvar 29, bvar 36, bvar 185, bvar 192]),
    bnot (bands [bvar 29, bvar 37, bvar 185, bvar 193]),
    bnot (bands [bvar 29, bvar 38, bvar 185, bvar 194]),
    bnot (bands [bvar 29, bvar 39, bvar 185, bvar 195]),
    bnot (bands [bvar 30, bvar 34, bvar 186, bvar 190]),
    bnot (bands [bvar 30, bvar 35, bvar 186, bvar 191]),
    bnot (bands [bvar 30, bvar 37, bvar 186, bvar 193]),
    bnot (bands [bvar 30, bvar 39, bvar 186, bvar 195]),
    bnot (bands [bvar 31, bvar 34, bvar 187, bvar 190]),
    bnot (bands [bvar 31, bvar 35, bvar 187, bvar 191]),
    bnot (bands [bvar 31, bvar 37, bvar 187, bvar 193]),
    bnot (bands [bvar 31, bvar 39, bvar 187, bvar 195]),
    bnot (bands [bvar 32, bvar 33, bvar 188, bvar 189]),
    bnot (bands [bvar 32, bvar 34, bvar 188, bvar 190]),
    bnot (bands [bvar 32, bvar 35, bvar 188, bvar 191]),
    bnot (bands [bvar 32, bvar 36, bvar 188, bvar 192]),
    bnot (bands [bvar 32, bvar 37, bvar 188, bvar 193]),
    bnot (bands [bvar 32, bvar 38, bvar 188, bvar 194]),
    bnot (bands [bvar 32, bvar 39, bvar 188, bvar 195]),
    bnot (bands [bvar 33, bvar 34, bvar 189, bvar 190]),
    bnot (bands [bvar 33, bvar 35, bvar 189, bvar 191]),
    bnot (bands [bvar 33, bvar 36, bvar 189, bvar 192]),
    bnot (bands [bvar 33, bvar 37, bvar 189, bvar 193]),
    bnot (bands [bvar 33, bvar 39, bvar 189, bvar 195]),
    bnot (bands [bvar 34, bvar 35, bvar 190, bvar 191]),
    bnot (bands [bvar 34, bvar 36, bvar 190, bvar 192]),
    bnot (bands [bvar 34, bvar 37, bvar 190, bvar 193]),
    bnot (bands [bvar 34, bvar 38, bvar 190, bvar 194]),
    bnot (bands [bvar 34, bvar 39, bvar 190, bvar 195]),
    bnot (bands [bvar 35, bvar 36, bvar 191, bvar 192]),
    bnot (bands [bvar 35, bvar 37, bvar 191, bvar 193]),
    bnot (bands [bvar 35, bvar 38, bvar 191, bvar 194]),
    bnot (bands [bvar 35, bvar 39, bvar 191, bvar 195]),
    bnot (bands [bvar 44, bvar 48, bvar 57, bvar 61]),
    bnot (bands [bvar 44, bvar 52, bvar 57, bvar 65]),
    bnot (bands [bvar 48, bvar 52, bvar 61, bvar 65]),
    bnot (bands [bvar 44, bvar 45, bvar 135, bvar 136]),
    bnot (bands [bvar 44, bvar 47, bvar 135, bvar 138]),
    bnot (bands [bvar 55, bvar 59, bvar 68, bvar 72]),
    bnot (bands [bvar 55, bvar 66, bvar 68, bvar 79]),
    bnot (bands [bvar 59, bvar 66, bvar 72, bvar 79]),
    bnot (bands [bvar 57, bvar 59, bvar 109, bvar 111]),
    bnot (bands [bvar 57, bvar 64, bvar 174, bvar 181]),
    bnot (bands [bvar 71, bvar 73, bvar 149, bvar 151]),
    bnot (bands [bvar 71, bvar 74, bvar 149, bvar 152]),
    bnot (bands [bvar 71, bvar 75, bvar 149, bvar 153]),
    bnot (bands [bvar 73, bvar 75, bvar 151, bvar 153]),
    bnot (bands [bvar 74, bvar 75, bvar 152, bvar 153]),
    bnot (bands [bvar 67, bvar 68, bvar 158, bvar 159]),
    bnot (bands [bvar 68, bvar 78, bvar 159, bvar 169]),
    bnot (bands [bvar 71, bvar 73, bvar 162, bvar 164]),
    bnot (bands [bvar 71, bvar 75, bvar 162, bvar 166]),
    bnot (bands [bvar 72, bvar 75, bvar 163, bvar 166]) ]

def reducedUnionChunk025 : BVLogicalExpr :=
  bands reducedUnionChunk025Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
