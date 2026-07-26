import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk119Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 654, bvar 660, bvar 173, bvar 179]),
    bnot (bands [bvar 654, bvar 664, bvar 173, bvar 183]),
    bnot (bands [bvar 655, bvar 656, bvar 174, bvar 175]),
    bnot (bands [bvar 655, bvar 658, bvar 174, bvar 177]),
    bnot (bands [bvar 655, bvar 659, bvar 174, bvar 178]),
    bnot (bands [bvar 656, bvar 657, bvar 175, bvar 176]),
    bnot (bands [bvar 656, bvar 658, bvar 175, bvar 177]),
    bnot (bands [bvar 656, bvar 659, bvar 175, bvar 178]),
    bnot (bands [bvar 656, bvar 660, bvar 175, bvar 179]),
    bnot (bands [bvar 656, bvar 664, bvar 175, bvar 183]),
    bnot (bands [bvar 658, bvar 659, bvar 177, bvar 178]),
    bnot (bands [bvar 658, bvar 660, bvar 177, bvar 179]),
    bnot (bands [bvar 658, bvar 664, bvar 177, bvar 183]),
    bnot (bands [bvar 659, bvar 660, bvar 178, bvar 179]),
    bnot (bands [bvar 659, bvar 664, bvar 178, bvar 183]),
    bnot (bands [bvar 660, bvar 664, bvar 179, bvar 183]),
    atMost [bands [bvar 145, bvar 691], bands [bvar 146, bvar 692], bands [bvar 147, bvar 693], bands [bvar 148, bvar 694], bands [bvar 149, bvar 695], bands [bvar 150, bvar 696], bands [bvar 151, bvar 697], bands [bvar 152, bvar 698], bands [bvar 153, bvar 699], bands [bvar 154, bvar 700], bands [bvar 155, bvar 701], bands [bvar 156, bvar 702], bands [bvar 157, bvar 703]] 2,
    bnot (bands [bvar 145, bvar 146, bvar 691, bvar 692]),
    bnot (bands [bvar 145, bvar 147, bvar 691, bvar 693]),
    bnot (bands [bvar 145, bvar 148, bvar 691, bvar 694]),
    bnot (bands [bvar 145, bvar 149, bvar 691, bvar 695]),
    bnot (bands [bvar 145, bvar 150, bvar 691, bvar 696]),
    bnot (bands [bvar 145, bvar 151, bvar 691, bvar 697]),
    bnot (bands [bvar 145, bvar 152, bvar 691, bvar 698]),
    bnot (bands [bvar 145, bvar 153, bvar 691, bvar 699]),
    bnot (bands [bvar 146, bvar 149, bvar 692, bvar 695]),
    bnot (bands [bvar 146, bvar 150, bvar 692, bvar 696]),
    bnot (bands [bvar 146, bvar 151, bvar 692, bvar 697]),
    bnot (bands [bvar 146, bvar 152, bvar 692, bvar 698]),
    bnot (bands [bvar 146, bvar 153, bvar 692, bvar 699]),
    bnot (bands [bvar 147, bvar 149, bvar 693, bvar 695]),
    bnot (bands [bvar 147, bvar 150, bvar 693, bvar 696]),
    bnot (bands [bvar 147, bvar 151, bvar 693, bvar 697]),
    bnot (bands [bvar 147, bvar 152, bvar 693, bvar 698]),
    bnot (bands [bvar 147, bvar 153, bvar 693, bvar 699]),
    bnot (bands [bvar 148, bvar 149, bvar 694, bvar 695]),
    bnot (bands [bvar 148, bvar 150, bvar 694, bvar 696]),
    bnot (bands [bvar 148, bvar 151, bvar 694, bvar 697]),
    bnot (bands [bvar 148, bvar 152, bvar 694, bvar 698]),
    bnot (bands [bvar 148, bvar 153, bvar 694, bvar 699]),
    bnot (bands [bvar 149, bvar 150, bvar 695, bvar 696]),
    bnot (bands [bvar 149, bvar 151, bvar 695, bvar 697]),
    bnot (bands [bvar 149, bvar 152, bvar 695, bvar 698]),
    bnot (bands [bvar 149, bvar 153, bvar 695, bvar 699]),
    bnot (bands [bvar 150, bvar 151, bvar 696, bvar 697]),
    bnot (bands [bvar 150, bvar 152, bvar 696, bvar 698]),
    bnot (bands [bvar 150, bvar 153, bvar 696, bvar 699]),
    bnot (bands [bvar 151, bvar 152, bvar 697, bvar 698]),
    bnot (bands [bvar 151, bvar 153, bvar 697, bvar 699]),
    bnot (bands [bvar 152, bvar 153, bvar 698, bvar 699]),
    bnot (bands [bvar 155, bvar 156, bvar 701, bvar 702]),
    atMost [bands [bvar 652, bvar 184], bands [bvar 653, bvar 185], bands [bvar 654, bvar 186], bands [bvar 655, bvar 187], bands [bvar 656, bvar 188], bands [bvar 657, bvar 189], bands [bvar 658, bvar 190], bands [bvar 659, bvar 191], bands [bvar 660, bvar 192], bands [bvar 661, bvar 193], bands [bvar 662, bvar 194], bands [bvar 663, bvar 195], bands [bvar 664, bvar 196]] 2,
    bnot (bands [bvar 652, bvar 653, bvar 184, bvar 185]),
    bnot (bands [bvar 652, bvar 654, bvar 184, bvar 186]),
    bnot (bands [bvar 652, bvar 656, bvar 184, bvar 188]),
    bnot (bands [bvar 652, bvar 657, bvar 184, bvar 189]),
    bnot (bands [bvar 652, bvar 658, bvar 184, bvar 190]),
    bnot (bands [bvar 652, bvar 659, bvar 184, bvar 191]),
    bnot (bands [bvar 652, bvar 660, bvar 184, bvar 192]),
    bnot (bands [bvar 653, bvar 656, bvar 185, bvar 188]),
    bnot (bands [bvar 653, bvar 657, bvar 185, bvar 189]),
    bnot (bands [bvar 653, bvar 658, bvar 185, bvar 190]),
    bnot (bands [bvar 653, bvar 659, bvar 185, bvar 191]),
    bnot (bands [bvar 653, bvar 660, bvar 185, bvar 192]) ]

def reducedUnionChunk119 : BVLogicalExpr :=
  bands reducedUnionChunk119Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
