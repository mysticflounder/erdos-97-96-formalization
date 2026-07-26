import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk184Assertions : List BVLogicalExpr :=
  [ bimplies (bands [bvar 1653, bvar 1662]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1653, bvar 1663]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1653, bvar 1664]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1653, bvar 1665]) (bveq ((.var 1556 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1654, bvar 1655]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1577 : BVExpr 7))),
    bimplies (bands [bvar 1654, bvar 1656]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 1654, bvar 1657]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 1654, bvar 1658]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 1654, bvar 1659]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1654, bvar 1660]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 1654, bvar 1662]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1654, bvar 1663]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1654, bvar 1664]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1654, bvar 1665]) (bveq ((.var 1567 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1655, bvar 1656]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1586 : BVExpr 7))),
    bimplies (bands [bvar 1655, bvar 1657]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 1655, bvar 1658]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 1655, bvar 1659]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1655, bvar 1660]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 1655, bvar 1662]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1655, bvar 1663]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1655, bvar 1664]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1655, bvar 1665]) (bveq ((.var 1577 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1656, bvar 1657]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1594 : BVExpr 7))),
    bimplies (bands [bvar 1656, bvar 1658]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1601 : BVExpr 7))),
    bimplies (bands [bvar 1656, bvar 1659]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1656, bvar 1660]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 1656, bvar 1662]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1656, bvar 1663]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1656, bvar 1664]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1656, bvar 1665]) (bveq ((.var 1586 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1657, bvar 1659]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1607 : BVExpr 7))),
    bimplies (bands [bvar 1657, bvar 1660]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 1657, bvar 1662]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1657, bvar 1663]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1657, bvar 1664]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1657, bvar 1665]) (bveq ((.var 1594 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1658, bvar 1662]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1658, bvar 1663]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1658, bvar 1664]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1658, bvar 1665]) (bveq ((.var 1601 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1659, bvar 1660]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1612 : BVExpr 7))),
    bimplies (bands [bvar 1659, bvar 1662]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1659, bvar 1663]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1659, bvar 1664]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1659, bvar 1665]) (bveq ((.var 1607 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1660, bvar 1662]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1617 : BVExpr 7))),
    bimplies (bands [bvar 1660, bvar 1663]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1660, bvar 1664]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1660, bvar 1665]) (bveq ((.var 1612 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1662, bvar 1663]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1618 : BVExpr 7))),
    bimplies (bands [bvar 1662, bvar 1664]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1662, bvar 1665]) (bveq ((.var 1617 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1663, bvar 1664]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1619 : BVExpr 7))),
    bimplies (bands [bvar 1663, bvar 1665]) (bveq ((.var 1618 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1664, bvar 1665]) (bveq ((.var 1619 : BVExpr 7)) ((.var 1620 : BVExpr 7))),
    bimplies (bands [bvar 1627, bvar 1628]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1563 : BVExpr 7))),
    bimplies (bands [bvar 1627, bvar 1636]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1595 : BVExpr 7))),
    bimplies (bands [bvar 1627, bvar 1637]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1596 : BVExpr 7))),
    bimplies (bands [bvar 1627, bvar 1639]) (bveq ((.var 1552 : BVExpr 7)) ((.var 1598 : BVExpr 7))),
    bimplies (bands [bvar 1628, bvar 1629]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1573 : BVExpr 7))),
    bimplies (bands [bvar 1628, bvar 1630]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1582 : BVExpr 7))),
    bimplies (bands [bvar 1628, bvar 1632]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1591 : BVExpr 7))),
    bimplies (bands [bvar 1628, bvar 1633]) (bveq ((.var 1563 : BVExpr 7)) ((.var 1592 : BVExpr 7))) ]

def reducedUnionChunk184 : BVLogicalExpr :=
  bands reducedUnionChunk184Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
