/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeBaseSat
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCoverIndexBridge

/-!
# Semantic satisfiability ingress for the exact-twelve source-safe cover CNF

This module composes the semantic candidate-index bridge with the explicit
Sinz valuation.  It records the exact direction required of a source-faithful
abstraction: every semantic row family satisfying `FrozenSafeCubeOK` induces a
satisfying assignment of `SafeCoverCnf.baseCnf`.

Consequently, a separately certified UNSAT result for this exact CNF would
exclude every `FrozenSafeCubeOK` exact-twelve row family.  This theorem does not
claim that the live Rigid221 branch itself produces such a row family; that
source-level producer remains a separate ingress obligation.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress

/-- Every proof-facing source-safe exact-twelve cube is represented by a
satisfying assignment of the frozen numerical cover CNF. -/
theorem safeCoverCnf_sat_of_safeCubeOK {row : RowPattern Label}
    (hrow : FrozenSafeCubeOK row) :
    ∃ τ : Nat → Bool,
      Std.Sat.CNF.eval τ SafeCoverCnf.baseCnf = true := by
  obtain ⟨idx, hidx, _, hc2, hc4⟩ :=
    SafeCoverIndexBridge.exists_coverIndex_of_safeCubeOK hrow
  exact SafeCoverCnf.baseCnf_sat idx hidx hc2 hc4

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
