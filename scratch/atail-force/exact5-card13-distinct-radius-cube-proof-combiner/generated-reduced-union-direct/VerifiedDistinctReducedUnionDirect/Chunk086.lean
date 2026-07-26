import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk086Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1103, bvar 1104, bvar 687, bvar 688]),
    bnot (bands [bvar 1099, bvar 1102, bvar 696, bvar 699]),
    bnot (bands [bvar 1099, bvar 1103, bvar 696, bvar 700]),
    bnot (bands [bvar 1099, bvar 1104, bvar 696, bvar 701]),
    bnot (bands [bvar 1099, bvar 1105, bvar 696, bvar 702]),
    bnot (bands [bvar 1100, bvar 1102, bvar 697, bvar 699]),
    bnot (bands [bvar 1100, bvar 1103, bvar 697, bvar 700]),
    bnot (bands [bvar 1100, bvar 1104, bvar 697, bvar 701]),
    bnot (bands [bvar 1100, bvar 1105, bvar 697, bvar 702]),
    bnot (bands [bvar 1101, bvar 1102, bvar 698, bvar 699]),
    bnot (bands [bvar 1101, bvar 1103, bvar 698, bvar 700]),
    bnot (bands [bvar 1101, bvar 1104, bvar 698, bvar 701]),
    bnot (bands [bvar 1101, bvar 1105, bvar 698, bvar 702]),
    bnot (bands [bvar 1102, bvar 1103, bvar 699, bvar 700]),
    bnot (bands [bvar 1102, bvar 1104, bvar 699, bvar 701]),
    bnot (bands [bvar 1102, bvar 1105, bvar 699, bvar 702]),
    bnot (bands [bvar 1103, bvar 1104, bvar 700, bvar 701]),
    bnot (bands [bvar 1103, bvar 1105, bvar 700, bvar 702]),
    bnot (bands [bvar 1104, bvar 1105, bvar 701, bvar 702]),
    bnot (bands [bvar 1107, bvar 1117, bvar 613, bvar 623]),
    bnot (bands [bvar 1108, bvar 1111, bvar 614, bvar 617]),
    bnot (bands [bvar 1108, bvar 1114, bvar 614, bvar 620]),
    bnot (bands [bvar 1108, bvar 1116, bvar 614, bvar 622]),
    bnot (bands [bvar 1109, bvar 1111, bvar 615, bvar 617]),
    bnot (bands [bvar 1109, bvar 1116, bvar 615, bvar 622]),
    bnot (bands [bvar 1110, bvar 1111, bvar 616, bvar 617]),
    bnot (bands [bvar 1110, bvar 1114, bvar 616, bvar 620]),
    bnot (bands [bvar 1110, bvar 1115, bvar 616, bvar 621]),
    bnot (bands [bvar 1110, bvar 1116, bvar 616, bvar 622]),
    bnot (bands [bvar 1110, bvar 1117, bvar 616, bvar 623]),
    bnot (bands [bvar 1110, bvar 1118, bvar 616, bvar 624]),
    bnot (bands [bvar 1110, bvar 1119, bvar 616, bvar 625]),
    bnot (bands [bvar 1111, bvar 1114, bvar 617, bvar 620]),
    bnot (bands [bvar 1111, bvar 1115, bvar 617, bvar 621]),
    bnot (bands [bvar 1111, bvar 1116, bvar 617, bvar 622]),
    bnot (bands [bvar 1111, bvar 1117, bvar 617, bvar 623]),
    bnot (bands [bvar 1111, bvar 1118, bvar 617, bvar 624]),
    bnot (bands [bvar 1111, bvar 1119, bvar 617, bvar 625]),
    bnot (bands [bvar 1114, bvar 1116, bvar 620, bvar 622]),
    bnot (bands [bvar 1114, bvar 1117, bvar 620, bvar 623]),
    bnot (bands [bvar 1114, bvar 1118, bvar 620, bvar 624]),
    bnot (bands [bvar 1114, bvar 1119, bvar 620, bvar 625]),
    bnot (bands [bvar 1116, bvar 1118, bvar 622, bvar 624]),
    bnot (bands [bvar 1117, bvar 1118, bvar 623, bvar 624]),
    bnot (bands [bvar 1118, bvar 1119, bvar 624, bvar 625]),
    bnot (bands [bvar 600, bvar 612, bvar 1120, bvar 1132]),
    bnot (bands [bvar 601, bvar 610, bvar 1121, bvar 1130]),
    bnot (bands [bvar 603, bvar 604, bvar 1123, bvar 1124]),
    bnot (bands [bvar 603, bvar 607, bvar 1123, bvar 1127]),
    bnot (bands [bvar 603, bvar 608, bvar 1123, bvar 1128]),
    bnot (bands [bvar 603, bvar 610, bvar 1123, bvar 1130]),
    bnot (bands [bvar 603, bvar 611, bvar 1123, bvar 1131]),
    bnot (bands [bvar 603, bvar 612, bvar 1123, bvar 1132]),
    bnot (bands [bvar 604, bvar 607, bvar 1124, bvar 1127]),
    bnot (bands [bvar 604, bvar 608, bvar 1124, bvar 1128]),
    bnot (bands [bvar 604, bvar 610, bvar 1124, bvar 1130]),
    bnot (bands [bvar 604, bvar 611, bvar 1124, bvar 1131]),
    bnot (bands [bvar 604, bvar 612, bvar 1124, bvar 1132]),
    bnot (bands [bvar 607, bvar 608, bvar 1127, bvar 1128]),
    bnot (bands [bvar 607, bvar 610, bvar 1127, bvar 1130]),
    bnot (bands [bvar 607, bvar 611, bvar 1127, bvar 1131]),
    bnot (bands [bvar 607, bvar 612, bvar 1127, bvar 1132]),
    bnot (bands [bvar 608, bvar 610, bvar 1128, bvar 1130]),
    bnot (bands [bvar 608, bvar 611, bvar 1128, bvar 1131]) ]

def reducedUnionChunk086 : BVLogicalExpr :=
  bands reducedUnionChunk086Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
