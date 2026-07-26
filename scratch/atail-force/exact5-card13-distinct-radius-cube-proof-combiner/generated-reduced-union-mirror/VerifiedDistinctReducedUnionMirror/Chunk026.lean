import VerifiedDistinctReducedUnionMirror.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk026Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 72, bvar 76, bvar 163, bvar 167]),
    bnot (bands [bvar 73, bvar 75, bvar 164, bvar 166]),
    bnot (bands [bvar 75, bvar 76, bvar 166, bvar 167]),
    bnot (bands [bvar 67, bvar 68, bvar 171, bvar 172]),
    bnot (bands [bvar 71, bvar 74, bvar 175, bvar 178]),
    bnot (bands [bvar 74, bvar 75, bvar 178, bvar 179]),
    bnot (bands [bvar 74, bvar 76, bvar 178, bvar 180]),
    bnot (bands [bvar 75, bvar 76, bvar 179, bvar 180]),
    bnot (bands [bvar 75, bvar 77, bvar 179, bvar 181]),
    bnot (bands [bvar 73, bvar 77, bvar 190, bvar 194]),
    bnot (bands [bvar 93, bvar 103, bvar 119, bvar 129]),
    bnot (bands [bvar 95, bvar 102, bvar 121, bvar 128]),
    bnot (bands [bvar 95, bvar 103, bvar 121, bvar 129]),
    bnot (bands [bvar 95, bvar 104, bvar 121, bvar 130]),
    bnot (bands [bvar 96, bvar 97, bvar 122, bvar 123]),
    bnot (bands [bvar 96, bvar 101, bvar 122, bvar 127]),
    bnot (bands [bvar 96, bvar 102, bvar 122, bvar 128]),
    bnot (bands [bvar 96, bvar 104, bvar 122, bvar 130]),
    bnot (bands [bvar 96, bvar 105, bvar 122, bvar 131]),
    bnot (bands [bvar 97, bvar 101, bvar 123, bvar 127]),
    bnot (bands [bvar 97, bvar 102, bvar 123, bvar 128]),
    bnot (bands [bvar 97, bvar 103, bvar 123, bvar 129]),
    bnot (bands [bvar 97, bvar 104, bvar 123, bvar 130]),
    bnot (bands [bvar 97, bvar 105, bvar 123, bvar 131]),
    bnot (bands [bvar 101, bvar 102, bvar 127, bvar 128]),
    bnot (bands [bvar 102, bvar 103, bvar 128, bvar 129]),
    bnot (bands [bvar 102, bvar 104, bvar 128, bvar 130]),
    bnot (bands [bvar 102, bvar 105, bvar 128, bvar 131]),
    bnot (bands [bvar 103, bvar 104, bvar 129, bvar 130]),
    bnot (bands [bvar 93, bvar 96, bvar 132, bvar 135]),
    bnot (bands [bvar 93, bvar 97, bvar 132, bvar 136]),
    bnot (bands [bvar 93, bvar 103, bvar 132, bvar 142]),
    bnot (bands [bvar 93, bvar 104, bvar 132, bvar 143]),
    bnot (bands [bvar 96, bvar 97, bvar 135, bvar 136]),
    bnot (bands [bvar 96, bvar 102, bvar 135, bvar 141]),
    bnot (bands [bvar 96, bvar 103, bvar 135, bvar 142]),
    bnot (bands [bvar 96, bvar 104, bvar 135, bvar 143]),
    bnot (bands [bvar 96, bvar 105, bvar 135, bvar 144]),
    bnot (bands [bvar 97, bvar 102, bvar 136, bvar 141]),
    bnot (bands [bvar 97, bvar 103, bvar 136, bvar 142]),
    bnot (bands [bvar 97, bvar 104, bvar 136, bvar 143]),
    bnot (bands [bvar 97, bvar 105, bvar 136, bvar 144]),
    bnot (bands [bvar 99, bvar 100, bvar 138, bvar 139]),
    bnot (bands [bvar 94, bvar 97, bvar 146, bvar 149]),
    bnot (bands [bvar 97, bvar 104, bvar 149, bvar 156]),
    bnot (bands [bvar 97, bvar 105, bvar 149, bvar 157]),
    bnot (bands [bvar 99, bvar 100, bvar 151, bvar 152]),
    bnot (bands [bvar 99, bvar 101, bvar 151, bvar 153]),
    bnot (bands [bvar 100, bvar 101, bvar 152, bvar 153]),
    bnot (bands [bvar 104, bvar 105, bvar 156, bvar 157]),
    bnot (bands [bvar 104, bvar 105, bvar 169, bvar 170]),
    bnot (bands [bvar 93, bvar 97, bvar 171, bvar 175]),
    bnot (bands [bvar 94, bvar 97, bvar 172, bvar 175]),
    bnot (bands [bvar 94, bvar 105, bvar 172, bvar 183]),
    bnot (bands [bvar 95, bvar 97, bvar 173, bvar 175]),
    bnot (bands [bvar 95, bvar 105, bvar 173, bvar 183]),
    bnot (bands [bvar 96, bvar 97, bvar 174, bvar 175]),
    bnot (bands [bvar 96, bvar 105, bvar 174, bvar 183]),
    bnot (bands [bvar 97, bvar 105, bvar 175, bvar 183]),
    bnot (bands [bvar 99, bvar 101, bvar 177, bvar 179]),
    bnot (bands [bvar 99, bvar 102, bvar 177, bvar 180]),
    bnot (bands [bvar 100, bvar 101, bvar 178, bvar 179]),
    bnot (bands [bvar 100, bvar 102, bvar 178, bvar 180]),
    bnot (bands [bvar 101, bvar 102, bvar 179, bvar 180]) ]

def reducedUnionChunk026 : BVLogicalExpr :=
  bands reducedUnionChunk026Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedMirror
