import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk232Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1595 : BVExpr 7))) ]

def reducedUnionChunk232 : BVLogicalExpr :=
  bands reducedUnionChunk232Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
