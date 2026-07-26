import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk028Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 93, bvar 94, bvar 158, bvar 159]),
    bnot (bands [bvar 93, bvar 95, bvar 158, bvar 160]),
    bnot (bands [bvar 93, bvar 96, bvar 158, bvar 161]),
    bnot (bands [bvar 93, bvar 97, bvar 158, bvar 162]),
    bnot (bands [bvar 94, bvar 97, bvar 159, bvar 162]),
    bnot (bands [bvar 94, bvar 104, bvar 159, bvar 169]),
    bnot (bands [bvar 95, bvar 97, bvar 160, bvar 162]),
    bnot (bands [bvar 95, bvar 104, bvar 160, bvar 169]),
    bnot (bands [bvar 96, bvar 97, bvar 161, bvar 162]),
    bnot (bands [bvar 96, bvar 104, bvar 161, bvar 169]),
    bnot (bands [bvar 96, bvar 105, bvar 161, bvar 170]),
    bnot (bands [bvar 97, bvar 104, bvar 162, bvar 169]),
    bnot (bands [bvar 97, bvar 105, bvar 162, bvar 170]),
    bnot (bands [bvar 99, bvar 100, bvar 164, bvar 165]),
    bnot (bands [bvar 99, bvar 101, bvar 164, bvar 166]),
    bnot (bands [bvar 99, bvar 102, bvar 164, bvar 167]),
    bnot (bands [bvar 100, bvar 101, bvar 165, bvar 166]),
    bnot (bands [bvar 100, bvar 102, bvar 165, bvar 167]),
    bnot (bands [bvar 101, bvar 102, bvar 166, bvar 167]),
    bnot (bands [bvar 104, bvar 105, bvar 169, bvar 170]),
    bnot (bands [bvar 101, bvar 102, bvar 192, bvar 193]),
    bnot (bands [bvar 101, bvar 103, bvar 192, bvar 194]),
    bnot (bands [bvar 102, bvar 104, bvar 193, bvar 195]),
    bnot (bands [bvar 106, bvar 115, bvar 119, bvar 128]),
    bnot (bands [bvar 107, bvar 116, bvar 120, bvar 129]),
    bnot (bands [bvar 109, bvar 114, bvar 122, bvar 127]),
    bnot (bands [bvar 109, bvar 116, bvar 122, bvar 129]),
    bnot (bands [bvar 109, bvar 118, bvar 122, bvar 131]),
    bnot (bands [bvar 110, bvar 111, bvar 123, bvar 124]),
    bnot (bands [bvar 110, bvar 114, bvar 123, bvar 127]),
    bnot (bands [bvar 110, bvar 116, bvar 123, bvar 129]),
    bnot (bands [bvar 110, bvar 118, bvar 123, bvar 131]),
    bnot (bands [bvar 111, bvar 114, bvar 124, bvar 127]),
    bnot (bands [bvar 111, bvar 116, bvar 124, bvar 129]),
    bnot (bands [bvar 111, bvar 118, bvar 124, bvar 131]),
    bnot (bands [bvar 114, bvar 116, bvar 127, bvar 129]),
    bnot (bands [bvar 114, bvar 118, bvar 127, bvar 131]),
    bnot (bands [bvar 116, bvar 118, bvar 129, bvar 131]),
    bnot (bands [bvar 106, bvar 108, bvar 132, bvar 134]),
    bnot (bands [bvar 106, bvar 109, bvar 132, bvar 135]),
    bnot (bands [bvar 106, bvar 110, bvar 132, bvar 136]),
    bnot (bands [bvar 106, bvar 115, bvar 132, bvar 141]),
    bnot (bands [bvar 109, bvar 110, bvar 135, bvar 136]),
    bnot (bands [bvar 109, bvar 115, bvar 135, bvar 141]),
    bnot (bands [bvar 109, bvar 117, bvar 135, bvar 143]),
    bnot (bands [bvar 109, bvar 118, bvar 135, bvar 144]),
    bnot (bands [bvar 110, bvar 115, bvar 136, bvar 141]),
    bnot (bands [bvar 110, bvar 117, bvar 136, bvar 143]),
    bnot (bands [bvar 110, bvar 118, bvar 136, bvar 144]),
    bnot (bands [bvar 106, bvar 107, bvar 145, bvar 146]),
    bnot (bands [bvar 106, bvar 111, bvar 145, bvar 150]),
    bnot (bands [bvar 106, bvar 118, bvar 145, bvar 157]),
    bnot (bands [bvar 107, bvar 111, bvar 146, bvar 150]),
    bnot (bands [bvar 107, bvar 116, bvar 146, bvar 155]),
    bnot (bands [bvar 107, bvar 117, bvar 146, bvar 156]),
    bnot (bands [bvar 108, bvar 111, bvar 147, bvar 150]),
    bnot (bands [bvar 109, bvar 111, bvar 148, bvar 150]),
    bnot (bands [bvar 110, bvar 111, bvar 149, bvar 150]),
    bnot (bands [bvar 110, bvar 117, bvar 149, bvar 156]),
    bnot (bands [bvar 110, bvar 118, bvar 149, bvar 157]),
    bnot (bands [bvar 111, bvar 117, bvar 150, bvar 156]),
    bnot (bands [bvar 111, bvar 118, bvar 150, bvar 157]),
    bnot (bands [bvar 113, bvar 114, bvar 152, bvar 153]),
    bnot (bands [bvar 106, bvar 107, bvar 158, bvar 159]) ]

def reducedUnionChunk028 : BVLogicalExpr :=
  bands reducedUnionChunk028Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
