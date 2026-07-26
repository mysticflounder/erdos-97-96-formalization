import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk266Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1608 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1609 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1610 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1611 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1603 : BVExpr 7))) ]

def reducedUnionChunk266 : BVLogicalExpr :=
  bands reducedUnionChunk266Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
