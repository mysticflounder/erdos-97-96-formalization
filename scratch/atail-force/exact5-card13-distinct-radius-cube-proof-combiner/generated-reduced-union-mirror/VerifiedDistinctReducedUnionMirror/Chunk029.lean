import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk029Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 135, bvar 138, bvar 174, bvar 177]),
    bnot (bands [bvar 135, bvar 139, bvar 174, bvar 178]),
    bnot (bands [bvar 135, bvar 144, bvar 174, bvar 183]),
    bnot (bands [bvar 136, bvar 144, bvar 175, bvar 183]),
    bnot (bands [bvar 138, bvar 144, bvar 177, bvar 183]),
    bnot (bands [bvar 139, bvar 144, bvar 178, bvar 183]),
    bnot (bands [bvar 132, bvar 135, bvar 184, bvar 187]),
    bnot (bands [bvar 132, bvar 136, bvar 184, bvar 188]),
    bnot (bands [bvar 132, bvar 137, bvar 184, bvar 189]),
    bnot (bands [bvar 132, bvar 138, bvar 184, bvar 190]),
    bnot (bands [bvar 135, bvar 136, bvar 187, bvar 188]),
    bnot (bands [bvar 135, bvar 138, bvar 187, bvar 190]),
    bnot (bands [bvar 145, bvar 146, bvar 158, bvar 159]),
    bnot (bands [bvar 145, bvar 147, bvar 158, bvar 160]),
    bnot (bands [bvar 145, bvar 148, bvar 158, bvar 161]),
    bnot (bands [bvar 145, bvar 149, bvar 158, bvar 162]),
    bnot (bands [bvar 145, bvar 150, bvar 158, bvar 163]),
    bnot (bands [bvar 145, bvar 151, bvar 158, bvar 164]),
    bnot (bands [bvar 145, bvar 152, bvar 158, bvar 165]),
    bnot (bands [bvar 145, bvar 153, bvar 158, bvar 166]),
    bnot (bands [bvar 145, bvar 156, bvar 158, bvar 169]),
    bnot (bands [bvar 146, bvar 149, bvar 159, bvar 162]),
    bnot (bands [bvar 146, bvar 150, bvar 159, bvar 163]),
    bnot (bands [bvar 146, bvar 151, bvar 159, bvar 164]),
    bnot (bands [bvar 146, bvar 152, bvar 159, bvar 165]),
    bnot (bands [bvar 146, bvar 153, bvar 159, bvar 166]),
    bnot (bands [bvar 146, bvar 157, bvar 159, bvar 170]),
    bnot (bands [bvar 147, bvar 149, bvar 160, bvar 162]),
    bnot (bands [bvar 147, bvar 150, bvar 160, bvar 163]),
    bnot (bands [bvar 147, bvar 151, bvar 160, bvar 164]),
    bnot (bands [bvar 147, bvar 152, bvar 160, bvar 165]),
    bnot (bands [bvar 147, bvar 153, bvar 160, bvar 166]),
    bnot (bands [bvar 147, bvar 157, bvar 160, bvar 170]),
    bnot (bands [bvar 148, bvar 149, bvar 161, bvar 162]),
    bnot (bands [bvar 148, bvar 150, bvar 161, bvar 163]),
    bnot (bands [bvar 148, bvar 151, bvar 161, bvar 164]),
    bnot (bands [bvar 148, bvar 152, bvar 161, bvar 165]),
    bnot (bands [bvar 148, bvar 153, bvar 161, bvar 166]),
    bnot (bands [bvar 148, bvar 157, bvar 161, bvar 170]),
    bnot (bands [bvar 149, bvar 150, bvar 162, bvar 163]),
    bnot (bands [bvar 149, bvar 151, bvar 162, bvar 164]),
    bnot (bands [bvar 149, bvar 152, bvar 162, bvar 165]),
    bnot (bands [bvar 149, bvar 153, bvar 162, bvar 166]),
    bnot (bands [bvar 149, bvar 156, bvar 162, bvar 169]),
    bnot (bands [bvar 149, bvar 157, bvar 162, bvar 170]),
    bnot (bands [bvar 150, bvar 151, bvar 163, bvar 164]),
    bnot (bands [bvar 150, bvar 152, bvar 163, bvar 165]),
    bnot (bands [bvar 150, bvar 153, bvar 163, bvar 166]),
    bnot (bands [bvar 150, bvar 156, bvar 163, bvar 169]),
    bnot (bands [bvar 150, bvar 157, bvar 163, bvar 170]),
    bnot (bands [bvar 151, bvar 152, bvar 164, bvar 165]),
    bnot (bands [bvar 151, bvar 153, bvar 164, bvar 166]),
    bnot (bands [bvar 151, bvar 156, bvar 164, bvar 169]),
    bnot (bands [bvar 151, bvar 157, bvar 164, bvar 170]),
    bnot (bands [bvar 152, bvar 153, bvar 165, bvar 166]),
    bnot (bands [bvar 152, bvar 156, bvar 165, bvar 169]),
    bnot (bands [bvar 152, bvar 157, bvar 165, bvar 170]),
    bnot (bands [bvar 153, bvar 156, bvar 166, bvar 169]),
    bnot (bands [bvar 153, bvar 157, bvar 166, bvar 170]),
    bnot (bands [bvar 156, bvar 157, bvar 169, bvar 170]),
    bnot (bands [bvar 148, bvar 153, bvar 174, bvar 179]),
    bnot (bands [bvar 149, bvar 151, bvar 175, bvar 177]),
    bnot (bands [bvar 149, bvar 157, bvar 175, bvar 183]),
    bnot (bands [bvar 150, bvar 151, bvar 176, bvar 177]) ]

def reducedUnionChunk029 : BVLogicalExpr :=
  bands reducedUnionChunk029Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
