import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk156Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 97, bvar 100]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 97, bvar 101]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 97, bvar 102]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 97, bvar 103]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 97, bvar 104]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 97, bvar 105]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 99, bvar 100]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 99, bvar 101]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 99, bvar 102]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 99, bvar 103]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 99, bvar 104]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 99, bvar 105]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 100, bvar 101]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 100, bvar 102]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 100, bvar 103]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 100, bvar 104]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 100, bvar 105]) (bveq ((.var 1600 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 101, bvar 102]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1602 : BVExpr 7))),
    bimplies (bands [bvar 101, bvar 103]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 101, bvar 104]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 101, bvar 105]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 102, bvar 103]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1603 : BVExpr 7))),
    bimplies (bands [bvar 102, bvar 104]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 102, bvar 105]) (bveq ((.var 1602 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 103, bvar 104]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1604 : BVExpr 7))),
    bimplies (bands [bvar 103, bvar 105]) (bveq ((.var 1603 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 104, bvar 105]) (bveq ((.var 1604 : BVExpr 7)) ((.var 1605 : BVExpr 7))),
    bimplies (bands [bvar 106, bvar 107]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1565 : BVExpr 7))),
    bimplies (bands [bvar 106, bvar 108]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1575 : BVExpr 7))),
    bimplies (bands [bvar 106, bvar 109]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 106, bvar 110]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 106, bvar 111]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 106, bvar 113]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 106, bvar 114]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 106, bvar 115]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 106, bvar 116]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 106, bvar 117]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 106, bvar 118]) (bveq ((.var 1554 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 107, bvar 109]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 107, bvar 110]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 107, bvar 111]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 107, bvar 113]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 107, bvar 114]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 107, bvar 115]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 107, bvar 116]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 107, bvar 117]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 107, bvar 118]) (bveq ((.var 1565 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 108, bvar 109]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1584 : BVExpr 7))),
    bimplies (bands [bvar 108, bvar 110]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 108, bvar 111]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 108, bvar 113]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 108, bvar 114]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 108, bvar 115]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 108, bvar 116]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 108, bvar 117]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 108, bvar 118]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 109, bvar 110]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1592 : BVExpr 7))),
    bimplies (bands [bvar 109, bvar 111]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 109, bvar 113]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 109, bvar 114]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 109, bvar 115]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 109, bvar 116]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 109, bvar 117]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 109, bvar 118]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1611 : BVExpr 7))) ]

def reducedUnionChunk156 : BVLogicalExpr :=
  bands reducedUnionChunk156Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
