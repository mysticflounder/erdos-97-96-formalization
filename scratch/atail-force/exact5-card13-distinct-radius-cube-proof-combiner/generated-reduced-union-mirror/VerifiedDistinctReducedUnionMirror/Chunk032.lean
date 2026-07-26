import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk032Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 173, bvar 179, bvar 186, bvar 192]),
    bnot (bands [bvar 173, bvar 180, bvar 186, bvar 193]),
    bnot (bands [bvar 173, bvar 181, bvar 186, bvar 194]),
    bnot (bands [bvar 174, bvar 175, bvar 187, bvar 188]),
    bnot (bands [bvar 174, bvar 176, bvar 187, bvar 189]),
    bnot (bands [bvar 174, bvar 177, bvar 187, bvar 190]),
    bnot (bands [bvar 174, bvar 179, bvar 187, bvar 192]),
    bnot (bands [bvar 174, bvar 180, bvar 187, bvar 193]),
    bnot (bands [bvar 174, bvar 181, bvar 187, bvar 194]),
    bnot (bands [bvar 175, bvar 176, bvar 188, bvar 189]),
    bnot (bands [bvar 175, bvar 177, bvar 188, bvar 190]),
    bnot (bands [bvar 175, bvar 178, bvar 188, bvar 191]),
    bnot (bands [bvar 175, bvar 179, bvar 188, bvar 192]),
    bnot (bands [bvar 175, bvar 180, bvar 188, bvar 193]),
    bnot (bands [bvar 175, bvar 181, bvar 188, bvar 194]),
    bnot (bands [bvar 176, bvar 177, bvar 189, bvar 190]),
    bnot (bands [bvar 176, bvar 178, bvar 189, bvar 191]),
    bnot (bands [bvar 176, bvar 179, bvar 189, bvar 192]),
    bnot (bands [bvar 176, bvar 180, bvar 189, bvar 193]),
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
    atMost [bvar 136, bvar 137, bvar 138, bvar 139, bvar 140] 1,
    atMost [bvar 145, bvar 153, bvar 154, bvar 155, bvar 156, bvar 157] 2,
    atMost [bvar 158, bvar 166, bvar 167, bvar 168, bvar 169, bvar 170] 2,
    atMost [bvar 171, bvar 179, bvar 180, bvar 181, bvar 182, bvar 183] 2,
    atMost [bvar 184, bvar 192, bvar 193, bvar 194, bvar 195, bvar 196] 2,
    atMost [bvar 132, bvar 140, bvar 141, bvar 142, bvar 143, bvar 144] 1,
    atMost [bvar 28, bvar 36, bvar 37, bvar 38, bvar 39, bvar 40] 1,
    atMost [bvar 28, bvar 29, bvar 30, bvar 31, bvar 32] 2,
    atMost [bvar 41, bvar 42, bvar 43, bvar 44, bvar 45] 2,
    atMost [bvar 67, bvar 68, bvar 69, bvar 70, bvar 71] 2,
    atMost [bvar 28, bvar 29, bvar 30, bvar 31, bvar 32] 1,
    bnot (bands [bvar 34, bvar 40, bvar 73, bvar 79]),
    bnot (bvar 535),
    exactly [bvar 535, bvar 536, bvar 537, bvar 538, bvar 539, bvar 540, bvar 541, bvar 542, bvar 543, bvar 544, bvar 545, bvar 546, bvar 547] 4,
    bnot (bvar 549),
    exactly [bvar 548, bvar 549, bvar 550, bvar 551, bvar 552, bvar 553, bvar 554, bvar 555, bvar 556, bvar 557, bvar 558, bvar 559, bvar 560] 4,
    bnot (bvar 563),
    bnot (bvar 577),
    exactly [bvar 574, bvar 575, bvar 576, bvar 577, bvar 578, bvar 579, bvar 580, bvar 581, bvar 582, bvar 583, bvar 584, bvar 585, bvar 586] 4,
    bnot (bvar 591),
    bnot (bvar 605),
    exactly [bvar 600, bvar 601, bvar 602, bvar 603, bvar 604, bvar 605, bvar 606, bvar 607, bvar 608, bvar 609, bvar 610, bvar 611, bvar 612] 4,
    bnot (bvar 619),
    exactly [bvar 613, bvar 614, bvar 615, bvar 616, bvar 617, bvar 618, bvar 619, bvar 620, bvar 621, bvar 622, bvar 623, bvar 624, bvar 625] 4,
    bnot (bvar 633),
    exactly [bvar 626, bvar 627, bvar 628, bvar 629, bvar 630, bvar 631, bvar 632, bvar 633, bvar 634, bvar 635, bvar 636, bvar 637, bvar 638] 4,
    bnot (bvar 647),
    exactly [bvar 639, bvar 640, bvar 641, bvar 642, bvar 643, bvar 644, bvar 645, bvar 646, bvar 647, bvar 648, bvar 649, bvar 650, bvar 651] 4,
    bnot (bvar 661),
    exactly [bvar 652, bvar 653, bvar 654, bvar 655, bvar 656, bvar 657, bvar 658, bvar 659, bvar 660, bvar 661, bvar 662, bvar 663, bvar 664] 4,
    bnot (bvar 675),
    exactly [bvar 665, bvar 666, bvar 667, bvar 668, bvar 669, bvar 670, bvar 671, bvar 672, bvar 673, bvar 674, bvar 675, bvar 676, bvar 677] 4 ]

def reducedUnionChunk032 : BVLogicalExpr :=
  bands reducedUnionChunk032Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
