import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk107Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 564, bvar 569, bvar 161, bvar 166]),
    bnot (bands [bvar 564, bvar 570, bvar 161, bvar 167]),
    bnot (bands [bvar 567, bvar 570, bvar 164, bvar 167]),
    bnot (bands [bvar 57, bvar 59, bvar 681, bvar 683]),
    bnot (bands [bvar 562, bvar 573, bvar 172, bvar 183]),
    bnot (bands [bvar 564, bvar 567, bvar 174, bvar 177]),
    bnot (bands [bvar 564, bvar 568, bvar 174, bvar 178]),
    bnot (bands [bvar 564, bvar 569, bvar 174, bvar 179]),
    bnot (bands [bvar 564, bvar 570, bvar 174, bvar 180]),
    bnot (bands [bvar 564, bvar 571, bvar 174, bvar 181]),
    bnot (bands [bvar 567, bvar 570, bvar 177, bvar 180]),
    bnot (bands [bvar 567, bvar 571, bvar 177, bvar 181]),
    bnot (bands [bvar 568, bvar 570, bvar 178, bvar 180]),
    bnot (bands [bvar 568, bvar 571, bvar 178, bvar 181]),
    bnot (bands [bvar 569, bvar 571, bvar 179, bvar 181]),
    bnot (bands [bvar 57, bvar 63, bvar 694, bvar 700]),
    bnot (bands [bvar 564, bvar 567, bvar 187, bvar 190]),
    bnot (bands [bvar 564, bvar 568, bvar 187, bvar 191]),
    bnot (bands [bvar 564, bvar 569, bvar 187, bvar 192]),
    bnot (bands [bvar 564, bvar 570, bvar 187, bvar 193]),
    bnot (bands [bvar 564, bvar 571, bvar 187, bvar 194]),
    bnot (bands [bvar 564, bvar 572, bvar 187, bvar 195]),
    bnot (bands [bvar 567, bvar 570, bvar 190, bvar 193]),
    bnot (bands [bvar 567, bvar 572, bvar 190, bvar 195]),
    bnot (bands [bvar 568, bvar 570, bvar 191, bvar 193]),
    bnot (bands [bvar 568, bvar 571, bvar 191, bvar 194]),
    bnot (bands [bvar 73, bvar 75, bvar 606, bvar 608]),
    bnot (bands [bvar 73, bvar 78, bvar 606, bvar 611]),
    bnot (bands [bvar 74, bvar 78, bvar 607, bvar 611]),
    bnot (bands [bvar 75, bvar 78, bvar 608, bvar 611]),
    bnot (bands [bvar 67, bvar 68, bvar 639, bvar 640]),
    bnot (bands [bvar 68, bvar 76, bvar 640, bvar 648]),
    bnot (bands [bvar 68, bvar 77, bvar 640, bvar 649]),
    bnot (bands [bvar 68, bvar 78, bvar 640, bvar 650]),
    bnot (bands [bvar 71, bvar 73, bvar 656, bvar 658]),
    bnot (bands [bvar 71, bvar 75, bvar 656, bvar 660]),
    bnot (bands [bvar 73, bvar 75, bvar 658, bvar 660]),
    bnot (bands [bvar 574, bvar 575, bvar 145, bvar 146]),
    bnot (bands [bvar 574, bvar 576, bvar 145, bvar 147]),
    bnot (bands [bvar 574, bvar 584, bvar 145, bvar 155]),
    bnot (bands [bvar 575, bvar 585, bvar 146, bvar 156]),
    bnot (bands [bvar 576, bvar 585, bvar 147, bvar 156]),
    bnot (bands [bvar 576, bvar 586, bvar 147, bvar 157]),
    bnot (bands [bvar 578, bvar 582, bvar 149, bvar 153]),
    bnot (bands [bvar 579, bvar 581, bvar 150, bvar 152]),
    bnot (bands [bvar 579, bvar 582, bvar 150, bvar 153]),
    bnot (bands [bvar 580, bvar 581, bvar 151, bvar 152]),
    bnot (bands [bvar 580, bvar 582, bvar 151, bvar 153]),
    bnot (bands [bvar 581, bvar 582, bvar 152, bvar 153]),
    bnot (bands [bvar 585, bvar 586, bvar 156, bvar 157]),
    bnot (bands [bvar 68, bvar 78, bvar 666, bvar 676]),
    bnot (bands [bvar 73, bvar 75, bvar 671, bvar 673]),
    bnot (bands [bvar 73, bvar 76, bvar 671, bvar 674]),
    bnot (bands [bvar 578, bvar 579, bvar 162, bvar 163]),
    bnot (bands [bvar 578, bvar 580, bvar 162, bvar 164]),
    bnot (bands [bvar 578, bvar 581, bvar 162, bvar 165]),
    bnot (bands [bvar 578, bvar 582, bvar 162, bvar 166]),
    bnot (bands [bvar 578, bvar 583, bvar 162, bvar 167]),
    bnot (bands [bvar 579, bvar 580, bvar 163, bvar 164]),
    bnot (bands [bvar 579, bvar 581, bvar 163, bvar 165]),
    bnot (bands [bvar 579, bvar 582, bvar 163, bvar 166]),
    bnot (bands [bvar 580, bvar 581, bvar 164, bvar 165]),
    bnot (bands [bvar 580, bvar 582, bvar 164, bvar 166]),
    bnot (bands [bvar 580, bvar 583, bvar 164, bvar 167]) ]

def reducedUnionChunk107 : BVLogicalExpr :=
  bands reducedUnionChunk107Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
