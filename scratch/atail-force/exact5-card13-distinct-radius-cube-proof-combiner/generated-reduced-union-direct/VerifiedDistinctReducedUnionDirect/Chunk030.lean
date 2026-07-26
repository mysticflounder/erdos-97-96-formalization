import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk030Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 125, bvar 129, bvar 151, bvar 155]),
    bnot (bands [bvar 125, bvar 130, bvar 151, bvar 156]),
    bnot (bands [bvar 125, bvar 131, bvar 151, bvar 157]),
    bnot (bands [bvar 129, bvar 130, bvar 155, bvar 156]),
    bnot (bands [bvar 129, bvar 131, bvar 155, bvar 157]),
    bnot (bands [bvar 130, bvar 131, bvar 156, bvar 157]),
    bnot (bands [bvar 132, bvar 133, bvar 145, bvar 146]),
    bnot (bands [bvar 132, bvar 134, bvar 145, bvar 147]),
    bnot (bands [bvar 132, bvar 135, bvar 145, bvar 148]),
    bnot (bands [bvar 132, bvar 136, bvar 145, bvar 149]),
    bnot (bands [bvar 132, bvar 137, bvar 145, bvar 150]),
    bnot (bands [bvar 132, bvar 138, bvar 145, bvar 151]),
    bnot (bands [bvar 132, bvar 143, bvar 145, bvar 156]),
    bnot (bands [bvar 135, bvar 136, bvar 148, bvar 149]),
    bnot (bands [bvar 135, bvar 137, bvar 148, bvar 150]),
    bnot (bands [bvar 135, bvar 138, bvar 148, bvar 151]),
    bnot (bands [bvar 135, bvar 142, bvar 148, bvar 155]),
    bnot (bands [bvar 135, bvar 143, bvar 148, bvar 156]),
    bnot (bands [bvar 135, bvar 144, bvar 148, bvar 157]),
    bnot (bands [bvar 136, bvar 138, bvar 149, bvar 151]),
    bnot (bands [bvar 136, bvar 142, bvar 149, bvar 155]),
    bnot (bands [bvar 136, bvar 143, bvar 149, bvar 156]),
    bnot (bands [bvar 136, bvar 144, bvar 149, bvar 157]),
    bnot (bands [bvar 137, bvar 142, bvar 150, bvar 155]),
    bnot (bands [bvar 137, bvar 143, bvar 150, bvar 156]),
    bnot (bands [bvar 137, bvar 144, bvar 150, bvar 157]),
    bnot (bands [bvar 138, bvar 142, bvar 151, bvar 155]),
    bnot (bands [bvar 138, bvar 143, bvar 151, bvar 156]),
    bnot (bands [bvar 138, bvar 144, bvar 151, bvar 157]),
    bnot (bands [bvar 143, bvar 144, bvar 156, bvar 157]),
    bnot (bands [bvar 132, bvar 135, bvar 158, bvar 161]),
    bnot (bands [bvar 132, bvar 136, bvar 158, bvar 162]),
    bnot (bands [bvar 132, bvar 137, bvar 158, bvar 163]),
    bnot (bands [bvar 132, bvar 138, bvar 158, bvar 164]),
    bnot (bands [bvar 132, bvar 139, bvar 158, bvar 165]),
    bnot (bands [bvar 133, bvar 136, bvar 159, bvar 162]),
    bnot (bands [bvar 133, bvar 137, bvar 159, bvar 163]),
    bnot (bands [bvar 135, bvar 136, bvar 161, bvar 162]),
    bnot (bands [bvar 135, bvar 138, bvar 161, bvar 164]),
    bnot (bands [bvar 135, bvar 139, bvar 161, bvar 165]),
    bnot (bands [bvar 135, bvar 143, bvar 161, bvar 169]),
    bnot (bands [bvar 135, bvar 144, bvar 161, bvar 170]),
    bnot (bands [bvar 136, bvar 138, bvar 162, bvar 164]),
    bnot (bands [bvar 136, bvar 143, bvar 162, bvar 169]),
    bnot (bands [bvar 136, bvar 144, bvar 162, bvar 170]),
    bnot (bands [bvar 138, bvar 143, bvar 164, bvar 169]),
    bnot (bands [bvar 138, bvar 144, bvar 164, bvar 170]),
    bnot (bands [bvar 139, bvar 143, bvar 165, bvar 169]),
    bnot (bands [bvar 132, bvar 133, bvar 171, bvar 172]),
    bnot (bands [bvar 132, bvar 135, bvar 171, bvar 174]),
    bnot (bands [bvar 132, bvar 136, bvar 171, bvar 175]),
    bnot (bands [bvar 132, bvar 137, bvar 171, bvar 176]),
    bnot (bands [bvar 132, bvar 138, bvar 171, bvar 177]),
    bnot (bands [bvar 132, bvar 139, bvar 171, bvar 178]),
    bnot (bands [bvar 135, bvar 136, bvar 174, bvar 175]),
    bnot (bands [bvar 135, bvar 138, bvar 174, bvar 177]),
    bnot (bands [bvar 135, bvar 139, bvar 174, bvar 178]),
    bnot (bands [bvar 135, bvar 144, bvar 174, bvar 183]),
    bnot (bands [bvar 136, bvar 138, bvar 175, bvar 177]),
    bnot (bands [bvar 136, bvar 139, bvar 175, bvar 178]),
    bnot (bands [bvar 136, bvar 144, bvar 175, bvar 183]),
    bnot (bands [bvar 137, bvar 144, bvar 176, bvar 183]),
    bnot (bands [bvar 132, bvar 135, bvar 184, bvar 187]),
    bnot (bands [bvar 132, bvar 137, bvar 184, bvar 189]) ]

def reducedUnionChunk030 : BVLogicalExpr :=
  bands reducedUnionChunk030Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
