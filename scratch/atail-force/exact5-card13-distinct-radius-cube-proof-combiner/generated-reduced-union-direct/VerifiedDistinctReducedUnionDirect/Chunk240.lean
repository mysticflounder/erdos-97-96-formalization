import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk240Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1576 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1576 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1575 : BVExpr 7))) ]

def reducedUnionChunk240 : BVLogicalExpr :=
  bands reducedUnionChunk240Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
