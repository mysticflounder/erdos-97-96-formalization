import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk212Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1595 : BVExpr 7))) ]

def reducedUnionChunk212 : BVLogicalExpr :=
  bands reducedUnionChunk212Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
