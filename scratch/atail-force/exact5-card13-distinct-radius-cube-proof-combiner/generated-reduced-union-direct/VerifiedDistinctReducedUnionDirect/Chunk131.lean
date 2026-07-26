import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk131Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1, bvar 9, bvar 562, bvar 570]),
    bnot (bands [bvar 1, bvar 10, bvar 562, bvar 571]),
    bnot (bands [bvar 1, bvar 11, bvar 562, bvar 572]),
    bnot (bands [bvar 1, bvar 12, bvar 562, bvar 573]),
    bnot (bands [bvar 5, bvar 6, bvar 566, bvar 567]),
    bnot (bands [bvar 5, bvar 8, bvar 566, bvar 569]),
    bnot (bands [bvar 6, bvar 7, bvar 567, bvar 568]),
    bnot (bands [bvar 6, bvar 8, bvar 567, bvar 569]),
    bnot (bands [bvar 6, bvar 9, bvar 567, bvar 570]),
    bnot (bands [bvar 6, bvar 10, bvar 567, bvar 571]),
    bnot (bands [bvar 6, bvar 11, bvar 567, bvar 572]),
    bnot (bands [bvar 6, bvar 12, bvar 567, bvar 573]),
    bnot (bands [bvar 7, bvar 8, bvar 568, bvar 569]),
    bnot (bands [bvar 7, bvar 9, bvar 568, bvar 570]),
    bnot (bands [bvar 7, bvar 10, bvar 568, bvar 571]),
    bnot (bands [bvar 7, bvar 11, bvar 568, bvar 572]),
    bnot (bands [bvar 7, bvar 12, bvar 568, bvar 573]),
    bnot (bands [bvar 8, bvar 9, bvar 569, bvar 570]),
    bnot (bands [bvar 8, bvar 10, bvar 569, bvar 571]),
    bnot (bands [bvar 8, bvar 11, bvar 569, bvar 572]),
    bnot (bands [bvar 8, bvar 12, bvar 569, bvar 573]),
    bnot (bands [bvar 9, bvar 10, bvar 570, bvar 571]),
    bnot (bands [bvar 9, bvar 11, bvar 570, bvar 572]),
    bnot (bands [bvar 9, bvar 12, bvar 570, bvar 573]),
    bnot (bands [bvar 10, bvar 11, bvar 571, bvar 572]),
    bnot (bands [bvar 10, bvar 12, bvar 571, bvar 573]),
    bnot (bands [bvar 11, bvar 12, bvar 572, bvar 573]),
    bnot (bands [bvar 0, bvar 5, bvar 574, bvar 579]),
    bnot (bands [bvar 0, bvar 7, bvar 574, bvar 581]),
    bnot (bands [bvar 0, bvar 8, bvar 574, bvar 582]),
    bnot (bands [bvar 0, bvar 9, bvar 574, bvar 583]),
    bnot (bands [bvar 0, bvar 10, bvar 574, bvar 584]),
    bnot (bands [bvar 0, bvar 11, bvar 574, bvar 585]),
    bnot (bands [bvar 0, bvar 12, bvar 574, bvar 586]),
    bnot (bands [bvar 1, bvar 12, bvar 575, bvar 586]),
    bnot (bands [bvar 2, bvar 12, bvar 576, bvar 586]),
    bnot (bands [bvar 5, bvar 10, bvar 579, bvar 584]),
    bnot (bands [bvar 6, bvar 10, bvar 580, bvar 584]),
    bnot (bands [bvar 6, bvar 12, bvar 580, bvar 586]),
    bnot (bands [bvar 7, bvar 10, bvar 581, bvar 584]),
    bnot (bands [bvar 7, bvar 11, bvar 581, bvar 585]),
    bnot (bands [bvar 7, bvar 12, bvar 581, bvar 586]),
    bnot (bands [bvar 8, bvar 9, bvar 582, bvar 583]),
    bnot (bands [bvar 8, bvar 10, bvar 582, bvar 584]),
    bnot (bands [bvar 8, bvar 11, bvar 582, bvar 585]),
    bnot (bands [bvar 9, bvar 10, bvar 583, bvar 584]),
    bnot (bands [bvar 9, bvar 11, bvar 583, bvar 585]),
    bnot (bands [bvar 10, bvar 12, bvar 584, bvar 586]),
    bnot (bands [bvar 0, bvar 1, bvar 600, bvar 601]),
    bnot (bands [bvar 0, bvar 2, bvar 600, bvar 602]),
    bnot (bands [bvar 0, bvar 3, bvar 600, bvar 603]),
    bnot (bands [bvar 0, bvar 6, bvar 600, bvar 606]),
    bnot (bands [bvar 0, bvar 7, bvar 600, bvar 607]),
    bnot (bands [bvar 0, bvar 8, bvar 600, bvar 608]),
    bnot (bands [bvar 0, bvar 9, bvar 600, bvar 609]),
    bnot (bands [bvar 0, bvar 10, bvar 600, bvar 610]),
    bnot (bands [bvar 0, bvar 11, bvar 600, bvar 611]),
    bnot (bands [bvar 0, bvar 12, bvar 600, bvar 612]),
    bnot (bands [bvar 1, bvar 6, bvar 601, bvar 606]),
    bnot (bands [bvar 1, bvar 7, bvar 601, bvar 607]),
    bnot (bands [bvar 1, bvar 8, bvar 601, bvar 608]),
    bnot (bands [bvar 1, bvar 9, bvar 601, bvar 609]),
    bnot (bands [bvar 1, bvar 10, bvar 601, bvar 610]),
    bnot (bands [bvar 1, bvar 11, bvar 601, bvar 611]) ]

def reducedUnionChunk131 : BVLogicalExpr :=
  bands reducedUnionChunk131Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
