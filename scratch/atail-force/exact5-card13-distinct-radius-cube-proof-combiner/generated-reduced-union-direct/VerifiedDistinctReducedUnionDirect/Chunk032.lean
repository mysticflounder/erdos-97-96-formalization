import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk032Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 159, bvar 163, bvar 172, bvar 176]),
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
    bnot (bands [bvar 162, bvar 163, bvar 175, bvar 176]),
    bnot (bands [bvar 162, bvar 164, bvar 175, bvar 177]),
    bnot (bands [bvar 162, bvar 165, bvar 175, bvar 178]),
    bnot (bands [bvar 162, bvar 166, bvar 175, bvar 179]),
    bnot (bands [bvar 162, bvar 167, bvar 175, bvar 180]),
    bnot (bands [bvar 162, bvar 170, bvar 175, bvar 183]),
    bnot (bands [bvar 163, bvar 165, bvar 176, bvar 178]),
    bnot (bands [bvar 163, bvar 166, bvar 176, bvar 179]),
    bnot (bands [bvar 163, bvar 167, bvar 176, bvar 180]),
    bnot (bands [bvar 164, bvar 166, bvar 177, bvar 179]),
    bnot (bands [bvar 164, bvar 167, bvar 177, bvar 180]),
    bnot (bands [bvar 164, bvar 170, bvar 177, bvar 183]),
    bnot (bands [bvar 165, bvar 166, bvar 178, bvar 179]),
    bnot (bands [bvar 165, bvar 170, bvar 178, bvar 183]),
    bnot (bands [bvar 166, bvar 167, bvar 179, bvar 180]),
    bnot (bands [bvar 166, bvar 170, bvar 179, bvar 183]),
    bnot (bands [bvar 158, bvar 159, bvar 184, bvar 185]),
    bnot (bands [bvar 158, bvar 160, bvar 184, bvar 186]),
    bnot (bands [bvar 158, bvar 161, bvar 184, bvar 187]),
    bnot (bands [bvar 158, bvar 162, bvar 184, bvar 188]),
    bnot (bands [bvar 158, bvar 164, bvar 184, bvar 190]),
    bnot (bands [bvar 158, bvar 165, bvar 184, bvar 191]),
    bnot (bands [bvar 158, bvar 166, bvar 184, bvar 192]),
    bnot (bands [bvar 159, bvar 162, bvar 185, bvar 188]),
    bnot (bands [bvar 159, bvar 164, bvar 185, bvar 190]),
    bnot (bands [bvar 159, bvar 165, bvar 185, bvar 191]),
    bnot (bands [bvar 159, bvar 166, bvar 185, bvar 192]),
    bnot (bands [bvar 159, bvar 167, bvar 185, bvar 193]),
    bnot (bands [bvar 160, bvar 162, bvar 186, bvar 188]),
    bnot (bands [bvar 160, bvar 164, bvar 186, bvar 190]),
    bnot (bands [bvar 160, bvar 165, bvar 186, bvar 191]),
    bnot (bands [bvar 160, bvar 166, bvar 186, bvar 192]),
    bnot (bands [bvar 161, bvar 162, bvar 187, bvar 188]),
    bnot (bands [bvar 162, bvar 163, bvar 188, bvar 189]),
    bnot (bands [bvar 162, bvar 164, bvar 188, bvar 190]),
    bnot (bands [bvar 162, bvar 165, bvar 188, bvar 191]),
    bnot (bands [bvar 162, bvar 166, bvar 188, bvar 192]),
    bnot (bands [bvar 162, bvar 167, bvar 188, bvar 193]),
    bnot (bands [bvar 163, bvar 165, bvar 189, bvar 191]),
    bnot (bands [bvar 164, bvar 166, bvar 190, bvar 192]),
    bnot (bands [bvar 165, bvar 166, bvar 191, bvar 192]),
    bnot (bands [bvar 171, bvar 172, bvar 184, bvar 185]),
    bnot (bands [bvar 171, bvar 173, bvar 184, bvar 186]),
    bnot (bands [bvar 171, bvar 174, bvar 184, bvar 187]),
    bnot (bands [bvar 171, bvar 175, bvar 184, bvar 188]),
    bnot (bands [bvar 171, bvar 177, bvar 184, bvar 190]),
    bnot (bands [bvar 171, bvar 178, bvar 184, bvar 191]),
    bnot (bands [bvar 171, bvar 179, bvar 184, bvar 192]),
    bnot (bands [bvar 171, bvar 180, bvar 184, bvar 193]),
    bnot (bands [bvar 171, bvar 181, bvar 184, bvar 194]) ]

def reducedUnionChunk032 : BVLogicalExpr :=
  bands reducedUnionChunk032Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
