import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk206Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1595 : BVExpr 7))) ]

def reducedUnionChunk206 : BVLogicalExpr :=
  bands reducedUnionChunk206Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
