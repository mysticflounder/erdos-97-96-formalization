import VerifiedDistinctReducedUnionDirect.Coordinator
import Std.Tactic.BVDecide.Reflect

open Std.Sat

namespace Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionLrat : String :=
  String.join
    [ include_str "certificates/part-000.lrat.txt",
      include_str "certificates/part-001.lrat.txt",
      include_str "certificates/part-002.lrat.txt",
      include_str "certificates/part-003.lrat.txt",
      include_str "certificates/part-004.lrat.txt" ]

theorem reducedUnionCnf_unsat : reducedUnionCnf.Unsat := by
  apply Reflect.verifyCert_correct reducedUnionCnf reducedUnionLrat
  native_decide

theorem reducedUnionExpr_unsat : reducedUnionExpr.Unsat := by
  have hbitblast : reducedUnionExpr.bitblast.Unsat := by
    rw [← AIG.Entrypoint.relabelNat_unsat_iff]
    exact
      (AIG.toCNF_equisat reducedUnionExpr.bitblast.relabelNat).mp
        reducedUnionCnf_unsat
  exact BVLogicalExpr.unsat_of_bitblast reducedUnionExpr hbitblast

#print axioms reducedUnionCnf_unsat
#print axioms reducedUnionExpr_unsat

end Problem97.ATailExactFiveDistinctReducedUnionVerifiedDirect
