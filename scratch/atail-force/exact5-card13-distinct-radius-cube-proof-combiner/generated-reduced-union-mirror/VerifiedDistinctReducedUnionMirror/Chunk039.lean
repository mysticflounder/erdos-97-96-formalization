import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk039Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 604, bvar 611, bvar 617, bvar 624]),
    bnot (bands [bvar 604, bvar 612, bvar 617, bvar 625]),
    bnot (bands [bvar 607, bvar 608, bvar 620, bvar 621]),
    bnot (bands [bvar 607, bvar 609, bvar 620, bvar 622]),
    bnot (bands [bvar 607, bvar 610, bvar 620, bvar 623]),
    bnot (bands [bvar 607, bvar 611, bvar 620, bvar 624]),
    bnot (bands [bvar 607, bvar 612, bvar 620, bvar 625]),
    bnot (bands [bvar 608, bvar 609, bvar 621, bvar 622]),
    bnot (bands [bvar 608, bvar 610, bvar 621, bvar 623]),
    bnot (bands [bvar 608, bvar 611, bvar 621, bvar 624]),
    bnot (bands [bvar 608, bvar 612, bvar 621, bvar 625]),
    bnot (bands [bvar 609, bvar 610, bvar 622, bvar 623]),
    bnot (bands [bvar 609, bvar 611, bvar 622, bvar 624]),
    bnot (bands [bvar 609, bvar 612, bvar 622, bvar 625]),
    bnot (bands [bvar 610, bvar 611, bvar 623, bvar 624]),
    bnot (bands [bvar 610, bvar 612, bvar 623, bvar 625]),
    bnot (bands [bvar 611, bvar 612, bvar 624, bvar 625]),
    bnot (bands [bvar 602, bvar 609, bvar 628, bvar 635]),
    bnot (bands [bvar 603, bvar 604, bvar 629, bvar 630]),
    bnot (bands [bvar 603, bvar 608, bvar 629, bvar 634]),
    bnot (bands [bvar 603, bvar 609, bvar 629, bvar 635]),
    bnot (bands [bvar 603, bvar 611, bvar 629, bvar 637]),
    bnot (bands [bvar 604, bvar 609, bvar 630, bvar 635]),
    bnot (bands [bvar 604, bvar 610, bvar 630, bvar 636]),
    bnot (bands [bvar 604, bvar 611, bvar 630, bvar 637]),
    bnot (bands [bvar 604, bvar 612, bvar 630, bvar 638]),
    bnot (bands [bvar 609, bvar 610, bvar 635, bvar 636]),
    bnot (bands [bvar 609, bvar 611, bvar 635, bvar 637]),
    bnot (bands [bvar 610, bvar 612, bvar 636, bvar 638]),
    bnot (bands [bvar 600, bvar 601, bvar 639, bvar 640]),
    bnot (bands [bvar 601, bvar 604, bvar 640, bvar 643]),
    bnot (bands [bvar 601, bvar 609, bvar 640, bvar 648]),
    bnot (bands [bvar 601, bvar 610, bvar 640, bvar 649]),
    bnot (bands [bvar 601, bvar 611, bvar 640, bvar 650]),
    bnot (bands [bvar 601, bvar 612, bvar 640, bvar 651]),
    bnot (bands [bvar 604, bvar 609, bvar 643, bvar 648]),
    bnot (bands [bvar 604, bvar 610, bvar 643, bvar 649]),
    bnot (bands [bvar 604, bvar 611, bvar 643, bvar 650]),
    bnot (bands [bvar 604, bvar 612, bvar 643, bvar 651]),
    bnot (bands [bvar 600, bvar 601, bvar 652, bvar 653]),
    bnot (bands [bvar 600, bvar 604, bvar 652, bvar 656]),
    bnot (bands [bvar 600, bvar 610, bvar 652, bvar 662]),
    bnot (bands [bvar 600, bvar 611, bvar 652, bvar 663]),
    bnot (bands [bvar 601, bvar 604, bvar 653, bvar 656]),
    bnot (bands [bvar 601, bvar 611, bvar 653, bvar 663]),
    bnot (bands [bvar 602, bvar 604, bvar 654, bvar 656]),
    bnot (bands [bvar 602, bvar 610, bvar 654, bvar 662]),
    bnot (bands [bvar 602, bvar 611, bvar 654, bvar 663]),
    bnot (bands [bvar 603, bvar 604, bvar 655, bvar 656]),
    bnot (bands [bvar 603, bvar 610, bvar 655, bvar 662]),
    bnot (bands [bvar 603, bvar 611, bvar 655, bvar 663]),
    bnot (bands [bvar 603, bvar 612, bvar 655, bvar 664]),
    bnot (bands [bvar 604, bvar 610, bvar 656, bvar 662]),
    bnot (bands [bvar 604, bvar 611, bvar 656, bvar 663]),
    bnot (bands [bvar 604, bvar 612, bvar 656, bvar 664]),
    bnot (bands [bvar 606, bvar 607, bvar 658, bvar 659]),
    bnot (bands [bvar 606, bvar 608, bvar 658, bvar 660]),
    bnot (bands [bvar 607, bvar 608, bvar 659, bvar 660]),
    bnot (bands [bvar 610, bvar 611, bvar 662, bvar 663]),
    bnot (bands [bvar 610, bvar 612, bvar 662, bvar 664]),
    bnot (bands [bvar 611, bvar 612, bvar 663, bvar 664]),
    bnot (bands [bvar 607, bvar 611, bvar 698, bvar 702]),
    bnot (bands [bvar 609, bvar 611, bvar 700, bvar 702]),
    bnot (bands [bvar 613, bvar 614, bvar 626, bvar 627]) ]

def reducedUnionChunk039 : BVLogicalExpr :=
  bands reducedUnionChunk039Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
