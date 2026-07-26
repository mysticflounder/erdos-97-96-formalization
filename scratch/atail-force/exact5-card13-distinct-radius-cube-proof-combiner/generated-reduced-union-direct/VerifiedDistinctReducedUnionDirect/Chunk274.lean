import VerifiedDistinctReducedUnionDirect.Base

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionChunk274Assertions : List BVLogicalExpr :=
  [ bimplies (bveq ((.var 1625 : BVExpr 7)) ((.var 1624 : BVExpr 7))) (bvult ((.var 1623 : BVExpr 7)) ((.var 1622 : BVExpr 7))) ]

def reducedUnionChunk274 : BVLogicalExpr :=
  bands reducedUnionChunk274Assertions

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
