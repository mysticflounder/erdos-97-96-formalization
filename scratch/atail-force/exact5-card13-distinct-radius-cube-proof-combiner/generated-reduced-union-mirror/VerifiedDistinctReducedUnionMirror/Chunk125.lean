import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk125Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 148, bvar 152, bvar 681, bvar 685]),
    bnot (bands [bvar 149, bvar 150, bvar 682, bvar 683]),
    bnot (bands [bvar 149, bvar 151, bvar 682, bvar 684]),
    bnot (bands [bvar 149, bvar 152, bvar 682, bvar 685]),
    bnot (bands [bvar 149, bvar 153, bvar 682, bvar 686]),
    bnot (bands [bvar 149, bvar 157, bvar 682, bvar 690]),
    bnot (bands [bvar 150, bvar 151, bvar 683, bvar 684]),
    bnot (bands [bvar 150, bvar 152, bvar 683, bvar 685]),
    bnot (bands [bvar 150, bvar 153, bvar 683, bvar 686]),
    bnot (bands [bvar 150, bvar 157, bvar 683, bvar 690]),
    bnot (bands [bvar 151, bvar 152, bvar 684, bvar 685]),
    bnot (bands [bvar 151, bvar 153, bvar 684, bvar 686]),
    bnot (bands [bvar 151, bvar 157, bvar 684, bvar 690]),
    bnot (bands [bvar 152, bvar 153, bvar 685, bvar 686]),
    bnot (bands [bvar 152, bvar 157, bvar 685, bvar 690]),
    bnot (bands [bvar 153, bvar 157, bvar 686, bvar 690]),
    atMost [bands [bvar 652, bvar 171], bands [bvar 653, bvar 172], bands [bvar 654, bvar 173], bands [bvar 655, bvar 174], bands [bvar 656, bvar 175], bands [bvar 657, bvar 176], bands [bvar 658, bvar 177], bands [bvar 659, bvar 178], bands [bvar 660, bvar 179], bands [bvar 661, bvar 180], bands [bvar 662, bvar 181], bands [bvar 663, bvar 182], bands [bvar 664, bvar 183]] 2,
    bnot (bands [bvar 652, bvar 653, bvar 171, bvar 172]),
    bnot (bands [bvar 652, bvar 654, bvar 171, bvar 173]),
    bnot (bands [bvar 652, bvar 655, bvar 171, bvar 174]),
    bnot (bands [bvar 652, bvar 656, bvar 171, bvar 175]),
    bnot (bands [bvar 652, bvar 657, bvar 171, bvar 176]),
    bnot (bands [bvar 652, bvar 658, bvar 171, bvar 177]),
    bnot (bands [bvar 652, bvar 659, bvar 171, bvar 178]),
    bnot (bands [bvar 652, bvar 660, bvar 171, bvar 179]),
    bnot (bands [bvar 652, bvar 664, bvar 171, bvar 183]),
    bnot (bands [bvar 653, bvar 656, bvar 172, bvar 175]),
    bnot (bands [bvar 653, bvar 657, bvar 172, bvar 176]),
    bnot (bands [bvar 653, bvar 658, bvar 172, bvar 177]),
    bnot (bands [bvar 653, bvar 659, bvar 172, bvar 178]),
    bnot (bands [bvar 653, bvar 660, bvar 172, bvar 179]),
    bnot (bands [bvar 653, bvar 664, bvar 172, bvar 183]),
    bnot (bands [bvar 654, bvar 656, bvar 173, bvar 175]),
    bnot (bands [bvar 654, bvar 657, bvar 173, bvar 176]),
    bnot (bands [bvar 654, bvar 658, bvar 173, bvar 177]),
    bnot (bands [bvar 654, bvar 659, bvar 173, bvar 178]),
    bnot (bands [bvar 654, bvar 660, bvar 173, bvar 179]),
    bnot (bands [bvar 654, bvar 664, bvar 173, bvar 183]),
    bnot (bands [bvar 655, bvar 656, bvar 174, bvar 175]),
    bnot (bands [bvar 655, bvar 657, bvar 174, bvar 176]),
    bnot (bands [bvar 655, bvar 658, bvar 174, bvar 177]),
    bnot (bands [bvar 655, bvar 660, bvar 174, bvar 179]),
    bnot (bands [bvar 655, bvar 664, bvar 174, bvar 183]),
    bnot (bands [bvar 656, bvar 657, bvar 175, bvar 176]),
    bnot (bands [bvar 656, bvar 658, bvar 175, bvar 177]),
    bnot (bands [bvar 656, bvar 659, bvar 175, bvar 178]),
    bnot (bands [bvar 656, bvar 660, bvar 175, bvar 179]),
    bnot (bands [bvar 656, bvar 664, bvar 175, bvar 183]),
    bnot (bands [bvar 657, bvar 658, bvar 176, bvar 177]),
    bnot (bands [bvar 657, bvar 659, bvar 176, bvar 178]),
    bnot (bands [bvar 657, bvar 660, bvar 176, bvar 179]),
    bnot (bands [bvar 657, bvar 664, bvar 176, bvar 183]),
    bnot (bands [bvar 658, bvar 659, bvar 177, bvar 178]),
    bnot (bands [bvar 658, bvar 660, bvar 177, bvar 179]),
    bnot (bands [bvar 658, bvar 664, bvar 177, bvar 183]),
    bnot (bands [bvar 659, bvar 660, bvar 178, bvar 179]),
    bnot (bands [bvar 659, bvar 664, bvar 178, bvar 183]),
    bnot (bands [bvar 660, bvar 664, bvar 179, bvar 183]),
    bnot (bands [bvar 145, bvar 146, bvar 691, bvar 692]),
    bnot (bands [bvar 145, bvar 147, bvar 691, bvar 693]),
    bnot (bands [bvar 145, bvar 148, bvar 691, bvar 694]),
    bnot (bands [bvar 145, bvar 149, bvar 691, bvar 695]),
    bnot (bands [bvar 145, bvar 151, bvar 691, bvar 697]),
    bnot (bands [bvar 145, bvar 152, bvar 691, bvar 698]) ]

def reducedUnionChunk125 : BVLogicalExpr :=
  bands reducedUnionChunk125Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
