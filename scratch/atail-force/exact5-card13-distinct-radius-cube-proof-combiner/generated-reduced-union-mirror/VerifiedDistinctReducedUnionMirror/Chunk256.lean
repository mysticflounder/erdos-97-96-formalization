import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk256Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1584 : BVExpr 7))) ]

def reducedUnionChunk256 : BVLogicalExpr :=
  bands reducedUnionChunk256Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
