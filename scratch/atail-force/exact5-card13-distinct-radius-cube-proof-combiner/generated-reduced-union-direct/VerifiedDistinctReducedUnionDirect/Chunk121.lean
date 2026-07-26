import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk121Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 667, bvar 677, bvar 173, bvar 183]),
    bnot (bands [bvar 668, bvar 669, bvar 174, bvar 175]),
    bnot (bands [bvar 668, bvar 670, bvar 174, bvar 176]),
    bnot (bands [bvar 668, bvar 671, bvar 174, bvar 177]),
    bnot (bands [bvar 668, bvar 672, bvar 174, bvar 178]),
    bnot (bands [bvar 668, bvar 673, bvar 174, bvar 179]),
    bnot (bands [bvar 668, bvar 674, bvar 174, bvar 180]),
    bnot (bands [bvar 668, bvar 677, bvar 174, bvar 183]),
    bnot (bands [bvar 669, bvar 670, bvar 175, bvar 176]),
    bnot (bands [bvar 669, bvar 671, bvar 175, bvar 177]),
    bnot (bands [bvar 669, bvar 672, bvar 175, bvar 178]),
    bnot (bands [bvar 669, bvar 673, bvar 175, bvar 179]),
    bnot (bands [bvar 669, bvar 674, bvar 175, bvar 180]),
    bnot (bands [bvar 669, bvar 677, bvar 175, bvar 183]),
    bnot (bands [bvar 670, bvar 671, bvar 176, bvar 177]),
    bnot (bands [bvar 670, bvar 672, bvar 176, bvar 178]),
    bnot (bands [bvar 670, bvar 673, bvar 176, bvar 179]),
    bnot (bands [bvar 670, bvar 674, bvar 176, bvar 180]),
    bnot (bands [bvar 670, bvar 677, bvar 176, bvar 183]),
    bnot (bands [bvar 671, bvar 672, bvar 177, bvar 178]),
    bnot (bands [bvar 671, bvar 673, bvar 177, bvar 179]),
    bnot (bands [bvar 671, bvar 674, bvar 177, bvar 180]),
    bnot (bands [bvar 671, bvar 677, bvar 177, bvar 183]),
    bnot (bands [bvar 672, bvar 673, bvar 178, bvar 179]),
    bnot (bands [bvar 672, bvar 674, bvar 178, bvar 180]),
    bnot (bands [bvar 672, bvar 677, bvar 178, bvar 183]),
    bnot (bands [bvar 673, bvar 674, bvar 179, bvar 180]),
    bnot (bands [bvar 673, bvar 677, bvar 179, bvar 183]),
    bnot (bands [bvar 674, bvar 677, bvar 180, bvar 183]),
    bnot (bands [bvar 158, bvar 159, bvar 691, bvar 692]),
    bnot (bands [bvar 158, bvar 160, bvar 691, bvar 693]),
    bnot (bands [bvar 158, bvar 162, bvar 691, bvar 695]),
    bnot (bands [bvar 158, bvar 165, bvar 691, bvar 698]),
    bnot (bands [bvar 159, bvar 162, bvar 692, bvar 695]),
    bnot (bands [bvar 159, bvar 164, bvar 692, bvar 697]),
    bnot (bands [bvar 159, bvar 165, bvar 692, bvar 698]),
    bnot (bands [bvar 159, bvar 166, bvar 692, bvar 699]),
    bnot (bands [bvar 159, bvar 167, bvar 692, bvar 700]),
    bnot (bands [bvar 160, bvar 162, bvar 693, bvar 695]),
    bnot (bands [bvar 160, bvar 164, bvar 693, bvar 697]),
    bnot (bands [bvar 160, bvar 165, bvar 693, bvar 698]),
    bnot (bands [bvar 160, bvar 166, bvar 693, bvar 699]),
    bnot (bands [bvar 160, bvar 167, bvar 693, bvar 700]),
    bnot (bands [bvar 161, bvar 162, bvar 694, bvar 695]),
    bnot (bands [bvar 162, bvar 163, bvar 695, bvar 696]),
    bnot (bands [bvar 162, bvar 164, bvar 695, bvar 697]),
    bnot (bands [bvar 162, bvar 165, bvar 695, bvar 698]),
    bnot (bands [bvar 162, bvar 166, bvar 695, bvar 699]),
    bnot (bands [bvar 162, bvar 167, bvar 695, bvar 700]),
    bnot (bands [bvar 164, bvar 167, bvar 697, bvar 700]),
    bnot (bands [bvar 165, bvar 166, bvar 698, bvar 699]),
    bnot (bands [bvar 165, bvar 167, bvar 698, bvar 700]),
    bnot (bands [bvar 166, bvar 167, bvar 699, bvar 700]),
    bnot (bands [bvar 665, bvar 666, bvar 184, bvar 185]),
    bnot (bands [bvar 665, bvar 667, bvar 184, bvar 186]),
    bnot (bands [bvar 665, bvar 669, bvar 184, bvar 188]),
    bnot (bands [bvar 665, bvar 671, bvar 184, bvar 190]),
    bnot (bands [bvar 665, bvar 672, bvar 184, bvar 191]),
    bnot (bands [bvar 665, bvar 673, bvar 184, bvar 192]),
    bnot (bands [bvar 665, bvar 674, bvar 184, bvar 193]),
    bnot (bands [bvar 666, bvar 669, bvar 185, bvar 188]),
    bnot (bands [bvar 666, bvar 670, bvar 185, bvar 189]),
    bnot (bands [bvar 666, bvar 671, bvar 185, bvar 190]),
    bnot (bands [bvar 666, bvar 672, bvar 185, bvar 191]) ]

def reducedUnionChunk121 : BVLogicalExpr :=
  bands reducedUnionChunk121Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
