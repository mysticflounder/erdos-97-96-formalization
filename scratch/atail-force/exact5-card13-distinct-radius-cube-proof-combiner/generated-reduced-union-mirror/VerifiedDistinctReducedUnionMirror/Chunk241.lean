import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk241Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bveq ((.var 1622 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1622 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bveq ((.var 1622 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1622 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1573 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1573 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1573 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1573 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1573 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1573 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1573 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1573 : BVExpr 7)) ((.var 1576 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1573 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1573 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1573 : BVExpr 7))) ]

def reducedUnionChunk241 : BVLogicalExpr :=
  bands reducedUnionChunk241Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
