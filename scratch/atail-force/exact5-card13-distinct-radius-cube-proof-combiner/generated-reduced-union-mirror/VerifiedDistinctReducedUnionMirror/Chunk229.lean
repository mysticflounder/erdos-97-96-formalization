import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk229Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1566 : BVExpr 7))) ]

def reducedUnionChunk229 : BVLogicalExpr :=
  bands reducedUnionChunk229Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
