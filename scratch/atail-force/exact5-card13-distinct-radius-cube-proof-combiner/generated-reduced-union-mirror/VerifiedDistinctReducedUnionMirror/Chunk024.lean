import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk024Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 37, bvar 39, bvar 128, bvar 130]),
    bnot (bands [bvar 38, bvar 40, bvar 129, bvar 131]),
    bnot (bands [bvar 39, bvar 40, bvar 130, bvar 131]),
    bnot (bands [bvar 29, bvar 35, bvar 133, bvar 139]),
    bnot (bands [bvar 30, bvar 35, bvar 134, bvar 139]),
    bnot (bands [bvar 31, bvar 32, bvar 135, bvar 136]),
    bnot (bands [bvar 31, bvar 33, bvar 135, bvar 137]),
    bnot (bands [bvar 31, bvar 34, bvar 135, bvar 138]),
    bnot (bands [bvar 31, bvar 35, bvar 135, bvar 139]),
    bnot (bands [bvar 32, bvar 34, bvar 136, bvar 138]),
    bnot (bands [bvar 32, bvar 35, bvar 136, bvar 139]),
    bnot (bands [bvar 34, bvar 35, bvar 138, bvar 139]),
    bnot (bands [bvar 29, bvar 32, bvar 146, bvar 149]),
    bnot (bands [bvar 29, bvar 33, bvar 146, bvar 150]),
    bnot (bands [bvar 29, bvar 34, bvar 146, bvar 151]),
    bnot (bands [bvar 29, bvar 35, bvar 146, bvar 152]),
    bnot (bands [bvar 29, bvar 36, bvar 146, bvar 153]),
    bnot (bands [bvar 30, bvar 32, bvar 147, bvar 149]),
    bnot (bands [bvar 30, bvar 33, bvar 147, bvar 150]),
    bnot (bands [bvar 30, bvar 34, bvar 147, bvar 151]),
    bnot (bands [bvar 30, bvar 35, bvar 147, bvar 152]),
    bnot (bands [bvar 30, bvar 36, bvar 147, bvar 153]),
    bnot (bands [bvar 31, bvar 34, bvar 148, bvar 151]),
    bnot (bands [bvar 31, bvar 35, bvar 148, bvar 152]),
    bnot (bands [bvar 31, bvar 36, bvar 148, bvar 153]),
    bnot (bands [bvar 32, bvar 33, bvar 149, bvar 150]),
    bnot (bands [bvar 32, bvar 34, bvar 149, bvar 151]),
    bnot (bands [bvar 32, bvar 35, bvar 149, bvar 152]),
    bnot (bands [bvar 32, bvar 36, bvar 149, bvar 153]),
    bnot (bands [bvar 33, bvar 34, bvar 150, bvar 151]),
    bnot (bands [bvar 33, bvar 35, bvar 150, bvar 152]),
    bnot (bands [bvar 33, bvar 36, bvar 150, bvar 153]),
    bnot (bands [bvar 34, bvar 35, bvar 151, bvar 152]),
    bnot (bands [bvar 34, bvar 36, bvar 151, bvar 153]),
    bnot (bands [bvar 35, bvar 36, bvar 152, bvar 153]),
    bnot (bands [bvar 38, bvar 40, bvar 155, bvar 157]),
    bnot (bands [bvar 29, bvar 34, bvar 159, bvar 164]),
    bnot (bands [bvar 29, bvar 35, bvar 159, bvar 165]),
    bnot (bands [bvar 29, bvar 36, bvar 159, bvar 166]),
    bnot (bands [bvar 30, bvar 34, bvar 160, bvar 164]),
    bnot (bands [bvar 30, bvar 35, bvar 160, bvar 165]),
    bnot (bands [bvar 30, bvar 36, bvar 160, bvar 166]),
    bnot (bands [bvar 32, bvar 33, bvar 162, bvar 163]),
    bnot (bands [bvar 32, bvar 34, bvar 162, bvar 164]),
    bnot (bands [bvar 32, bvar 35, bvar 162, bvar 165]),
    bnot (bands [bvar 32, bvar 36, bvar 162, bvar 166]),
    bnot (bands [bvar 32, bvar 37, bvar 162, bvar 167]),
    bnot (bands [bvar 33, bvar 35, bvar 163, bvar 165]),
    bnot (bands [bvar 33, bvar 36, bvar 163, bvar 166]),
    bnot (bands [bvar 34, bvar 35, bvar 164, bvar 165]),
    bnot (bands [bvar 34, bvar 36, bvar 164, bvar 166]),
    bnot (bands [bvar 35, bvar 36, bvar 165, bvar 166]),
    bnot (bands [bvar 35, bvar 37, bvar 165, bvar 167]),
    bnot (bands [bvar 29, bvar 34, bvar 172, bvar 177]),
    bnot (bands [bvar 29, bvar 35, bvar 172, bvar 178]),
    bnot (bands [bvar 29, bvar 36, bvar 172, bvar 179]),
    bnot (bands [bvar 29, bvar 37, bvar 172, bvar 180]),
    bnot (bands [bvar 30, bvar 34, bvar 173, bvar 177]),
    bnot (bands [bvar 30, bvar 35, bvar 173, bvar 178]),
    bnot (bands [bvar 30, bvar 36, bvar 173, bvar 179]),
    bnot (bands [bvar 30, bvar 38, bvar 173, bvar 181]),
    bnot (bands [bvar 31, bvar 34, bvar 174, bvar 177]),
    bnot (bands [bvar 31, bvar 36, bvar 174, bvar 179]),
    bnot (bands [bvar 32, bvar 35, bvar 175, bvar 178]) ]

def reducedUnionChunk024 : BVLogicalExpr :=
  bands reducedUnionChunk024Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
