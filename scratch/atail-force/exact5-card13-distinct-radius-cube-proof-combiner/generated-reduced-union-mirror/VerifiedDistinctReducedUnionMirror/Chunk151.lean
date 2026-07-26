import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk151Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1059, bvar 1066]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
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
    bimplies (bands [bvar 1063, bvar 1065]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 1063, bvar 1066]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 1063, bvar 1067]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 1064, bvar 1065]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1569 : BVExpr 7))),
    bimplies (bands [bvar 1064, bvar 1066]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 1064, bvar 1067]) (bveq ((.var 1568 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 1065, bvar 1066]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
    bimplies (bands [bvar 1065, bvar 1067]) (bveq ((.var 1569 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 1066, bvar 1067]) (bveq ((.var 1570 : BVExpr 7)) ((.var 1571 : BVExpr 7))),
    bimplies (bands [bvar 1069, bvar 1071]) (bveq ((.var 1561 : BVExpr 7)) ((.var 1572 : BVExpr 7))),
    bimplies (bands [bvar 1081, bvar 1082]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1562 : BVExpr 7))),
    bimplies (bands [bvar 1081, bvar 1083]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1572 : BVExpr 7))),
    bimplies (bands [bvar 1081, bvar 1085]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 1081, bvar 1086]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 1081, bvar 1087]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 1081, bvar 1088]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 1081, bvar 1089]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 1081, bvar 1090]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 1081, bvar 1091]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 1081, bvar 1092]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 1081, bvar 1093]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1082, bvar 1083]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1572 : BVExpr 7))),
    bimplies (bands [bvar 1082, bvar 1085]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 1082, bvar 1086]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 1082, bvar 1087]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 1082, bvar 1088]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 1082, bvar 1089]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 1082, bvar 1090]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 1082, bvar 1091]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 1082, bvar 1092]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 1082, bvar 1093]) (bveq ((.var 1562 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1083, bvar 1085]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 1083, bvar 1086]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 1083, bvar 1087]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 1083, bvar 1088]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 1083, bvar 1089]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 1083, bvar 1090]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 1083, bvar 1091]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 1083, bvar 1092]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 1083, bvar 1093]) (bveq ((.var 1572 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1085, bvar 1086]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 1085, bvar 1087]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 1085, bvar 1088]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1585 : BVExpr 7))) ]

def reducedUnionChunk151 : BVLogicalExpr :=
  bands reducedUnionChunk151Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
