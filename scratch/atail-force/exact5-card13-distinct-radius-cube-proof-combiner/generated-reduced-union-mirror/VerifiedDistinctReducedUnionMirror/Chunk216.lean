import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk216Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1597 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1598 : BVExpr 7)) ((.var 1597 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1600 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1554 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1602 : BVExpr 7))) ]

def reducedUnionChunk216 : BVLogicalExpr :=
  bands reducedUnionChunk216Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
