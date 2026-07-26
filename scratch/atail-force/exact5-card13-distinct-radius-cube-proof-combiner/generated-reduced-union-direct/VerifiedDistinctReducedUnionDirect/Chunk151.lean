import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk151Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1202, bvar 1204]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1202, bvar 1205]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1202, bvar 1206]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1202, bvar 1207]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1202, bvar 1208]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1202, bvar 1209]) (bveq ((.var 1598 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1203, bvar 1204]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 1203, bvar 1205]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1203, bvar 1206]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1203, bvar 1207]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1203, bvar 1208]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1203, bvar 1209]) (bveq ((.var 1605 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1204, bvar 1205]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 1204, bvar 1206]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1204, bvar 1207]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1204, bvar 1208]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1204, bvar 1209]) (bveq ((.var 1611 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1205, bvar 1206]) (bveq ((.var 1616 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1205, bvar 1207]) (bveq ((.var 1616 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1205, bvar 1208]) (bveq ((.var 1616 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1205, bvar 1209]) (bveq ((.var 1616 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1206, bvar 1207]) (bveq ((.var 1620 : BVExpr 7)) ((.var 1623 : BVExpr 7))),
    bimplies (bands [bvar 1206, bvar 1208]) (bveq ((.var 1620 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1206, bvar 1209]) (bveq ((.var 1620 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1207, bvar 1208]) (bveq ((.var 1623 : BVExpr 7)) ((.var 1625 : BVExpr 7))),
    bimplies (bands [bvar 1207, bvar 1209]) (bveq ((.var 1623 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 1208, bvar 1209]) (bveq ((.var 1625 : BVExpr 7)) ((.var 1626 : BVExpr 7))),
    bimplies (bands [bvar 29, bvar 31]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bands [bvar 29, bvar 32]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bands [bvar 29, bvar 33]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bands [bvar 29, bvar 34]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bands [bvar 29, bvar 35]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 29, bvar 36]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 29, bvar 37]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 29, bvar 38]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 29, bvar 39]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 29, bvar 40]) (bveq ((.var 1549 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 30, bvar 31]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1551 : BVExpr 7))),
    bimplies (bands [bvar 30, bvar 32]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bands [bvar 30, bvar 33]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bands [bvar 30, bvar 34]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bands [bvar 30, bvar 35]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 30, bvar 36]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 30, bvar 37]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 30, bvar 38]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 30, bvar 39]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 30, bvar 40]) (bveq ((.var 1550 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 31, bvar 32]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1552 : BVExpr 7))),
    bimplies (bands [bvar 31, bvar 33]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bands [bvar 31, bvar 34]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bands [bvar 31, bvar 35]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 31, bvar 36]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 31, bvar 37]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 31, bvar 38]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 31, bvar 39]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 31, bvar 40]) (bveq ((.var 1551 : BVExpr 7)) ((.var 1560 : BVExpr 7))),
    bimplies (bands [bvar 32, bvar 33]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1553 : BVExpr 7))),
    bimplies (bands [bvar 32, bvar 34]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1554 : BVExpr 7))),
    bimplies (bands [bvar 32, bvar 35]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1555 : BVExpr 7))),
    bimplies (bands [bvar 32, bvar 36]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1556 : BVExpr 7))),
    bimplies (bands [bvar 32, bvar 37]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1557 : BVExpr 7))),
    bimplies (bands [bvar 32, bvar 38]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1558 : BVExpr 7))),
    bimplies (bands [bvar 32, bvar 39]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1559 : BVExpr 7))),
    bimplies (bands [bvar 32, bvar 40]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1560 : BVExpr 7))) ]

def reducedUnionChunk151 : BVLogicalExpr :=
  bands reducedUnionChunk151Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
