import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk242Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1615 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1616 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1616 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1576 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1600 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1600 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1617 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1617 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1578 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1602 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1578 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1618 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1618 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1619 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1619 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1620 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1620 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1577 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1581 : BVExpr 7))) (bvult ((.var 1601 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1601 : BVExpr 7))) (bvult ((.var 1581 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1621 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1621 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1579 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1603 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1579 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1622 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1622 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1580 : BVExpr 7))) (bvult ((.var 1602 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1604 : BVExpr 7)) ((.var 1602 : BVExpr 7))) (bvult ((.var 1580 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1578 : BVExpr 7)) ((.var 1623 : BVExpr 7))) (bvult ((.var 1574 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bveq ((.var 1605 : BVExpr 7)) ((.var 1574 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1578 : BVExpr 7))) ]

def reducedUnionChunk242 : BVLogicalExpr :=
  bands reducedUnionChunk242Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
