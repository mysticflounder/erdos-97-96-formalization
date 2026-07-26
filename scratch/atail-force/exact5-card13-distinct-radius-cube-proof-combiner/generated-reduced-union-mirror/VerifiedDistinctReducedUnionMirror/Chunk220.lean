import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk220Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bveq ((.var 1613 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1613 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bveq ((.var 1613 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1613 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1616 : BVExpr 7))) ]

def reducedUnionChunk220 : BVLogicalExpr :=
  bands reducedUnionChunk220Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
