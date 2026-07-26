import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk028Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 125, bvar 129, bvar 138, bvar 142]),
    bnot (bands [bvar 125, bvar 130, bvar 138, bvar 143]),
    bnot (bands [bvar 119, bvar 121, bvar 158, bvar 160]),
    bnot (bands [bvar 119, bvar 131, bvar 158, bvar 170]),
    bnot (bands [bvar 120, bvar 123, bvar 159, bvar 162]),
    bnot (bands [bvar 120, bvar 131, bvar 159, bvar 170]),
    bnot (bands [bvar 121, bvar 123, bvar 160, bvar 162]),
    bnot (bands [bvar 121, bvar 125, bvar 160, bvar 164]),
    bnot (bands [bvar 121, bvar 130, bvar 160, bvar 169]),
    bnot (bands [bvar 121, bvar 131, bvar 160, bvar 170]),
    bnot (bands [bvar 122, bvar 123, bvar 161, bvar 162]),
    bnot (bands [bvar 122, bvar 131, bvar 161, bvar 170]),
    bnot (bands [bvar 123, bvar 125, bvar 162, bvar 164]),
    bnot (bands [bvar 123, bvar 130, bvar 162, bvar 169]),
    bnot (bands [bvar 123, bvar 131, bvar 162, bvar 170]),
    bnot (bands [bvar 124, bvar 130, bvar 163, bvar 169]),
    bnot (bands [bvar 125, bvar 130, bvar 164, bvar 169]),
    bnot (bands [bvar 125, bvar 131, bvar 164, bvar 170]),
    bnot (bands [bvar 127, bvar 128, bvar 166, bvar 167]),
    bnot (bands [bvar 130, bvar 131, bvar 169, bvar 170]),
    bnot (bands [bvar 119, bvar 120, bvar 171, bvar 172]),
    bnot (bands [bvar 119, bvar 123, bvar 184, bvar 188]),
    bnot (bands [bvar 119, bvar 124, bvar 184, bvar 189]),
    bnot (bands [bvar 132, bvar 133, bvar 145, bvar 146]),
    bnot (bands [bvar 132, bvar 134, bvar 145, bvar 147]),
    bnot (bands [bvar 132, bvar 135, bvar 145, bvar 148]),
    bnot (bands [bvar 132, bvar 137, bvar 145, bvar 150]),
    bnot (bands [bvar 132, bvar 142, bvar 145, bvar 155]),
    bnot (bands [bvar 132, bvar 143, bvar 145, bvar 156]),
    bnot (bands [bvar 132, bvar 144, bvar 145, bvar 157]),
    bnot (bands [bvar 133, bvar 144, bvar 146, bvar 157]),
    bnot (bands [bvar 134, bvar 137, bvar 147, bvar 150]),
    bnot (bands [bvar 134, bvar 142, bvar 147, bvar 155]),
    bnot (bands [bvar 135, bvar 136, bvar 148, bvar 149]),
    bnot (bands [bvar 135, bvar 137, bvar 148, bvar 150]),
    bnot (bands [bvar 135, bvar 138, bvar 148, bvar 151]),
    bnot (bands [bvar 135, bvar 139, bvar 148, bvar 152]),
    bnot (bands [bvar 135, bvar 142, bvar 148, bvar 155]),
    bnot (bands [bvar 135, bvar 143, bvar 148, bvar 156]),
    bnot (bands [bvar 135, bvar 144, bvar 148, bvar 157]),
    bnot (bands [bvar 136, bvar 139, bvar 149, bvar 152]),
    bnot (bands [bvar 137, bvar 142, bvar 150, bvar 155]),
    bnot (bands [bvar 137, bvar 143, bvar 150, bvar 156]),
    bnot (bands [bvar 137, bvar 144, bvar 150, bvar 157]),
    bnot (bands [bvar 142, bvar 144, bvar 155, bvar 157]),
    bnot (bands [bvar 143, bvar 144, bvar 156, bvar 157]),
    bnot (bands [bvar 132, bvar 135, bvar 158, bvar 161]),
    bnot (bands [bvar 132, bvar 136, bvar 158, bvar 162]),
    bnot (bands [bvar 132, bvar 139, bvar 158, bvar 165]),
    bnot (bands [bvar 135, bvar 136, bvar 161, bvar 162]),
    bnot (bands [bvar 135, bvar 138, bvar 161, bvar 164]),
    bnot (bands [bvar 135, bvar 139, bvar 161, bvar 165]),
    bnot (bands [bvar 135, bvar 143, bvar 161, bvar 169]),
    bnot (bands [bvar 135, bvar 144, bvar 161, bvar 170]),
    bnot (bands [bvar 136, bvar 143, bvar 162, bvar 169]),
    bnot (bands [bvar 136, bvar 144, bvar 162, bvar 170]),
    bnot (bands [bvar 138, bvar 139, bvar 164, bvar 165]),
    bnot (bands [bvar 139, bvar 143, bvar 165, bvar 169]),
    bnot (bands [bvar 132, bvar 135, bvar 171, bvar 174]),
    bnot (bands [bvar 132, bvar 136, bvar 171, bvar 175]),
    bnot (bands [bvar 132, bvar 138, bvar 171, bvar 177]),
    bnot (bands [bvar 132, bvar 139, bvar 171, bvar 178]),
    bnot (bands [bvar 132, bvar 144, bvar 171, bvar 183]),
    bnot (bands [bvar 135, bvar 136, bvar 174, bvar 175]) ]

def reducedUnionChunk028 : BVLogicalExpr :=
  bands reducedUnionChunk028Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
