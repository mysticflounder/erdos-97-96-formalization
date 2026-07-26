import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk143Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1088, bvar 1093]) (bveq ((.var 1585 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1089, bvar 1090]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1587 : BVExpr 7))),
    bimplies (bands [bvar 1089, bvar 1091]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 1089, bvar 1092]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 1089, bvar 1093]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1090, bvar 1091]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1588 : BVExpr 7))),
    bimplies (bands [bvar 1090, bvar 1092]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 1090, bvar 1093]) (bveq ((.var 1587 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1091, bvar 1092]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1589 : BVExpr 7))),
    bimplies (bands [bvar 1091, bvar 1093]) (bveq ((.var 1588 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1092, bvar 1093]) (bveq ((.var 1589 : BVExpr 7)) ((.var 1590 : BVExpr 7))),
    bimplies (bands [bvar 1094, bvar 1095]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bands [bvar 1094, bvar 1096]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bands [bvar 1094, bvar 1097]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 1094, bvar 1099]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 1094, bvar 1100]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 1094, bvar 1101]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 1094, bvar 1102]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 1094, bvar 1103]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1094, bvar 1104]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1094, bvar 1105]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1094, bvar 1106]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1095, bvar 1096]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bands [bvar 1095, bvar 1097]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 1095, bvar 1099]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 1095, bvar 1100]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 1095, bvar 1101]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 1095, bvar 1102]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 1095, bvar 1103]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1095, bvar 1104]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1095, bvar 1105]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1095, bvar 1106]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1096, bvar 1097]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 1096, bvar 1099]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 1096, bvar 1100]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 1096, bvar 1101]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 1096, bvar 1102]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 1096, bvar 1103]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1096, bvar 1104]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1096, bvar 1105]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1096, bvar 1106]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1097, bvar 1099]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 1097, bvar 1100]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 1097, bvar 1101]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 1097, bvar 1102]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 1097, bvar 1103]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1097, bvar 1104]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1097, bvar 1105]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1097, bvar 1106]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1099, bvar 1100]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 1099, bvar 1101]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 1099, bvar 1102]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 1099, bvar 1103]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1099, bvar 1104]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1099, bvar 1105]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1099, bvar 1106]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1100, bvar 1101]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 1100, bvar 1102]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 1100, bvar 1103]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1100, bvar 1104]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1100, bvar 1105]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1100, bvar 1106]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1101, bvar 1102]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 1101, bvar 1103]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7))) ]

def reducedUnionChunk143 : BVLogicalExpr :=
  bands reducedUnionChunk143Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
