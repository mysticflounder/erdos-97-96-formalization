import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk024Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 34, bvar 36, bvar 164, bvar 166]),
    bnot (bands [bvar 34, bvar 37, bvar 164, bvar 167]),
    bnot (bands [bvar 35, bvar 36, bvar 165, bvar 166]),
    bnot (bands [bvar 35, bvar 37, bvar 165, bvar 167]),
    bnot (bands [bvar 29, bvar 32, bvar 172, bvar 175]),
    bnot (bands [bvar 29, bvar 33, bvar 172, bvar 176]),
    bnot (bands [bvar 29, bvar 34, bvar 172, bvar 177]),
    bnot (bands [bvar 29, bvar 35, bvar 172, bvar 178]),
    bnot (bands [bvar 29, bvar 36, bvar 172, bvar 179]),
    bnot (bands [bvar 29, bvar 38, bvar 172, bvar 181]),
    bnot (bands [bvar 30, bvar 32, bvar 173, bvar 175]),
    bnot (bands [bvar 30, bvar 33, bvar 173, bvar 176]),
    bnot (bands [bvar 30, bvar 34, bvar 173, bvar 177]),
    bnot (bands [bvar 30, bvar 35, bvar 173, bvar 178]),
    bnot (bands [bvar 30, bvar 36, bvar 173, bvar 179]),
    bnot (bands [bvar 30, bvar 37, bvar 173, bvar 180]),
    bnot (bands [bvar 30, bvar 38, bvar 173, bvar 181]),
    bnot (bands [bvar 31, bvar 34, bvar 174, bvar 177]),
    bnot (bands [bvar 31, bvar 35, bvar 174, bvar 178]),
    bnot (bands [bvar 31, bvar 36, bvar 174, bvar 179]),
    bnot (bands [bvar 31, bvar 37, bvar 174, bvar 180]),
    bnot (bands [bvar 32, bvar 33, bvar 175, bvar 176]),
    bnot (bands [bvar 32, bvar 34, bvar 175, bvar 177]),
    bnot (bands [bvar 32, bvar 35, bvar 175, bvar 178]),
    bnot (bands [bvar 32, bvar 36, bvar 175, bvar 179]),
    bnot (bands [bvar 32, bvar 37, bvar 175, bvar 180]),
    bnot (bands [bvar 32, bvar 38, bvar 175, bvar 181]),
    bnot (bands [bvar 33, bvar 34, bvar 176, bvar 177]),
    bnot (bands [bvar 33, bvar 35, bvar 176, bvar 178]),
    bnot (bands [bvar 33, bvar 36, bvar 176, bvar 179]),
    bnot (bands [bvar 33, bvar 37, bvar 176, bvar 180]),
    bnot (bands [bvar 33, bvar 38, bvar 176, bvar 181]),
    bnot (bands [bvar 34, bvar 35, bvar 177, bvar 178]),
    bnot (bands [bvar 34, bvar 36, bvar 177, bvar 179]),
    bnot (bands [bvar 34, bvar 37, bvar 177, bvar 180]),
    bnot (bands [bvar 34, bvar 38, bvar 177, bvar 181]),
    bnot (bands [bvar 35, bvar 36, bvar 178, bvar 179]),
    bnot (bands [bvar 35, bvar 37, bvar 178, bvar 180]),
    bnot (bands [bvar 35, bvar 38, bvar 178, bvar 181]),
    bnot (bands [bvar 36, bvar 37, bvar 179, bvar 180]),
    bnot (bands [bvar 36, bvar 38, bvar 179, bvar 181]),
    bnot (bands [bvar 29, bvar 33, bvar 185, bvar 189]),
    bnot (bands [bvar 29, bvar 34, bvar 185, bvar 190]),
    bnot (bands [bvar 29, bvar 35, bvar 185, bvar 191]),
    bnot (bands [bvar 29, bvar 36, bvar 185, bvar 192]),
    bnot (bands [bvar 29, bvar 38, bvar 185, bvar 194]),
    bnot (bands [bvar 29, bvar 39, bvar 185, bvar 195]),
    bnot (bands [bvar 30, bvar 32, bvar 186, bvar 188]),
    bnot (bands [bvar 30, bvar 33, bvar 186, bvar 189]),
    bnot (bands [bvar 30, bvar 34, bvar 186, bvar 190]),
    bnot (bands [bvar 30, bvar 35, bvar 186, bvar 191]),
    bnot (bands [bvar 30, bvar 36, bvar 186, bvar 192]),
    bnot (bands [bvar 30, bvar 38, bvar 186, bvar 194]),
    bnot (bands [bvar 30, bvar 39, bvar 186, bvar 195]),
    bnot (bands [bvar 31, bvar 33, bvar 187, bvar 189]),
    bnot (bands [bvar 31, bvar 34, bvar 187, bvar 190]),
    bnot (bands [bvar 31, bvar 38, bvar 187, bvar 194]),
    bnot (bands [bvar 32, bvar 33, bvar 188, bvar 189]),
    bnot (bands [bvar 32, bvar 34, bvar 188, bvar 190]),
    bnot (bands [bvar 32, bvar 35, bvar 188, bvar 191]),
    bnot (bands [bvar 32, bvar 36, bvar 188, bvar 192]),
    bnot (bands [bvar 32, bvar 37, bvar 188, bvar 193]),
    bnot (bands [bvar 32, bvar 38, bvar 188, bvar 194]),
    bnot (bands [bvar 32, bvar 39, bvar 188, bvar 195]) ]

def reducedUnionChunk024 : BVLogicalExpr :=
  bands reducedUnionChunk024Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
