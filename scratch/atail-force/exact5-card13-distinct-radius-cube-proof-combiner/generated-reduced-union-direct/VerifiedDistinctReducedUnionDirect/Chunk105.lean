import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk105Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 34, bvar 37, bvar 697, bvar 700]),
    bnot (bands [bvar 34, bvar 38, bvar 697, bvar 701]),
    bnot (bands [bvar 34, bvar 39, bvar 697, bvar 702]),
    bnot (bands [bvar 35, bvar 36, bvar 698, bvar 699]),
    bnot (bands [bvar 35, bvar 37, bvar 698, bvar 700]),
    bnot (bands [bvar 35, bvar 38, bvar 698, bvar 701]),
    bnot (bands [bvar 35, bvar 39, bvar 698, bvar 702]),
    bnot (bands [bvar 36, bvar 38, bvar 699, bvar 701]),
    bnot (bands [bvar 37, bvar 38, bvar 700, bvar 701]),
    bnot (bands [bvar 536, bvar 541, bvar 185, bvar 190]),
    bnot (bands [bvar 536, bvar 542, bvar 185, bvar 191]),
    bnot (bands [bvar 536, bvar 545, bvar 185, bvar 194]),
    bnot (bands [bvar 537, bvar 541, bvar 186, bvar 190]),
    bnot (bands [bvar 537, bvar 542, bvar 186, bvar 191]),
    bnot (bands [bvar 541, bvar 542, bvar 190, bvar 191]),
    bnot (bands [bvar 541, bvar 545, bvar 190, bvar 194]),
    bnot (bands [bvar 542, bvar 545, bvar 191, bvar 194]),
    bnot (bands [bvar 44, bvar 46, bvar 564, bvar 566]),
    bnot (bands [bvar 551, bvar 553, bvar 57, bvar 59]),
    bnot (bands [bvar 44, bvar 45, bvar 603, bvar 604]),
    bnot (bands [bvar 48, bvar 49, bvar 607, bvar 608]),
    bnot (bands [bvar 48, bvar 50, bvar 607, bvar 609]),
    bnot (bands [bvar 48, bvar 51, bvar 607, bvar 610]),
    bnot (bands [bvar 48, bvar 52, bvar 607, bvar 611]),
    bnot (bands [bvar 49, bvar 50, bvar 608, bvar 609]),
    bnot (bands [bvar 49, bvar 51, bvar 608, bvar 610]),
    bnot (bands [bvar 49, bvar 52, bvar 608, bvar 611]),
    bnot (bands [bvar 49, bvar 53, bvar 608, bvar 612]),
    bnot (bands [bvar 50, bvar 51, bvar 609, bvar 610]),
    bnot (bands [bvar 44, bvar 46, bvar 616, bvar 618]),
    bnot (bands [bvar 41, bvar 50, bvar 639, bvar 648]),
    bnot (bands [bvar 41, bvar 51, bvar 639, bvar 649]),
    bnot (bands [bvar 551, bvar 552, bvar 135, bvar 136]),
    bnot (bands [bvar 551, bvar 555, bvar 135, bvar 139]),
    bnot (bands [bvar 45, bvar 48, bvar 656, bvar 659]),
    bnot (bands [bvar 52, bvar 53, bvar 663, bvar 664]),
    bnot (bands [bvar 41, bvar 53, bvar 665, bvar 677]),
    bnot (bands [bvar 43, bvar 50, bvar 667, bvar 674]),
    bnot (bands [bvar 45, bvar 47, bvar 669, bvar 671]),
    bnot (bands [bvar 45, bvar 48, bvar 669, bvar 672]),
    bnot (bands [bvar 45, bvar 49, bvar 669, bvar 673]),
    bnot (bands [bvar 47, bvar 49, bvar 671, bvar 673]),
    bnot (bands [bvar 47, bvar 50, bvar 671, bvar 674]),
    bnot (bands [bvar 48, bvar 49, bvar 672, bvar 673]),
    bnot (bands [bvar 552, bvar 553, bvar 162, bvar 163]),
    bnot (bands [bvar 552, bvar 554, bvar 162, bvar 164]),
    bnot (bands [bvar 552, bvar 555, bvar 162, bvar 165]),
    bnot (bands [bvar 559, bvar 560, bvar 169, bvar 170]),
    bnot (bands [bvar 43, bvar 48, bvar 680, bvar 685]),
    bnot (bands [bvar 44, bvar 48, bvar 681, bvar 685]),
    bnot (bands [bvar 45, bvar 46, bvar 682, bvar 683]),
    bnot (bands [bvar 45, bvar 47, bvar 682, bvar 684]),
    bnot (bands [bvar 47, bvar 48, bvar 684, bvar 685]),
    bnot (bands [bvar 47, bvar 49, bvar 684, bvar 686]),
    bnot (bands [bvar 47, bvar 50, bvar 684, bvar 687]),
    bnot (bands [bvar 48, bvar 49, bvar 685, bvar 686]),
    bnot (bands [bvar 48, bvar 50, bvar 685, bvar 687]),
    bnot (bands [bvar 49, bvar 50, bvar 686, bvar 687]),
    bnot (bands [bvar 45, bvar 48, bvar 695, bvar 698]),
    bnot (bands [bvar 48, bvar 49, bvar 698, bvar 699]),
    bnot (bands [bvar 48, bvar 50, bvar 698, bvar 700]),
    bnot (bands [bvar 562, bvar 566, bvar 68, bvar 72]),
    bnot (bands [bvar 562, bvar 567, bvar 68, bvar 73]),
    bnot (bands [bvar 562, bvar 568, bvar 68, bvar 74]) ]

def reducedUnionChunk105 : BVLogicalExpr :=
  bands reducedUnionChunk105Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
