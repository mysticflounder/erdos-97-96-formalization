import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk245Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1576 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1576 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1574 : BVExpr 7))) ]

def reducedUnionChunk245 : BVLogicalExpr :=
  bands reducedUnionChunk245Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
