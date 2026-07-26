import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk106Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 35, bvar 37, bvar 685, bvar 687]),
    bnot (bands [bvar 35, bvar 38, bvar 685, bvar 688]),
    bnot (bands [bvar 36, bvar 38, bvar 686, bvar 688]),
    bnot (bands [bvar 37, bvar 38, bvar 687, bvar 688]),
    atMost [bands [bvar 535, bvar 171], bands [bvar 536, bvar 172], bands [bvar 537, bvar 173], bands [bvar 538, bvar 174], bands [bvar 539, bvar 175], bands [bvar 540, bvar 176], bands [bvar 541, bvar 177], bands [bvar 542, bvar 178], bands [bvar 543, bvar 179], bands [bvar 544, bvar 180], bands [bvar 545, bvar 181], bands [bvar 546, bvar 182], bands [bvar 547, bvar 183]] 2,
    bnot (bands [bvar 536, bvar 539, bvar 172, bvar 175]),
    bnot (bands [bvar 536, bvar 540, bvar 172, bvar 176]),
    bnot (bands [bvar 536, bvar 541, bvar 172, bvar 177]),
    bnot (bands [bvar 536, bvar 542, bvar 172, bvar 178]),
    bnot (bands [bvar 536, bvar 543, bvar 172, bvar 179]),
    bnot (bands [bvar 536, bvar 544, bvar 172, bvar 180]),
    bnot (bands [bvar 536, bvar 545, bvar 172, bvar 181]),
    bnot (bands [bvar 537, bvar 539, bvar 173, bvar 175]),
    bnot (bands [bvar 537, bvar 540, bvar 173, bvar 176]),
    bnot (bands [bvar 537, bvar 541, bvar 173, bvar 177]),
    bnot (bands [bvar 537, bvar 542, bvar 173, bvar 178]),
    bnot (bands [bvar 537, bvar 543, bvar 173, bvar 179]),
    bnot (bands [bvar 537, bvar 544, bvar 173, bvar 180]),
    bnot (bands [bvar 537, bvar 545, bvar 173, bvar 181]),
    bnot (bands [bvar 538, bvar 539, bvar 174, bvar 175]),
    bnot (bands [bvar 538, bvar 540, bvar 174, bvar 176]),
    bnot (bands [bvar 538, bvar 541, bvar 174, bvar 177]),
    bnot (bands [bvar 538, bvar 542, bvar 174, bvar 178]),
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
    bnot (bands [bvar 543, bvar 545, bvar 179, bvar 181]),
    bnot (bands [bvar 29, bvar 32, bvar 692, bvar 695]),
    bnot (bands [bvar 29, bvar 33, bvar 692, bvar 696]),
    bnot (bands [bvar 29, bvar 34, bvar 692, bvar 697]),
    bnot (bands [bvar 29, bvar 35, bvar 692, bvar 698]),
    bnot (bands [bvar 29, bvar 36, bvar 692, bvar 699]),
    bnot (bands [bvar 29, bvar 37, bvar 692, bvar 700]),
    bnot (bands [bvar 29, bvar 39, bvar 692, bvar 702]),
    bnot (bands [bvar 30, bvar 33, bvar 693, bvar 696]),
    bnot (bands [bvar 30, bvar 34, bvar 693, bvar 697]),
    bnot (bands [bvar 30, bvar 35, bvar 693, bvar 698]),
    bnot (bands [bvar 30, bvar 36, bvar 693, bvar 699]),
    bnot (bands [bvar 30, bvar 37, bvar 693, bvar 700]),
    bnot (bands [bvar 30, bvar 39, bvar 693, bvar 702]),
    bnot (bands [bvar 31, bvar 33, bvar 694, bvar 696]),
    bnot (bands [bvar 31, bvar 34, bvar 694, bvar 697]),
    bnot (bands [bvar 31, bvar 35, bvar 694, bvar 698]),
    bnot (bands [bvar 32, bvar 33, bvar 695, bvar 696]),
    bnot (bands [bvar 32, bvar 34, bvar 695, bvar 697]),
    bnot (bands [bvar 32, bvar 35, bvar 695, bvar 698]),
    bnot (bands [bvar 32, bvar 36, bvar 695, bvar 699]),
    bnot (bands [bvar 32, bvar 37, bvar 695, bvar 700]) ]

def reducedUnionChunk106 : BVLogicalExpr :=
  bands reducedUnionChunk106Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
