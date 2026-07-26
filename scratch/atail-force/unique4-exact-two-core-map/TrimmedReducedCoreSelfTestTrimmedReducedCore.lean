import Std.Tactic.BVDecide.Reflect

open Std.Sat

namespace Problem97.ATailUniqueFourExactTwoReducedCoreScratch

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

/-- Raw signed DIMACS clauses of the frozen `trimmed-reduced-core-self-test` reduced input core. -/
def TrimmedReducedCoreSelfTestDimacs : List (List Int) := [
  [-3],
  [3]
]

def TrimmedReducedCoreSelfTestToLit (literal : Int) : Nat × Bool :=
  (literal.natAbs - 1, decide (0 < literal))

/-- Zero-based `Std.Sat` translation of `TrimmedReducedCoreSelfTestDimacs`. -/
def TrimmedReducedCoreSelfTestCnf : CNF Nat :=
  TrimmedReducedCoreSelfTestDimacs.map fun clause => clause.map TrimmedReducedCoreSelfTestToLit

def TrimmedReducedCoreSelfTestLrat : String := include_str "trimmed-reduced-core-self-test.trimmed.lrat"

/-- Verified-LRAT UNSAT theorem for the frozen `trimmed-reduced-core-self-test` reduced input core.
The final Boolean replay uses `native_decide`, hence its standard compiler
trust boundary; this theorem alone is not a source-to-CNF bridge. -/
theorem TrimmedReducedCoreSelfTestCore_unsat : TrimmedReducedCoreSelfTestCnf.Unsat := by
  apply Reflect.verifyCert_correct TrimmedReducedCoreSelfTestCnf TrimmedReducedCoreSelfTestLrat
  native_decide

#print axioms TrimmedReducedCoreSelfTestCore_unsat

end Problem97.ATailUniqueFourExactTwoReducedCoreScratch
