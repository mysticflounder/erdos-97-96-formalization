import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk037Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 537, bvar 540, bvar 693, bvar 696]),
    bnot (bands [bvar 537, bvar 541, bvar 693, bvar 697]),
    bnot (bands [bvar 537, bvar 542, bvar 693, bvar 698]),
    bnot (bands [bvar 537, bvar 543, bvar 693, bvar 699]),
    bnot (bands [bvar 537, bvar 544, bvar 693, bvar 700]),
    bnot (bands [bvar 537, bvar 546, bvar 693, bvar 702]),
    bnot (bands [bvar 538, bvar 540, bvar 694, bvar 696]),
    bnot (bands [bvar 538, bvar 541, bvar 694, bvar 697]),
    bnot (bands [bvar 538, bvar 542, bvar 694, bvar 698]),
    bnot (bands [bvar 538, bvar 543, bvar 694, bvar 699]),
    bnot (bands [bvar 538, bvar 544, bvar 694, bvar 700]),
    bnot (bands [bvar 539, bvar 540, bvar 695, bvar 696]),
    bnot (bands [bvar 539, bvar 541, bvar 695, bvar 697]),
    bnot (bands [bvar 539, bvar 542, bvar 695, bvar 698]),
    bnot (bands [bvar 539, bvar 543, bvar 695, bvar 699]),
    bnot (bands [bvar 539, bvar 544, bvar 695, bvar 700]),
    bnot (bands [bvar 539, bvar 545, bvar 695, bvar 701]),
    bnot (bands [bvar 539, bvar 546, bvar 695, bvar 702]),
    bnot (bands [bvar 540, bvar 541, bvar 696, bvar 697]),
    bnot (bands [bvar 540, bvar 542, bvar 696, bvar 698]),
    bnot (bands [bvar 540, bvar 543, bvar 696, bvar 699]),
    bnot (bands [bvar 540, bvar 544, bvar 696, bvar 700]),
    bnot (bands [bvar 540, bvar 545, bvar 696, bvar 701]),
    bnot (bands [bvar 540, bvar 546, bvar 696, bvar 702]),
    bnot (bands [bvar 541, bvar 542, bvar 697, bvar 698]),
    bnot (bands [bvar 541, bvar 543, bvar 697, bvar 699]),
    bnot (bands [bvar 541, bvar 544, bvar 697, bvar 700]),
    bnot (bands [bvar 541, bvar 545, bvar 697, bvar 701]),
    bnot (bands [bvar 541, bvar 546, bvar 697, bvar 702]),
    bnot (bands [bvar 542, bvar 543, bvar 698, bvar 699]),
    bnot (bands [bvar 542, bvar 544, bvar 698, bvar 700]),
    bnot (bands [bvar 542, bvar 545, bvar 698, bvar 701]),
    bnot (bands [bvar 542, bvar 546, bvar 698, bvar 702]),
    bnot (bands [bvar 543, bvar 544, bvar 699, bvar 700]),
    bnot (bands [bvar 551, bvar 554, bvar 564, bvar 567]),
    bnot (bands [bvar 551, bvar 556, bvar 564, bvar 569]),
    bnot (bands [bvar 551, bvar 557, bvar 564, bvar 570]),
    bnot (bands [bvar 551, bvar 558, bvar 564, bvar 571]),
    bnot (bands [bvar 551, bvar 559, bvar 564, bvar 572]),
    bnot (bands [bvar 554, bvar 558, bvar 567, bvar 571]),
    bnot (bands [bvar 556, bvar 558, bvar 569, bvar 571]),
    bnot (bands [bvar 557, bvar 559, bvar 570, bvar 572]),
    bnot (bands [bvar 548, bvar 554, bvar 574, bvar 580]),
    bnot (bands [bvar 548, bvar 555, bvar 574, bvar 581]),
    bnot (bands [bvar 548, bvar 558, bvar 574, bvar 584]),
    bnot (bands [bvar 552, bvar 554, bvar 578, bvar 580]),
    bnot (bands [bvar 553, bvar 554, bvar 579, bvar 580]),
    bnot (bands [bvar 553, bvar 555, bvar 579, bvar 581]),
    bnot (bands [bvar 553, bvar 558, bvar 579, bvar 584]),
    bnot (bands [bvar 554, bvar 558, bvar 580, bvar 584]),
    bnot (bands [bvar 555, bvar 558, bvar 581, bvar 584]),
    bnot (bands [bvar 555, bvar 560, bvar 581, bvar 586]),
    bnot (bands [bvar 558, bvar 559, bvar 584, bvar 585]),
    bnot (bands [bvar 548, bvar 556, bvar 600, bvar 608]),
    bnot (bands [bvar 555, bvar 556, bvar 607, bvar 608]),
    bnot (bands [bvar 556, bvar 557, bvar 608, bvar 609]),
    bnot (bands [bvar 556, bvar 558, bvar 608, bvar 610]),
    bnot (bands [bvar 556, bvar 560, bvar 608, bvar 612]),
    bnot (bands [bvar 557, bvar 558, bvar 609, bvar 610]),
    bnot (bands [bvar 557, bvar 560, bvar 609, bvar 612]),
    bnot (bands [bvar 562, bvar 566, bvar 575, bvar 579]),
    bnot (bands [bvar 562, bvar 567, bvar 575, bvar 580]),
    bnot (bands [bvar 562, bvar 568, bvar 575, bvar 581]),
    bnot (bands [bvar 562, bvar 570, bvar 575, bvar 583]) ]

def reducedUnionChunk037 : BVLogicalExpr :=
  bands reducedUnionChunk037Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
