import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk198Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1552 : BVExpr 7))) ]

def reducedUnionChunk198 : BVLogicalExpr :=
  bands reducedUnionChunk198Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
