import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk101Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 35, bvar 39, bvar 620, bvar 624]),
    bnot (bands [bvar 35, bvar 40, bvar 620, bvar 625]),
    bnot (bands [bvar 36, bvar 38, bvar 621, bvar 623]),
    bnot (bands [bvar 36, bvar 40, bvar 621, bvar 625]),
    bnot (bands [bvar 536, bvar 540, bvar 107, bvar 111]),
    bnot (bands [bvar 537, bvar 540, bvar 108, bvar 111]),
    bnot (bands [bvar 538, bvar 540, bvar 109, bvar 111]),
    bnot (bands [bvar 539, bvar 540, bvar 110, bvar 111]),
    bnot (bands [bvar 29, bvar 34, bvar 627, bvar 632]),
    bnot (bands [bvar 30, bvar 34, bvar 628, bvar 632]),
    bnot (bands [bvar 31, bvar 33, bvar 629, bvar 631]),
    bnot (bands [bvar 32, bvar 33, bvar 630, bvar 631]),
    bnot (bands [bvar 536, bvar 539, bvar 120, bvar 123]),
    bnot (bands [bvar 536, bvar 540, bvar 120, bvar 124]),
    bnot (bands [bvar 536, bvar 541, bvar 120, bvar 125]),
    bnot (bands [bvar 537, bvar 540, bvar 121, bvar 124]),
    bnot (bands [bvar 537, bvar 541, bvar 121, bvar 125]),
    bnot (bands [bvar 538, bvar 539, bvar 122, bvar 123]),
    bnot (bands [bvar 538, bvar 540, bvar 122, bvar 124]),
    bnot (bands [bvar 538, bvar 541, bvar 122, bvar 125]),
    bnot (bands [bvar 539, bvar 540, bvar 123, bvar 124]),
    bnot (bands [bvar 539, bvar 541, bvar 123, bvar 125]),
    bnot (bands [bvar 540, bvar 541, bvar 124, bvar 125]),
    bnot (bands [bvar 543, bvar 545, bvar 127, bvar 129]),
    bnot (bands [bvar 546, bvar 547, bvar 130, bvar 131]),
    bnot (bands [bvar 29, bvar 32, bvar 640, bvar 643]),
    bnot (bands [bvar 29, bvar 33, bvar 640, bvar 644]),
    bnot (bands [bvar 29, bvar 34, bvar 640, bvar 645]),
    bnot (bands [bvar 29, bvar 35, bvar 640, bvar 646]),
    bnot (bands [bvar 30, bvar 34, bvar 641, bvar 645]),
    bnot (bands [bvar 30, bvar 35, bvar 641, bvar 646]),
    bnot (bands [bvar 32, bvar 34, bvar 643, bvar 645]),
    bnot (bands [bvar 32, bvar 35, bvar 643, bvar 646]),
    bnot (bands [bvar 34, bvar 35, bvar 645, bvar 646]),
    bnot (bands [bvar 538, bvar 541, bvar 135, bvar 138]),
    bnot (bands [bvar 538, bvar 542, bvar 135, bvar 139]),
    bnot (bands [bvar 539, bvar 541, bvar 136, bvar 138]),
    bnot (bands [bvar 539, bvar 542, bvar 136, bvar 139]),
    bnot (bands [bvar 541, bvar 542, bvar 138, bvar 139]),
    bnot (bands [bvar 29, bvar 33, bvar 653, bvar 657]),
    bnot (bands [bvar 29, bvar 34, bvar 653, bvar 658]),
    bnot (bands [bvar 29, bvar 35, bvar 653, bvar 659]),
    bnot (bands [bvar 29, bvar 36, bvar 653, bvar 660]),
    bnot (bands [bvar 30, bvar 32, bvar 654, bvar 656]),
    bnot (bands [bvar 30, bvar 33, bvar 654, bvar 657]),
    bnot (bands [bvar 30, bvar 34, bvar 654, bvar 658]),
    bnot (bands [bvar 30, bvar 35, bvar 654, bvar 659]),
    bnot (bands [bvar 30, bvar 36, bvar 654, bvar 660]),
    bnot (bands [bvar 31, bvar 32, bvar 655, bvar 656]),
    bnot (bands [bvar 31, bvar 33, bvar 655, bvar 657]),
    bnot (bands [bvar 31, bvar 34, bvar 655, bvar 658]),
    bnot (bands [bvar 31, bvar 35, bvar 655, bvar 659]),
    bnot (bands [bvar 31, bvar 36, bvar 655, bvar 660]),
    bnot (bands [bvar 32, bvar 33, bvar 656, bvar 657]),
    bnot (bands [bvar 32, bvar 34, bvar 656, bvar 658]),
    bnot (bands [bvar 32, bvar 35, bvar 656, bvar 659]),
    bnot (bands [bvar 32, bvar 36, bvar 656, bvar 660]),
    bnot (bands [bvar 33, bvar 34, bvar 657, bvar 658]),
    bnot (bands [bvar 33, bvar 35, bvar 657, bvar 659]),
    bnot (bands [bvar 33, bvar 36, bvar 657, bvar 660]),
    bnot (bands [bvar 34, bvar 35, bvar 658, bvar 659]),
    bnot (bands [bvar 34, bvar 36, bvar 658, bvar 660]),
    bnot (bands [bvar 35, bvar 36, bvar 659, bvar 660]),
    bnot (bands [bvar 38, bvar 39, bvar 662, bvar 663]) ]

def reducedUnionChunk101 : BVLogicalExpr :=
  bands reducedUnionChunk101Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
