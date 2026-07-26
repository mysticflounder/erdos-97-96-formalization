import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk223Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1563 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1563 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1567 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1567 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1562 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1564 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1564 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1565 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1565 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1566 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1563 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1566 : BVExpr 7)) ((.var 1576 : BVExpr 7))) ]

def reducedUnionChunk223 : BVLogicalExpr :=
  bands reducedUnionChunk223Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
