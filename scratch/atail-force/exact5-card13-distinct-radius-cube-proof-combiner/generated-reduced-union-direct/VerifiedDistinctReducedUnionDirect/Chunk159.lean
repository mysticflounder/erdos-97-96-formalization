import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk159Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 139, bvar 141]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 139, bvar 142]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 139, bvar 143]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 139, bvar 144]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 141, bvar 142]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 141, bvar 143]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 141, bvar 144]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 142, bvar 143]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 142, bvar 144]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 143, bvar 144]) (bveq ((.var 1619 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 145, bvar 146]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 145, bvar 147]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bands [bvar 145, bvar 148]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 145, bvar 149]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 145, bvar 150]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 145, bvar 151]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 145, bvar 152]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 145, bvar 153]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 145, bvar 155]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 145, bvar 156]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 145, bvar 157]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 146, bvar 148]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 146, bvar 149]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 146, bvar 150]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 146, bvar 151]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 146, bvar 152]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 146, bvar 153]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 146, bvar 155]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 146, bvar 156]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 146, bvar 157]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 147, bvar 148]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 147, bvar 149]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 147, bvar 150]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 147, bvar 151]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 147, bvar 152]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 147, bvar 153]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 147, bvar 155]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 147, bvar 156]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 147, bvar 157]) (bveq ((.var 1578 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 148, bvar 149]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 148, bvar 150]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 148, bvar 151]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 148, bvar 152]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 148, bvar 153]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 148, bvar 155]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 148, bvar 156]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 148, bvar 157]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 149, bvar 150]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 149, bvar 151]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 149, bvar 152]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 149, bvar 153]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 149, bvar 155]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 149, bvar 156]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 149, bvar 157]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 150, bvar 151]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 150, bvar 152]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 150, bvar 153]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 150, bvar 155]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 150, bvar 156]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 150, bvar 157]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 151, bvar 152]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 151, bvar 153]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 151, bvar 155]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 151, bvar 156]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1622 : BVExpr 7))) ]

def reducedUnionChunk159 : BVLogicalExpr :=
  bands reducedUnionChunk159Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
