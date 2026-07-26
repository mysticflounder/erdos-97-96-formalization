import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk035Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 543, bvar 546, bvar 569, bvar 572]),
    bnot (bands [bvar 544, bvar 545, bvar 570, bvar 571]),
    bnot (bands [bvar 544, bvar 546, bvar 570, bvar 572]),
    bnot (bands [bvar 545, bvar 546, bvar 571, bvar 572]),
    bnot (bands [bvar 546, bvar 547, bvar 572, bvar 573]),
    bnot (bands [bvar 539, bvar 540, bvar 578, bvar 579]),
    bnot (bands [bvar 539, bvar 541, bvar 578, bvar 580]),
    bnot (bands [bvar 539, bvar 542, bvar 578, bvar 581]),
    bnot (bands [bvar 539, bvar 543, bvar 578, bvar 582]),
    bnot (bands [bvar 539, bvar 545, bvar 578, bvar 584]),
    bnot (bands [bvar 539, bvar 547, bvar 578, bvar 586]),
    bnot (bands [bvar 540, bvar 541, bvar 579, bvar 580]),
    bnot (bands [bvar 540, bvar 542, bvar 579, bvar 581]),
    bnot (bands [bvar 540, bvar 543, bvar 579, bvar 582]),
    bnot (bands [bvar 541, bvar 542, bvar 580, bvar 581]),
    bnot (bands [bvar 541, bvar 543, bvar 580, bvar 582]),
    bnot (bands [bvar 541, bvar 544, bvar 580, bvar 583]),
    bnot (bands [bvar 541, bvar 545, bvar 580, bvar 584]),
    bnot (bands [bvar 541, bvar 546, bvar 580, bvar 585]),
    bnot (bands [bvar 541, bvar 547, bvar 580, bvar 586]),
    bnot (bands [bvar 542, bvar 543, bvar 581, bvar 582]),
    bnot (bands [bvar 542, bvar 544, bvar 581, bvar 583]),
    bnot (bands [bvar 542, bvar 545, bvar 581, bvar 584]),
    bnot (bands [bvar 542, bvar 546, bvar 581, bvar 585]),
    bnot (bands [bvar 542, bvar 547, bvar 581, bvar 586]),
    bnot (bands [bvar 538, bvar 539, bvar 603, bvar 604]),
    bnot (bands [bvar 541, bvar 542, bvar 606, bvar 607]),
    bnot (bands [bvar 541, bvar 543, bvar 606, bvar 608]),
    bnot (bands [bvar 541, bvar 545, bvar 606, bvar 610]),
    bnot (bands [bvar 541, bvar 546, bvar 606, bvar 611]),
    bnot (bands [bvar 541, bvar 547, bvar 606, bvar 612]),
    bnot (bands [bvar 542, bvar 543, bvar 607, bvar 608]),
    bnot (bands [bvar 542, bvar 544, bvar 607, bvar 609]),
    bnot (bands [bvar 542, bvar 545, bvar 607, bvar 610]),
    bnot (bands [bvar 542, bvar 546, bvar 607, bvar 611]),
    bnot (bands [bvar 542, bvar 547, bvar 607, bvar 612]),
    bnot (bands [bvar 543, bvar 545, bvar 608, bvar 610]),
    bnot (bands [bvar 536, bvar 540, bvar 614, bvar 618]),
    bnot (bands [bvar 537, bvar 540, bvar 615, bvar 618]),
    bnot (bands [bvar 538, bvar 540, bvar 616, bvar 618]),
    bnot (bands [bvar 539, bvar 540, bvar 617, bvar 618]),
    bnot (bands [bvar 542, bvar 543, bvar 620, bvar 621]),
    bnot (bands [bvar 542, bvar 544, bvar 620, bvar 622]),
    bnot (bands [bvar 542, bvar 545, bvar 620, bvar 623]),
    bnot (bands [bvar 542, bvar 546, bvar 620, bvar 624]),
    bnot (bands [bvar 542, bvar 547, bvar 620, bvar 625]),
    bnot (bands [bvar 544, bvar 546, bvar 622, bvar 624]),
    bnot (bands [bvar 545, bvar 546, bvar 623, bvar 624]),
    bnot (bands [bvar 536, bvar 541, bvar 627, bvar 632]),
    bnot (bands [bvar 537, bvar 540, bvar 628, bvar 631]),
    bnot (bands [bvar 537, bvar 541, bvar 628, bvar 632]),
    bnot (bands [bvar 538, bvar 540, bvar 629, bvar 631]),
    bnot (bands [bvar 538, bvar 541, bvar 629, bvar 632]),
    bnot (bands [bvar 539, bvar 540, bvar 630, bvar 631]),
    bnot (bands [bvar 539, bvar 541, bvar 630, bvar 632]),
    bnot (bands [bvar 540, bvar 541, bvar 631, bvar 632]),
    bnot (bands [bvar 543, bvar 544, bvar 634, bvar 635]),
    bnot (bands [bvar 543, bvar 545, bvar 634, bvar 636]),
    bnot (bands [bvar 543, bvar 547, bvar 634, bvar 638]),
    bnot (bands [bvar 544, bvar 545, bvar 635, bvar 636]),
    bnot (bands [bvar 544, bvar 546, bvar 635, bvar 637]),
    bnot (bands [bvar 545, bvar 546, bvar 636, bvar 637]),
    bnot (bands [bvar 536, bvar 539, bvar 640, bvar 643]),
    bnot (bands [bvar 536, bvar 541, bvar 640, bvar 645]) ]

def reducedUnionChunk035 : BVLogicalExpr :=
  bands reducedUnionChunk035Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
