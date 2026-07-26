import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk141Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1051, bvar 1052]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 1051, bvar 1053]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 1051, bvar 1054]) (bveq ((.var 1557 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 1052, bvar 1053]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 1052, bvar 1054]) (bveq ((.var 1558 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 1053, bvar 1054]) (bveq ((.var 1559 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 1055, bvar 1057]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1561 : BVExpr 7))),
    bimplies (bands [bvar 1055, bvar 1058]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bands [bvar 1055, bvar 1059]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bands [bvar 1055, bvar 1060]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 1055, bvar 1061]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 1055, bvar 1062]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 1055, bvar 1063]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 1055, bvar 1064]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 1055, bvar 1065]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 1055, bvar 1066]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 1055, bvar 1067]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 1057, bvar 1058]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bands [bvar 1057, bvar 1059]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bands [bvar 1057, bvar 1060]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 1057, bvar 1061]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 1057, bvar 1062]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 1057, bvar 1063]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 1057, bvar 1064]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 1057, bvar 1065]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 1057, bvar 1066]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 1057, bvar 1067]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 1058, bvar 1059]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bands [bvar 1058, bvar 1060]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 1058, bvar 1061]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 1058, bvar 1062]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 1058, bvar 1063]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 1058, bvar 1064]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 1058, bvar 1065]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 1058, bvar 1066]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 1058, bvar 1067]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 1059, bvar 1060]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 1059, bvar 1061]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 1059, bvar 1062]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 1059, bvar 1063]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 1059, bvar 1064]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 1059, bvar 1065]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 1059, bvar 1066]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 1059, bvar 1067]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 1060, bvar 1061]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 1060, bvar 1062]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 1060, bvar 1063]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 1060, bvar 1064]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 1060, bvar 1065]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 1060, bvar 1066]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 1060, bvar 1067]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 1061, bvar 1062]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 1061, bvar 1063]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 1061, bvar 1064]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 1061, bvar 1065]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 1061, bvar 1066]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 1061, bvar 1067]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 1062, bvar 1063]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1567 : BVExpr 7))),
    bimplies (bands [bvar 1062, bvar 1064]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 1062, bvar 1065]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 1062, bvar 1066]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 1062, bvar 1067]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 1063, bvar 1064]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1568 : BVExpr 7))),
    bimplies (bands [bvar 1063, bvar 1065]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1569 : BVExpr 7))) ]

def reducedUnionChunk141 : BVLogicalExpr :=
  bands reducedUnionChunk141Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
