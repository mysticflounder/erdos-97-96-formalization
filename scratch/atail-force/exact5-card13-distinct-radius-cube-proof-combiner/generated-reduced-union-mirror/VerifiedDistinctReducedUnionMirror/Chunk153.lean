import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk153Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1097, bvar 1100]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
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
    bimplies (bands [bvar 1101, bvar 1103]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1101, bvar 1104]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1101, bvar 1105]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1101, bvar 1106]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1102, bvar 1103]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1102, bvar 1104]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1102, bvar 1105]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1102, bvar 1106]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1103, bvar 1104]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1103, bvar 1105]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1103, bvar 1106]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1104, bvar 1105]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1104, bvar 1106]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1105, bvar 1106]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1107, bvar 1108]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 1107, bvar 1109]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bands [bvar 1107, bvar 1110]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 1107, bvar 1111]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 1107, bvar 1113]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 1107, bvar 1114]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 1107, bvar 1115]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 1107, bvar 1116]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 1107, bvar 1117]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 1107, bvar 1118]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 1107, bvar 1119]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 1108, bvar 1109]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bands [bvar 1108, bvar 1110]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 1108, bvar 1111]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 1108, bvar 1113]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 1108, bvar 1114]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 1108, bvar 1115]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 1108, bvar 1116]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 1108, bvar 1117]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 1108, bvar 1118]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 1108, bvar 1119]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 1109, bvar 1110]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 1109, bvar 1111]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 1109, bvar 1113]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 1109, bvar 1114]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 1109, bvar 1115]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 1109, bvar 1116]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 1109, bvar 1117]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 1109, bvar 1118]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1604 : BVExpr 7))) ]

def reducedUnionChunk153 : BVLogicalExpr :=
  bands reducedUnionChunk153Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
