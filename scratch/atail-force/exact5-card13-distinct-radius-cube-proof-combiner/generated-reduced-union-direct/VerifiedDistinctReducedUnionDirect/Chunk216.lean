import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk216Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1578 : BVExpr 7))) ]

def reducedUnionChunk216 : BVLogicalExpr :=
  bands reducedUnionChunk216Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
