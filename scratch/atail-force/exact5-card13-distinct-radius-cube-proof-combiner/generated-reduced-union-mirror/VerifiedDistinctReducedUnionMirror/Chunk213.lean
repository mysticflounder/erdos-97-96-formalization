import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk213Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1597 : BVExpr 7))) ]

def reducedUnionChunk213 : BVLogicalExpr :=
  bands reducedUnionChunk213Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
