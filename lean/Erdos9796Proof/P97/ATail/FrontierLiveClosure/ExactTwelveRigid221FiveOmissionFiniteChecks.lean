/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221FiveOmissionCnf

/-!
# Frozen finite checks for the exact-twelve five-omission CNF

The expensive closed computations live in this module so that ordinary source
ingress proof iterations reuse its compiled object file.  These theorems check
only the frozen twelve-label clause tables; they do not prove an UNSAT result.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FiveOmissionCnf

open Census554.CoverCnf
open ExactTwelveCarrierIngress

def centerSelectorAssign (centers : Finset Label) (v : Nat) : Bool :=
  decide (∃ center ∈ centers, v = centerVar center.val)

set_option maxHeartbeats 0 in
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- The positive eight-selector clauses are the finite dual of selecting five
of twelve center labels. -/
theorem centerAtLeastFive_sat :
    ∀ centers : Finset Label, centers.card = 5 →
      ∀ c ∈ centerAtLeastFiveClauses,
        evalClauseD (centerSelectorAssign centers) c = true := by
  native_decide

set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
theorem centerAtLeastFive_literal_shape :
    ∀ c ∈ centerAtLeastFiveClauses, ∀ l ∈ c,
      ∃ p : Label, l = Int.ofNat (centerVar p.val) := by
  native_decide

end FiveOmissionCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
