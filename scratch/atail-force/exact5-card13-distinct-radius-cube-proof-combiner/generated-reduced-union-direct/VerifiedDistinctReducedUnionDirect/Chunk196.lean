import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk196Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1575 : BVExpr 7))) ]

def reducedUnionChunk196 : BVLogicalExpr :=
  bands reducedUnionChunk196Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
