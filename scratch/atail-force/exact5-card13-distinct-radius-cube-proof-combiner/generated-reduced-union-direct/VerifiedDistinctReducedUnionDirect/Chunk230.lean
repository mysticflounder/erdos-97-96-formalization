import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk230Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1569 : BVExpr 7))) ]

def reducedUnionChunk230 : BVLogicalExpr :=
  bands reducedUnionChunk230Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
