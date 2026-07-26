import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk217Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1603 : BVExpr 7))) ]

def reducedUnionChunk217 : BVLogicalExpr :=
  bands reducedUnionChunk217Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
