import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk165Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 108, bvar 113]) (bveq ((.var 1575 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
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
    bimplies (bands [bvar 109, bvar 118]) (bveq ((.var 1584 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 110, bvar 111]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1599 : BVExpr 7))),
    bimplies (bands [bvar 110, bvar 113]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 110, bvar 114]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 110, bvar 115]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 110, bvar 116]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 110, bvar 117]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 110, bvar 118]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 111, bvar 113]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 111, bvar 114]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 111, bvar 115]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 111, bvar 116]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 111, bvar 117]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 111, bvar 118]) (bveq ((.var 1599 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 113, bvar 114]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 113, bvar 115]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 113, bvar 116]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 113, bvar 117]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 113, bvar 118]) (bveq ((.var 1606 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 114, bvar 115]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1608 : BVExpr 7))),
    bimplies (bands [bvar 114, bvar 116]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 114, bvar 117]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 114, bvar 118]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 115, bvar 116]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1609 : BVExpr 7))),
    bimplies (bands [bvar 115, bvar 117]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 115, bvar 118]) (bveq ((.var 1608 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 116, bvar 117]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1610 : BVExpr 7))),
    bimplies (bands [bvar 116, bvar 118]) (bveq ((.var 1609 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 117, bvar 118]) (bveq ((.var 1610 : BVExpr 7)) ((.var 1611 : BVExpr 7))),
    bimplies (bands [bvar 119, bvar 120]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1566 : BVExpr 7))),
    bimplies (bands [bvar 119, bvar 121]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1576 : BVExpr 7))),
    bimplies (bands [bvar 119, bvar 122]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 119, bvar 123]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 119, bvar 124]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 119, bvar 125]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 119, bvar 127]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 119, bvar 128]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 119, bvar 129]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 119, bvar 130]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 119, bvar 131]) (bveq ((.var 1555 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 120, bvar 122]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 120, bvar 123]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1593 : BVExpr 7))),
    bimplies (bands [bvar 120, bvar 124]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1600 : BVExpr 7))),
    bimplies (bands [bvar 120, bvar 125]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1606 : BVExpr 7))),
    bimplies (bands [bvar 120, bvar 127]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 120, bvar 128]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1613 : BVExpr 7))),
    bimplies (bands [bvar 120, bvar 129]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1614 : BVExpr 7))),
    bimplies (bands [bvar 120, bvar 130]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1615 : BVExpr 7))),
    bimplies (bands [bvar 120, bvar 131]) (bveq ((.var 1566 : BVExpr 7)) ((.var 1616 : BVExpr 7))),
    bimplies (bands [bvar 121, bvar 122]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1585 : BVExpr 7))),
    bimplies (bands [bvar 121, bvar 123]) (bveq ((.var 1576 : BVExpr 7)) ((.var 1593 : BVExpr 7))) ]

def reducedUnionChunk165 : BVLogicalExpr :=
  bands reducedUnionChunk165Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
