import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk186Assertions : List BVLogicalExpr :=
  [ bimplies (bnot (bbeq (bvar 1097) (bvar 1101))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1593 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1097) (bvar 1102))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1097) (bvar 1103))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1097) (bvar 1104))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1097) (bvar 1105))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1097) (bvar 1106))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1099) (bvar 1100))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1099) (bvar 1101))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1593 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1099) (bvar 1102))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1099) (bvar 1103))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1099) (bvar 1104))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1099) (bvar 1105))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1099) (bvar 1106))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1100) (bvar 1101))) (bands [bnot (bveq ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1100) (bvar 1102))) (bands [bnot (bveq ((.var 1592 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1100) (bvar 1103))) (bands [bnot (bveq ((.var 1592 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1100) (bvar 1104))) (bands [bnot (bveq ((.var 1592 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1100) (bvar 1105))) (bands [bnot (bveq ((.var 1592 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1100) (bvar 1106))) (bands [bnot (bveq ((.var 1592 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1101) (bvar 1102))) (bands [bnot (bveq ((.var 1593 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1101) (bvar 1103))) (bands [bnot (bveq ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1101) (bvar 1104))) (bands [bnot (bveq ((.var 1593 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1101) (bvar 1105))) (bands [bnot (bveq ((.var 1593 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1101) (bvar 1106))) (bands [bnot (bveq ((.var 1593 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1102) (bvar 1103))) (bands [bnot (bveq ((.var 1594 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1102) (bvar 1104))) (bands [bnot (bveq ((.var 1594 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1102) (bvar 1105))) (bands [bnot (bveq ((.var 1594 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1102) (bvar 1106))) (bands [bnot (bveq ((.var 1594 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1103) (bvar 1104))) (bands [bnot (bveq ((.var 1595 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1103) (bvar 1105))) (bands [bnot (bveq ((.var 1595 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1103) (bvar 1106))) (bands [bnot (bveq ((.var 1595 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1104) (bvar 1105))) (bands [bnot (bveq ((.var 1596 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1104) (bvar 1106))) (bands [bnot (bveq ((.var 1596 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1105) (bvar 1106))) (bands [bnot (bveq ((.var 1597 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 0) (bvar 1))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1563 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 0) (bvar 2))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1573 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 0) (bvar 3))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1582 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 0) (bvar 5))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1591 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 0) (bvar 6))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1592 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 0) (bvar 7))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1593 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 0) (bvar 8))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 0) (bvar 9))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 0) (bvar 10))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 0) (bvar 11))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 0) (bvar 12))) (bands [bnot (bveq ((.var 1552 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1) (bvar 2))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1573 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1) (bvar 3))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1582 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1) (bvar 5))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1591 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1) (bvar 6))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1592 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1) (bvar 7))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1593 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1) (bvar 8))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1) (bvar 9))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1) (bvar 10))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1) (bvar 11))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1) (bvar 12))) (bands [bnot (bveq ((.var 1563 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 2) (bvar 3))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1582 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 2) (bvar 5))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1591 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 2) (bvar 6))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1592 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 2) (bvar 7))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1593 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 2) (bvar 8))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 2) (bvar 9))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 2) (bvar 10))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 2) (bvar 11))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 2) (bvar 12))) (bands [bnot (bveq ((.var 1573 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]) ]

def reducedUnionChunk186 : BVLogicalExpr :=
  bands reducedUnionChunk186Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
