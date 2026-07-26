import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk174Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 570, bvar 571]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bands [bvar 570, bvar 572]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bands [bvar 570, bvar 573]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bands [bvar 571, bvar 572]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bands [bvar 571, bvar 573]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bands [bvar 572, bvar 573]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bands [bvar 574, bvar 575]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bands [bvar 574, bvar 576]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1572 : BVExpr 7))),
    bimplies (bands [bvar 574, bvar 578]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 574, bvar 579]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 574, bvar 580]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 574, bvar 581]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 574, bvar 582]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
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
    bimplies (bands [bvar 582, bvar 584]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1588 : BVExpr 7))) ]

def reducedUnionChunk174 : BVLogicalExpr :=
  bands reducedUnionChunk174Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
