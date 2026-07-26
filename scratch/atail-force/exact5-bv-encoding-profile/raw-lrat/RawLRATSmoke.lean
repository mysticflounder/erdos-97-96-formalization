import Std.Tactic.BVDecide.LRAT.Checker
import Std.Tactic.BVDecide.LRAT.Parser
import Std.Tactic.BVDecide.Reflect

open Std.Sat

namespace Problem97.ATailExactFiveRawLRATSmoke

open Std.Tactic.BVDecide

/-- The raw CNF `(x) ∧ (¬x)`, using `Std.Sat`'s zero-based variables. -/
def tinyCnf : CNF Nat := [[(0, true)], [(0, false)]]

/-- The one-step LRAT derivation of the empty clause from the two units. -/
def tinyProof : Array LRAT.IntAction := #[.addEmpty 3 #[1, 2]]

example : LRAT.check tinyProof tinyCnf = true := by native_decide

def tinyLratText : String := include_str "tiny.lrat"

example :
    (match LRAT.parseLRATProof tinyLratText.toUTF8 with
      | .ok proof => proof == tinyProof
      | .error _ => false) = true := by native_decide

example : Reflect.verifyCert tinyCnf tinyLratText = true := by native_decide

/-- Kernel-checked raw-CNF unsatisfiability, without invoking `bv_decide`. -/
theorem tinyCnf_unsat : tinyCnf.Unsat := by
  apply Reflect.verifyCert_correct tinyCnf tinyLratText
  native_decide

/--
The only semantic direction needed to transfer raw-CNF UNSAT back to a source
predicate.  Tseitin auxiliaries make existential extension strictly more
general than requiring one fixed assignment encoder.
-/
def SourceToCnfSound
    {Source : Type} (source : Source → Bool) (cnf : CNF Nat) : Prop :=
  ∀ s, source s = true → ∃ assignment : Nat → Bool, cnf.eval assignment = true

/-- A source predicate with a satisfying assignment cannot soundly encode into
an unsatisfiable CNF. -/
theorem source_eq_false_of_cnf_unsat
    {Source : Type} {source : Source → Bool} {cnf : CNF Nat}
    (hsound : SourceToCnfSound source cnf) (hunsat : cnf.Unsat) (s : Source) :
    source s = false := by
  cases hs : source s
  · rfl
  · obtain ⟨assignment, hsat⟩ := hsound s hs
    exact Bool.noConfusion (hsat.symm.trans (hunsat assignment))

/-- End-to-end tiny instance of the generic source-to-CNF bridge. -/
theorem tinySource_false (x : Bool) : (x && !x) = false := by
  apply source_eq_false_of_cnf_unsat
      (source := fun x => x && !x) (cnf := tinyCnf) (s := x)
  · intro y hy
    refine ⟨fun _ => y, ?_⟩
    simp at hy ⊢
  · exact tinyCnf_unsat

#print axioms tinyCnf_unsat
#print axioms source_eq_false_of_cnf_unsat
#print axioms tinySource_false

end Problem97.ATailExactFiveRawLRATSmoke
