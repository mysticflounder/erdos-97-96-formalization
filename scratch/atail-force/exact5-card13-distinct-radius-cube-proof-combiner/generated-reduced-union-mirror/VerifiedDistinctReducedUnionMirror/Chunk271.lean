import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk271Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1596 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1597 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bveq ((.var 1595 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1618 : BVExpr 7))) ]

def reducedUnionChunk271 : BVLogicalExpr :=
  bands reducedUnionChunk271Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
