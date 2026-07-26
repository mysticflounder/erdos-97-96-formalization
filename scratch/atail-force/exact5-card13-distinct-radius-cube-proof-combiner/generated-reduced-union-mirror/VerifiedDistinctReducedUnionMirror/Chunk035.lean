import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk035Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 541, bvar 542, bvar 671, bvar 672]),
    bnot (bands [bvar 541, bvar 543, bvar 671, bvar 673]),
    bnot (bands [bvar 541, bvar 544, bvar 671, bvar 674]),
    bnot (bands [bvar 542, bvar 543, bvar 672, bvar 673]),
    bnot (bands [bvar 542, bvar 544, bvar 672, bvar 674]),
    bnot (bands [bvar 543, bvar 544, bvar 673, bvar 674]),
    bnot (bands [bvar 536, bvar 539, bvar 679, bvar 682]),
    bnot (bands [bvar 536, bvar 540, bvar 679, bvar 683]),
    bnot (bands [bvar 536, bvar 541, bvar 679, bvar 684]),
    bnot (bands [bvar 536, bvar 542, bvar 679, bvar 685]),
    bnot (bands [bvar 536, bvar 543, bvar 679, bvar 686]),
    bnot (bands [bvar 536, bvar 545, bvar 679, bvar 688]),
    bnot (bands [bvar 537, bvar 539, bvar 680, bvar 682]),
    bnot (bands [bvar 537, bvar 540, bvar 680, bvar 683]),
    bnot (bands [bvar 537, bvar 541, bvar 680, bvar 684]),
    bnot (bands [bvar 537, bvar 542, bvar 680, bvar 685]),
    bnot (bands [bvar 537, bvar 543, bvar 680, bvar 686]),
    bnot (bands [bvar 537, bvar 545, bvar 680, bvar 688]),
    bnot (bands [bvar 538, bvar 541, bvar 681, bvar 684]),
    bnot (bands [bvar 539, bvar 540, bvar 682, bvar 683]),
    bnot (bands [bvar 539, bvar 541, bvar 682, bvar 684]),
    bnot (bands [bvar 539, bvar 542, bvar 682, bvar 685]),
    bnot (bands [bvar 539, bvar 543, bvar 682, bvar 686]),
    bnot (bands [bvar 539, bvar 545, bvar 682, bvar 688]),
    bnot (bands [bvar 540, bvar 541, bvar 683, bvar 684]),
    bnot (bands [bvar 540, bvar 542, bvar 683, bvar 685]),
    bnot (bands [bvar 540, bvar 544, bvar 683, bvar 687]),
    bnot (bands [bvar 540, bvar 545, bvar 683, bvar 688]),
    bnot (bands [bvar 541, bvar 542, bvar 684, bvar 685]),
    bnot (bands [bvar 541, bvar 543, bvar 684, bvar 686]),
    bnot (bands [bvar 541, bvar 544, bvar 684, bvar 687]),
    bnot (bands [bvar 541, bvar 545, bvar 684, bvar 688]),
    bnot (bands [bvar 542, bvar 543, bvar 685, bvar 686]),
    bnot (bands [bvar 542, bvar 544, bvar 685, bvar 687]),
    bnot (bands [bvar 542, bvar 545, bvar 685, bvar 688]),
    bnot (bands [bvar 543, bvar 545, bvar 686, bvar 688]),
    bnot (bands [bvar 536, bvar 540, bvar 692, bvar 696]),
    bnot (bands [bvar 536, bvar 541, bvar 692, bvar 697]),
    bnot (bands [bvar 536, bvar 542, bvar 692, bvar 698]),
    bnot (bands [bvar 536, bvar 543, bvar 692, bvar 699]),
    bnot (bands [bvar 536, bvar 544, bvar 692, bvar 700]),
    bnot (bands [bvar 536, bvar 546, bvar 692, bvar 702]),
    bnot (bands [bvar 537, bvar 539, bvar 693, bvar 695]),
    bnot (bands [bvar 537, bvar 540, bvar 693, bvar 696]),
    bnot (bands [bvar 537, bvar 541, bvar 693, bvar 697]),
    bnot (bands [bvar 537, bvar 542, bvar 693, bvar 698]),
    bnot (bands [bvar 537, bvar 543, bvar 693, bvar 699]),
    bnot (bands [bvar 537, bvar 544, bvar 693, bvar 700]),
    bnot (bands [bvar 537, bvar 546, bvar 693, bvar 702]),
    bnot (bands [bvar 538, bvar 540, bvar 694, bvar 696]),
    bnot (bands [bvar 538, bvar 541, bvar 694, bvar 697]),
    bnot (bands [bvar 539, bvar 540, bvar 695, bvar 696]),
    bnot (bands [bvar 539, bvar 541, bvar 695, bvar 697]),
    bnot (bands [bvar 539, bvar 542, bvar 695, bvar 698]),
    bnot (bands [bvar 539, bvar 543, bvar 695, bvar 699]),
    bnot (bands [bvar 539, bvar 544, bvar 695, bvar 700]),
    bnot (bands [bvar 539, bvar 545, bvar 695, bvar 701]),
    bnot (bands [bvar 539, bvar 546, bvar 695, bvar 702]),
    bnot (bands [bvar 540, bvar 541, bvar 696, bvar 697]),
    bnot (bands [bvar 540, bvar 542, bvar 696, bvar 698]),
    bnot (bands [bvar 540, bvar 543, bvar 696, bvar 699]),
    bnot (bands [bvar 540, bvar 544, bvar 696, bvar 700]),
    bnot (bands [bvar 540, bvar 545, bvar 696, bvar 701]),
    bnot (bands [bvar 540, bvar 546, bvar 696, bvar 702]) ]

def reducedUnionChunk035 : BVLogicalExpr :=
  bands reducedUnionChunk035Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
