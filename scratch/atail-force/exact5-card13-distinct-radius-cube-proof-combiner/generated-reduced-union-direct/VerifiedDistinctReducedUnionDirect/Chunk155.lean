import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk155Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 83, bvar 91]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 83, bvar 92]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 85, bvar 86]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 85, bvar 87]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 85, bvar 89]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 85, bvar 90]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 85, bvar 91]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 85, bvar 92]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 86, bvar 87]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 86, bvar 89]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 86, bvar 90]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 86, bvar 91]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 86, bvar 92]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 87, bvar 88]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 87, bvar 89]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 87, bvar 90]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 87, bvar 91]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 87, bvar 92]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 88, bvar 89]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 88, bvar 90]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 88, bvar 91]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 88, bvar 92]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 89, bvar 90]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 89, bvar 91]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 90, bvar 92]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 91, bvar 92]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 94]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1564 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 95]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1574 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 96]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 97]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 99]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 100]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 101]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 102]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 103]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 104]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 93, bvar 105]) (bveq ((.var 1553 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 96]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 97]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 99]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 100]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 101]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 102]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 103]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 104]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 94, bvar 105]) (bveq ((.var 1564 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 95, bvar 96]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1583 : BVExpr 7))),
    bimplies (bands [bvar 95, bvar 97]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 95, bvar 99]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 95, bvar 100]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 95, bvar 101]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 95, bvar 102]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 95, bvar 103]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 95, bvar 104]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 95, bvar 105]) (bveq ((.var 1574 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 96, bvar 97]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 96, bvar 99]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 96, bvar 100]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 96, bvar 101]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 96, bvar 102]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 96, bvar 103]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 96, bvar 104]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 96, bvar 105]) (bveq ((.var 1583 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 97, bvar 99]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1599 : BVExpr 7))) ]

def reducedUnionChunk155 : BVLogicalExpr :=
  bands reducedUnionChunk155Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
