import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk211Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1609 : BVExpr 7))) ]

def reducedUnionChunk211 : BVLogicalExpr :=
  bands reducedUnionChunk211Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
