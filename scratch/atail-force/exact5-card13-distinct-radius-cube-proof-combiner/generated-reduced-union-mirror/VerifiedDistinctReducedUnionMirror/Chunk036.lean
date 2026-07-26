import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk036Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 541, bvar 542, bvar 697, bvar 698]),
    bnot (bands [bvar 541, bvar 543, bvar 697, bvar 699]),
    bnot (bands [bvar 541, bvar 544, bvar 697, bvar 700]),
    bnot (bands [bvar 541, bvar 545, bvar 697, bvar 701]),
    bnot (bands [bvar 541, bvar 546, bvar 697, bvar 702]),
    bnot (bands [bvar 542, bvar 543, bvar 698, bvar 699]),
    bnot (bands [bvar 542, bvar 544, bvar 698, bvar 700]),
    bnot (bands [bvar 542, bvar 545, bvar 698, bvar 701]),
    bnot (bands [bvar 542, bvar 546, bvar 698, bvar 702]),
    bnot (bands [bvar 551, bvar 553, bvar 564, bvar 566]),
    bnot (bands [bvar 551, bvar 554, bvar 564, bvar 567]),
    bnot (bands [bvar 551, bvar 555, bvar 564, bvar 568]),
    bnot (bands [bvar 551, bvar 556, bvar 564, bvar 569]),
    bnot (bands [bvar 551, bvar 557, bvar 564, bvar 570]),
    bnot (bands [bvar 551, bvar 558, bvar 564, bvar 571]),
    bnot (bands [bvar 551, bvar 560, bvar 564, bvar 573]),
    bnot (bands [bvar 553, bvar 555, bvar 566, bvar 568]),
    bnot (bands [bvar 554, bvar 560, bvar 567, bvar 573]),
    bnot (bands [bvar 555, bvar 558, bvar 568, bvar 571]),
    bnot (bands [bvar 556, bvar 557, bvar 569, bvar 570]),
    bnot (bands [bvar 556, bvar 558, bvar 569, bvar 571]),
    bnot (bands [bvar 552, bvar 556, bvar 669, bvar 673]),
    bnot (bands [bvar 552, bvar 557, bvar 669, bvar 674]),
    bnot (bands [bvar 552, bvar 555, bvar 682, bvar 685]),
    bnot (bands [bvar 554, bvar 559, bvar 697, bvar 702]),
    bnot (bands [bvar 556, bvar 559, bvar 699, bvar 702]),
    bnot (bands [bvar 557, bvar 559, bvar 700, bvar 702]),
    bnot (bands [bvar 562, bvar 567, bvar 575, bvar 580]),
    bnot (bands [bvar 562, bvar 568, bvar 575, bvar 581]),
    bnot (bands [bvar 562, bvar 569, bvar 575, bvar 582]),
    bnot (bands [bvar 562, bvar 570, bvar 575, bvar 583]),
    bnot (bands [bvar 562, bvar 571, bvar 575, bvar 584]),
    bnot (bands [bvar 562, bvar 572, bvar 575, bvar 585]),
    bnot (bands [bvar 567, bvar 571, bvar 580, bvar 584]),
    bnot (bands [bvar 567, bvar 572, bvar 580, bvar 585]),
    bnot (bands [bvar 567, bvar 573, bvar 580, bvar 586]),
    bnot (bands [bvar 568, bvar 571, bvar 581, bvar 584]),
    bnot (bands [bvar 569, bvar 572, bvar 582, bvar 585]),
    bnot (bands [bvar 570, bvar 572, bvar 583, bvar 585]),
    bnot (bands [bvar 562, bvar 567, bvar 601, bvar 606]),
    bnot (bands [bvar 562, bvar 568, bvar 601, bvar 607]),
    bnot (bands [bvar 562, bvar 569, bvar 601, bvar 608]),
    bnot (bands [bvar 562, bvar 570, bvar 601, bvar 609]),
    bnot (bands [bvar 562, bvar 571, bvar 601, bvar 610]),
    bnot (bands [bvar 562, bvar 572, bvar 601, bvar 611]),
    bnot (bands [bvar 562, bvar 573, bvar 601, bvar 612]),
    bnot (bands [bvar 567, bvar 568, bvar 606, bvar 607]),
    bnot (bands [bvar 567, bvar 569, bvar 606, bvar 608]),
    bnot (bands [bvar 567, bvar 570, bvar 606, bvar 609]),
    bnot (bands [bvar 568, bvar 570, bvar 607, bvar 609]),
    bnot (bands [bvar 568, bvar 571, bvar 607, bvar 610]),
    bnot (bands [bvar 568, bvar 572, bvar 607, bvar 611]),
    bnot (bands [bvar 569, bvar 570, bvar 608, bvar 609]),
    bnot (bands [bvar 569, bvar 573, bvar 608, bvar 612]),
    bnot (bands [bvar 570, bvar 571, bvar 609, bvar 610]),
    bnot (bands [bvar 562, bvar 568, bvar 614, bvar 620]),
    bnot (bands [bvar 562, bvar 569, bvar 614, bvar 621]),
    bnot (bands [bvar 562, bvar 570, bvar 614, bvar 622]),
    bnot (bands [bvar 562, bvar 571, bvar 614, bvar 623]),
    bnot (bands [bvar 562, bvar 572, bvar 614, bvar 624]),
    bnot (bands [bvar 562, bvar 573, bvar 614, bvar 625]),
    bnot (bands [bvar 564, bvar 566, bvar 616, bvar 618]),
    bnot (bands [bvar 568, bvar 569, bvar 620, bvar 621]),
    bnot (bands [bvar 568, bvar 570, bvar 620, bvar 622]) ]

def reducedUnionChunk036 : BVLogicalExpr :=
  bands reducedUnionChunk036Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
