import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk275Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bveq ((.var 1613 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1613 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bveq ((.var 1613 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1613 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1614 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1615 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1616 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1615 : BVExpr 7))) ]

def reducedUnionChunk275 : BVLogicalExpr :=
  bands reducedUnionChunk275Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
