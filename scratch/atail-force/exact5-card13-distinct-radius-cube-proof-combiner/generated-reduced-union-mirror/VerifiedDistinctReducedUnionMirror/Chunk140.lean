import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk140Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 5, bvar 10, bvar 579, bvar 584]),
    bnot (bands [bvar 5, bvar 12, bvar 579, bvar 586]),
    bnot (bands [bvar 6, bvar 9, bvar 580, bvar 583]),
    bnot (bands [bvar 6, bvar 11, bvar 580, bvar 585]),
    bnot (bands [bvar 6, bvar 12, bvar 580, bvar 586]),
    bnot (bands [bvar 7, bvar 9, bvar 581, bvar 583]),
    bnot (bands [bvar 7, bvar 11, bvar 581, bvar 585]),
    bnot (bands [bvar 8, bvar 9, bvar 582, bvar 583]),
    bnot (bands [bvar 8, bvar 10, bvar 582, bvar 584]),
    bnot (bands [bvar 8, bvar 11, bvar 582, bvar 585]),
    bnot (bands [bvar 8, bvar 12, bvar 582, bvar 586]),
    bnot (bands [bvar 9, bvar 10, bvar 583, bvar 584]),
    bnot (bands [bvar 9, bvar 11, bvar 583, bvar 585]),
    bnot (bands [bvar 9, bvar 12, bvar 583, bvar 586]),
    bnot (bands [bvar 10, bvar 11, bvar 584, bvar 585]),
    bnot (bands [bvar 10, bvar 12, bvar 584, bvar 586]),
    bnot (bands [bvar 11, bvar 12, bvar 585, bvar 586]),
    bnot (bands [bvar 0, bvar 1, bvar 600, bvar 601]),
    bnot (bands [bvar 0, bvar 2, bvar 600, bvar 602]),
    bnot (bands [bvar 0, bvar 3, bvar 600, bvar 603]),
    bnot (bands [bvar 0, bvar 6, bvar 600, bvar 606]),
    bnot (bands [bvar 0, bvar 7, bvar 600, bvar 607]),
    bnot (bands [bvar 0, bvar 8, bvar 600, bvar 608]),
    bnot (bands [bvar 0, bvar 9, bvar 600, bvar 609]),
    bnot (bands [bvar 0, bvar 10, bvar 600, bvar 610]),
    bnot (bands [bvar 0, bvar 11, bvar 600, bvar 611]),
    bnot (bands [bvar 0, bvar 12, bvar 600, bvar 612]),
    bnot (bands [bvar 1, bvar 7, bvar 601, bvar 607]),
    bnot (bands [bvar 1, bvar 8, bvar 601, bvar 608]),
    bnot (bands [bvar 1, bvar 9, bvar 601, bvar 609]),
    bnot (bands [bvar 1, bvar 10, bvar 601, bvar 610]),
    bnot (bands [bvar 1, bvar 11, bvar 601, bvar 611]),
    bnot (bands [bvar 1, bvar 12, bvar 601, bvar 612]),
    bnot (bands [bvar 2, bvar 7, bvar 602, bvar 607]),
    bnot (bands [bvar 2, bvar 8, bvar 602, bvar 608]),
    bnot (bands [bvar 2, bvar 9, bvar 602, bvar 609]),
    bnot (bands [bvar 2, bvar 10, bvar 602, bvar 610]),
    bnot (bands [bvar 2, bvar 11, bvar 602, bvar 611]),
    bnot (bands [bvar 2, bvar 12, bvar 602, bvar 612]),
    bnot (bands [bvar 3, bvar 6, bvar 603, bvar 606]),
    bnot (bands [bvar 3, bvar 7, bvar 603, bvar 607]),
    bnot (bands [bvar 3, bvar 8, bvar 603, bvar 608]),
    bnot (bands [bvar 3, bvar 9, bvar 603, bvar 609]),
    bnot (bands [bvar 3, bvar 10, bvar 603, bvar 610]),
    bnot (bands [bvar 3, bvar 11, bvar 603, bvar 611]),
    bnot (bands [bvar 3, bvar 12, bvar 603, bvar 612]),
    bnot (bands [bvar 6, bvar 9, bvar 606, bvar 609]),
    bnot (bands [bvar 6, bvar 10, bvar 606, bvar 610]),
    bnot (bands [bvar 6, bvar 11, bvar 606, bvar 611]),
    bnot (bands [bvar 6, bvar 12, bvar 606, bvar 612]),
    bnot (bands [bvar 7, bvar 8, bvar 607, bvar 608]),
    bnot (bands [bvar 7, bvar 9, bvar 607, bvar 609]),
    bnot (bands [bvar 7, bvar 10, bvar 607, bvar 610]),
    bnot (bands [bvar 7, bvar 11, bvar 607, bvar 611]),
    bnot (bands [bvar 7, bvar 12, bvar 607, bvar 612]),
    bnot (bands [bvar 8, bvar 9, bvar 608, bvar 609]),
    bnot (bands [bvar 8, bvar 10, bvar 608, bvar 610]),
    bnot (bands [bvar 8, bvar 11, bvar 608, bvar 611]),
    bnot (bands [bvar 8, bvar 12, bvar 608, bvar 612]),
    bnot (bands [bvar 9, bvar 10, bvar 609, bvar 610]),
    bnot (bands [bvar 9, bvar 11, bvar 609, bvar 611]),
    bnot (bands [bvar 9, bvar 12, bvar 609, bvar 612]),
    bnot (bands [bvar 10, bvar 11, bvar 610, bvar 611]),
    bnot (bands [bvar 10, bvar 12, bvar 610, bvar 612]) ]

def reducedUnionChunk140 : BVLogicalExpr :=
  bands reducedUnionChunk140Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
