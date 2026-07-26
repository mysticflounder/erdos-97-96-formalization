import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk137Assertions : List BVLogicalExpr :=
  [ bors [bands [bveq ((.var 26 : BVExpr 4)) ((.const 9#4)), bvar 1103], bands [bveq ((.var 26 : BVExpr 4)) ((.const 10#4)), bvar 1104], bands [bveq ((.var 26 : BVExpr 4)) ((.const 11#4)), bvar 1105], bands [bveq ((.var 26 : BVExpr 4)) ((.const 12#4)), bvar 1106], bands [bveq ((.var 27 : BVExpr 4)) ((.const 9#4)), bvar 1103], bands [bveq ((.var 27 : BVExpr 4)) ((.const 10#4)), bvar 1104], bands [bveq ((.var 27 : BVExpr 4)) ((.const 11#4)), bvar 1105], bands [bveq ((.var 27 : BVExpr 4)) ((.const 12#4)), bvar 1106]],
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
    bnot (bands [bvar 1105, bvar 11]),
    bnot (bands [bvar 1106, bvar 12]),
    exactly [bvar 1103, bvar 1104, bvar 1105, bvar 1106] 2,
    exactly [bvar 9, bvar 10, bvar 11, bvar 12] 2,
    bors [bvar 1103, bvar 9],
    bors [bvar 1104, bvar 10],
    bors [bvar 1105, bvar 11],
    bors [bvar 1106, bvar 12],
    bimplies (bors [bands [bvar 1627, bvar 1094], bands [bvar 1628, bvar 1095], bands [bvar 1629, bvar 1096], bands [bvar 1630, bvar 1097], bands [bvar 1631, bvar 1098], bands [bvar 1632, bvar 1099], bands [bvar 1633, bvar 1100], bands [bvar 1634, bvar 1101], bands [bvar 1635, bvar 1102], bands [bvar 1636, bvar 1103], bands [bvar 1637, bvar 1104], bands [bvar 1638, bvar 1105], bands [bvar 1639, bvar 1106]]) (bands [bbeq (bvar 1627) (bvar 1094), bbeq (bvar 1628) (bvar 1095), bbeq (bvar 1629) (bvar 1096), bbeq (bvar 1630) (bvar 1097), bbeq (bvar 1631) (bvar 1098), bbeq (bvar 1632) (bvar 1099), bbeq (bvar 1633) (bvar 1100), bbeq (bvar 1634) (bvar 1101), bbeq (bvar 1635) (bvar 1102), bbeq (bvar 1636) (bvar 1103), bbeq (bvar 1637) (bvar 1104), bbeq (bvar 1638) (bvar 1105), bbeq (bvar 1639) (bvar 1106)]),
    bnot (bands [bvar 1634, bvar 1637, bvar 1049, bvar 1052]),
    bnot (bands [bvar 1632, bvar 1637, bvar 33, bvar 38]),
    bnot (bands [bvar 1632, bvar 1639, bvar 33, bvar 40]),
    bnot (bands [bvar 1633, bvar 1636, bvar 34, bvar 37]),
    bnot (bands [bvar 1633, bvar 1638, bvar 34, bvar 39]),
    bnot (bands [bvar 1633, bvar 1639, bvar 34, bvar 40]),
    bnot (bands [bvar 1634, bvar 1636, bvar 35, bvar 37]),
    bnot (bands [bvar 1634, bvar 1637, bvar 35, bvar 38]),
    bnot (bands [bvar 1634, bvar 1639, bvar 35, bvar 40]),
    bnot (bands [bvar 1637, bvar 1638, bvar 38, bvar 39]),
    bnot (bands [bvar 1637, bvar 1638, bvar 545, bvar 546]),
    bnot (bands [bvar 1628, bvar 1637, bvar 562, bvar 571]),
    bnot (bands [bvar 1628, bvar 1638, bvar 562, bvar 572]),
    bnot (bands [bvar 1628, bvar 1639, bvar 562, bvar 573]),
    bnot (bands [bvar 1633, bvar 1638, bvar 567, bvar 572]),
    bnot (bands [bvar 1633, bvar 1639, bvar 567, bvar 573]),
    bnot (bands [bvar 1634, bvar 1638, bvar 568, bvar 572]),
    bnot (bands [bvar 1630, bvar 1636, bvar 96, bvar 102]),
    bnot (bands [bvar 1627, bvar 1639, bvar 600, bvar 612]),
    bnot (bands [bvar 1629, bvar 1634, bvar 602, bvar 607]),
    bnot (bands [bvar 1629, bvar 1636, bvar 602, bvar 609]),
    bnot (bands [bvar 1629, bvar 1637, bvar 602, bvar 610]),
    bnot (bands [bvar 1629, bvar 1638, bvar 602, bvar 611]),
    bnot (bands [bvar 1629, bvar 1639, bvar 602, bvar 612]),
    bnot (bands [bvar 1630, bvar 1634, bvar 603, bvar 607]),
    bnot (bands [bvar 1630, bvar 1635, bvar 603, bvar 608]),
    bnot (bands [bvar 1630, bvar 1636, bvar 603, bvar 609]),
    bnot (bands [bvar 1630, bvar 1637, bvar 603, bvar 610]),
    bnot (bands [bvar 1630, bvar 1638, bvar 603, bvar 611]),
    bnot (bands [bvar 1630, bvar 1639, bvar 603, bvar 612]),
    bnot (bands [bvar 1634, bvar 1636, bvar 607, bvar 609]),
    bnot (bands [bvar 1634, bvar 1637, bvar 607, bvar 610]),
    bnot (bands [bvar 1634, bvar 1638, bvar 607, bvar 611]),
    bnot (bands [bvar 1634, bvar 1639, bvar 607, bvar 612]),
    bnot (bands [bvar 1635, bvar 1637, bvar 608, bvar 610]),
    bnot (bands [bvar 1635, bvar 1638, bvar 608, bvar 611]),
    bnot (bands [bvar 1635, bvar 1639, bvar 608, bvar 612]),
    bnot (bands [bvar 1636, bvar 1638, bvar 609, bvar 611]),
    bnot (bands [bvar 1637, bvar 1638, bvar 610, bvar 611]),
    bnot (bands [bvar 1637, bvar 1639, bvar 610, bvar 612]),
    bnot (bands [bvar 1638, bvar 1639, bvar 611, bvar 612]),
    bnot (bands [bvar 1630, bvar 1638, bvar 616, bvar 624]),
    bnot (bands [bvar 1637, bvar 1638, bvar 623, bvar 624]),
    bnot (bands [bvar 1630, bvar 1638, bvar 135, bvar 143]) ]

def reducedUnionChunk137 : BVLogicalExpr :=
  bands reducedUnionChunk137Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
