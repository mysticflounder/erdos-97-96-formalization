import Std.Tactic.BVDecide.Reflect

open Std.Sat

namespace Problem97.ATailExactFiveVerifiedBVExprLRATSmoke

open Std.Tactic.BVDecide

/-- One one-bit source variable. -/
def smokeBit : BVExpr 1 := .var 0

def smokeAtom : BVPred := .getLsbD smokeBit 0

/-- The deliberately inconsistent source expression `x ∧ ¬x`. -/
def smokeExpr : BVLogicalExpr :=
  .gate .and (.literal smokeAtom) (.not (.literal smokeAtom))

/-- The verified library bit-blast and Tseitin CNF, with atoms relabeled to `Nat`. -/
def smokeCnf : CNF Nat := AIG.toCNF smokeExpr.bitblast.relabelNat

example : smokeCnf = [[(0, true)], [(0, false)]] := by native_decide

def smokeLrat : String := include_str "bvexpr-smoke.lrat"

/--
The verified AIG/Tseitin compiler has the exact source-to-CNF direction needed
by the exact-five lane.  This theorem is generic over the source expression.
-/
theorem source_to_cnf_sound (expr : BVLogicalExpr) (source : BVExpr.Assignment)
    (hsource : expr.eval source = true) :
    ∃ assignment : Nat → Bool,
      (AIG.toCNF expr.bitblast.relabelNat).eval assignment = true := by
  classical
  apply Classical.byContradiction
  intro hnone
  have hcnf : (AIG.toCNF expr.bitblast.relabelNat).Unsat := by
    intro assignment
    cases heval : (AIG.toCNF expr.bitblast.relabelNat).eval assignment
    · rfl
    · exact False.elim (hnone ⟨assignment, heval⟩)
  have hbitblast : expr.bitblast.Unsat := by
    rw [← AIG.Entrypoint.relabelNat_unsat_iff]
    exact (AIG.toCNF_equisat expr.bitblast.relabelNat).mp hcnf
  have hexpr : expr.Unsat := BVLogicalExpr.unsat_of_bitblast expr hbitblast
  exact Bool.noConfusion (hsource.symm.trans (hexpr source))

/-- Fresh LRAT replay against the CNF produced by the verified compiler. -/
theorem smokeExpr_unsat : smokeExpr.Unsat := by
  apply Reflect.unsat_of_verifyBVExpr_eq_true smokeExpr smokeLrat
  native_decide

theorem smokeExpr_eval_false (source : BVExpr.Assignment) :
    smokeExpr.eval source = false :=
  smokeExpr_unsat source

#print axioms source_to_cnf_sound
#print axioms smokeExpr_unsat

end Problem97.ATailExactFiveVerifiedBVExprLRATSmoke
