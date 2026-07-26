import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk200Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1559 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1559 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1558 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1550 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1550 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1559 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1560 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1560 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1553 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1553 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1592 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1592 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1554 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1584 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1554 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1593 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1593 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1555 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1555 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1594 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1594 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1556 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1556 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1595 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1595 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1557 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1557 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1551 : BVExpr 7))) (bvult ((.var 1596 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1596 : BVExpr 7))) (bvult ((.var 1551 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1558 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1552 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1558 : BVExpr 7)) ((.var 1588 : BVExpr 7))) ]

def reducedUnionChunk200 : BVLogicalExpr :=
  bands reducedUnionChunk200Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
