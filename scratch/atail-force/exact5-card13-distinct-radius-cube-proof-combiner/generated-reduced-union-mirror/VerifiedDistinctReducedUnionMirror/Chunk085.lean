import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk085Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1101, bvar 1104, bvar 620, bvar 623]),
    bnot (bands [bvar 1101, bvar 1105, bvar 620, bvar 624]),
    bnot (bands [bvar 1101, bvar 1106, bvar 620, bvar 625]),
    bnot (bands [bvar 1102, bvar 1103, bvar 621, bvar 622]),
    bnot (bands [bvar 1102, bvar 1104, bvar 621, bvar 623]),
    bnot (bands [bvar 1102, bvar 1105, bvar 621, bvar 624]),
    bnot (bands [bvar 1102, bvar 1106, bvar 621, bvar 625]),
    bnot (bands [bvar 1103, bvar 1104, bvar 622, bvar 623]),
    bnot (bands [bvar 1103, bvar 1105, bvar 622, bvar 624]),
    bnot (bands [bvar 1103, bvar 1106, bvar 622, bvar 625]),
    bnot (bands [bvar 1104, bvar 1105, bvar 623, bvar 624]),
    bnot (bands [bvar 1104, bvar 1106, bvar 623, bvar 625]),
    bnot (bands [bvar 1105, bvar 1106, bvar 624, bvar 625]),
    bnot (bands [bvar 1094, bvar 1104, bvar 626, bvar 636]),
    bnot (bands [bvar 1094, bvar 1105, bvar 626, bvar 637]),
    bnot (bands [bvar 1094, bvar 1106, bvar 626, bvar 638]),
    bnot (bands [bvar 1095, bvar 1103, bvar 627, bvar 635]),
    bnot (bands [bvar 1095, bvar 1105, bvar 627, bvar 637]),
    bnot (bands [bvar 1095, bvar 1106, bvar 627, bvar 638]),
    bnot (bands [bvar 1096, bvar 1103, bvar 628, bvar 635]),
    bnot (bands [bvar 1096, bvar 1104, bvar 628, bvar 636]),
    bnot (bands [bvar 1096, bvar 1105, bvar 628, bvar 637]),
    bnot (bands [bvar 1096, bvar 1106, bvar 628, bvar 638]),
    bnot (bands [bvar 1097, bvar 1103, bvar 629, bvar 635]),
    bnot (bands [bvar 1097, bvar 1104, bvar 629, bvar 636]),
    bnot (bands [bvar 1097, bvar 1105, bvar 629, bvar 637]),
    bnot (bands [bvar 1097, bvar 1106, bvar 629, bvar 638]),
    bnot (bands [bvar 1102, bvar 1103, bvar 634, bvar 635]),
    bnot (bands [bvar 1102, bvar 1104, bvar 634, bvar 636]),
    bnot (bands [bvar 1103, bvar 1104, bvar 635, bvar 636]),
    bnot (bands [bvar 1103, bvar 1105, bvar 635, bvar 637]),
    bnot (bands [bvar 1103, bvar 1106, bvar 635, bvar 638]),
    bnot (bands [bvar 1104, bvar 1105, bvar 636, bvar 637]),
    bnot (bands [bvar 1104, bvar 1106, bvar 636, bvar 638]),
    bnot (bands [bvar 1094, bvar 1095, bvar 639, bvar 640]),
    bnot (bands [bvar 1094, bvar 1103, bvar 639, bvar 648]),
    bnot (bands [bvar 1094, bvar 1104, bvar 639, bvar 649]),
    bnot (bands [bvar 1095, bvar 1103, bvar 640, bvar 648]),
    bnot (bands [bvar 1095, bvar 1104, bvar 640, bvar 649]),
    bnot (bands [bvar 1095, bvar 1105, bvar 640, bvar 650]),
    bnot (bands [bvar 1095, bvar 1106, bvar 640, bvar 651]),
    bnot (bands [bvar 1094, bvar 1104, bvar 652, bvar 662]),
    bnot (bands [bvar 1094, bvar 1105, bvar 652, bvar 663]),
    bnot (bands [bvar 1094, bvar 1106, bvar 652, bvar 664]),
    bnot (bands [bvar 1095, bvar 1105, bvar 653, bvar 663]),
    bnot (bands [bvar 1095, bvar 1106, bvar 653, bvar 664]),
    bnot (bands [bvar 1096, bvar 1104, bvar 654, bvar 662]),
    bnot (bands [bvar 1096, bvar 1105, bvar 654, bvar 663]),
    bnot (bands [bvar 1096, bvar 1106, bvar 654, bvar 664]),
    bnot (bands [bvar 1097, bvar 1104, bvar 655, bvar 662]),
    bnot (bands [bvar 1097, bvar 1105, bvar 655, bvar 663]),
    bnot (bands [bvar 1097, bvar 1106, bvar 655, bvar 664]),
    bnot (bands [bvar 1101, bvar 1102, bvar 659, bvar 660]),
    bnot (bands [bvar 1104, bvar 1105, bvar 662, bvar 663]),
    bnot (bands [bvar 1104, bvar 1106, bvar 662, bvar 664]),
    bnot (bands [bvar 1094, bvar 1096, bvar 665, bvar 667]),
    bnot (bands [bvar 1094, bvar 1105, bvar 665, bvar 676]),
    bnot (bands [bvar 1094, bvar 1106, bvar 665, bvar 677]),
    bnot (bands [bvar 1096, bvar 1105, bvar 667, bvar 676]),
    bnot (bands [bvar 1096, bvar 1106, bvar 667, bvar 677]),
    bnot (bands [bvar 1099, bvar 1103, bvar 670, bvar 674]),
    bnot (bands [bvar 1100, bvar 1103, bvar 671, bvar 674]),
    bnot (bands [bvar 1101, bvar 1102, bvar 672, bvar 673]),
    bnot (bands [bvar 1101, bvar 1103, bvar 672, bvar 674]) ]

def reducedUnionChunk085 : BVLogicalExpr :=
  bands reducedUnionChunk085Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
