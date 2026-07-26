import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk252Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1575 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1610 : BVExpr 7))) ]

def reducedUnionChunk252 : BVLogicalExpr :=
  bands reducedUnionChunk252Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
