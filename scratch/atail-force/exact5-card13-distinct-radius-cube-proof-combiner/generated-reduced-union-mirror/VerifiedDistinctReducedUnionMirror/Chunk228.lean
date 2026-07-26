import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk228Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1585 : BVExpr 7))) ]

def reducedUnionChunk228 : BVLogicalExpr :=
  bands reducedUnionChunk228Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
