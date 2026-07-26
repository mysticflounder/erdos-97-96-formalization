import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk253Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1586 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1588 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1588 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1587 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1589 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1589 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1588 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1603 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1603 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1583 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1583 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1589 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1590 : BVExpr 7))) (bvult ((.var 1604 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1604 : BVExpr 7))) (bvult ((.var 1590 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bveq ((.var 1585 : BVExpr 7)) ((.var 1612 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bveq ((.var 1607 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1612 : BVExpr 7)) ((.var 1585 : BVExpr 7))) ]

def reducedUnionChunk253 : BVLogicalExpr :=
  bands reducedUnionChunk253Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
