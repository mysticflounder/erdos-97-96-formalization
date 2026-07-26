import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk110Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 606, bvar 608, bvar 151, bvar 153]),
    bnot (bands [bvar 607, bvar 608, bvar 152, bvar 153]),
    bnot (bands [bvar 610, bvar 611, bvar 155, bvar 156]),
    bnot (bands [bvar 610, bvar 612, bvar 155, bvar 157]),
    bnot (bands [bvar 611, bvar 612, bvar 156, bvar 157]),
    bnot (bands [bvar 93, bvar 97, bvar 665, bvar 669]),
    bnot (bands [bvar 94, bvar 97, bvar 666, bvar 669]),
    bnot (bands [bvar 95, bvar 97, bvar 667, bvar 669]),
    bnot (bands [bvar 96, bvar 97, bvar 668, bvar 669]),
    bnot (bands [bvar 96, bvar 105, bvar 668, bvar 677]),
    bnot (bands [bvar 97, bvar 104, bvar 669, bvar 676]),
    bnot (bands [bvar 97, bvar 105, bvar 669, bvar 677]),
    bnot (bands [bvar 99, bvar 101, bvar 671, bvar 673]),
    bnot (bands [bvar 99, bvar 102, bvar 671, bvar 674]),
    bnot (bands [bvar 100, bvar 102, bvar 672, bvar 674]),
    bnot (bands [bvar 104, bvar 105, bvar 676, bvar 677]),
    bnot (bands [bvar 600, bvar 601, bvar 158, bvar 159]),
    bnot (bands [bvar 600, bvar 602, bvar 158, bvar 160]),
    bnot (bands [bvar 600, bvar 603, bvar 158, bvar 161]),
    bnot (bands [bvar 600, bvar 604, bvar 158, bvar 162]),
    bnot (bands [bvar 601, bvar 604, bvar 159, bvar 162]),
    bnot (bands [bvar 601, bvar 611, bvar 159, bvar 169]),
    bnot (bands [bvar 602, bvar 604, bvar 160, bvar 162]),
    bnot (bands [bvar 602, bvar 611, bvar 160, bvar 169]),
    bnot (bands [bvar 602, bvar 612, bvar 160, bvar 170]),
    bnot (bands [bvar 603, bvar 604, bvar 161, bvar 162]),
    bnot (bands [bvar 603, bvar 611, bvar 161, bvar 169]),
    bnot (bands [bvar 603, bvar 612, bvar 161, bvar 170]),
    bnot (bands [bvar 604, bvar 611, bvar 162, bvar 169]),
    bnot (bands [bvar 604, bvar 612, bvar 162, bvar 170]),
    bnot (bands [bvar 606, bvar 608, bvar 164, bvar 166]),
    bnot (bands [bvar 606, bvar 609, bvar 164, bvar 167]),
    bnot (bands [bvar 607, bvar 608, bvar 165, bvar 166]),
    bnot (bands [bvar 607, bvar 609, bvar 165, bvar 167]),
    bnot (bands [bvar 608, bvar 609, bvar 166, bvar 167]),
    bnot (bands [bvar 611, bvar 612, bvar 169, bvar 170]),
    bnot (bands [bvar 96, bvar 105, bvar 681, bvar 690]),
    bnot (bands [bvar 97, bvar 105, bvar 682, bvar 690]),
    bnot (bands [bvar 101, bvar 103, bvar 686, bvar 688]),
    atMost [bands [bvar 600, bvar 171], bands [bvar 601, bvar 172], bands [bvar 602, bvar 173], bands [bvar 603, bvar 174], bands [bvar 604, bvar 175], bands [bvar 605, bvar 176], bands [bvar 606, bvar 177], bands [bvar 607, bvar 178], bands [bvar 608, bvar 179], bands [bvar 609, bvar 180], bands [bvar 610, bvar 181], bands [bvar 611, bvar 182], bands [bvar 612, bvar 183]] 2,
    bnot (bands [bvar 600, bvar 601, bvar 171, bvar 172]),
    bnot (bands [bvar 600, bvar 602, bvar 171, bvar 173]),
    bnot (bands [bvar 600, bvar 604, bvar 171, bvar 175]),
    bnot (bands [bvar 600, bvar 612, bvar 171, bvar 183]),
    bnot (bands [bvar 601, bvar 604, bvar 172, bvar 175]),
    bnot (bands [bvar 601, bvar 612, bvar 172, bvar 183]),
    bnot (bands [bvar 602, bvar 604, bvar 173, bvar 175]),
    bnot (bands [bvar 602, bvar 612, bvar 173, bvar 183]),
    bnot (bands [bvar 603, bvar 604, bvar 174, bvar 175]),
    bnot (bands [bvar 603, bvar 612, bvar 174, bvar 183]),
    bnot (bands [bvar 604, bvar 612, bvar 175, bvar 183]),
    bnot (bands [bvar 606, bvar 607, bvar 177, bvar 178]),
    bnot (bands [bvar 606, bvar 608, bvar 177, bvar 179]),
    bnot (bands [bvar 606, bvar 609, bvar 177, bvar 180]),
    bnot (bands [bvar 606, bvar 610, bvar 177, bvar 181]),
    bnot (bands [bvar 607, bvar 608, bvar 178, bvar 179]),
    bnot (bands [bvar 607, bvar 609, bvar 178, bvar 180]),
    bnot (bands [bvar 607, bvar 610, bvar 178, bvar 181]),
    bnot (bands [bvar 608, bvar 609, bvar 179, bvar 180]),
    bnot (bands [bvar 608, bvar 610, bvar 179, bvar 181]),
    bnot (bands [bvar 609, bvar 610, bvar 180, bvar 181]),
    bnot (bands [bvar 600, bvar 601, bvar 184, bvar 185]),
    bnot (bands [bvar 600, bvar 602, bvar 184, bvar 186]),
    bnot (bands [bvar 600, bvar 603, bvar 184, bvar 187]) ]

def reducedUnionChunk110 : BVLogicalExpr :=
  bands reducedUnionChunk110Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
