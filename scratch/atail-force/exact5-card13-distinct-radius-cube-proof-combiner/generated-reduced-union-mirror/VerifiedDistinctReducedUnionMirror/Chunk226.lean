import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk226Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1613 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1576 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1614 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1614 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1576 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1615 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1576 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1566 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1576 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1576 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1568 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1568 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1570 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1567 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1581 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1571 : BVExpr 7))) (bvult ((.var 1577 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1581 : BVExpr 7)) ((.var 1577 : BVExpr 7))) (bvult ((.var 1571 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1569 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1579 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1569 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1561 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1580 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1561 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bveq ((.var 1568 : BVExpr 7)) ((.var 1570 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1580 : BVExpr 7))) ]

def reducedUnionChunk226 : BVLogicalExpr :=
  bands reducedUnionChunk226Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
