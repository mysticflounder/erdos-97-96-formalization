import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk266Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1592 : BVExpr 7))) ]

def reducedUnionChunk266 : BVLogicalExpr :=
  bands reducedUnionChunk266Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
