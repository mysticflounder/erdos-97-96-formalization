import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk036Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 536, bvar 542, bvar 640, bvar 646]),
    bnot (bands [bvar 539, bvar 541, bvar 643, bvar 645]),
    bnot (bands [bvar 539, bvar 542, bvar 643, bvar 646]),
    bnot (bands [bvar 541, bvar 542, bvar 645, bvar 646]),
    bnot (bands [bvar 536, bvar 540, bvar 666, bvar 670]),
    bnot (bands [bvar 536, bvar 541, bvar 666, bvar 671]),
    bnot (bands [bvar 536, bvar 542, bvar 666, bvar 672]),
    bnot (bands [bvar 536, bvar 543, bvar 666, bvar 673]),
    bnot (bands [bvar 536, bvar 544, bvar 666, bvar 674]),
    bnot (bands [bvar 537, bvar 539, bvar 667, bvar 669]),
    bnot (bands [bvar 537, bvar 540, bvar 667, bvar 670]),
    bnot (bands [bvar 537, bvar 541, bvar 667, bvar 671]),
    bnot (bands [bvar 537, bvar 542, bvar 667, bvar 672]),
    bnot (bands [bvar 537, bvar 543, bvar 667, bvar 673]),
    bnot (bands [bvar 537, bvar 544, bvar 667, bvar 674]),
    bnot (bands [bvar 538, bvar 539, bvar 668, bvar 669]),
    bnot (bands [bvar 538, bvar 540, bvar 668, bvar 670]),
    bnot (bands [bvar 538, bvar 541, bvar 668, bvar 671]),
    bnot (bands [bvar 538, bvar 542, bvar 668, bvar 672]),
    bnot (bands [bvar 538, bvar 543, bvar 668, bvar 673]),
    bnot (bands [bvar 538, bvar 544, bvar 668, bvar 674]),
    bnot (bands [bvar 539, bvar 540, bvar 669, bvar 670]),
    bnot (bands [bvar 539, bvar 541, bvar 669, bvar 671]),
    bnot (bands [bvar 539, bvar 542, bvar 669, bvar 672]),
    bnot (bands [bvar 539, bvar 543, bvar 669, bvar 673]),
    bnot (bands [bvar 539, bvar 544, bvar 669, bvar 674]),
    bnot (bands [bvar 540, bvar 541, bvar 670, bvar 671]),
    bnot (bands [bvar 540, bvar 542, bvar 670, bvar 672]),
    bnot (bands [bvar 540, bvar 543, bvar 670, bvar 673]),
    bnot (bands [bvar 540, bvar 544, bvar 670, bvar 674]),
    bnot (bands [bvar 541, bvar 542, bvar 671, bvar 672]),
    bnot (bands [bvar 541, bvar 543, bvar 671, bvar 673]),
    bnot (bands [bvar 541, bvar 544, bvar 671, bvar 674]),
    bnot (bands [bvar 542, bvar 543, bvar 672, bvar 673]),
    bnot (bands [bvar 542, bvar 544, bvar 672, bvar 674]),
    bnot (bands [bvar 543, bvar 544, bvar 673, bvar 674]),
    bnot (bands [bvar 546, bvar 547, bvar 676, bvar 677]),
    bnot (bands [bvar 536, bvar 540, bvar 679, bvar 683]),
    bnot (bands [bvar 536, bvar 541, bvar 679, bvar 684]),
    bnot (bands [bvar 536, bvar 542, bvar 679, bvar 685]),
    bnot (bands [bvar 536, bvar 545, bvar 679, bvar 688]),
    bnot (bands [bvar 537, bvar 540, bvar 680, bvar 683]),
    bnot (bands [bvar 537, bvar 541, bvar 680, bvar 684]),
    bnot (bands [bvar 537, bvar 542, bvar 680, bvar 685]),
    bnot (bands [bvar 537, bvar 545, bvar 680, bvar 688]),
    bnot (bands [bvar 539, bvar 540, bvar 682, bvar 683]),
    bnot (bands [bvar 539, bvar 541, bvar 682, bvar 684]),
    bnot (bands [bvar 540, bvar 541, bvar 683, bvar 684]),
    bnot (bands [bvar 540, bvar 543, bvar 683, bvar 686]),
    bnot (bands [bvar 540, bvar 545, bvar 683, bvar 688]),
    bnot (bands [bvar 541, bvar 543, bvar 684, bvar 686]),
    bnot (bands [bvar 541, bvar 544, bvar 684, bvar 687]),
    bnot (bands [bvar 541, bvar 545, bvar 684, bvar 688]),
    bnot (bands [bvar 542, bvar 543, bvar 685, bvar 686]),
    bnot (bands [bvar 542, bvar 544, bvar 685, bvar 687]),
    bnot (bands [bvar 543, bvar 544, bvar 686, bvar 687]),
    bnot (bands [bvar 536, bvar 539, bvar 692, bvar 695]),
    bnot (bands [bvar 536, bvar 540, bvar 692, bvar 696]),
    bnot (bands [bvar 536, bvar 541, bvar 692, bvar 697]),
    bnot (bands [bvar 536, bvar 542, bvar 692, bvar 698]),
    bnot (bands [bvar 536, bvar 543, bvar 692, bvar 699]),
    bnot (bands [bvar 536, bvar 544, bvar 692, bvar 700]),
    bnot (bands [bvar 536, bvar 545, bvar 692, bvar 701]),
    bnot (bands [bvar 536, bvar 546, bvar 692, bvar 702]) ]

def reducedUnionChunk036 : BVLogicalExpr :=
  bands reducedUnionChunk036Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
