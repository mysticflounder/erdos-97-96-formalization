import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk197Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1575 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1569 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1570 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1550 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bveq ((.var 1571 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1564 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1565 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1549 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1549 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1562 : BVExpr 7)) ((.var 1551 : BVExpr 7))) ]

def reducedUnionChunk197 : BVLogicalExpr :=
  bands reducedUnionChunk197Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
