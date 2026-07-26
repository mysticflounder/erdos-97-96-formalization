import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk160Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 151, bvar 157]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 152, bvar 153]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 152, bvar 155]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 152, bvar 156]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 152, bvar 157]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 153, bvar 155]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 153, bvar 156]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 153, bvar 157]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 155, bvar 156]) (bveq ((.var 1621 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 155, bvar 157]) (bveq ((.var 1621 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 156, bvar 157]) (bveq ((.var 1622 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 158, bvar 159]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 158, bvar 160]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1579 : BVExpr 7))),
    bimplies (bands [bvar 158, bvar 161]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 158, bvar 162]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 158, bvar 163]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 158, bvar 164]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 158, bvar 165]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 158, bvar 166]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 158, bvar 167]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 158, bvar 169]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 158, bvar 170]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 159, bvar 161]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 159, bvar 162]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 159, bvar 163]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 159, bvar 164]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 159, bvar 165]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 159, bvar 166]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 159, bvar 167]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 159, bvar 169]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 159, bvar 170]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 160, bvar 161]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 160, bvar 162]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 160, bvar 163]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 160, bvar 164]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 160, bvar 165]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 160, bvar 166]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 160, bvar 167]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 160, bvar 169]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 160, bvar 170]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 161, bvar 162]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 161, bvar 163]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 161, bvar 164]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 161, bvar 165]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 161, bvar 166]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 161, bvar 167]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 161, bvar 169]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 161, bvar 170]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 162, bvar 163]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 162, bvar 164]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 162, bvar 165]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 162, bvar 166]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 162, bvar 167]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 162, bvar 169]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 162, bvar 170]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 163, bvar 164]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 163, bvar 165]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 163, bvar 166]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 163, bvar 167]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 163, bvar 169]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 163, bvar 170]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 164, bvar 165]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 164, bvar 166]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 164, bvar 167]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1621 : BVExpr 7))) ]

def reducedUnionChunk160 : BVLogicalExpr :=
  bands reducedUnionChunk160Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
