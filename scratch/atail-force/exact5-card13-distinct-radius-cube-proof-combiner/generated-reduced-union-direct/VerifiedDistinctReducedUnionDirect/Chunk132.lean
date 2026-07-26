import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk132Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1, bvar 12, bvar 601, bvar 612]),
    bnot (bands [bvar 2, bvar 6, bvar 602, bvar 606]),
    bnot (bands [bvar 2, bvar 7, bvar 602, bvar 607]),
    bnot (bands [bvar 2, bvar 8, bvar 602, bvar 608]),
    bnot (bands [bvar 2, bvar 9, bvar 602, bvar 609]),
    bnot (bands [bvar 2, bvar 10, bvar 602, bvar 610]),
    bnot (bands [bvar 2, bvar 11, bvar 602, bvar 611]),
    bnot (bands [bvar 2, bvar 12, bvar 602, bvar 612]),
    bnot (bands [bvar 3, bvar 6, bvar 603, bvar 606]),
    bnot (bands [bvar 3, bvar 7, bvar 603, bvar 607]),
    bnot (bands [bvar 3, bvar 8, bvar 603, bvar 608]),
    bnot (bands [bvar 3, bvar 9, bvar 603, bvar 609]),
    bnot (bands [bvar 3, bvar 10, bvar 603, bvar 610]),
    bnot (bands [bvar 3, bvar 11, bvar 603, bvar 611]),
    bnot (bands [bvar 3, bvar 12, bvar 603, bvar 612]),
    bnot (bands [bvar 6, bvar 7, bvar 606, bvar 607]),
    bnot (bands [bvar 6, bvar 9, bvar 606, bvar 609]),
    bnot (bands [bvar 6, bvar 10, bvar 606, bvar 610]),
    bnot (bands [bvar 6, bvar 11, bvar 606, bvar 611]),
    bnot (bands [bvar 6, bvar 12, bvar 606, bvar 612]),
    bnot (bands [bvar 7, bvar 8, bvar 607, bvar 608]),
    bnot (bands [bvar 7, bvar 9, bvar 607, bvar 609]),
    bnot (bands [bvar 7, bvar 10, bvar 607, bvar 610]),
    bnot (bands [bvar 7, bvar 11, bvar 607, bvar 611]),
    bnot (bands [bvar 7, bvar 12, bvar 607, bvar 612]),
    bnot (bands [bvar 8, bvar 9, bvar 608, bvar 609]),
    bnot (bands [bvar 8, bvar 10, bvar 608, bvar 610]),
    bnot (bands [bvar 8, bvar 11, bvar 608, bvar 611]),
    bnot (bands [bvar 8, bvar 12, bvar 608, bvar 612]),
    bnot (bands [bvar 9, bvar 10, bvar 609, bvar 610]),
    bnot (bands [bvar 9, bvar 11, bvar 609, bvar 611]),
    bnot (bands [bvar 9, bvar 12, bvar 609, bvar 612]),
    bnot (bands [bvar 10, bvar 11, bvar 610, bvar 611]),
    bnot (bands [bvar 10, bvar 12, bvar 610, bvar 612]),
    bnot (bands [bvar 11, bvar 12, bvar 611, bvar 612]),
    bnot (bands [bvar 0, bvar 7, bvar 613, bvar 620]),
    bnot (bands [bvar 0, bvar 9, bvar 613, bvar 622]),
    bnot (bands [bvar 0, bvar 10, bvar 613, bvar 623]),
    bnot (bands [bvar 0, bvar 11, bvar 613, bvar 624]),
    bnot (bands [bvar 0, bvar 12, bvar 613, bvar 625]),
    bnot (bands [bvar 1, bvar 10, bvar 614, bvar 623]),
    bnot (bands [bvar 1, bvar 12, bvar 614, bvar 625]),
    bnot (bands [bvar 2, bvar 9, bvar 615, bvar 622]),
    bnot (bands [bvar 2, bvar 10, bvar 615, bvar 623]),
    bnot (bands [bvar 2, bvar 11, bvar 615, bvar 624]),
    bnot (bands [bvar 2, bvar 12, bvar 615, bvar 625]),
    bnot (bands [bvar 3, bvar 7, bvar 616, bvar 620]),
    bnot (bands [bvar 3, bvar 8, bvar 616, bvar 621]),
    bnot (bands [bvar 3, bvar 9, bvar 616, bvar 622]),
    bnot (bands [bvar 3, bvar 10, bvar 616, bvar 623]),
    bnot (bands [bvar 3, bvar 11, bvar 616, bvar 624]),
    bnot (bands [bvar 3, bvar 12, bvar 616, bvar 625]),
    bnot (bands [bvar 7, bvar 9, bvar 620, bvar 622]),
    bnot (bands [bvar 7, bvar 10, bvar 620, bvar 623]),
    bnot (bands [bvar 7, bvar 11, bvar 620, bvar 624]),
    bnot (bands [bvar 7, bvar 12, bvar 620, bvar 625]),
    bnot (bands [bvar 8, bvar 10, bvar 621, bvar 623]),
    bnot (bands [bvar 8, bvar 11, bvar 621, bvar 624]),
    bnot (bands [bvar 8, bvar 12, bvar 621, bvar 625]),
    bnot (bands [bvar 9, bvar 10, bvar 622, bvar 623]),
    bnot (bands [bvar 9, bvar 11, bvar 622, bvar 624]),
    bnot (bands [bvar 9, bvar 12, bvar 622, bvar 625]),
    bnot (bands [bvar 10, bvar 11, bvar 623, bvar 624]),
    bnot (bands [bvar 10, bvar 12, bvar 623, bvar 625]) ]

def reducedUnionChunk132 : BVLogicalExpr :=
  bands reducedUnionChunk132Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
