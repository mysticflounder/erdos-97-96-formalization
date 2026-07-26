import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk175Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 582, bvar 585]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 582, bvar 586]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 583, bvar 584]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 583, bvar 585]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 583, bvar 586]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 584, bvar 585]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 584, bvar 586]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 585, bvar 586]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 600, bvar 601]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 600, bvar 602]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bands [bvar 600, bvar 603]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 600, bvar 604]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 600, bvar 606]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 600, bvar 607]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 600, bvar 608]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 600, bvar 609]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 600, bvar 610]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 600, bvar 611]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 600, bvar 612]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 601, bvar 602]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bands [bvar 601, bvar 603]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 601, bvar 604]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 601, bvar 606]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 601, bvar 607]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 601, bvar 608]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 601, bvar 609]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 601, bvar 610]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 601, bvar 611]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 601, bvar 612]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 602, bvar 604]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 602, bvar 606]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 602, bvar 607]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 602, bvar 608]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 602, bvar 609]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 602, bvar 610]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 602, bvar 611]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 602, bvar 612]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 603, bvar 604]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 603, bvar 606]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 603, bvar 607]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 603, bvar 608]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 603, bvar 609]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 603, bvar 610]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 603, bvar 611]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 603, bvar 612]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 604, bvar 606]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 604, bvar 607]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 604, bvar 608]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 604, bvar 609]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 604, bvar 610]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 604, bvar 611]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 604, bvar 612]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 606, bvar 607]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 606, bvar 608]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 606, bvar 609]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 606, bvar 610]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 606, bvar 611]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 606, bvar 612]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 607, bvar 608]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 607, bvar 609]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 607, bvar 610]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 607, bvar 611]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 607, bvar 612]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 608, bvar 609]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1602 : BVExpr 7))) ]

def reducedUnionChunk175 : BVLogicalExpr :=
  bands reducedUnionChunk175Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
