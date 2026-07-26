import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk207Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1581 : BVExpr 7))) ]

def reducedUnionChunk207 : BVLogicalExpr :=
  bands reducedUnionChunk207Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
