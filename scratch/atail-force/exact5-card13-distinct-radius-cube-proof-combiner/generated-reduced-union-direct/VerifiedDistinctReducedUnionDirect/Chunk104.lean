import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk104Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 537, bvar 542, bvar 173, bvar 178]),
    bnot (bands [bvar 537, bvar 543, bvar 173, bvar 179]),
    bnot (bands [bvar 537, bvar 544, bvar 173, bvar 180]),
    bnot (bands [bvar 537, bvar 545, bvar 173, bvar 181]),
    bnot (bands [bvar 538, bvar 540, bvar 174, bvar 176]),
    bnot (bands [bvar 538, bvar 541, bvar 174, bvar 177]),
    bnot (bands [bvar 538, bvar 542, bvar 174, bvar 178]),
    bnot (bands [bvar 538, bvar 543, bvar 174, bvar 179]),
    bnot (bands [bvar 538, bvar 544, bvar 174, bvar 180]),
    bnot (bands [bvar 539, bvar 540, bvar 175, bvar 176]),
    bnot (bands [bvar 539, bvar 541, bvar 175, bvar 177]),
    bnot (bands [bvar 539, bvar 542, bvar 175, bvar 178]),
    bnot (bands [bvar 539, bvar 543, bvar 175, bvar 179]),
    bnot (bands [bvar 539, bvar 544, bvar 175, bvar 180]),
    bnot (bands [bvar 539, bvar 545, bvar 175, bvar 181]),
    bnot (bands [bvar 540, bvar 541, bvar 176, bvar 177]),
    bnot (bands [bvar 540, bvar 542, bvar 176, bvar 178]),
    bnot (bands [bvar 540, bvar 543, bvar 176, bvar 179]),
    bnot (bands [bvar 540, bvar 544, bvar 176, bvar 180]),
    bnot (bands [bvar 540, bvar 545, bvar 176, bvar 181]),
    bnot (bands [bvar 541, bvar 542, bvar 177, bvar 178]),
    bnot (bands [bvar 541, bvar 543, bvar 177, bvar 179]),
    bnot (bands [bvar 541, bvar 544, bvar 177, bvar 180]),
    bnot (bands [bvar 541, bvar 545, bvar 177, bvar 181]),
    bnot (bands [bvar 542, bvar 543, bvar 178, bvar 179]),
    bnot (bands [bvar 542, bvar 544, bvar 178, bvar 180]),
    bnot (bands [bvar 542, bvar 545, bvar 178, bvar 181]),
    bnot (bands [bvar 543, bvar 544, bvar 179, bvar 180]),
    bnot (bands [bvar 544, bvar 545, bvar 180, bvar 181]),
    bnot (bands [bvar 29, bvar 32, bvar 692, bvar 695]),
    bnot (bands [bvar 29, bvar 33, bvar 692, bvar 696]),
    bnot (bands [bvar 29, bvar 34, bvar 692, bvar 697]),
    bnot (bands [bvar 29, bvar 35, bvar 692, bvar 698]),
    bnot (bands [bvar 29, bvar 36, bvar 692, bvar 699]),
    bnot (bands [bvar 29, bvar 37, bvar 692, bvar 700]),
    bnot (bands [bvar 29, bvar 38, bvar 692, bvar 701]),
    bnot (bands [bvar 29, bvar 39, bvar 692, bvar 702]),
    bnot (bands [bvar 30, bvar 33, bvar 693, bvar 696]),
    bnot (bands [bvar 30, bvar 34, bvar 693, bvar 697]),
    bnot (bands [bvar 30, bvar 35, bvar 693, bvar 698]),
    bnot (bands [bvar 30, bvar 36, bvar 693, bvar 699]),
    bnot (bands [bvar 30, bvar 37, bvar 693, bvar 700]),
    bnot (bands [bvar 30, bvar 38, bvar 693, bvar 701]),
    bnot (bands [bvar 31, bvar 33, bvar 694, bvar 696]),
    bnot (bands [bvar 31, bvar 34, bvar 694, bvar 697]),
    bnot (bands [bvar 31, bvar 35, bvar 694, bvar 698]),
    bnot (bands [bvar 31, bvar 36, bvar 694, bvar 699]),
    bnot (bands [bvar 31, bvar 38, bvar 694, bvar 701]),
    bnot (bands [bvar 31, bvar 39, bvar 694, bvar 702]),
    bnot (bands [bvar 32, bvar 33, bvar 695, bvar 696]),
    bnot (bands [bvar 32, bvar 34, bvar 695, bvar 697]),
    bnot (bands [bvar 32, bvar 35, bvar 695, bvar 698]),
    bnot (bands [bvar 32, bvar 36, bvar 695, bvar 699]),
    bnot (bands [bvar 32, bvar 37, bvar 695, bvar 700]),
    bnot (bands [bvar 32, bvar 38, bvar 695, bvar 701]),
    bnot (bands [bvar 32, bvar 39, bvar 695, bvar 702]),
    bnot (bands [bvar 33, bvar 34, bvar 696, bvar 697]),
    bnot (bands [bvar 33, bvar 35, bvar 696, bvar 698]),
    bnot (bands [bvar 33, bvar 36, bvar 696, bvar 699]),
    bnot (bands [bvar 33, bvar 37, bvar 696, bvar 700]),
    bnot (bands [bvar 33, bvar 38, bvar 696, bvar 701]),
    bnot (bands [bvar 33, bvar 39, bvar 696, bvar 702]),
    bnot (bands [bvar 34, bvar 35, bvar 697, bvar 698]),
    bnot (bands [bvar 34, bvar 36, bvar 697, bvar 699]) ]

def reducedUnionChunk104 : BVLogicalExpr :=
  bands reducedUnionChunk104Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
