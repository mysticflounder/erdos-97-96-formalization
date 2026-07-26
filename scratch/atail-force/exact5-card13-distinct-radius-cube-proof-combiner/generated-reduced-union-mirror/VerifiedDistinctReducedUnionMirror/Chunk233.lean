import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk233Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1596 : BVExpr 7))) ]

def reducedUnionChunk233 : BVLogicalExpr :=
  bands reducedUnionChunk233Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
