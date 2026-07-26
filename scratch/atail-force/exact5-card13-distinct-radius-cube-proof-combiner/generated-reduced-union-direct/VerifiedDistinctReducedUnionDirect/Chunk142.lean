import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk142Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1063, bvar 1066]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1570 : BVExpr 7))),
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
    bimplies (bands [bvar 1085, bvar 1088]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 1085, bvar 1089]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 1085, bvar 1090]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 1085, bvar 1091]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 1085, bvar 1092]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 1085, bvar 1093]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1086, bvar 1087]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 1086, bvar 1088]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 1086, bvar 1089]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 1086, bvar 1090]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 1086, bvar 1091]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 1086, bvar 1092]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 1086, bvar 1093]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1087, bvar 1088]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 1087, bvar 1089]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 1087, bvar 1090]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 1087, bvar 1091]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 1087, bvar 1092]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 1087, bvar 1093]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1088, bvar 1089]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 1088, bvar 1090]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 1088, bvar 1091]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 1088, bvar 1092]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1589 : BVExpr 7))) ]

def reducedUnionChunk142 : BVLogicalExpr :=
  bands reducedUnionChunk142Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
