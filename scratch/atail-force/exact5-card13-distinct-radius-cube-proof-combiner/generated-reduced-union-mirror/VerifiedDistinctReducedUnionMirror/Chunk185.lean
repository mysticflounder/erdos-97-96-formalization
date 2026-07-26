import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk185Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1628, bvar 1636]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1628, bvar 1637]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1628, bvar 1638]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1628, bvar 1639]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1629, bvar 1636]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1629, bvar 1637]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1629, bvar 1638]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1629, bvar 1639]) (bveq ((.var 1573 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1630, bvar 1636]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1630, bvar 1637]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1630, bvar 1638]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1630, bvar 1639]) (bveq ((.var 1582 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1632, bvar 1636]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1632, bvar 1637]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1632, bvar 1638]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1632, bvar 1639]) (bveq ((.var 1591 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1633, bvar 1636]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1633, bvar 1637]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1633, bvar 1638]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1633, bvar 1639]) (bveq ((.var 1592 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1634, bvar 1636]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1634, bvar 1637]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1634, bvar 1638]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1634, bvar 1639]) (bveq ((.var 1593 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1635, bvar 1636]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1635, bvar 1637]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1635, bvar 1638]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1635, bvar 1639]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1636, bvar 1637]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1636, bvar 1638]) (bveq ((.var 1595 : BVExpr 7)) ((.var 1597 : BVExpr 7))),
    bimplies (bands [bvar 1637, bvar 1639]) (bveq ((.var 1596 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1638, bvar 1639]) (bveq ((.var 1597 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bnot (bbeq (bvar 1094) (bvar 1095))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1563 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1094) (bvar 1096))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1094) (bvar 1097))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1582 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1094) (bvar 1099))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1591 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1094) (bvar 1100))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1592 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1094) (bvar 1101))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1593 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1094) (bvar 1102))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1094) (bvar 1103))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1094) (bvar 1104))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1094) (bvar 1105))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1094) (bvar 1106))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1095) (bvar 1096))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1573 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1095) (bvar 1097))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1582 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1095) (bvar 1099))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1591 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1095) (bvar 1100))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1592 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1095) (bvar 1101))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1593 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1095) (bvar 1102))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1095) (bvar 1103))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1095) (bvar 1104))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1095) (bvar 1105))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1095) (bvar 1106))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1096) (bvar 1097))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1582 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1096) (bvar 1099))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1591 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1096) (bvar 1100))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1592 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1096) (bvar 1101))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1593 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1096) (bvar 1102))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1096) (bvar 1103))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1096) (bvar 1104))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1096) (bvar 1105))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1096) (bvar 1106))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1097) (bvar 1099))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1591 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1097) (bvar 1100))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1592 : BVExpr 7)))]) ]

def reducedUnionChunk185 : BVLogicalExpr :=
  bands reducedUnionChunk185Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
