import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk030Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 150, bvar 152, bvar 176, bvar 178]),
    bnot (bands [bvar 150, bvar 153, bvar 176, bvar 179]),
    bnot (bands [bvar 150, bvar 157, bvar 176, bvar 183]),
    bnot (bands [bvar 151, bvar 152, bvar 177, bvar 178]),
    bnot (bands [bvar 151, bvar 153, bvar 177, bvar 179]),
    bnot (bands [bvar 151, bvar 157, bvar 177, bvar 183]),
    bnot (bands [bvar 152, bvar 153, bvar 178, bvar 179]),
    bnot (bands [bvar 152, bvar 157, bvar 178, bvar 183]),
    bnot (bands [bvar 146, bvar 149, bvar 185, bvar 188]),
    bnot (bands [bvar 146, bvar 151, bvar 185, bvar 190]),
    bnot (bands [bvar 147, bvar 149, bvar 186, bvar 188]),
    bnot (bands [bvar 147, bvar 151, bvar 186, bvar 190]),
    bnot (bands [bvar 148, bvar 149, bvar 187, bvar 188]),
    bnot (bands [bvar 148, bvar 152, bvar 187, bvar 191]),
    bnot (bands [bvar 149, bvar 150, bvar 188, bvar 189]),
    bnot (bands [bvar 149, bvar 151, bvar 188, bvar 190]),
    bnot (bands [bvar 149, bvar 152, bvar 188, bvar 191]),
    bnot (bands [bvar 149, bvar 153, bvar 188, bvar 192]),
    bnot (bands [bvar 150, bvar 151, bvar 189, bvar 190]),
    bnot (bands [bvar 150, bvar 152, bvar 189, bvar 191]),
    bnot (bands [bvar 150, bvar 153, bvar 189, bvar 192]),
    bnot (bands [bvar 151, bvar 153, bvar 190, bvar 192]),
    bnot (bands [bvar 152, bvar 153, bvar 191, bvar 192]),
    bnot (bands [bvar 155, bvar 156, bvar 194, bvar 195]),
    bnot (bands [bvar 158, bvar 159, bvar 171, bvar 172]),
    bnot (bands [bvar 158, bvar 160, bvar 171, bvar 173]),
    bnot (bands [bvar 158, bvar 161, bvar 171, bvar 174]),
    bnot (bands [bvar 158, bvar 162, bvar 171, bvar 175]),
    bnot (bands [bvar 158, bvar 163, bvar 171, bvar 176]),
    bnot (bands [bvar 158, bvar 164, bvar 171, bvar 177]),
    bnot (bands [bvar 158, bvar 165, bvar 171, bvar 178]),
    bnot (bands [bvar 158, bvar 166, bvar 171, bvar 179]),
    bnot (bands [bvar 158, bvar 167, bvar 171, bvar 180]),
    bnot (bands [bvar 158, bvar 170, bvar 171, bvar 183]),
    bnot (bands [bvar 159, bvar 162, bvar 172, bvar 175]),
    bnot (bands [bvar 159, bvar 163, bvar 172, bvar 176]),
    bnot (bands [bvar 159, bvar 164, bvar 172, bvar 177]),
    bnot (bands [bvar 159, bvar 165, bvar 172, bvar 178]),
    bnot (bands [bvar 159, bvar 166, bvar 172, bvar 179]),
    bnot (bands [bvar 159, bvar 167, bvar 172, bvar 180]),
    bnot (bands [bvar 159, bvar 170, bvar 172, bvar 183]),
    bnot (bands [bvar 160, bvar 162, bvar 173, bvar 175]),
    bnot (bands [bvar 160, bvar 163, bvar 173, bvar 176]),
    bnot (bands [bvar 160, bvar 164, bvar 173, bvar 177]),
    bnot (bands [bvar 160, bvar 165, bvar 173, bvar 178]),
    bnot (bands [bvar 160, bvar 166, bvar 173, bvar 179]),
    bnot (bands [bvar 160, bvar 167, bvar 173, bvar 180]),
    bnot (bands [bvar 160, bvar 170, bvar 173, bvar 183]),
    bnot (bands [bvar 161, bvar 162, bvar 174, bvar 175]),
    bnot (bands [bvar 161, bvar 163, bvar 174, bvar 176]),
    bnot (bands [bvar 161, bvar 164, bvar 174, bvar 177]),
    bnot (bands [bvar 161, bvar 166, bvar 174, bvar 179]),
    bnot (bands [bvar 161, bvar 167, bvar 174, bvar 180]),
    bnot (bands [bvar 161, bvar 170, bvar 174, bvar 183]),
    bnot (bands [bvar 162, bvar 163, bvar 175, bvar 176]),
    bnot (bands [bvar 162, bvar 164, bvar 175, bvar 177]),
    bnot (bands [bvar 162, bvar 165, bvar 175, bvar 178]),
    bnot (bands [bvar 162, bvar 166, bvar 175, bvar 179]),
    bnot (bands [bvar 162, bvar 167, bvar 175, bvar 180]),
    bnot (bands [bvar 162, bvar 170, bvar 175, bvar 183]),
    bnot (bands [bvar 163, bvar 164, bvar 176, bvar 177]),
    bnot (bands [bvar 163, bvar 165, bvar 176, bvar 178]),
    bnot (bands [bvar 163, bvar 166, bvar 176, bvar 179]),
    bnot (bands [bvar 163, bvar 167, bvar 176, bvar 180]) ]

def reducedUnionChunk030 : BVLogicalExpr :=
  bands reducedUnionChunk030Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
