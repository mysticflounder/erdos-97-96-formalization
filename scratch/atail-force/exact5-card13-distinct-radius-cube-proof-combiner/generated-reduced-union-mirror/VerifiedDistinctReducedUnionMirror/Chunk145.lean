import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk145Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 26 : BVExpr 4)) ((.const 11#4))) (bnot (bvar 11)),
    bimplies (bveq ((.var 27 : BVExpr 4)) ((.const 11#4))) (bnot (bvar 11)),
    bimplies (bveq ((.var 26 : BVExpr 4)) ((.const 12#4))) (bnot (bvar 12)),
    bimplies (bveq ((.var 27 : BVExpr 4)) ((.const 12#4))) (bnot (bvar 12)),
    atMost [bvar 4, bvar 5, bvar 6, bvar 7, bvar 8] 1,
    atMost [bvar 0, bvar 1, bvar 2, bvar 3, bvar 4] 1,
    bnot (bands [bvar 30, bvar 29]),
    bnot (bands [bvar 69, bvar 68]),
    bnot (bands [bvar 95, bvar 94]),
    bnot (bands [bvar 108, bvar 107]),
    bnot (bands [bvar 121, bvar 120]),
    bnot (bands [bvar 134, bvar 133]),
    bnot (bands [bvar 147, bvar 146]),
    bnot (bands [bvar 160, bvar 159]),
    bnot (bands [bvar 173, bvar 172]),
    bnot (bands [bvar 186, bvar 185]),
    bnot (bands [bvar 537, bvar 538]),
    bnot (bands [bvar 550, bvar 551]),
    bnot (bands [bvar 602, bvar 603]),
    bnot (bands [bvar 615, bvar 616]),
    bnot (bands [bvar 628, bvar 629]),
    bnot (bands [bvar 641, bvar 642]),
    bnot (bands [bvar 654, bvar 655]),
    bnot (bands [bvar 667, bvar 668]),
    bnot (bands [bvar 680, bvar 681]),
    bnot (bands [bvar 693, bvar 694]),
    bveq ((.var 16 : BVExpr 4)) ((.const 2#4)),
    bvar 1071,
    bvar 1069,
    bnot (bvar 1068),
    bnot (bvar 1072),
    bnot (bors [bands [bveq ((.var 15 : BVExpr 4)) ((.const 0#4)), bvar 1043], bands [bveq ((.var 15 : BVExpr 4)) ((.const 1#4)), bvar 1056], bands [bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bvar 1069], bands [bveq ((.var 15 : BVExpr 4)) ((.const 3#4)), bvar 1082], bands [bveq ((.var 15 : BVExpr 4)) ((.const 4#4)), bvar 1095], bands [bveq ((.var 15 : BVExpr 4)) ((.const 5#4)), bvar 1108], bands [bveq ((.var 15 : BVExpr 4)) ((.const 6#4)), bvar 1121], bands [bveq ((.var 15 : BVExpr 4)) ((.const 7#4)), bvar 1134], bands [bveq ((.var 15 : BVExpr 4)) ((.const 8#4)), bvar 1147], bands [bveq ((.var 15 : BVExpr 4)) ((.const 9#4)), bvar 1160], bands [bveq ((.var 15 : BVExpr 4)) ((.const 10#4)), bvar 1173], bands [bveq ((.var 15 : BVExpr 4)) ((.const 11#4)), bvar 1186], bands [bveq ((.var 15 : BVExpr 4)) ((.const 12#4)), bvar 1199]]),
    bnot (bors [bands [bveq ((.var 15 : BVExpr 4)) ((.const 0#4)), bvar 1045], bands [bveq ((.var 15 : BVExpr 4)) ((.const 1#4)), bvar 1058], bands [bveq ((.var 15 : BVExpr 4)) ((.const 2#4)), bvar 1071], bands [bveq ((.var 15 : BVExpr 4)) ((.const 3#4)), bvar 1084], bands [bveq ((.var 15 : BVExpr 4)) ((.const 4#4)), bvar 1097], bands [bveq ((.var 15 : BVExpr 4)) ((.const 5#4)), bvar 1110], bands [bveq ((.var 15 : BVExpr 4)) ((.const 6#4)), bvar 1123], bands [bveq ((.var 15 : BVExpr 4)) ((.const 7#4)), bvar 1136], bands [bveq ((.var 15 : BVExpr 4)) ((.const 8#4)), bvar 1149], bands [bveq ((.var 15 : BVExpr 4)) ((.const 9#4)), bvar 1162], bands [bveq ((.var 15 : BVExpr 4)) ((.const 10#4)), bvar 1175], bands [bveq ((.var 15 : BVExpr 4)) ((.const 11#4)), bvar 1188], bands [bveq ((.var 15 : BVExpr 4)) ((.const 12#4)), bvar 1201]]),
    exactly [bvar 1627, bvar 1628, bvar 1629, bvar 1630, bvar 1631, bvar 1632, bvar 1633, bvar 1634, bvar 1635, bvar 1636, bvar 1637, bvar 1638, bvar 1639] 4,
    bnot (bvar 1631),
    exactly [bvar 1640, bvar 1641, bvar 1642, bvar 1643, bvar 1644, bvar 1645, bvar 1646, bvar 1647, bvar 1648, bvar 1649, bvar 1650, bvar 1651, bvar 1652] 4,
    bnot (bvar 1648),
    atLeast [bvar 1641, bvar 1642, bvar 1643] 2,
    bimplies (bvar 1640) (bvar 1653),
    bimplies (bvar 1644) (bvar 1657),
    bimplies (bvar 1645) (bvar 1658),
    bimplies (bvar 1646) (bvar 1659),
    bimplies (bvar 1647) (bvar 1660),
    bimplies (bvar 1649) (bvar 1662),
    bimplies (bvar 1650) (bvar 1663),
    bimplies (bvar 1651) (bvar 1664),
    bimplies (bvar 1652) (bvar 1665),
    atMost [bvar 1631, bvar 1632, bvar 1633, bvar 1634, bvar 1635] 1,
    atMost [bvar 1627, bvar 1628, bvar 1629, bvar 1630, bvar 1631] 1,
    atMost [bvar 1640, bvar 1648, bvar 1649, bvar 1650, bvar 1651, bvar 1652] 1,
    atLeast [bvar 1103, bvar 1104, bvar 1105, bvar 1106] 2,
    atLeast [bvar 9, bvar 10, bvar 11, bvar 12] 2,
    bors [bands [bveq ((.var 26 : BVExpr 4)) ((.const 9#4)), bvar 1103], bands [bveq ((.var 26 : BVExpr 4)) ((.const 10#4)), bvar 1104], bands [bveq ((.var 26 : BVExpr 4)) ((.const 11#4)), bvar 1105], bands [bveq ((.var 26 : BVExpr 4)) ((.const 12#4)), bvar 1106], bands [bveq ((.var 27 : BVExpr 4)) ((.const 9#4)), bvar 1103], bands [bveq ((.var 27 : BVExpr 4)) ((.const 10#4)), bvar 1104], bands [bveq ((.var 27 : BVExpr 4)) ((.const 11#4)), bvar 1105], bands [bveq ((.var 27 : BVExpr 4)) ((.const 12#4)), bvar 1106]],
    bnot (bands [bvar 1094, bvar 0]),
    bnot (bands [bvar 1095, bvar 1]),
    bnot (bands [bvar 1096, bvar 2]),
    bnot (bands [bvar 1097, bvar 3]),
    bnot (bands [bvar 1099, bvar 5]),
    bnot (bands [bvar 1100, bvar 6]),
    bnot (bands [bvar 1101, bvar 7]),
    bnot (bands [bvar 1102, bvar 8]),
    bnot (bands [bvar 1103, bvar 9]),
    bnot (bands [bvar 1104, bvar 10]),
    bnot (bands [bvar 1105, bvar 11]) ]

def reducedUnionChunk145 : BVLogicalExpr :=
  bands reducedUnionChunk145Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
