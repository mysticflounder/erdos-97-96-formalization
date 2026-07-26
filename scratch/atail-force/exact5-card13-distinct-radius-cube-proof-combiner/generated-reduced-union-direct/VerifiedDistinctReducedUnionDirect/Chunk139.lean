import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk139Assertions : List BVLogicalExpr :=
  [ bvult ((.var 1559 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1560 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1561 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1562 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1563 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1564 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1565 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1566 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1567 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1568 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1569 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1570 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1571 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1572 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1573 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1574 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1575 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1576 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1577 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1578 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1579 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1580 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1581 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1582 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1583 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1584 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1585 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1586 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1587 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1588 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1589 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1590 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1591 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1592 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1593 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1594 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1595 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1596 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1597 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1598 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1599 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1600 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1601 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1602 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1603 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1604 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1605 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1606 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1607 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1608 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1609 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1610 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1611 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1612 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1613 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1614 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1615 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1616 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1617 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1618 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1619 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1620 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1621 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1622 : BVExpr 7)) ((.const 78#7)) ]

def reducedUnionChunk139 : BVLogicalExpr :=
  bands reducedUnionChunk139Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
