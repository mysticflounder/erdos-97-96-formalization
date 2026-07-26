import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk187Assertions : List BVLogicalExpr :=
  [ bimplies (bnot (bbeq (bvar 3) (bvar 5))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1591 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 3) (bvar 7))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1593 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 3) (bvar 8))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 3) (bvar 9))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 3) (bvar 10))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 3) (bvar 11))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 3) (bvar 12))) (bands [bnot (bveq ((.var 1582 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 5) (bvar 6))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1592 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 5) (bvar 7))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1593 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 5) (bvar 8))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 5) (bvar 9))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 5) (bvar 10))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 5) (bvar 11))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 5) (bvar 12))) (bands [bnot (bveq ((.var 1591 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 6) (bvar 7))) (bands [bnot (bveq ((.var 1592 : BVExpr 7)) ((.var 1593 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 6) (bvar 8))) (bands [bnot (bveq ((.var 1592 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 6) (bvar 9))) (bands [bnot (bveq ((.var 1592 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 6) (bvar 10))) (bands [bnot (bveq ((.var 1592 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 6) (bvar 11))) (bands [bnot (bveq ((.var 1592 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 6) (bvar 12))) (bands [bnot (bveq ((.var 1592 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 7) (bvar 8))) (bands [bnot (bveq ((.var 1593 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 7) (bvar 9))) (bands [bnot (bveq ((.var 1593 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 7) (bvar 10))) (bands [bnot (bveq ((.var 1593 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 7) (bvar 11))) (bands [bnot (bveq ((.var 1593 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 7) (bvar 12))) (bands [bnot (bveq ((.var 1593 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 8) (bvar 9))) (bands [bnot (bveq ((.var 1594 : BVExpr 7)) ((.var 1595 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 8) (bvar 10))) (bands [bnot (bveq ((.var 1594 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 8) (bvar 11))) (bands [bnot (bveq ((.var 1594 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 8) (bvar 12))) (bands [bnot (bveq ((.var 1594 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 9) (bvar 10))) (bands [bnot (bveq ((.var 1595 : BVExpr 7)) ((.var 1596 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 9) (bvar 11))) (bands [bnot (bveq ((.var 1595 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 9) (bvar 12))) (bands [bnot (bveq ((.var 1595 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 10) (bvar 11))) (bands [bnot (bveq ((.var 1596 : BVExpr 7)) ((.var 1597 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 10) (bvar 12))) (bands [bnot (bveq ((.var 1596 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 11) (bvar 12))) (bands [bnot (bveq ((.var 1597 : BVExpr 7)) ((.var 1598 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1653) (bvar 1654))) (bands [bnot (bveq ((.var 1556 : BVExpr 7)) ((.var 1567 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1653) (bvar 1655))) (bands [bnot (bveq ((.var 1556 : BVExpr 7)) ((.var 1577 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1653) (bvar 1656))) (bands [bnot (bveq ((.var 1556 : BVExpr 7)) ((.var 1586 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1653) (bvar 1657))) (bands [bnot (bveq ((.var 1556 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1653) (bvar 1658))) (bands [bnot (bveq ((.var 1556 : BVExpr 7)) ((.var 1601 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1653) (bvar 1659))) (bands [bnot (bveq ((.var 1556 : BVExpr 7)) ((.var 1607 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1653) (bvar 1660))) (bands [bnot (bveq ((.var 1556 : BVExpr 7)) ((.var 1612 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1653) (bvar 1662))) (bands [bnot (bveq ((.var 1556 : BVExpr 7)) ((.var 1617 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1653) (bvar 1663))) (bands [bnot (bveq ((.var 1556 : BVExpr 7)) ((.var 1618 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1653) (bvar 1664))) (bands [bnot (bveq ((.var 1556 : BVExpr 7)) ((.var 1619 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1653) (bvar 1665))) (bands [bnot (bveq ((.var 1556 : BVExpr 7)) ((.var 1620 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1654) (bvar 1657))) (bands [bnot (bveq ((.var 1567 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1654) (bvar 1658))) (bands [bnot (bveq ((.var 1567 : BVExpr 7)) ((.var 1601 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1654) (bvar 1659))) (bands [bnot (bveq ((.var 1567 : BVExpr 7)) ((.var 1607 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1654) (bvar 1660))) (bands [bnot (bveq ((.var 1567 : BVExpr 7)) ((.var 1612 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1654) (bvar 1662))) (bands [bnot (bveq ((.var 1567 : BVExpr 7)) ((.var 1617 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1654) (bvar 1663))) (bands [bnot (bveq ((.var 1567 : BVExpr 7)) ((.var 1618 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1654) (bvar 1664))) (bands [bnot (bveq ((.var 1567 : BVExpr 7)) ((.var 1619 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1654) (bvar 1665))) (bands [bnot (bveq ((.var 1567 : BVExpr 7)) ((.var 1620 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1655) (bvar 1657))) (bands [bnot (bveq ((.var 1577 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1655) (bvar 1658))) (bands [bnot (bveq ((.var 1577 : BVExpr 7)) ((.var 1601 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1655) (bvar 1659))) (bands [bnot (bveq ((.var 1577 : BVExpr 7)) ((.var 1607 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1655) (bvar 1660))) (bands [bnot (bveq ((.var 1577 : BVExpr 7)) ((.var 1612 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1655) (bvar 1662))) (bands [bnot (bveq ((.var 1577 : BVExpr 7)) ((.var 1617 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1655) (bvar 1663))) (bands [bnot (bveq ((.var 1577 : BVExpr 7)) ((.var 1618 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1655) (bvar 1664))) (bands [bnot (bveq ((.var 1577 : BVExpr 7)) ((.var 1619 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1655) (bvar 1665))) (bands [bnot (bveq ((.var 1577 : BVExpr 7)) ((.var 1620 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1656) (bvar 1657))) (bands [bnot (bveq ((.var 1586 : BVExpr 7)) ((.var 1594 : BVExpr 7)))]),
    bimplies (bnot (bbeq (bvar 1656) (bvar 1658))) (bands [bnot (bveq ((.var 1586 : BVExpr 7)) ((.var 1601 : BVExpr 7)))]) ]

def reducedUnionChunk187 : BVLogicalExpr :=
  bands reducedUnionChunk187Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
