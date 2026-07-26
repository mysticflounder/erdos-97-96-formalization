import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk203Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bveq ((.var 1573 : BVExpr 7)) ((.var 1552 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1586 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1586 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1587 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1587 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1551 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1573 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1573 : BVExpr 7)) ((.var 1575 : BVExpr 7))) ]

def reducedUnionChunk203 : BVLogicalExpr :=
  bands reducedUnionChunk203Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
