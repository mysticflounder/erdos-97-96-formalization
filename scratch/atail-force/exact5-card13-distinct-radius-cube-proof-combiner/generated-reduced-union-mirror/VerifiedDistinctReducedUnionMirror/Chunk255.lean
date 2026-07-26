import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk255Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1619 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1619 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1620 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bveq ((.var 1622 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1622 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bveq ((.var 1622 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1622 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1625 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1625 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1623 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1626 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1626 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1624 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1599 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1599 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1584 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1592 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1584 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1582 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1593 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1582 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1585 : BVExpr 7))) (bvult ((.var 1591 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bveq ((.var 1583 : BVExpr 7)) ((.var 1591 : BVExpr 7))) (bvult ((.var 1585 : BVExpr 7)) ((.var 1593 : BVExpr 7))) ]

def reducedUnionChunk255 : BVLogicalExpr :=
  bands reducedUnionChunk255Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
