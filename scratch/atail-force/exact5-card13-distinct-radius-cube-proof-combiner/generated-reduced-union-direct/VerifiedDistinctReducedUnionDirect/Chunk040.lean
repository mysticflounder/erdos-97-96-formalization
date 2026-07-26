import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk040Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 604, bvar 608, bvar 617, bvar 621]),
    bnot (bands [bvar 604, bvar 609, bvar 617, bvar 622]),
    bnot (bands [bvar 604, bvar 610, bvar 617, bvar 623]),
    bnot (bands [bvar 604, bvar 611, bvar 617, bvar 624]),
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
    bnot (bands [bvar 600, bvar 604, bvar 626, bvar 630]),
    bnot (bands [bvar 600, bvar 608, bvar 626, bvar 634]),
    bnot (bands [bvar 600, bvar 609, bvar 626, bvar 635]),
    bnot (bands [bvar 600, bvar 610, bvar 626, bvar 636]),
    bnot (bands [bvar 601, bvar 604, bvar 627, bvar 630]),
    bnot (bands [bvar 601, bvar 608, bvar 627, bvar 634]),
    bnot (bands [bvar 601, bvar 609, bvar 627, bvar 635]),
    bnot (bands [bvar 601, bvar 611, bvar 627, bvar 637]),
    bnot (bands [bvar 602, bvar 604, bvar 628, bvar 630]),
    bnot (bands [bvar 602, bvar 608, bvar 628, bvar 634]),
    bnot (bands [bvar 602, bvar 609, bvar 628, bvar 635]),
    bnot (bands [bvar 602, bvar 611, bvar 628, bvar 637]),
    bnot (bands [bvar 603, bvar 604, bvar 629, bvar 630]),
    bnot (bands [bvar 603, bvar 608, bvar 629, bvar 634]),
    bnot (bands [bvar 603, bvar 609, bvar 629, bvar 635]),
    bnot (bands [bvar 603, bvar 610, bvar 629, bvar 636]),
    bnot (bands [bvar 603, bvar 611, bvar 629, bvar 637]),
    bnot (bands [bvar 603, bvar 612, bvar 629, bvar 638]),
    bnot (bands [bvar 604, bvar 608, bvar 630, bvar 634]),
    bnot (bands [bvar 604, bvar 609, bvar 630, bvar 635]),
    bnot (bands [bvar 604, bvar 610, bvar 630, bvar 636]),
    bnot (bands [bvar 604, bvar 611, bvar 630, bvar 637]),
    bnot (bands [bvar 604, bvar 612, bvar 630, bvar 638]),
    bnot (bands [bvar 608, bvar 609, bvar 634, bvar 635]),
    bnot (bands [bvar 608, bvar 610, bvar 634, bvar 636]),
    bnot (bands [bvar 608, bvar 611, bvar 634, bvar 637]),
    bnot (bands [bvar 608, bvar 612, bvar 634, bvar 638]),
    bnot (bands [bvar 609, bvar 610, bvar 635, bvar 636]),
    bnot (bands [bvar 609, bvar 611, bvar 635, bvar 637]),
    bnot (bands [bvar 609, bvar 612, bvar 635, bvar 638]),
    bnot (bands [bvar 610, bvar 611, bvar 636, bvar 637]),
    bnot (bands [bvar 610, bvar 612, bvar 636, bvar 638]),
    bnot (bands [bvar 611, bvar 612, bvar 637, bvar 638]),
    bnot (bands [bvar 600, bvar 601, bvar 639, bvar 640]),
    bnot (bands [bvar 600, bvar 604, bvar 639, bvar 643]),
    bnot (bands [bvar 600, bvar 609, bvar 639, bvar 648]),
    bnot (bands [bvar 600, bvar 610, bvar 639, bvar 649]),
    bnot (bands [bvar 600, bvar 611, bvar 639, bvar 650]),
    bnot (bands [bvar 601, bvar 604, bvar 640, bvar 643]),
    bnot (bands [bvar 601, bvar 609, bvar 640, bvar 648]),
    bnot (bands [bvar 601, bvar 610, bvar 640, bvar 649]),
    bnot (bands [bvar 601, bvar 611, bvar 640, bvar 650]),
    bnot (bands [bvar 601, bvar 612, bvar 640, bvar 651]),
    bnot (bands [bvar 603, bvar 604, bvar 642, bvar 643]) ]

def reducedUnionChunk040 : BVLogicalExpr :=
  bands reducedUnionChunk040Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
