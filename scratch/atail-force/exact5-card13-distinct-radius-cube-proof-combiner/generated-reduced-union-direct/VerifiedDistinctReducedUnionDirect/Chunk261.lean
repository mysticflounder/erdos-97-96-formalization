import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk261Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bveq ((.var 1607 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1607 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1594 : BVExpr 7))) ]

def reducedUnionChunk261 : BVLogicalExpr :=
  bands reducedUnionChunk261Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
