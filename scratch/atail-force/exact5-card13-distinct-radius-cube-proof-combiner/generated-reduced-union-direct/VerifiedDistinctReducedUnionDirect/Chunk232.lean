import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk232Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bveq ((.var 1618 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1618 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bveq ((.var 1618 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1618 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bveq ((.var 1619 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1619 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bveq ((.var 1619 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1619 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bveq ((.var 1619 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1619 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bveq ((.var 1619 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1569 : BVExpr 7))) ]

def reducedUnionChunk232 : BVLogicalExpr :=
  bands reducedUnionChunk232Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
