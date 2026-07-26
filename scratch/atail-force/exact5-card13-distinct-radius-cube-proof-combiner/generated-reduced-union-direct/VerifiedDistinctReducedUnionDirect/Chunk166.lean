import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk166Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 574, bvar 582]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 574, bvar 583]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 574, bvar 584]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 574, bvar 585]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 574, bvar 586]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 575, bvar 576]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1572 : BVExpr 7))),
    bimplies (bands [bvar 575, bvar 578]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 575, bvar 579]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 575, bvar 580]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 575, bvar 581]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 575, bvar 582]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 575, bvar 583]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 575, bvar 584]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 575, bvar 585]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 575, bvar 586]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 576, bvar 578]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 576, bvar 579]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 576, bvar 580]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 576, bvar 581]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 576, bvar 582]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 576, bvar 583]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 576, bvar 584]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 576, bvar 585]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 576, bvar 586]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 578, bvar 579]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 578, bvar 580]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 578, bvar 581]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 578, bvar 582]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 578, bvar 583]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 578, bvar 584]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 578, bvar 585]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 578, bvar 586]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 579, bvar 580]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 579, bvar 581]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 579, bvar 582]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 579, bvar 583]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 579, bvar 584]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 579, bvar 585]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 579, bvar 586]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 580, bvar 581]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 580, bvar 582]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 580, bvar 583]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 580, bvar 584]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 580, bvar 585]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 580, bvar 586]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 581, bvar 582]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 581, bvar 583]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 581, bvar 584]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 581, bvar 585]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 581, bvar 586]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 582, bvar 583]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 582, bvar 584]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 582, bvar 585]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
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
    bimplies (bands [bvar 600, bvar 604]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1591 : BVExpr 7))) ]

def reducedUnionChunk166 : BVLogicalExpr :=
  bands reducedUnionChunk166Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
