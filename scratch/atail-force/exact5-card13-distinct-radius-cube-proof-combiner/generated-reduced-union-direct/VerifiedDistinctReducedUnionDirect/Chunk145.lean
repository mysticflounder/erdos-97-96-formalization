import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk145Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1114, bvar 1115]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 1114, bvar 1116]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 1114, bvar 1117]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 1114, bvar 1118]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 1114, bvar 1119]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 1115, bvar 1116]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 1115, bvar 1117]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 1115, bvar 1118]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 1115, bvar 1119]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 1116, bvar 1117]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 1116, bvar 1118]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 1116, bvar 1119]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 1117, bvar 1118]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 1117, bvar 1119]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 1118, bvar 1119]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 1120, bvar 1121]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 1120, bvar 1122]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bands [bvar 1120, bvar 1123]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 1120, bvar 1124]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 1120, bvar 1125]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 1120, bvar 1127]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1120, bvar 1128]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1120, bvar 1129]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1120, bvar 1130]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1120, bvar 1131]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1120, bvar 1132]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1121, bvar 1122]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bands [bvar 1121, bvar 1123]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 1121, bvar 1124]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 1121, bvar 1125]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 1121, bvar 1127]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1121, bvar 1128]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1121, bvar 1129]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1121, bvar 1130]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1121, bvar 1131]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1121, bvar 1132]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1122, bvar 1123]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 1122, bvar 1124]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 1122, bvar 1125]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 1122, bvar 1127]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1122, bvar 1128]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1122, bvar 1129]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1122, bvar 1130]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1122, bvar 1131]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1122, bvar 1132]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1124]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1125]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1127]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1128]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1129]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1130]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1131]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1123, bvar 1132]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1125]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1127]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1128]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1129]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1130]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1131]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 1124, bvar 1132]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1125, bvar 1127]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 1125, bvar 1128]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1125, bvar 1129]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 1125, bvar 1130]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1609 : BVExpr 7))) ]

def reducedUnionChunk145 : BVLogicalExpr :=
  bands reducedUnionChunk145Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
