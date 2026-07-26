import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk113Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 613, bvar 617, bvar 171, bvar 175]),
    bnot (bands [bvar 614, bvar 617, bvar 172, bvar 175]),
    bnot (bands [bvar 615, bvar 617, bvar 173, bvar 175]),
    bnot (bands [bvar 616, bvar 617, bvar 174, bvar 175]),
    bnot (bands [bvar 617, bvar 625, bvar 175, bvar 183]),
    bnot (bands [bvar 620, bvar 621, bvar 178, bvar 179]),
    bnot (bands [bvar 620, bvar 623, bvar 178, bvar 181]),
    bnot (bands [bvar 621, bvar 622, bvar 179, bvar 180]),
    bnot (bands [bvar 621, bvar 623, bvar 179, bvar 181]),
    bnot (bands [bvar 613, bvar 617, bvar 184, bvar 188]),
    bnot (bands [bvar 614, bvar 617, bvar 185, bvar 188]),
    bnot (bands [bvar 615, bvar 617, bvar 186, bvar 188]),
    bnot (bands [bvar 616, bvar 617, bvar 187, bvar 188]),
    bnot (bands [bvar 620, bvar 624, bvar 191, bvar 195]),
    bnot (bands [bvar 621, bvar 622, bvar 192, bvar 193]),
    bnot (bands [bvar 621, bvar 623, bvar 192, bvar 194]),
    bnot (bands [bvar 621, bvar 624, bvar 192, bvar 195]),
    bnot (bands [bvar 622, bvar 623, bvar 193, bvar 194]),
    bnot (bands [bvar 622, bvar 624, bvar 193, bvar 195]),
    bnot (bands [bvar 119, bvar 123, bvar 639, bvar 643]),
    bnot (bands [bvar 123, bvar 129, bvar 643, bvar 649]),
    bnot (bands [bvar 626, bvar 627, bvar 132, bvar 133]),
    bnot (bands [bvar 626, bvar 628, bvar 132, bvar 134]),
    bnot (bands [bvar 626, bvar 629, bvar 132, bvar 135]),
    bnot (bands [bvar 626, bvar 630, bvar 132, bvar 136]),
    bnot (bands [bvar 626, bvar 631, bvar 132, bvar 137]),
    bnot (bands [bvar 626, bvar 636, bvar 132, bvar 142]),
    bnot (bands [bvar 627, bvar 631, bvar 133, bvar 137]),
    bnot (bands [bvar 628, bvar 631, bvar 134, bvar 137]),
    bnot (bands [bvar 629, bvar 630, bvar 135, bvar 136]),
    bnot (bands [bvar 629, bvar 631, bvar 135, bvar 137]),
    bnot (bands [bvar 629, bvar 636, bvar 135, bvar 142]),
    bnot (bands [bvar 629, bvar 637, bvar 135, bvar 143]),
    bnot (bands [bvar 629, bvar 638, bvar 135, bvar 144]),
    bnot (bands [bvar 630, bvar 635, bvar 136, bvar 141]),
    bnot (bands [bvar 630, bvar 636, bvar 136, bvar 142]),
    bnot (bands [bvar 630, bvar 637, bvar 136, bvar 143]),
    bnot (bands [bvar 631, bvar 635, bvar 137, bvar 141]),
    bnot (bands [bvar 631, bvar 636, bvar 137, bvar 142]),
    bnot (bands [bvar 631, bvar 637, bvar 137, bvar 143]),
    bnot (bands [bvar 631, bvar 638, bvar 137, bvar 144]),
    bnot (bands [bvar 626, bvar 630, bvar 145, bvar 149]),
    bnot (bands [bvar 626, bvar 632, bvar 145, bvar 151]),
    bnot (bands [bvar 626, bvar 636, bvar 145, bvar 155]),
    bnot (bands [bvar 626, bvar 637, bvar 145, bvar 156]),
    bnot (bands [bvar 626, bvar 638, bvar 145, bvar 157]),
    bnot (bands [bvar 627, bvar 630, bvar 146, bvar 149]),
    bnot (bands [bvar 628, bvar 630, bvar 147, bvar 149]),
    bnot (bands [bvar 628, bvar 636, bvar 147, bvar 155]),
    bnot (bands [bvar 628, bvar 637, bvar 147, bvar 156]),
    bnot (bands [bvar 630, bvar 632, bvar 149, bvar 151]),
    bnot (bands [bvar 630, bvar 636, bvar 149, bvar 155]),
    bnot (bands [bvar 630, bvar 637, bvar 149, bvar 156]),
    bnot (bands [bvar 630, bvar 638, bvar 149, bvar 157]),
    bnot (bands [bvar 632, bvar 636, bvar 151, bvar 155]),
    bnot (bands [bvar 632, bvar 637, bvar 151, bvar 156]),
    bnot (bands [bvar 632, bvar 638, bvar 151, bvar 157]),
    bnot (bands [bvar 636, bvar 637, bvar 155, bvar 156]),
    bnot (bands [bvar 636, bvar 638, bvar 155, bvar 157]),
    bnot (bands [bvar 626, bvar 632, bvar 158, bvar 164]),
    bnot (bands [bvar 626, bvar 638, bvar 158, bvar 170]),
    bnot (bands [bvar 627, bvar 630, bvar 159, bvar 162]),
    bnot (bands [bvar 629, bvar 631, bvar 161, bvar 163]),
    bnot (bands [bvar 630, bvar 631, bvar 162, bvar 163]) ]

def reducedUnionChunk113 : BVLogicalExpr :=
  bands reducedUnionChunk113Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
