import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk038Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 574, bvar 575, bvar 639, bvar 640]),
    bnot (bands [bvar 575, bvar 584, bvar 640, bvar 649]),
    bnot (bands [bvar 575, bvar 585, bvar 640, bvar 650]),
    bnot (bands [bvar 578, bvar 582, bvar 656, bvar 660]),
    bnot (bands [bvar 579, bvar 582, bvar 657, bvar 660]),
    bnot (bands [bvar 578, bvar 579, bvar 695, bvar 696]),
    bnot (bands [bvar 578, bvar 580, bvar 695, bvar 697]),
    bnot (bands [bvar 578, bvar 581, bvar 695, bvar 698]),
    bnot (bands [bvar 578, bvar 582, bvar 695, bvar 699]),
    bnot (bands [bvar 578, bvar 583, bvar 695, bvar 700]),
    bnot (bands [bvar 578, bvar 584, bvar 695, bvar 701]),
    bnot (bands [bvar 578, bvar 585, bvar 695, bvar 702]),
    bnot (bands [bvar 579, bvar 580, bvar 696, bvar 697]),
    bnot (bands [bvar 579, bvar 581, bvar 696, bvar 698]),
    bnot (bands [bvar 579, bvar 582, bvar 696, bvar 699]),
    bnot (bands [bvar 579, bvar 583, bvar 696, bvar 700]),
    bnot (bands [bvar 579, bvar 584, bvar 696, bvar 701]),
    bnot (bands [bvar 579, bvar 585, bvar 696, bvar 702]),
    bnot (bands [bvar 580, bvar 581, bvar 697, bvar 698]),
    bnot (bands [bvar 580, bvar 582, bvar 697, bvar 699]),
    bnot (bands [bvar 580, bvar 583, bvar 697, bvar 700]),
    bnot (bands [bvar 580, bvar 584, bvar 697, bvar 701]),
    bnot (bands [bvar 580, bvar 585, bvar 697, bvar 702]),
    bnot (bands [bvar 581, bvar 582, bvar 698, bvar 699]),
    bnot (bands [bvar 581, bvar 583, bvar 698, bvar 700]),
    bnot (bands [bvar 581, bvar 584, bvar 698, bvar 701]),
    bnot (bands [bvar 581, bvar 585, bvar 698, bvar 702]),
    bnot (bands [bvar 582, bvar 583, bvar 699, bvar 700]),
    bnot (bands [bvar 582, bvar 584, bvar 699, bvar 701]),
    bnot (bands [bvar 582, bvar 585, bvar 699, bvar 702]),
    bnot (bands [bvar 583, bvar 584, bvar 700, bvar 701]),
    bnot (bands [bvar 584, bvar 585, bvar 701, bvar 702]),
    bnot (bands [bvar 600, bvar 603, bvar 613, bvar 616]),
    bnot (bands [bvar 600, bvar 604, bvar 613, bvar 617]),
    bnot (bands [bvar 600, bvar 607, bvar 613, bvar 620]),
    bnot (bands [bvar 600, bvar 608, bvar 613, bvar 621]),
    bnot (bands [bvar 600, bvar 609, bvar 613, bvar 622]),
    bnot (bands [bvar 600, bvar 610, bvar 613, bvar 623]),
    bnot (bands [bvar 600, bvar 611, bvar 613, bvar 624]),
    bnot (bands [bvar 600, bvar 612, bvar 613, bvar 625]),
    bnot (bands [bvar 601, bvar 604, bvar 614, bvar 617]),
    bnot (bands [bvar 601, bvar 607, bvar 614, bvar 620]),
    bnot (bands [bvar 601, bvar 608, bvar 614, bvar 621]),
    bnot (bands [bvar 601, bvar 610, bvar 614, bvar 623]),
    bnot (bands [bvar 601, bvar 611, bvar 614, bvar 624]),
    bnot (bands [bvar 601, bvar 612, bvar 614, bvar 625]),
    bnot (bands [bvar 602, bvar 604, bvar 615, bvar 617]),
    bnot (bands [bvar 602, bvar 607, bvar 615, bvar 620]),
    bnot (bands [bvar 602, bvar 608, bvar 615, bvar 621]),
    bnot (bands [bvar 602, bvar 609, bvar 615, bvar 622]),
    bnot (bands [bvar 602, bvar 610, bvar 615, bvar 623]),
    bnot (bands [bvar 602, bvar 611, bvar 615, bvar 624]),
    bnot (bands [bvar 602, bvar 612, bvar 615, bvar 625]),
    bnot (bands [bvar 603, bvar 604, bvar 616, bvar 617]),
    bnot (bands [bvar 603, bvar 607, bvar 616, bvar 620]),
    bnot (bands [bvar 603, bvar 608, bvar 616, bvar 621]),
    bnot (bands [bvar 603, bvar 609, bvar 616, bvar 622]),
    bnot (bands [bvar 603, bvar 610, bvar 616, bvar 623]),
    bnot (bands [bvar 603, bvar 611, bvar 616, bvar 624]),
    bnot (bands [bvar 603, bvar 612, bvar 616, bvar 625]),
    bnot (bands [bvar 604, bvar 607, bvar 617, bvar 620]),
    bnot (bands [bvar 604, bvar 608, bvar 617, bvar 621]),
    bnot (bands [bvar 604, bvar 609, bvar 617, bvar 622]),
    bnot (bands [bvar 604, bvar 610, bvar 617, bvar 623]) ]

def reducedUnionChunk038 : BVLogicalExpr :=
  bands reducedUnionChunk038Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
