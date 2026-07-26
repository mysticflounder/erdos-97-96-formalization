import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk051Assertions : List BVLogicalExpr :=
  [ bnot (bands [bvar 1045, bvar 1048, bvar 135, bvar 138]),
    bnot (bands [bvar 1045, bvar 1049, bvar 135, bvar 139]),
    bnot (bands [bvar 1046, bvar 1048, bvar 136, bvar 138]),
    bnot (bands [bvar 1046, bvar 1049, bvar 136, bvar 139]),
    bnot (bands [bvar 1048, bvar 1049, bvar 138, bvar 139]),
    bnot (bands [bvar 1043, bvar 1046, bvar 146, bvar 149]),
    bnot (bands [bvar 1043, bvar 1047, bvar 146, bvar 150]),
    bnot (bands [bvar 1043, bvar 1048, bvar 146, bvar 151]),
    bnot (bands [bvar 1043, bvar 1049, bvar 146, bvar 152]),
    bnot (bands [bvar 1043, bvar 1050, bvar 146, bvar 153]),
    bnot (bands [bvar 1044, bvar 1046, bvar 147, bvar 149]),
    bnot (bands [bvar 1044, bvar 1047, bvar 147, bvar 150]),
    bnot (bands [bvar 1044, bvar 1048, bvar 147, bvar 151]),
    bnot (bands [bvar 1044, bvar 1049, bvar 147, bvar 152]),
    bnot (bands [bvar 1044, bvar 1050, bvar 147, bvar 153]),
    bnot (bands [bvar 1045, bvar 1046, bvar 148, bvar 149]),
    bnot (bands [bvar 1045, bvar 1047, bvar 148, bvar 150]),
    bnot (bands [bvar 1045, bvar 1048, bvar 148, bvar 151]),
    bnot (bands [bvar 1045, bvar 1049, bvar 148, bvar 152]),
    bnot (bands [bvar 1045, bvar 1050, bvar 148, bvar 153]),
    bnot (bands [bvar 1046, bvar 1047, bvar 149, bvar 150]),
    bnot (bands [bvar 1046, bvar 1048, bvar 149, bvar 151]),
    bnot (bands [bvar 1046, bvar 1049, bvar 149, bvar 152]),
    bnot (bands [bvar 1046, bvar 1050, bvar 149, bvar 153]),
    bnot (bands [bvar 1047, bvar 1048, bvar 150, bvar 151]),
    bnot (bands [bvar 1047, bvar 1049, bvar 150, bvar 152]),
    bnot (bands [bvar 1047, bvar 1050, bvar 150, bvar 153]),
    bnot (bands [bvar 1048, bvar 1049, bvar 151, bvar 152]),
    bnot (bands [bvar 1048, bvar 1050, bvar 151, bvar 153]),
    bnot (bands [bvar 1049, bvar 1050, bvar 152, bvar 153]),
    bnot (bands [bvar 1052, bvar 1053, bvar 155, bvar 156]),
    bnot (bands [bvar 1052, bvar 1054, bvar 155, bvar 157]),
    bnot (bands [bvar 1053, bvar 1054, bvar 156, bvar 157]),
    bnot (bands [bvar 29, bvar 34, bvar 1160, bvar 1165]),
    bnot (bands [bvar 29, bvar 35, bvar 1160, bvar 1166]),
    bnot (bands [bvar 30, bvar 33, bvar 1161, bvar 1164]),
    bnot (bands [bvar 30, bvar 34, bvar 1161, bvar 1165]),
    bnot (bands [bvar 30, bvar 35, bvar 1161, bvar 1166]),
    bnot (bands [bvar 30, bvar 36, bvar 1161, bvar 1167]),
    bnot (bands [bvar 33, bvar 34, bvar 1164, bvar 1165]),
    bnot (bands [bvar 33, bvar 35, bvar 1164, bvar 1166]),
    bnot (bands [bvar 33, bvar 36, bvar 1164, bvar 1167]),
    bnot (bands [bvar 34, bvar 35, bvar 1165, bvar 1166]),
    bnot (bands [bvar 34, bvar 36, bvar 1165, bvar 1167]),
    bnot (bands [bvar 35, bvar 36, bvar 1166, bvar 1167]),
    bnot (bands [bvar 1043, bvar 1046, bvar 159, bvar 162]),
    bnot (bands [bvar 1043, bvar 1047, bvar 159, bvar 163]),
    bnot (bands [bvar 1043, bvar 1048, bvar 159, bvar 164]),
    bnot (bands [bvar 1043, bvar 1049, bvar 159, bvar 165]),
    bnot (bands [bvar 1043, bvar 1050, bvar 159, bvar 166]),
    bnot (bands [bvar 1043, bvar 1051, bvar 159, bvar 167]),
    bnot (bands [bvar 1044, bvar 1047, bvar 160, bvar 163]),
    bnot (bands [bvar 1044, bvar 1048, bvar 160, bvar 164]),
    bnot (bands [bvar 1044, bvar 1049, bvar 160, bvar 165]),
    bnot (bands [bvar 1044, bvar 1050, bvar 160, bvar 166]),
    bnot (bands [bvar 1045, bvar 1047, bvar 161, bvar 163]),
    bnot (bands [bvar 1045, bvar 1049, bvar 161, bvar 165]),
    bnot (bands [bvar 1046, bvar 1047, bvar 162, bvar 163]),
    bnot (bands [bvar 1046, bvar 1048, bvar 162, bvar 164]),
    bnot (bands [bvar 1046, bvar 1049, bvar 162, bvar 165]),
    bnot (bands [bvar 1046, bvar 1050, bvar 162, bvar 166]),
    bnot (bands [bvar 1046, bvar 1051, bvar 162, bvar 167]),
    bnot (bands [bvar 1047, bvar 1048, bvar 163, bvar 164]),
    bnot (bands [bvar 1047, bvar 1049, bvar 163, bvar 165]) ]

def reducedUnionChunk051 : BVLogicalExpr :=
  bands reducedUnionChunk051Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
