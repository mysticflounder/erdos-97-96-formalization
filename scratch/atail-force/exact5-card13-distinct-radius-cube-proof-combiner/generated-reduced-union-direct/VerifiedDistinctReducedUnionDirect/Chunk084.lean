import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk084Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1094, bvar 1102, bvar 600, bvar 608]),
    bnot (bands [bvar 1094, bvar 1103, bvar 600, bvar 609]),
    bnot (bands [bvar 1094, bvar 1104, bvar 600, bvar 610]),
    bnot (bands [bvar 1094, bvar 1105, bvar 600, bvar 611]),
    bnot (bands [bvar 1094, bvar 1106, bvar 600, bvar 612]),
    bnot (bands [bvar 1095, bvar 1100, bvar 601, bvar 606]),
    bnot (bands [bvar 1095, bvar 1101, bvar 601, bvar 607]),
    bnot (bands [bvar 1095, bvar 1102, bvar 601, bvar 608]),
    bnot (bands [bvar 1095, bvar 1103, bvar 601, bvar 609]),
    bnot (bands [bvar 1095, bvar 1104, bvar 601, bvar 610]),
    bnot (bands [bvar 1095, bvar 1105, bvar 601, bvar 611]),
    bnot (bands [bvar 1095, bvar 1106, bvar 601, bvar 612]),
    bnot (bands [bvar 1096, bvar 1100, bvar 602, bvar 606]),
    bnot (bands [bvar 1096, bvar 1101, bvar 602, bvar 607]),
    bnot (bands [bvar 1096, bvar 1102, bvar 602, bvar 608]),
    bnot (bands [bvar 1096, bvar 1103, bvar 602, bvar 609]),
    bnot (bands [bvar 1096, bvar 1104, bvar 602, bvar 610]),
    bnot (bands [bvar 1096, bvar 1105, bvar 602, bvar 611]),
    bnot (bands [bvar 1096, bvar 1106, bvar 602, bvar 612]),
    bnot (bands [bvar 1097, bvar 1100, bvar 603, bvar 606]),
    bnot (bands [bvar 1097, bvar 1101, bvar 603, bvar 607]),
    bnot (bands [bvar 1097, bvar 1102, bvar 603, bvar 608]),
    bnot (bands [bvar 1097, bvar 1103, bvar 603, bvar 609]),
    bnot (bands [bvar 1097, bvar 1104, bvar 603, bvar 610]),
    bnot (bands [bvar 1097, bvar 1105, bvar 603, bvar 611]),
    bnot (bands [bvar 1097, bvar 1106, bvar 603, bvar 612]),
    bnot (bands [bvar 1100, bvar 1103, bvar 606, bvar 609]),
    bnot (bands [bvar 1100, bvar 1104, bvar 606, bvar 610]),
    bnot (bands [bvar 1100, bvar 1105, bvar 606, bvar 611]),
    bnot (bands [bvar 1100, bvar 1106, bvar 606, bvar 612]),
    bnot (bands [bvar 1101, bvar 1103, bvar 607, bvar 609]),
    bnot (bands [bvar 1101, bvar 1104, bvar 607, bvar 610]),
    bnot (bands [bvar 1101, bvar 1105, bvar 607, bvar 611]),
    bnot (bands [bvar 1101, bvar 1106, bvar 607, bvar 612]),
    bnot (bands [bvar 1102, bvar 1103, bvar 608, bvar 609]),
    bnot (bands [bvar 1102, bvar 1104, bvar 608, bvar 610]),
    bnot (bands [bvar 1102, bvar 1105, bvar 608, bvar 611]),
    bnot (bands [bvar 1102, bvar 1106, bvar 608, bvar 612]),
    bnot (bands [bvar 1103, bvar 1104, bvar 609, bvar 610]),
    bnot (bands [bvar 1103, bvar 1105, bvar 609, bvar 611]),
    bnot (bands [bvar 1103, bvar 1106, bvar 609, bvar 612]),
    bnot (bands [bvar 1104, bvar 1105, bvar 610, bvar 611]),
    bnot (bands [bvar 1104, bvar 1106, bvar 610, bvar 612]),
    bnot (bands [bvar 1105, bvar 1106, bvar 611, bvar 612]),
    bnot (bands [bvar 1094, bvar 1101, bvar 613, bvar 620]),
    bnot (bands [bvar 1094, bvar 1103, bvar 613, bvar 622]),
    bnot (bands [bvar 1094, bvar 1104, bvar 613, bvar 623]),
    bnot (bands [bvar 1094, bvar 1105, bvar 613, bvar 624]),
    bnot (bands [bvar 1094, bvar 1106, bvar 613, bvar 625]),
    bnot (bands [bvar 1095, bvar 1101, bvar 614, bvar 620]),
    bnot (bands [bvar 1095, bvar 1103, bvar 614, bvar 622]),
    bnot (bands [bvar 1095, bvar 1104, bvar 614, bvar 623]),
    bnot (bands [bvar 1095, bvar 1106, bvar 614, bvar 625]),
    bnot (bands [bvar 1096, bvar 1101, bvar 615, bvar 620]),
    bnot (bands [bvar 1096, bvar 1103, bvar 615, bvar 622]),
    bnot (bands [bvar 1096, bvar 1104, bvar 615, bvar 623]),
    bnot (bands [bvar 1096, bvar 1105, bvar 615, bvar 624]),
    bnot (bands [bvar 1096, bvar 1106, bvar 615, bvar 625]),
    bnot (bands [bvar 1097, bvar 1101, bvar 616, bvar 620]),
    bnot (bands [bvar 1097, bvar 1102, bvar 616, bvar 621]),
    bnot (bands [bvar 1097, bvar 1103, bvar 616, bvar 622]),
    bnot (bands [bvar 1097, bvar 1104, bvar 616, bvar 623]),
    bnot (bands [bvar 1097, bvar 1105, bvar 616, bvar 624]),
    bnot (bands [bvar 1097, bvar 1106, bvar 616, bvar 625]) ]

def reducedUnionChunk084 : BVLogicalExpr :=
  bands reducedUnionChunk084Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
