import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk211Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1555 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1556 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bveq ((.var 1557 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1589 : BVExpr 7))) ]

def reducedUnionChunk211 : BVLogicalExpr :=
  bands reducedUnionChunk211Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
