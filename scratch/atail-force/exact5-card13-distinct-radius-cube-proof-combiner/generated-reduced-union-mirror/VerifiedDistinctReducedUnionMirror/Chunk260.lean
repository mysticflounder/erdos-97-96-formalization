import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk260Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1601 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1586 : BVExpr 7))) ]

def reducedUnionChunk260 : BVLogicalExpr :=
  bands reducedUnionChunk260Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
