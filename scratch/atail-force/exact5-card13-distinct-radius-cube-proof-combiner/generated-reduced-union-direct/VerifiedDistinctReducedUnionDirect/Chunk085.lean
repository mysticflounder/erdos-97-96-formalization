import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk085Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1101, bvar 1103, bvar 620, bvar 622]),
    bnot (bands [bvar 1101, bvar 1104, bvar 620, bvar 623]),
    bnot (bands [bvar 1101, bvar 1105, bvar 620, bvar 624]),
    bnot (bands [bvar 1101, bvar 1106, bvar 620, bvar 625]),
    bnot (bands [bvar 1102, bvar 1103, bvar 621, bvar 622]),
    bnot (bands [bvar 1102, bvar 1104, bvar 621, bvar 623]),
    bnot (bands [bvar 1102, bvar 1105, bvar 621, bvar 624]),
    bnot (bands [bvar 1102, bvar 1106, bvar 621, bvar 625]),
    bnot (bands [bvar 1103, bvar 1105, bvar 622, bvar 624]),
    bnot (bands [bvar 1103, bvar 1106, bvar 622, bvar 625]),
    bnot (bands [bvar 1104, bvar 1105, bvar 623, bvar 624]),
    bnot (bands [bvar 1104, bvar 1106, bvar 623, bvar 625]),
    bnot (bands [bvar 1105, bvar 1106, bvar 624, bvar 625]),
    bnot (bands [bvar 1094, bvar 1104, bvar 626, bvar 636]),
    bnot (bands [bvar 1094, bvar 1106, bvar 626, bvar 638]),
    bnot (bands [bvar 1102, bvar 1105, bvar 634, bvar 637]),
    bnot (bands [bvar 1103, bvar 1106, bvar 635, bvar 638]),
    bnot (bands [bvar 1104, bvar 1106, bvar 636, bvar 638]),
    bnot (bands [bvar 1105, bvar 1106, bvar 637, bvar 638]),
    bnot (bands [bvar 1094, bvar 1095, bvar 639, bvar 640]),
    bnot (bands [bvar 1095, bvar 1103, bvar 640, bvar 648]),
    bnot (bands [bvar 1095, bvar 1104, bvar 640, bvar 649]),
    bnot (bands [bvar 1095, bvar 1105, bvar 640, bvar 650]),
    bnot (bands [bvar 1095, bvar 1106, bvar 640, bvar 651]),
    bnot (bands [bvar 1097, bvar 1103, bvar 642, bvar 648]),
    bnot (bands [bvar 1097, bvar 1104, bvar 642, bvar 649]),
    bnot (bands [bvar 1103, bvar 1104, bvar 648, bvar 649]),
    bnot (bands [bvar 1103, bvar 1105, bvar 648, bvar 650]),
    bnot (bands [bvar 1103, bvar 1106, bvar 648, bvar 651]),
    bnot (bands [bvar 1104, bvar 1106, bvar 649, bvar 651]),
    bnot (bands [bvar 1094, bvar 1095, bvar 652, bvar 653]),
    bnot (bands [bvar 1094, bvar 1096, bvar 652, bvar 654]),
    bnot (bands [bvar 1094, bvar 1104, bvar 652, bvar 662]),
    bnot (bands [bvar 1094, bvar 1106, bvar 652, bvar 664]),
    bnot (bands [bvar 1095, bvar 1104, bvar 653, bvar 662]),
    bnot (bands [bvar 1095, bvar 1105, bvar 653, bvar 663]),
    bnot (bands [bvar 1095, bvar 1106, bvar 653, bvar 664]),
    bnot (bands [bvar 1096, bvar 1104, bvar 654, bvar 662]),
    bnot (bands [bvar 1096, bvar 1105, bvar 654, bvar 663]),
    bnot (bands [bvar 1096, bvar 1106, bvar 654, bvar 664]),
    bnot (bands [bvar 1097, bvar 1106, bvar 655, bvar 664]),
    bnot (bands [bvar 1104, bvar 1106, bvar 662, bvar 664]),
    bnot (bands [bvar 1094, bvar 1105, bvar 665, bvar 676]),
    bnot (bands [bvar 1094, bvar 1106, bvar 665, bvar 677]),
    bnot (bands [bvar 1095, bvar 1105, bvar 666, bvar 676]),
    bnot (bands [bvar 1095, bvar 1106, bvar 666, bvar 677]),
    bnot (bands [bvar 1096, bvar 1105, bvar 667, bvar 676]),
    bnot (bands [bvar 1096, bvar 1106, bvar 667, bvar 677]),
    bnot (bands [bvar 1097, bvar 1105, bvar 668, bvar 676]),
    bnot (bands [bvar 1097, bvar 1106, bvar 668, bvar 677]),
    bnot (bands [bvar 1099, bvar 1102, bvar 670, bvar 673]),
    bnot (bands [bvar 1099, bvar 1103, bvar 670, bvar 674]),
    bnot (bands [bvar 1100, bvar 1103, bvar 671, bvar 674]),
    bnot (bands [bvar 1101, bvar 1102, bvar 672, bvar 673]),
    bnot (bands [bvar 1101, bvar 1103, bvar 672, bvar 674]),
    bnot (bands [bvar 1102, bvar 1103, bvar 673, bvar 674]),
    bnot (bands [bvar 1105, bvar 1106, bvar 676, bvar 677]),
    bnot (bands [bvar 1096, bvar 1106, bvar 680, bvar 690]),
    bnot (bands [bvar 1097, bvar 1106, bvar 681, bvar 690]),
    bnot (bands [bvar 1099, bvar 1103, bvar 683, bvar 687]),
    bnot (bands [bvar 1100, bvar 1104, bvar 684, bvar 688]),
    bnot (bands [bvar 1101, bvar 1103, bvar 685, bvar 687]),
    bnot (bands [bvar 1101, bvar 1104, bvar 685, bvar 688]),
    bnot (bands [bvar 1102, bvar 1103, bvar 686, bvar 687]) ]

def reducedUnionChunk085 : BVLogicalExpr :=
  bands reducedUnionChunk085Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
