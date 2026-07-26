import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk102Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 541, bvar 543, bvar 1087, bvar 1089]),
    bnot (bands [bvar 1060, bvar 1066, bvar 566, bvar 572]),
    bnot (bands [bvar 567, bvar 573, bvar 1087, bvar 1093]),
    bnot (bands [bvar 567, bvar 573, bvar 1100, bvar 1106]),
    bnot (bands [bvar 585, bvar 586, bvar 1105, bvar 1106]),
    bnot (bands [bvar 30, bvar 35, bvar 550, bvar 555]),
    bnot (bands [bvar 31, bvar 34, bvar 551, bvar 554]),
    bnot (bands [bvar 31, bvar 35, bvar 551, bvar 555]),
    bnot (bands [bvar 31, bvar 39, bvar 551, bvar 559]),
    bnot (bands [bvar 33, bvar 35, bvar 553, bvar 555]),
    bnot (bands [bvar 34, bvar 35, bvar 554, bvar 555]),
    bnot (bands [bvar 34, bvar 36, bvar 554, bvar 556]),
    bnot (bands [bvar 34, bvar 39, bvar 554, bvar 559]),
    bnot (bands [bvar 35, bvar 36, bvar 555, bvar 556]),
    bnot (bands [bvar 35, bvar 39, bvar 555, bvar 559]),
    bnot (bands [bvar 538, bvar 540, bvar 57, bvar 59]),
    bnot (bands [bvar 32, bvar 33, bvar 578, bvar 579]),
    bnot (bands [bvar 32, bvar 35, bvar 578, bvar 581]),
    bnot (bands [bvar 32, bvar 36, bvar 578, bvar 582]),
    bnot (bands [bvar 32, bvar 38, bvar 578, bvar 584]),
    bnot (bands [bvar 32, bvar 40, bvar 578, bvar 586]),
    bnot (bands [bvar 33, bvar 35, bvar 579, bvar 581]),
    bnot (bands [bvar 33, bvar 36, bvar 579, bvar 582]),
    bnot (bands [bvar 33, bvar 38, bvar 579, bvar 584]),
    bnot (bands [bvar 34, bvar 35, bvar 580, bvar 581]),
    bnot (bands [bvar 35, bvar 36, bvar 581, bvar 582]),
    bnot (bands [bvar 35, bvar 38, bvar 581, bvar 584]),
    bnot (bands [bvar 35, bvar 40, bvar 581, bvar 586]),
    bnot (bands [bvar 539, bvar 540, bvar 71, bvar 72]),
    bnot (bands [bvar 540, bvar 542, bvar 72, bvar 74]),
    bnot (bands [bvar 540, bvar 544, bvar 72, bvar 76]),
    bnot (bands [bvar 540, bvar 547, bvar 72, bvar 79]),
    bnot (bands [bvar 541, bvar 547, bvar 73, bvar 79]),
    bnot (bands [bvar 542, bvar 547, bvar 74, bvar 79]),
    atMost [bands [bvar 28, bvar 600], bands [bvar 29, bvar 601], bands [bvar 30, bvar 602], bands [bvar 31, bvar 603], bands [bvar 32, bvar 604], bands [bvar 33, bvar 605], bands [bvar 34, bvar 606], bands [bvar 35, bvar 607], bands [bvar 36, bvar 608], bands [bvar 37, bvar 609], bands [bvar 38, bvar 610], bands [bvar 39, bvar 611], bands [bvar 40, bvar 612]] 2,
    bnot (bands [bvar 31, bvar 32, bvar 603, bvar 604]),
    bnot (bands [bvar 34, bvar 35, bvar 606, bvar 607]),
    bnot (bands [bvar 34, bvar 36, bvar 606, bvar 608]),
    bnot (bands [bvar 34, bvar 37, bvar 606, bvar 609]),
    bnot (bands [bvar 34, bvar 38, bvar 606, bvar 610]),
    bnot (bands [bvar 34, bvar 39, bvar 606, bvar 611]),
    bnot (bands [bvar 34, bvar 40, bvar 606, bvar 612]),
    bnot (bands [bvar 35, bvar 36, bvar 607, bvar 608]),
    bnot (bands [bvar 35, bvar 37, bvar 607, bvar 609]),
    bnot (bands [bvar 35, bvar 38, bvar 607, bvar 610]),
    bnot (bands [bvar 35, bvar 39, bvar 607, bvar 611]),
    bnot (bands [bvar 35, bvar 40, bvar 607, bvar 612]),
    bnot (bands [bvar 36, bvar 37, bvar 608, bvar 609]),
    bnot (bands [bvar 36, bvar 38, bvar 608, bvar 610]),
    bnot (bands [bvar 36, bvar 39, bvar 608, bvar 611]),
    bnot (bands [bvar 36, bvar 40, bvar 608, bvar 612]),
    bnot (bands [bvar 38, bvar 40, bvar 610, bvar 612]),
    bnot (bands [bvar 39, bvar 40, bvar 611, bvar 612]),
    bnot (bands [bvar 537, bvar 539, bvar 95, bvar 97]),
    bnot (bands [bvar 541, bvar 542, bvar 99, bvar 100]),
    bnot (bands [bvar 541, bvar 543, bvar 99, bvar 101]),
    bnot (bands [bvar 541, bvar 544, bvar 99, bvar 102]),
    bnot (bands [bvar 541, bvar 545, bvar 99, bvar 103]),
    bnot (bands [bvar 541, bvar 546, bvar 99, bvar 104]),
    bnot (bands [bvar 541, bvar 547, bvar 99, bvar 105]),
    bnot (bands [bvar 542, bvar 543, bvar 100, bvar 101]),
    bnot (bands [bvar 542, bvar 544, bvar 100, bvar 102]),
    bnot (bands [bvar 542, bvar 545, bvar 100, bvar 103]),
    bnot (bands [bvar 542, bvar 546, bvar 100, bvar 104]) ]

def reducedUnionChunk102 : BVLogicalExpr :=
  bands reducedUnionChunk102Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
