import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk267Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1598 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1598 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1594 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1594 : BVExpr 7))) ]

def reducedUnionChunk267 : BVLogicalExpr :=
  bands reducedUnionChunk267Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
