import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk109Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 97, bvar 103, bvar 643, bvar 649]),
    bnot (bands [bvar 97, bvar 105, bvar 643, bvar 651]),
    bnot (bands [bvar 103, bvar 105, bvar 649, bvar 651]),
    atMost [bands [bvar 600, bvar 132], bands [bvar 601, bvar 133], bands [bvar 602, bvar 134], bands [bvar 603, bvar 135], bands [bvar 604, bvar 136], bands [bvar 605, bvar 137], bands [bvar 606, bvar 138], bands [bvar 607, bvar 139], bands [bvar 608, bvar 140], bands [bvar 609, bvar 141], bands [bvar 610, bvar 142], bands [bvar 611, bvar 143], bands [bvar 612, bvar 144]] 2,
    bnot (bands [bvar 600, bvar 603, bvar 132, bvar 135]),
    bnot (bands [bvar 600, bvar 604, bvar 132, bvar 136]),
    bnot (bands [bvar 600, bvar 609, bvar 132, bvar 141]),
    bnot (bands [bvar 600, bvar 610, bvar 132, bvar 142]),
    bnot (bands [bvar 600, bvar 611, bvar 132, bvar 143]),
    bnot (bands [bvar 602, bvar 609, bvar 134, bvar 141]),
    bnot (bands [bvar 603, bvar 604, bvar 135, bvar 136]),
    bnot (bands [bvar 603, bvar 609, bvar 135, bvar 141]),
    bnot (bands [bvar 603, bvar 610, bvar 135, bvar 142]),
    bnot (bands [bvar 603, bvar 611, bvar 135, bvar 143]),
    bnot (bands [bvar 603, bvar 612, bvar 135, bvar 144]),
    bnot (bands [bvar 604, bvar 609, bvar 136, bvar 141]),
    bnot (bands [bvar 604, bvar 610, bvar 136, bvar 142]),
    bnot (bands [bvar 604, bvar 611, bvar 136, bvar 143]),
    bnot (bands [bvar 604, bvar 612, bvar 136, bvar 144]),
    bnot (bands [bvar 606, bvar 607, bvar 138, bvar 139]),
    bnot (bands [bvar 93, bvar 95, bvar 652, bvar 654]),
    bnot (bands [bvar 93, bvar 96, bvar 652, bvar 655]),
    bnot (bands [bvar 93, bvar 97, bvar 652, bvar 656]),
    bnot (bands [bvar 93, bvar 103, bvar 652, bvar 662]),
    bnot (bands [bvar 93, bvar 104, bvar 652, bvar 663]),
    bnot (bands [bvar 93, bvar 105, bvar 652, bvar 664]),
    bnot (bands [bvar 94, bvar 97, bvar 653, bvar 656]),
    bnot (bands [bvar 94, bvar 104, bvar 653, bvar 663]),
    bnot (bands [bvar 94, bvar 105, bvar 653, bvar 664]),
    bnot (bands [bvar 95, bvar 97, bvar 654, bvar 656]),
    bnot (bands [bvar 95, bvar 104, bvar 654, bvar 663]),
    bnot (bands [bvar 95, bvar 105, bvar 654, bvar 664]),
    bnot (bands [bvar 96, bvar 97, bvar 655, bvar 656]),
    bnot (bands [bvar 96, bvar 104, bvar 655, bvar 663]),
    bnot (bands [bvar 96, bvar 105, bvar 655, bvar 664]),
    bnot (bands [bvar 97, bvar 103, bvar 656, bvar 662]),
    bnot (bands [bvar 97, bvar 104, bvar 656, bvar 663]),
    bnot (bands [bvar 97, bvar 105, bvar 656, bvar 664]),
    bnot (bands [bvar 99, bvar 100, bvar 658, bvar 659]),
    bnot (bands [bvar 99, bvar 101, bvar 658, bvar 660]),
    bnot (bands [bvar 100, bvar 101, bvar 659, bvar 660]),
    bnot (bands [bvar 103, bvar 104, bvar 662, bvar 663]),
    bnot (bands [bvar 103, bvar 105, bvar 662, bvar 664]),
    bnot (bands [bvar 104, bvar 105, bvar 663, bvar 664]),
    bnot (bands [bvar 600, bvar 601, bvar 145, bvar 146]),
    bnot (bands [bvar 600, bvar 602, bvar 145, bvar 147]),
    bnot (bands [bvar 600, bvar 603, bvar 145, bvar 148]),
    bnot (bands [bvar 600, bvar 604, bvar 145, bvar 149]),
    bnot (bands [bvar 600, bvar 610, bvar 145, bvar 155]),
    bnot (bands [bvar 600, bvar 611, bvar 145, bvar 156]),
    bnot (bands [bvar 600, bvar 612, bvar 145, bvar 157]),
    bnot (bands [bvar 601, bvar 604, bvar 146, bvar 149]),
    bnot (bands [bvar 601, bvar 610, bvar 146, bvar 155]),
    bnot (bands [bvar 602, bvar 604, bvar 147, bvar 149]),
    bnot (bands [bvar 602, bvar 610, bvar 147, bvar 155]),
    bnot (bands [bvar 602, bvar 611, bvar 147, bvar 156]),
    bnot (bands [bvar 603, bvar 604, bvar 148, bvar 149]),
    bnot (bands [bvar 603, bvar 610, bvar 148, bvar 155]),
    bnot (bands [bvar 603, bvar 611, bvar 148, bvar 156]),
    bnot (bands [bvar 603, bvar 612, bvar 148, bvar 157]),
    bnot (bands [bvar 604, bvar 610, bvar 149, bvar 155]),
    bnot (bands [bvar 604, bvar 611, bvar 149, bvar 156]),
    bnot (bands [bvar 604, bvar 612, bvar 149, bvar 157]),
    bnot (bands [bvar 606, bvar 607, bvar 151, bvar 152]) ]

def reducedUnionChunk109 : BVLogicalExpr :=
  bands reducedUnionChunk109Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
