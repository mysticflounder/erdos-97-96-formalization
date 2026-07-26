import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk226Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1601 : BVExpr 7))) ]

def reducedUnionChunk226 : BVLogicalExpr :=
  bands reducedUnionChunk226Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
