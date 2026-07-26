import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk033Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 172, bvar 175, bvar 185, bvar 188]),
    bnot (bands [bvar 172, bvar 177, bvar 185, bvar 190]),
    bnot (bands [bvar 172, bvar 178, bvar 185, bvar 191]),
    bnot (bands [bvar 172, bvar 179, bvar 185, bvar 192]),
    bnot (bands [bvar 172, bvar 180, bvar 185, bvar 193]),
    bnot (bands [bvar 172, bvar 181, bvar 185, bvar 194]),
    bnot (bands [bvar 173, bvar 175, bvar 186, bvar 188]),
    bnot (bands [bvar 173, bvar 177, bvar 186, bvar 190]),
    bnot (bands [bvar 173, bvar 178, bvar 186, bvar 191]),
    bnot (bands [bvar 173, bvar 179, bvar 186, bvar 192]),
    bnot (bands [bvar 173, bvar 180, bvar 186, bvar 193]),
    bnot (bands [bvar 173, bvar 181, bvar 186, bvar 194]),
    bnot (bands [bvar 174, bvar 175, bvar 187, bvar 188]),
    bnot (bands [bvar 174, bvar 177, bvar 187, bvar 190]),
    bnot (bands [bvar 174, bvar 178, bvar 187, bvar 191]),
    bnot (bands [bvar 174, bvar 179, bvar 187, bvar 192]),
    bnot (bands [bvar 174, bvar 181, bvar 187, bvar 194]),
    bnot (bands [bvar 175, bvar 176, bvar 188, bvar 189]),
    bnot (bands [bvar 175, bvar 177, bvar 188, bvar 190]),
    bnot (bands [bvar 175, bvar 178, bvar 188, bvar 191]),
    bnot (bands [bvar 175, bvar 179, bvar 188, bvar 192]),
    bnot (bands [bvar 175, bvar 180, bvar 188, bvar 193]),
    bnot (bands [bvar 175, bvar 181, bvar 188, bvar 194]),
    bnot (bands [bvar 176, bvar 178, bvar 189, bvar 191]),
    bnot (bands [bvar 176, bvar 179, bvar 189, bvar 192]),
    bnot (bands [bvar 176, bvar 181, bvar 189, bvar 194]),
    bnot (bands [bvar 177, bvar 178, bvar 190, bvar 191]),
    bnot (bands [bvar 177, bvar 179, bvar 190, bvar 192]),
    bnot (bands [bvar 177, bvar 180, bvar 190, bvar 193]),
    bnot (bands [bvar 177, bvar 181, bvar 190, bvar 194]),
    bnot (bands [bvar 178, bvar 179, bvar 191, bvar 192]),
    bnot (bands [bvar 178, bvar 180, bvar 191, bvar 193]),
    bnot (bands [bvar 178, bvar 181, bvar 191, bvar 194]),
    bnot (bands [bvar 179, bvar 180, bvar 192, bvar 193]),
    bnot (bands [bvar 179, bvar 181, bvar 192, bvar 194]),
    atMost [bvar 97, bvar 98, bvar 99, bvar 100, bvar 101] 2,
    atMost [bvar 110, bvar 111, bvar 112, bvar 113, bvar 114] 2,
    atMost [bvar 123, bvar 124, bvar 125, bvar 126, bvar 127] 2,
    atMost [bvar 84, bvar 85, bvar 86, bvar 87, bvar 88] 1,
    atMost [bvar 136, bvar 137, bvar 138, bvar 139, bvar 140] 1,
    atMost [bvar 145, bvar 153, bvar 154, bvar 155, bvar 156, bvar 157] 2,
    atMost [bvar 158, bvar 166, bvar 167, bvar 168, bvar 169, bvar 170] 2,
    atMost [bvar 171, bvar 179, bvar 180, bvar 181, bvar 182, bvar 183] 2,
    atMost [bvar 184, bvar 192, bvar 193, bvar 194, bvar 195, bvar 196] 2,
    atMost [bvar 132, bvar 140, bvar 141, bvar 142, bvar 143, bvar 144] 1,
    atMost [bvar 28, bvar 36, bvar 37, bvar 38, bvar 39, bvar 40] 1,
    bnot (bands [bvar 30, bvar 34, bvar 160, bvar 164]),
    bnot (bands [bvar 32, bvar 33, bvar 162, bvar 163]),
    bnot (bands [bvar 30, bvar 34, bvar 186, bvar 190]),
    bnot (bands [bvar 149, bvar 152, bvar 175, bvar 178]),
    bnot (bands [bvar 162, bvar 164, bvar 175, bvar 177]),
    atMost [bvar 41, bvar 42, bvar 43, bvar 44, bvar 45] 2,
    atMost [bvar 67, bvar 68, bvar 69, bvar 70, bvar 71] 2,
    atMost [bvar 28, bvar 29, bvar 30, bvar 31, bvar 32] 1,
    atMost [bvar 80, bvar 81, bvar 82, bvar 83, bvar 84] 1,
    bnot (bvar 535),
    exactly [bvar 535, bvar 536, bvar 537, bvar 538, bvar 539, bvar 540, bvar 541, bvar 542, bvar 543, bvar 544, bvar 545, bvar 546, bvar 547] 4,
    bnot (bvar 549),
    exactly [bvar 548, bvar 549, bvar 550, bvar 551, bvar 552, bvar 553, bvar 554, bvar 555, bvar 556, bvar 557, bvar 558, bvar 559, bvar 560] 4,
    bnot (bvar 563),
    bnot (bvar 577),
    exactly [bvar 574, bvar 575, bvar 576, bvar 577, bvar 578, bvar 579, bvar 580, bvar 581, bvar 582, bvar 583, bvar 584, bvar 585, bvar 586] 4,
    bnot (bvar 591),
    bnot (bvar 605) ]

def reducedUnionChunk033 : BVLogicalExpr :=
  bands reducedUnionChunk033Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
