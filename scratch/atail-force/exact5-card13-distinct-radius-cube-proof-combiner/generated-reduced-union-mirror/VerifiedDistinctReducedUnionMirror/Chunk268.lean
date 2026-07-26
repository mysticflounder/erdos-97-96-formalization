import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk268Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bveq ((.var 1607 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1607 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bveq ((.var 1607 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1608 : BVExpr 7))) ]

def reducedUnionChunk268 : BVLogicalExpr :=
  bands reducedUnionChunk268Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
