import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk178Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 632, bvar 638]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 634, bvar 635]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 634, bvar 636]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 634, bvar 637]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 634, bvar 638]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 635, bvar 636]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 635, bvar 637]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 635, bvar 638]) (bveq ((.var 1613 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 636, bvar 637]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 636, bvar 638]) (bveq ((.var 1614 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 637, bvar 638]) (bveq ((.var 1615 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 639, bvar 640]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 639, bvar 643]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 639, bvar 644]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 639, bvar 645]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 639, bvar 646]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 639, bvar 648]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 639, bvar 649]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 639, bvar 650]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 639, bvar 651]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 640, bvar 643]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 640, bvar 645]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 640, bvar 646]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 640, bvar 648]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 640, bvar 649]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 640, bvar 650]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 640, bvar 651]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 643, bvar 645]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 643, bvar 646]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 643, bvar 648]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 643, bvar 649]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 643, bvar 650]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 643, bvar 651]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 644, bvar 648]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 644, bvar 649]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 644, bvar 650]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 644, bvar 651]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 645, bvar 646]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 645, bvar 648]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 645, bvar 649]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 645, bvar 650]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 645, bvar 651]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 646, bvar 649]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 646, bvar 650]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 646, bvar 651]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 648, bvar 649]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 648, bvar 650]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 648, bvar 651]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 649, bvar 650]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 649, bvar 651]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 650, bvar 651]) (bveq ((.var 1619 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 652, bvar 653]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 652, bvar 654]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bands [bvar 652, bvar 655]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 652, bvar 656]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 652, bvar 657]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 652, bvar 658]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 652, bvar 659]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 652, bvar 660]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 652, bvar 662]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1621 : BVExpr 7))),
    bimplies (bands [bvar 652, bvar 663]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1622 : BVExpr 7))),
    bimplies (bands [bvar 652, bvar 664]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 653, bvar 654]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1578 : BVExpr 7))),
    bimplies (bands [bvar 653, bvar 655]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1587 : BVExpr 7))) ]

def reducedUnionChunk178 : BVLogicalExpr :=
  bands reducedUnionChunk178Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
