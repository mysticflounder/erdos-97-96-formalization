import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk127Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 665, bvar 669, bvar 171, bvar 175]),
    bnot (bands [bvar 665, bvar 670, bvar 171, bvar 176]),
    bnot (bands [bvar 665, bvar 671, bvar 171, bvar 177]),
    bnot (bands [bvar 665, bvar 672, bvar 171, bvar 178]),
    bnot (bands [bvar 665, bvar 673, bvar 171, bvar 179]),
    bnot (bands [bvar 666, bvar 669, bvar 172, bvar 175]),
    bnot (bands [bvar 666, bvar 670, bvar 172, bvar 176]),
    bnot (bands [bvar 666, bvar 671, bvar 172, bvar 177]),
    bnot (bands [bvar 666, bvar 672, bvar 172, bvar 178]),
    bnot (bands [bvar 666, bvar 673, bvar 172, bvar 179]),
    bnot (bands [bvar 666, bvar 674, bvar 172, bvar 180]),
    bnot (bands [bvar 666, bvar 677, bvar 172, bvar 183]),
    bnot (bands [bvar 667, bvar 669, bvar 173, bvar 175]),
    bnot (bands [bvar 667, bvar 670, bvar 173, bvar 176]),
    bnot (bands [bvar 667, bvar 671, bvar 173, bvar 177]),
    bnot (bands [bvar 667, bvar 672, bvar 173, bvar 178]),
    bnot (bands [bvar 667, bvar 673, bvar 173, bvar 179]),
    bnot (bands [bvar 667, bvar 677, bvar 173, bvar 183]),
    bnot (bands [bvar 668, bvar 669, bvar 174, bvar 175]),
    bnot (bands [bvar 668, bvar 670, bvar 174, bvar 176]),
    bnot (bands [bvar 668, bvar 671, bvar 174, bvar 177]),
    bnot (bands [bvar 668, bvar 673, bvar 174, bvar 179]),
    bnot (bands [bvar 668, bvar 677, bvar 174, bvar 183]),
    bnot (bands [bvar 669, bvar 670, bvar 175, bvar 176]),
    bnot (bands [bvar 669, bvar 671, bvar 175, bvar 177]),
    bnot (bands [bvar 669, bvar 672, bvar 175, bvar 178]),
    bnot (bands [bvar 669, bvar 673, bvar 175, bvar 179]),
    bnot (bands [bvar 669, bvar 677, bvar 175, bvar 183]),
    bnot (bands [bvar 670, bvar 671, bvar 176, bvar 177]),
    bnot (bands [bvar 670, bvar 672, bvar 176, bvar 178]),
    bnot (bands [bvar 670, bvar 673, bvar 176, bvar 179]),
    bnot (bands [bvar 670, bvar 677, bvar 176, bvar 183]),
    bnot (bands [bvar 671, bvar 673, bvar 177, bvar 179]),
    bnot (bands [bvar 671, bvar 674, bvar 177, bvar 180]),
    bnot (bands [bvar 671, bvar 677, bvar 177, bvar 183]),
    bnot (bands [bvar 672, bvar 673, bvar 178, bvar 179]),
    bnot (bands [bvar 672, bvar 674, bvar 178, bvar 180]),
    bnot (bands [bvar 672, bvar 677, bvar 178, bvar 183]),
    bnot (bands [bvar 673, bvar 677, bvar 179, bvar 183]),
    bnot (bands [bvar 158, bvar 159, bvar 691, bvar 692]),
    bnot (bands [bvar 158, bvar 160, bvar 691, bvar 693]),
    bnot (bands [bvar 158, bvar 161, bvar 691, bvar 694]),
    bnot (bands [bvar 158, bvar 162, bvar 691, bvar 695]),
    bnot (bands [bvar 158, bvar 163, bvar 691, bvar 696]),
    bnot (bands [bvar 158, bvar 164, bvar 691, bvar 697]),
    bnot (bands [bvar 158, bvar 165, bvar 691, bvar 698]),
    bnot (bands [bvar 158, bvar 166, bvar 691, bvar 699]),
    bnot (bands [bvar 158, bvar 167, bvar 691, bvar 700]),
    bnot (bands [bvar 159, bvar 162, bvar 692, bvar 695]),
    bnot (bands [bvar 159, bvar 163, bvar 692, bvar 696]),
    bnot (bands [bvar 159, bvar 164, bvar 692, bvar 697]),
    bnot (bands [bvar 159, bvar 165, bvar 692, bvar 698]),
    bnot (bands [bvar 159, bvar 166, bvar 692, bvar 699]),
    bnot (bands [bvar 159, bvar 167, bvar 692, bvar 700]),
    bnot (bands [bvar 160, bvar 162, bvar 693, bvar 695]),
    bnot (bands [bvar 160, bvar 163, bvar 693, bvar 696]),
    bnot (bands [bvar 160, bvar 164, bvar 693, bvar 697]),
    bnot (bands [bvar 160, bvar 165, bvar 693, bvar 698]),
    bnot (bands [bvar 160, bvar 166, bvar 693, bvar 699]),
    bnot (bands [bvar 160, bvar 167, bvar 693, bvar 700]),
    bnot (bands [bvar 161, bvar 162, bvar 694, bvar 695]),
    bnot (bands [bvar 161, bvar 163, bvar 694, bvar 696]),
    bnot (bands [bvar 161, bvar 164, bvar 694, bvar 697]),
    bnot (bands [bvar 161, bvar 165, bvar 694, bvar 698]) ]

def reducedUnionChunk127 : BVLogicalExpr :=
  bands reducedUnionChunk127Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
