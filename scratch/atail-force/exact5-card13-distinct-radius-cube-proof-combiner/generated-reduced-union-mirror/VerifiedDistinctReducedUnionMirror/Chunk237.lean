import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk237Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bveq ((.var 1607 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1607 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bveq ((.var 1607 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1607 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1567 : BVExpr 7))) ]

def reducedUnionChunk237 : BVLogicalExpr :=
  bands reducedUnionChunk237Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
