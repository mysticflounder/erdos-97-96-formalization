import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk103Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 542, bvar 547, bvar 100, bvar 105]),
    bnot (bands [bvar 543, bvar 544, bvar 101, bvar 102]),
    bnot (bands [bvar 543, bvar 545, bvar 101, bvar 103]),
    bnot (bands [bvar 543, bvar 546, bvar 101, bvar 104]),
    bnot (bands [bvar 543, bvar 547, bvar 101, bvar 105]),
    bnot (bands [bvar 544, bvar 546, bvar 102, bvar 104]),
    bnot (bands [bvar 544, bvar 547, bvar 102, bvar 105]),
    bnot (bands [bvar 545, bvar 546, bvar 103, bvar 104]),
    bnot (bands [bvar 545, bvar 547, bvar 103, bvar 105]),
    bnot (bands [bvar 546, bvar 547, bvar 104, bvar 105]),
    bnot (bands [bvar 32, bvar 33, bvar 617, bvar 618]),
    bnot (bands [bvar 35, bvar 36, bvar 620, bvar 621]),
    bnot (bands [bvar 35, bvar 37, bvar 620, bvar 622]),
    bnot (bands [bvar 35, bvar 38, bvar 620, bvar 623]),
    bnot (bands [bvar 35, bvar 39, bvar 620, bvar 624]),
    bnot (bands [bvar 35, bvar 40, bvar 620, bvar 625]),
    bnot (bands [bvar 36, bvar 37, bvar 621, bvar 622]),
    bnot (bands [bvar 36, bvar 39, bvar 621, bvar 624]),
    bnot (bands [bvar 36, bvar 40, bvar 621, bvar 625]),
    bnot (bands [bvar 37, bvar 38, bvar 622, bvar 623]),
    bnot (bands [bvar 37, bvar 39, bvar 622, bvar 624]),
    bnot (bands [bvar 38, bvar 40, bvar 623, bvar 625]),
    bnot (bands [bvar 39, bvar 40, bvar 624, bvar 625]),
    atMost [bands [bvar 535, bvar 106], bands [bvar 536, bvar 107], bands [bvar 537, bvar 108], bands [bvar 538, bvar 109], bands [bvar 539, bvar 110], bands [bvar 540, bvar 111], bands [bvar 541, bvar 112], bands [bvar 542, bvar 113], bands [bvar 543, bvar 114], bands [bvar 544, bvar 115], bands [bvar 545, bvar 116], bands [bvar 546, bvar 117], bands [bvar 547, bvar 118]] 2,
    bnot (bands [bvar 536, bvar 539, bvar 107, bvar 110]),
    bnot (bands [bvar 536, bvar 540, bvar 107, bvar 111]),
    bnot (bands [bvar 537, bvar 539, bvar 108, bvar 110]),
    bnot (bands [bvar 537, bvar 540, bvar 108, bvar 111]),
    bnot (bands [bvar 538, bvar 539, bvar 109, bvar 110]),
    bnot (bands [bvar 538, bvar 540, bvar 109, bvar 111]),
    bnot (bands [bvar 539, bvar 540, bvar 110, bvar 111]),
    bnot (bands [bvar 542, bvar 543, bvar 113, bvar 114]),
    bnot (bands [bvar 542, bvar 544, bvar 113, bvar 115]),
    bnot (bands [bvar 542, bvar 545, bvar 113, bvar 116]),
    bnot (bands [bvar 542, bvar 546, bvar 113, bvar 117]),
    bnot (bands [bvar 542, bvar 547, bvar 113, bvar 118]),
    bnot (bands [bvar 543, bvar 545, bvar 114, bvar 116]),
    bnot (bands [bvar 544, bvar 545, bvar 115, bvar 116]),
    bnot (bands [bvar 544, bvar 547, bvar 115, bvar 118]),
    bnot (bands [bvar 545, bvar 546, bvar 116, bvar 117]),
    bnot (bands [bvar 29, bvar 33, bvar 627, bvar 631]),
    bnot (bands [bvar 29, bvar 34, bvar 627, bvar 632]),
    bnot (bands [bvar 30, bvar 33, bvar 628, bvar 631]),
    bnot (bands [bvar 30, bvar 34, bvar 628, bvar 632]),
    bnot (bands [bvar 31, bvar 33, bvar 629, bvar 631]),
    bnot (bands [bvar 31, bvar 34, bvar 629, bvar 632]),
    bnot (bands [bvar 32, bvar 33, bvar 630, bvar 631]),
    bnot (bands [bvar 32, bvar 34, bvar 630, bvar 632]),
    bnot (bands [bvar 33, bvar 34, bvar 631, bvar 632]),
    bnot (bands [bvar 38, bvar 40, bvar 636, bvar 638]),
    bnot (bands [bvar 537, bvar 541, bvar 121, bvar 125]),
    bnot (bands [bvar 29, bvar 33, bvar 640, bvar 644]),
    bnot (bands [bvar 30, bvar 33, bvar 641, bvar 644]),
    bnot (bands [bvar 538, bvar 539, bvar 135, bvar 136]),
    bnot (bands [bvar 538, bvar 541, bvar 135, bvar 138]),
    bnot (bands [bvar 538, bvar 542, bvar 135, bvar 139]),
    bnot (bands [bvar 539, bvar 541, bvar 136, bvar 138]),
    bnot (bands [bvar 539, bvar 542, bvar 136, bvar 139]),
    bnot (bands [bvar 29, bvar 32, bvar 653, bvar 656]),
    bnot (bands [bvar 29, bvar 33, bvar 653, bvar 657]),
    bnot (bands [bvar 29, bvar 34, bvar 653, bvar 658]),
    bnot (bands [bvar 29, bvar 35, bvar 653, bvar 659]),
    bnot (bands [bvar 29, bvar 36, bvar 653, bvar 660]),
    bnot (bands [bvar 30, bvar 33, bvar 654, bvar 657]) ]

def reducedUnionChunk103 : BVLogicalExpr :=
  bands reducedUnionChunk103Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
