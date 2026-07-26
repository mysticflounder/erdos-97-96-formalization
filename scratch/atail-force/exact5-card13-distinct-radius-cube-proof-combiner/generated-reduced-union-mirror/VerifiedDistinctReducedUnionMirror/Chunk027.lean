import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk027Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 101, bvar 103, bvar 179, bvar 181]),
    bnot (bands [bvar 102, bvar 103, bvar 180, bvar 181]),
    bnot (bands [bvar 93, bvar 94, bvar 184, bvar 185]),
    bnot (bands [bvar 93, bvar 97, bvar 184, bvar 188]),
    bnot (bands [bvar 94, bvar 97, bvar 185, bvar 188]),
    bnot (bands [bvar 109, bvar 110, bvar 122, bvar 123]),
    bnot (bands [bvar 109, bvar 111, bvar 122, bvar 124]),
    bnot (bands [bvar 109, bvar 114, bvar 122, bvar 127]),
    bnot (bands [bvar 109, bvar 117, bvar 122, bvar 130]),
    bnot (bands [bvar 109, bvar 118, bvar 122, bvar 131]),
    bnot (bands [bvar 110, bvar 111, bvar 123, bvar 124]),
    bnot (bands [bvar 110, bvar 114, bvar 123, bvar 127]),
    bnot (bands [bvar 110, bvar 115, bvar 123, bvar 128]),
    bnot (bands [bvar 110, bvar 117, bvar 123, bvar 130]),
    bnot (bands [bvar 110, bvar 118, bvar 123, bvar 131]),
    bnot (bands [bvar 111, bvar 114, bvar 124, bvar 127]),
    bnot (bands [bvar 111, bvar 115, bvar 124, bvar 128]),
    bnot (bands [bvar 111, bvar 117, bvar 124, bvar 130]),
    bnot (bands [bvar 111, bvar 118, bvar 124, bvar 131]),
    bnot (bands [bvar 114, bvar 115, bvar 127, bvar 128]),
    bnot (bands [bvar 114, bvar 117, bvar 127, bvar 130]),
    bnot (bands [bvar 114, bvar 118, bvar 127, bvar 131]),
    bnot (bands [bvar 115, bvar 116, bvar 128, bvar 129]),
    bnot (bands [bvar 115, bvar 118, bvar 128, bvar 131]),
    bnot (bands [bvar 117, bvar 118, bvar 130, bvar 131]),
    bnot (bands [bvar 106, bvar 109, bvar 132, bvar 135]),
    bnot (bands [bvar 106, bvar 110, bvar 132, bvar 136]),
    bnot (bands [bvar 106, bvar 116, bvar 132, bvar 142]),
    bnot (bands [bvar 106, bvar 117, bvar 132, bvar 143]),
    bnot (bands [bvar 109, bvar 110, bvar 135, bvar 136]),
    bnot (bands [bvar 109, bvar 116, bvar 135, bvar 142]),
    bnot (bands [bvar 110, bvar 116, bvar 136, bvar 142]),
    bnot (bands [bvar 110, bvar 117, bvar 136, bvar 143]),
    bnot (bands [bvar 109, bvar 116, bvar 148, bvar 155]),
    bnot (bands [bvar 116, bvar 118, bvar 155, bvar 157]),
    bnot (bands [bvar 106, bvar 107, bvar 158, bvar 159]),
    bnot (bands [bvar 106, bvar 110, bvar 158, bvar 162]),
    bnot (bands [bvar 106, bvar 117, bvar 158, bvar 169]),
    bnot (bands [bvar 107, bvar 110, bvar 159, bvar 162]),
    bnot (bands [bvar 107, bvar 117, bvar 159, bvar 169]),
    bnot (bands [bvar 108, bvar 110, bvar 160, bvar 162]),
    bnot (bands [bvar 108, bvar 117, bvar 160, bvar 169]),
    bnot (bands [bvar 109, bvar 110, bvar 161, bvar 162]),
    bnot (bands [bvar 110, bvar 111, bvar 162, bvar 163]),
    bnot (bands [bvar 110, bvar 117, bvar 162, bvar 169]),
    bnot (bands [bvar 110, bvar 118, bvar 162, bvar 170]),
    bnot (bands [bvar 111, bvar 117, bvar 163, bvar 169]),
    bnot (bands [bvar 113, bvar 114, bvar 165, bvar 166]),
    bnot (bands [bvar 113, bvar 115, bvar 165, bvar 167]),
    bnot (bands [bvar 117, bvar 118, bvar 169, bvar 170]),
    bnot (bands [bvar 106, bvar 109, bvar 171, bvar 174]),
    bnot (bands [bvar 106, bvar 111, bvar 171, bvar 176]),
    bnot (bands [bvar 108, bvar 111, bvar 173, bvar 176]),
    bnot (bands [bvar 109, bvar 111, bvar 174, bvar 176]),
    bnot (bands [bvar 109, bvar 118, bvar 174, bvar 183]),
    bnot (bands [bvar 119, bvar 123, bvar 132, bvar 136]),
    bnot (bands [bvar 119, bvar 125, bvar 132, bvar 138]),
    bnot (bands [bvar 122, bvar 123, bvar 135, bvar 136]),
    bnot (bands [bvar 122, bvar 129, bvar 135, bvar 142]),
    bnot (bands [bvar 122, bvar 130, bvar 135, bvar 143]),
    bnot (bands [bvar 123, bvar 130, bvar 136, bvar 143]),
    bnot (bands [bvar 123, bvar 131, bvar 136, bvar 144]),
    bnot (bands [bvar 124, bvar 129, bvar 137, bvar 142]),
    bnot (bands [bvar 124, bvar 130, bvar 137, bvar 143]) ]

def reducedUnionChunk027 : BVLogicalExpr :=
  bands reducedUnionChunk027Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
