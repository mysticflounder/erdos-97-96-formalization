import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk100Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 541, bvar 544, bvar 73, bvar 76]),
    bnot (bands [bvar 541, bvar 545, bvar 73, bvar 77]),
    bnot (bands [bvar 541, bvar 546, bvar 73, bvar 78]),
    bnot (bands [bvar 541, bvar 547, bvar 73, bvar 79]),
    bnot (bands [bvar 542, bvar 543, bvar 74, bvar 75]),
    bnot (bands [bvar 542, bvar 544, bvar 74, bvar 76]),
    bnot (bands [bvar 542, bvar 545, bvar 74, bvar 77]),
    bnot (bands [bvar 542, bvar 546, bvar 74, bvar 78]),
    bnot (bands [bvar 542, bvar 547, bvar 74, bvar 79]),
    bnot (bands [bvar 543, bvar 544, bvar 75, bvar 76]),
    bnot (bands [bvar 543, bvar 545, bvar 75, bvar 77]),
    bnot (bands [bvar 543, bvar 546, bvar 75, bvar 78]),
    bnot (bands [bvar 543, bvar 547, bvar 75, bvar 79]),
    atMost [bands [bvar 28, bvar 600], bands [bvar 29, bvar 601], bands [bvar 30, bvar 602], bands [bvar 31, bvar 603], bands [bvar 32, bvar 604], bands [bvar 33, bvar 605], bands [bvar 34, bvar 606], bands [bvar 35, bvar 607], bands [bvar 36, bvar 608], bands [bvar 37, bvar 609], bands [bvar 38, bvar 610], bands [bvar 39, bvar 611], bands [bvar 40, bvar 612]] 2,
    bnot (bands [bvar 30, bvar 32, bvar 602, bvar 604]),
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
    bnot (bands [bvar 37, bvar 38, bvar 609, bvar 610]),
    bnot (bands [bvar 37, bvar 39, bvar 609, bvar 611]),
    bnot (bands [bvar 37, bvar 40, bvar 609, bvar 612]),
    bnot (bands [bvar 38, bvar 39, bvar 610, bvar 611]),
    bnot (bands [bvar 38, bvar 40, bvar 610, bvar 612]),
    bnot (bands [bvar 39, bvar 40, bvar 611, bvar 612]),
    bnot (bands [bvar 538, bvar 539, bvar 96, bvar 97]),
    bnot (bands [bvar 541, bvar 542, bvar 99, bvar 100]),
    bnot (bands [bvar 541, bvar 543, bvar 99, bvar 101]),
    bnot (bands [bvar 541, bvar 544, bvar 99, bvar 102]),
    bnot (bands [bvar 541, bvar 545, bvar 99, bvar 103]),
    bnot (bands [bvar 541, bvar 546, bvar 99, bvar 104]),
    bnot (bands [bvar 541, bvar 547, bvar 99, bvar 105]),
    bnot (bands [bvar 542, bvar 543, bvar 100, bvar 101]),
    bnot (bands [bvar 542, bvar 544, bvar 100, bvar 102]),
    bnot (bands [bvar 542, bvar 545, bvar 100, bvar 103]),
    bnot (bands [bvar 542, bvar 546, bvar 100, bvar 104]),
    bnot (bands [bvar 542, bvar 547, bvar 100, bvar 105]),
    bnot (bands [bvar 543, bvar 547, bvar 101, bvar 105]),
    bnot (bands [bvar 544, bvar 545, bvar 102, bvar 103]),
    bnot (bands [bvar 544, bvar 546, bvar 102, bvar 104]),
    bnot (bands [bvar 545, bvar 546, bvar 103, bvar 104]),
    bnot (bands [bvar 545, bvar 547, bvar 103, bvar 105]),
    bnot (bands [bvar 546, bvar 547, bvar 104, bvar 105]),
    bnot (bands [bvar 29, bvar 32, bvar 614, bvar 617]),
    bnot (bands [bvar 29, bvar 33, bvar 614, bvar 618]),
    bnot (bands [bvar 30, bvar 32, bvar 615, bvar 617]),
    bnot (bands [bvar 30, bvar 33, bvar 615, bvar 618]),
    bnot (bands [bvar 31, bvar 33, bvar 616, bvar 618]),
    bnot (bands [bvar 32, bvar 33, bvar 617, bvar 618]),
    bnot (bands [bvar 35, bvar 36, bvar 620, bvar 621]),
    bnot (bands [bvar 35, bvar 37, bvar 620, bvar 622]),
    bnot (bands [bvar 35, bvar 38, bvar 620, bvar 623]) ]

def reducedUnionChunk100 : BVLogicalExpr :=
  bands reducedUnionChunk100Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
