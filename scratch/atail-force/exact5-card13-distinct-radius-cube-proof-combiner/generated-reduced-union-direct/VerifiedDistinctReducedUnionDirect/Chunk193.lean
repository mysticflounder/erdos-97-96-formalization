import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk193Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1556 : BVExpr 7))) ]

def reducedUnionChunk193 : BVLogicalExpr :=
  bands reducedUnionChunk193Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
