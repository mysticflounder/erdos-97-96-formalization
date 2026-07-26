import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk161Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 164, bvar 169]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 164, bvar 170]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 165, bvar 166]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 165, bvar 167]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 165, bvar 169]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 165, bvar 170]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 166, bvar 167]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 166, bvar 169]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 166, bvar 170]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 167, bvar 169]) (bveq ((.var 1621 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 167, bvar 170]) (bveq ((.var 1621 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 169, bvar 170]) (bveq ((.var 1624 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 171, bvar 172]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 171, bvar 173]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bands [bvar 171, bvar 174]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 171, bvar 175]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 171, bvar 176]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 171, bvar 177]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 171, bvar 178]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 171, bvar 179]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 171, bvar 180]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 171, bvar 181]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 171, bvar 183]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 172, bvar 174]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 172, bvar 175]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 172, bvar 176]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 172, bvar 177]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 172, bvar 178]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 172, bvar 179]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 172, bvar 180]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 172, bvar 181]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 172, bvar 183]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 173, bvar 174]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 173, bvar 175]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 173, bvar 176]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 173, bvar 177]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 173, bvar 178]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 173, bvar 179]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 173, bvar 180]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 173, bvar 181]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 173, bvar 183]) (bveq ((.var 1580 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 174, bvar 175]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 174, bvar 176]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 174, bvar 177]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 174, bvar 178]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 174, bvar 179]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 174, bvar 180]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 174, bvar 181]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 174, bvar 183]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 175, bvar 176]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 175, bvar 177]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 175, bvar 178]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 175, bvar 179]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 175, bvar 180]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 175, bvar 181]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 175, bvar 183]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 176, bvar 177]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 176, bvar 178]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 176, bvar 179]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 176, bvar 180]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 176, bvar 181]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 176, bvar 183]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 177, bvar 178]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 177, bvar 179]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1619 : BVExpr 7))) ]

def reducedUnionChunk161 : BVLogicalExpr :=
  bands reducedUnionChunk161Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
