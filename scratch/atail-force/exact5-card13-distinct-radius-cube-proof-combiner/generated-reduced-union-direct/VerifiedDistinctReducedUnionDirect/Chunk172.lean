import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk172Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 666, bvar 673]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 666, bvar 674]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 666, bvar 676]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 666, bvar 677]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 667, bvar 669]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 667, bvar 670]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 667, bvar 671]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 667, bvar 672]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 667, bvar 673]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 667, bvar 674]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 667, bvar 676]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 667, bvar 677]) (bveq ((.var 1579 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 668, bvar 669]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 668, bvar 670]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 668, bvar 671]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 668, bvar 672]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 668, bvar 673]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 668, bvar 674]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 668, bvar 676]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 668, bvar 677]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 669, bvar 670]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 669, bvar 671]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 669, bvar 672]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 669, bvar 673]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 669, bvar 674]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 669, bvar 676]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 669, bvar 677]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 670, bvar 671]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 670, bvar 672]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 670, bvar 673]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 670, bvar 674]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 670, bvar 676]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 670, bvar 677]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 671, bvar 672]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 671, bvar 673]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 671, bvar 674]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 671, bvar 676]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 671, bvar 677]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 672, bvar 673]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 672, bvar 674]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 672, bvar 676]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 672, bvar 677]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 673, bvar 674]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 673, bvar 676]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 673, bvar 677]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 674, bvar 676]) (bveq ((.var 1621 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 674, bvar 677]) (bveq ((.var 1621 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 676, bvar 677]) (bveq ((.var 1624 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 678, bvar 679]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 678, bvar 680]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bands [bvar 678, bvar 681]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 678, bvar 682]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 678, bvar 683]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 678, bvar 684]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 678, bvar 685]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 678, bvar 686]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 678, bvar 687]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 678, bvar 688]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1624 : BVExpr 7))),
    bimplies (bands [bvar 678, bvar 690]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 679, bvar 680]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1580 : BVExpr 7))),
    bimplies (bands [bvar 679, bvar 681]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 679, bvar 682]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 679, bvar 683]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 679, bvar 684]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1610 : BVExpr 7))) ]

def reducedUnionChunk172 : BVLogicalExpr :=
  bands reducedUnionChunk172Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
