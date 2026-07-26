import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk114Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 630, bvar 637, bvar 162, bvar 169]),
    bnot (bands [bvar 631, bvar 637, bvar 163, bvar 169]),
    bnot (bands [bvar 631, bvar 638, bvar 163, bvar 170]),
    bnot (bands [bvar 632, bvar 638, bvar 164, bvar 170]),
    bnot (bands [bvar 634, bvar 635, bvar 166, bvar 167]),
    bnot (bands [bvar 637, bvar 638, bvar 169, bvar 170]),
    bnot (bands [bvar 119, bvar 120, bvar 678, bvar 679]),
    bnot (bands [bvar 119, bvar 122, bvar 678, bvar 681]),
    bnot (bands [bvar 119, bvar 123, bvar 678, bvar 682]),
    bnot (bands [bvar 120, bvar 123, bvar 679, bvar 682]),
    bnot (bands [bvar 127, bvar 128, bvar 686, bvar 687]),
    bnot (bands [bvar 127, bvar 129, bvar 686, bvar 688]),
    bnot (bands [bvar 128, bvar 129, bvar 687, bvar 688]),
    bnot (bands [bvar 626, bvar 627, bvar 171, bvar 172]),
    bnot (bands [bvar 626, bvar 628, bvar 171, bvar 173]),
    bnot (bands [bvar 626, bvar 630, bvar 171, bvar 175]),
    bnot (bands [bvar 627, bvar 630, bvar 172, bvar 175]),
    bnot (bands [bvar 628, bvar 630, bvar 173, bvar 175]),
    bnot (bands [bvar 629, bvar 631, bvar 174, bvar 176]),
    bnot (bands [bvar 630, bvar 631, bvar 175, bvar 176]),
    bnot (bands [bvar 631, bvar 632, bvar 176, bvar 177]),
    bnot (bands [bvar 634, bvar 635, bvar 179, bvar 180]),
    bnot (bands [bvar 634, bvar 636, bvar 179, bvar 181]),
    bnot (bands [bvar 635, bvar 636, bvar 180, bvar 181]),
    atMost [bands [bvar 119, bvar 691], bands [bvar 120, bvar 692], bands [bvar 121, bvar 693], bands [bvar 122, bvar 694], bands [bvar 123, bvar 695], bands [bvar 124, bvar 696], bands [bvar 125, bvar 697], bands [bvar 126, bvar 698], bands [bvar 127, bvar 699], bands [bvar 128, bvar 700], bands [bvar 129, bvar 701], bands [bvar 130, bvar 702], bands [bvar 131, bvar 703]] 2,
    bnot (bands [bvar 122, bvar 123, bvar 694, bvar 695]),
    bnot (bands [bvar 122, bvar 124, bvar 694, bvar 696]),
    bnot (bands [bvar 122, bvar 125, bvar 694, bvar 697]),
    bnot (bands [bvar 123, bvar 124, bvar 695, bvar 696]),
    bnot (bands [bvar 123, bvar 125, bvar 695, bvar 697]),
    bnot (bands [bvar 124, bvar 125, bvar 696, bvar 697]),
    bnot (bands [bvar 127, bvar 128, bvar 699, bvar 700]),
    bnot (bands [bvar 127, bvar 129, bvar 699, bvar 701]),
    bnot (bands [bvar 127, bvar 130, bvar 699, bvar 702]),
    bnot (bands [bvar 128, bvar 129, bvar 700, bvar 701]),
    bnot (bands [bvar 128, bvar 130, bvar 700, bvar 702]),
    bnot (bands [bvar 132, bvar 135, bvar 652, bvar 655]),
    bnot (bands [bvar 132, bvar 136, bvar 652, bvar 656]),
    bnot (bands [bvar 132, bvar 137, bvar 652, bvar 657]),
    bnot (bands [bvar 132, bvar 138, bvar 652, bvar 658]),
    bnot (bands [bvar 132, bvar 139, bvar 652, bvar 659]),
    bnot (bands [bvar 132, bvar 143, bvar 652, bvar 663]),
    bnot (bands [bvar 132, bvar 144, bvar 652, bvar 664]),
    bnot (bands [bvar 133, bvar 135, bvar 653, bvar 655]),
    bnot (bands [bvar 134, bvar 136, bvar 654, bvar 656]),
    bnot (bands [bvar 134, bvar 143, bvar 654, bvar 663]),
    bnot (bands [bvar 135, bvar 136, bvar 655, bvar 656]),
    bnot (bands [bvar 135, bvar 138, bvar 655, bvar 658]),
    bnot (bands [bvar 135, bvar 142, bvar 655, bvar 662]),
    bnot (bands [bvar 135, bvar 143, bvar 655, bvar 663]),
    bnot (bands [bvar 135, bvar 144, bvar 655, bvar 664]),
    bnot (bands [bvar 136, bvar 138, bvar 656, bvar 658]),
    bnot (bands [bvar 136, bvar 143, bvar 656, bvar 663]),
    bnot (bands [bvar 136, bvar 144, bvar 656, bvar 664]),
    bnot (bands [bvar 137, bvar 143, bvar 657, bvar 663]),
    bnot (bands [bvar 137, bvar 144, bvar 657, bvar 664]),
    bnot (bands [bvar 138, bvar 143, bvar 658, bvar 663]),
    bnot (bands [bvar 138, bvar 144, bvar 658, bvar 664]),
    bnot (bands [bvar 139, bvar 142, bvar 659, bvar 662]),
    bnot (bands [bvar 639, bvar 640, bvar 145, bvar 146]),
    bnot (bands [bvar 639, bvar 641, bvar 145, bvar 147]),
    bnot (bands [bvar 639, bvar 642, bvar 145, bvar 148]),
    bnot (bands [bvar 639, bvar 643, bvar 145, bvar 149]),
    bnot (bands [bvar 639, bvar 644, bvar 145, bvar 150]) ]

def reducedUnionChunk114 : BVLogicalExpr :=
  bands reducedUnionChunk114Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
