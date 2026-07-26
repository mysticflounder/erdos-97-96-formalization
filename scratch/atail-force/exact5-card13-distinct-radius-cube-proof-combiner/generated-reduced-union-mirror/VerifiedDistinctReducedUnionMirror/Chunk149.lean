import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk149Assertions : List BVLogicalExpr :=
  [ bvult ((.var 1601 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1602 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1603 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1604 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1605 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1606 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1607 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1608 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1609 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1610 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1611 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1612 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1613 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1614 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1615 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1616 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1617 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1618 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1619 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1620 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1621 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1622 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1623 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1624 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1625 : BVExpr 7)) ((.const 78#7)),
    bvult ((.var 1626 : BVExpr 7)) ((.const 78#7)),
    bimplies (bands [bvar 1043, bvar 1044]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1550 : BVExpr 7))),
    bimplies (bands [bvar 1043, bvar 1045]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bands [bvar 1043, bvar 1046]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bands [bvar 1043, bvar 1047]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bands [bvar 1043, bvar 1048]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bands [bvar 1043, bvar 1049]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 1043, bvar 1050]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 1043, bvar 1051]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 1043, bvar 1052]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 1043, bvar 1053]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 1043, bvar 1054]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 1044, bvar 1045]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bands [bvar 1044, bvar 1046]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bands [bvar 1044, bvar 1047]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bands [bvar 1044, bvar 1048]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bands [bvar 1044, bvar 1049]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 1044, bvar 1050]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 1044, bvar 1051]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 1044, bvar 1052]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 1044, bvar 1053]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 1044, bvar 1054]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 1045, bvar 1046]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bands [bvar 1045, bvar 1047]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bands [bvar 1045, bvar 1048]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bands [bvar 1045, bvar 1049]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 1045, bvar 1050]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 1045, bvar 1051]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 1045, bvar 1052]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 1045, bvar 1053]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 1045, bvar 1054]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 1046, bvar 1047]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bands [bvar 1046, bvar 1048]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bands [bvar 1046, bvar 1049]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 1046, bvar 1050]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 1046, bvar 1051]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 1046, bvar 1052]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 1046, bvar 1053]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 1046, bvar 1054]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1560 : BVExpr 7))) ]

def reducedUnionChunk149 : BVLogicalExpr :=
  bands reducedUnionChunk149Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
