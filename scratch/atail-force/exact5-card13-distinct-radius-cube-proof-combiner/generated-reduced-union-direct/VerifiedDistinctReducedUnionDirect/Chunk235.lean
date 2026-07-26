import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk235Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1605 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1605 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1574 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1606 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1606 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1576 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1607 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1607 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1608 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1608 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1609 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1609 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1610 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1610 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1611 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1611 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1575 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bveq ((.var 1590 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1613 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1572 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1572 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1588 : BVExpr 7))) ]

def reducedUnionChunk235 : BVLogicalExpr :=
  bands reducedUnionChunk235Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
