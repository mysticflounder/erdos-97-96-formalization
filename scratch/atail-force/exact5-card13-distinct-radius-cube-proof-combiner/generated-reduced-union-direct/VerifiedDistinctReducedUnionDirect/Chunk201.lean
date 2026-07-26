import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk201Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1589 : BVExpr 7))) ]

def reducedUnionChunk201 : BVLogicalExpr :=
  bands reducedUnionChunk201Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
