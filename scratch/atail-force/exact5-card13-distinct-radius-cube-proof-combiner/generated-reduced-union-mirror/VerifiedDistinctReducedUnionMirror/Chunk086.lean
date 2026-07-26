import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk086Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1102, bvar 1103, bvar 673, bvar 674]),
    bnot (bands [bvar 1105, bvar 1106, bvar 676, bvar 677]),
    bnot (bands [bvar 1094, bvar 1095, bvar 678, bvar 679]),
    bnot (bands [bvar 1094, bvar 1097, bvar 678, bvar 681]),
    bnot (bands [bvar 1095, bvar 1106, bvar 679, bvar 690]),
    bnot (bands [bvar 1096, bvar 1106, bvar 680, bvar 690]),
    bnot (bands [bvar 1097, bvar 1106, bvar 681, bvar 690]),
    bnot (bands [bvar 1099, bvar 1102, bvar 683, bvar 686]),
    bnot (bands [bvar 1099, bvar 1103, bvar 683, bvar 687]),
    bnot (bands [bvar 1099, bvar 1104, bvar 683, bvar 688]),
    bnot (bands [bvar 1100, bvar 1101, bvar 684, bvar 685]),
    bnot (bands [bvar 1100, bvar 1102, bvar 684, bvar 686]),
    bnot (bands [bvar 1100, bvar 1103, bvar 684, bvar 687]),
    bnot (bands [bvar 1100, bvar 1104, bvar 684, bvar 688]),
    bnot (bands [bvar 1101, bvar 1102, bvar 685, bvar 686]),
    bnot (bands [bvar 1101, bvar 1103, bvar 685, bvar 687]),
    bnot (bands [bvar 1101, bvar 1104, bvar 685, bvar 688]),
    bnot (bands [bvar 1102, bvar 1103, bvar 686, bvar 687]),
    bnot (bands [bvar 1102, bvar 1104, bvar 686, bvar 688]),
    bnot (bands [bvar 1103, bvar 1104, bvar 687, bvar 688]),
    bnot (bands [bvar 1099, bvar 1103, bvar 696, bvar 700]),
    bnot (bands [bvar 1099, bvar 1105, bvar 696, bvar 702]),
    bnot (bands [bvar 1100, bvar 1103, bvar 697, bvar 700]),
    bnot (bands [bvar 1100, bvar 1104, bvar 697, bvar 701]),
    bnot (bands [bvar 1100, bvar 1105, bvar 697, bvar 702]),
    bnot (bands [bvar 1101, bvar 1103, bvar 698, bvar 700]),
    bnot (bands [bvar 1101, bvar 1104, bvar 698, bvar 701]),
    bnot (bands [bvar 1101, bvar 1105, bvar 698, bvar 702]),
    bnot (bands [bvar 1102, bvar 1103, bvar 699, bvar 700]),
    bnot (bands [bvar 1102, bvar 1105, bvar 699, bvar 702]),
    bnot (bands [bvar 1103, bvar 1104, bvar 700, bvar 701]),
    bnot (bands [bvar 1103, bvar 1105, bvar 700, bvar 702]),
    bnot (bands [bvar 1104, bvar 1105, bvar 701, bvar 702]),
    bnot (bands [bvar 1107, bvar 1114, bvar 613, bvar 620]),
    bnot (bands [bvar 1107, bvar 1117, bvar 613, bvar 623]),
    bnot (bands [bvar 1107, bvar 1118, bvar 613, bvar 624]),
    bnot (bands [bvar 1108, bvar 1111, bvar 614, bvar 617]),
    bnot (bands [bvar 1108, bvar 1114, bvar 614, bvar 620]),
    bnot (bands [bvar 1108, bvar 1115, bvar 614, bvar 621]),
    bnot (bands [bvar 1108, bvar 1117, bvar 614, bvar 623]),
    bnot (bands [bvar 1108, bvar 1118, bvar 614, bvar 624]),
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
    bnot (bands [bvar 1114, bvar 1115, bvar 620, bvar 621]),
    bnot (bands [bvar 1114, bvar 1116, bvar 620, bvar 622]),
    bnot (bands [bvar 1114, bvar 1117, bvar 620, bvar 623]),
    bnot (bands [bvar 1114, bvar 1118, bvar 620, bvar 624]),
    bnot (bands [bvar 1114, bvar 1119, bvar 620, bvar 625]),
    bnot (bands [bvar 1115, bvar 1116, bvar 621, bvar 622]),
    bnot (bands [bvar 1115, bvar 1117, bvar 621, bvar 623]),
    bnot (bands [bvar 1115, bvar 1118, bvar 621, bvar 624]),
    bnot (bands [bvar 1115, bvar 1119, bvar 621, bvar 625]),
    bnot (bands [bvar 1117, bvar 1118, bvar 623, bvar 624]) ]

def reducedUnionChunk086 : BVLogicalExpr :=
  bands reducedUnionChunk086Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
