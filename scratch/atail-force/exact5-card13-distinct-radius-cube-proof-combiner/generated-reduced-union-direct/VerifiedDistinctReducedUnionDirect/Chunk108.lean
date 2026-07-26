import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk108Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 581, bvar 582, bvar 165, bvar 166]),
    bnot (bands [bvar 581, bvar 583, bvar 165, bvar 167]),
    bnot (bands [bvar 582, bvar 583, bvar 166, bvar 167]),
    bnot (bands [bvar 585, bvar 586, bvar 169, bvar 170]),
    bnot (bands [bvar 67, bvar 68, bvar 678, bvar 679]),
    bnot (bands [bvar 67, bvar 69, bvar 678, bvar 680]),
    bnot (bands [bvar 71, bvar 72, bvar 682, bvar 683]),
    bnot (bands [bvar 71, bvar 73, bvar 682, bvar 684]),
    bnot (bands [bvar 71, bvar 74, bvar 682, bvar 685]),
    bnot (bands [bvar 71, bvar 75, bvar 682, bvar 686]),
    bnot (bands [bvar 71, bvar 76, bvar 682, bvar 687]),
    bnot (bands [bvar 71, bvar 77, bvar 682, bvar 688]),
    bnot (bands [bvar 72, bvar 75, bvar 683, bvar 686]),
    bnot (bands [bvar 72, bvar 76, bvar 683, bvar 687]),
    bnot (bands [bvar 73, bvar 75, bvar 684, bvar 686]),
    bnot (bands [bvar 73, bvar 76, bvar 684, bvar 687]),
    bnot (bands [bvar 74, bvar 75, bvar 685, bvar 686]),
    bnot (bands [bvar 74, bvar 76, bvar 685, bvar 687]),
    bnot (bands [bvar 75, bvar 76, bvar 686, bvar 687]),
    bnot (bands [bvar 75, bvar 77, bvar 686, bvar 688]),
    bnot (bands [bvar 71, bvar 72, bvar 695, bvar 696]),
    bnot (bands [bvar 71, bvar 73, bvar 695, bvar 697]),
    bnot (bands [bvar 71, bvar 74, bvar 695, bvar 698]),
    bnot (bands [bvar 71, bvar 75, bvar 695, bvar 699]),
    bnot (bands [bvar 71, bvar 76, bvar 695, bvar 700]),
    bnot (bands [bvar 71, bvar 77, bvar 695, bvar 701]),
    bnot (bands [bvar 73, bvar 75, bvar 697, bvar 699]),
    bnot (bands [bvar 73, bvar 76, bvar 697, bvar 700]),
    bnot (bands [bvar 73, bvar 77, bvar 697, bvar 701]),
    bnot (bands [bvar 74, bvar 75, bvar 698, bvar 699]),
    bnot (bands [bvar 74, bvar 76, bvar 698, bvar 700]),
    bnot (bands [bvar 75, bvar 76, bvar 699, bvar 700]),
    bnot (bands [bvar 75, bvar 77, bvar 699, bvar 701]),
    bnot (bands [bvar 76, bvar 78, bvar 700, bvar 702]),
    bnot (bands [bvar 603, bvar 612, bvar 109, bvar 118]),
    bnot (bands [bvar 604, bvar 612, bvar 110, bvar 118]),
    atMost [bands [bvar 600, bvar 119], bands [bvar 601, bvar 120], bands [bvar 602, bvar 121], bands [bvar 603, bvar 122], bands [bvar 604, bvar 123], bands [bvar 605, bvar 124], bands [bvar 606, bvar 125], bands [bvar 607, bvar 126], bands [bvar 608, bvar 127], bands [bvar 609, bvar 128], bands [bvar 610, bvar 129], bands [bvar 611, bvar 130], bands [bvar 612, bvar 131]] 2,
    bnot (bands [bvar 600, bvar 612, bvar 119, bvar 131]),
    bnot (bands [bvar 602, bvar 612, bvar 121, bvar 131]),
    bnot (bands [bvar 603, bvar 604, bvar 122, bvar 123]),
    bnot (bands [bvar 603, bvar 608, bvar 122, bvar 127]),
    bnot (bands [bvar 603, bvar 610, bvar 122, bvar 129]),
    bnot (bands [bvar 603, bvar 611, bvar 122, bvar 130]),
    bnot (bands [bvar 603, bvar 612, bvar 122, bvar 131]),
    bnot (bands [bvar 604, bvar 608, bvar 123, bvar 127]),
    bnot (bands [bvar 604, bvar 610, bvar 123, bvar 129]),
    bnot (bands [bvar 604, bvar 611, bvar 123, bvar 130]),
    bnot (bands [bvar 604, bvar 612, bvar 123, bvar 131]),
    bnot (bands [bvar 608, bvar 610, bvar 127, bvar 129]),
    bnot (bands [bvar 608, bvar 611, bvar 127, bvar 130]),
    bnot (bands [bvar 608, bvar 612, bvar 127, bvar 131]),
    bnot (bands [bvar 610, bvar 612, bvar 129, bvar 131]),
    bnot (bands [bvar 611, bvar 612, bvar 130, bvar 131]),
    bnot (bands [bvar 93, bvar 94, bvar 639, bvar 640]),
    bnot (bands [bvar 93, bvar 97, bvar 639, bvar 643]),
    bnot (bands [bvar 93, bvar 102, bvar 639, bvar 648]),
    bnot (bands [bvar 93, bvar 103, bvar 639, bvar 649]),
    bnot (bands [bvar 93, bvar 105, bvar 639, bvar 651]),
    bnot (bands [bvar 94, bvar 97, bvar 640, bvar 643]),
    bnot (bands [bvar 94, bvar 102, bvar 640, bvar 648]),
    bnot (bands [bvar 94, bvar 103, bvar 640, bvar 649]),
    bnot (bands [bvar 94, bvar 105, bvar 640, bvar 651]),
    bnot (bands [bvar 96, bvar 103, bvar 642, bvar 649]),
    bnot (bands [bvar 97, bvar 102, bvar 643, bvar 648]) ]

def reducedUnionChunk108 : BVLogicalExpr :=
  bands reducedUnionChunk108Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
