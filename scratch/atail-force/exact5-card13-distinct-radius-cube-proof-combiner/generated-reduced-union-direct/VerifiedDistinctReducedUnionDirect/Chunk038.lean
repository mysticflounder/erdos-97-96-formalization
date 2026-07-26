import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk038Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 562, bvar 571, bvar 575, bvar 584]),
    bnot (bands [bvar 562, bvar 572, bvar 575, bvar 585]),
    bnot (bands [bvar 566, bvar 568, bvar 579, bvar 581]),
    bnot (bands [bvar 567, bvar 571, bvar 580, bvar 584]),
    bnot (bands [bvar 570, bvar 572, bvar 583, bvar 585]),
    bnot (bands [bvar 562, bvar 567, bvar 601, bvar 606]),
    bnot (bands [bvar 562, bvar 568, bvar 601, bvar 607]),
    bnot (bands [bvar 562, bvar 569, bvar 601, bvar 608]),
    bnot (bands [bvar 562, bvar 570, bvar 601, bvar 609]),
    bnot (bands [bvar 562, bvar 571, bvar 601, bvar 610]),
    bnot (bands [bvar 562, bvar 572, bvar 601, bvar 611]),
    bnot (bands [bvar 562, bvar 573, bvar 601, bvar 612]),
    bnot (bands [bvar 567, bvar 568, bvar 606, bvar 607]),
    bnot (bands [bvar 567, bvar 569, bvar 606, bvar 608]),
    bnot (bands [bvar 567, bvar 570, bvar 606, bvar 609]),
    bnot (bands [bvar 567, bvar 571, bvar 606, bvar 610]),
    bnot (bands [bvar 567, bvar 573, bvar 606, bvar 612]),
    bnot (bands [bvar 568, bvar 569, bvar 607, bvar 608]),
    bnot (bands [bvar 568, bvar 573, bvar 607, bvar 612]),
    bnot (bands [bvar 570, bvar 571, bvar 609, bvar 610]),
    bnot (bands [bvar 570, bvar 572, bvar 609, bvar 611]),
    bnot (bands [bvar 570, bvar 573, bvar 609, bvar 612]),
    bnot (bands [bvar 571, bvar 572, bvar 610, bvar 611]),
    bnot (bands [bvar 562, bvar 568, bvar 614, bvar 620]),
    bnot (bands [bvar 562, bvar 569, bvar 614, bvar 621]),
    bnot (bands [bvar 562, bvar 570, bvar 614, bvar 622]),
    bnot (bands [bvar 562, bvar 571, bvar 614, bvar 623]),
    bnot (bands [bvar 562, bvar 572, bvar 614, bvar 624]),
    bnot (bands [bvar 562, bvar 573, bvar 614, bvar 625]),
    bnot (bands [bvar 564, bvar 566, bvar 616, bvar 618]),
    bnot (bands [bvar 568, bvar 569, bvar 620, bvar 621]),
    bnot (bands [bvar 568, bvar 570, bvar 620, bvar 622]),
    bnot (bands [bvar 568, bvar 573, bvar 620, bvar 625]),
    bnot (bands [bvar 569, bvar 570, bvar 621, bvar 622]),
    bnot (bands [bvar 569, bvar 571, bvar 621, bvar 623]),
    bnot (bands [bvar 569, bvar 572, bvar 621, bvar 624]),
    bnot (bands [bvar 570, bvar 571, bvar 622, bvar 623]),
    bnot (bands [bvar 570, bvar 573, bvar 622, bvar 625]),
    bnot (bands [bvar 571, bvar 572, bvar 623, bvar 624]),
    bnot (bands [bvar 562, bvar 569, bvar 627, bvar 634]),
    bnot (bands [bvar 562, bvar 572, bvar 627, bvar 637]),
    bnot (bands [bvar 562, bvar 573, bvar 627, bvar 638]),
    bnot (bands [bvar 564, bvar 566, bvar 629, bvar 631]),
    bnot (bands [bvar 564, bvar 567, bvar 629, bvar 632]),
    bnot (bands [bvar 569, bvar 570, bvar 634, bvar 635]),
    bnot (bands [bvar 569, bvar 572, bvar 634, bvar 637]),
    bnot (bands [bvar 569, bvar 573, bvar 634, bvar 638]),
    bnot (bands [bvar 572, bvar 573, bvar 637, bvar 638]),
    bnot (bands [bvar 562, bvar 570, bvar 640, bvar 648]),
    bnot (bands [bvar 562, bvar 571, bvar 640, bvar 649]),
    bnot (bands [bvar 562, bvar 572, bvar 640, bvar 650]),
    bnot (bands [bvar 562, bvar 573, bvar 640, bvar 651]),
    bnot (bands [bvar 571, bvar 573, bvar 649, bvar 651]),
    bnot (bands [bvar 572, bvar 573, bvar 650, bvar 651]),
    bnot (bands [bvar 562, bvar 571, bvar 653, bvar 662]),
    bnot (bands [bvar 562, bvar 572, bvar 653, bvar 663]),
    bnot (bands [bvar 562, bvar 573, bvar 653, bvar 664]),
    bnot (bands [bvar 564, bvar 567, bvar 655, bvar 658]),
    bnot (bands [bvar 564, bvar 568, bvar 655, bvar 659]),
    bnot (bands [bvar 564, bvar 569, bvar 655, bvar 660]),
    bnot (bands [bvar 562, bvar 572, bvar 666, bvar 676]),
    bnot (bands [bvar 562, bvar 573, bvar 666, bvar 677]),
    bnot (bands [bvar 564, bvar 566, bvar 668, bvar 670]),
    bnot (bands [bvar 564, bvar 567, bvar 668, bvar 671]) ]

def reducedUnionChunk038 : BVLogicalExpr :=
  bands reducedUnionChunk038Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
