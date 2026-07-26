import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk192Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1553 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1569 : BVExpr 7))) ]

def reducedUnionChunk192 : BVLogicalExpr :=
  bands reducedUnionChunk192Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
