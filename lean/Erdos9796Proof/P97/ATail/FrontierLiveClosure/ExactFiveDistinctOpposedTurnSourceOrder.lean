/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CyclicPairSeparation

/-!
# Exact-five opposed-turn source order

This module isolates the finite boundary-order split used by the exact-grid
source adapter.  A point in the second opposite interior lies on one of two
fixed arcs, while the two later row centers separate their shared pair.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

attribute [local instance] Classical.propDecidable

/-- A fixed direct-or-mirror four-point chain, together with separation of the
shared row pair, forces either the old opposed-turn placement or the residual
family-13 placement. -/
theorem cyclicAdjacent_old_or_family13_of_chain_of_separated
    {n : ℕ} {ic₁ iw iO ic₂ ia : Fin n}
    (hchain :
      (iw < iO ∧ iO < ic₂ ∧ ic₂ < ia) ∨
        (ia < ic₂ ∧ ic₂ < iO ∧ iO < iw))
    (hsep : separatedPair ic₁ ic₂ ia iO) :
    (¬ cyclicAdjacent ic₁ iO ic₂ iw ∧
        cyclicAdjacent ic₂ iO ic₁ iw) ∨
      (cyclicAdjacent ia ic₂ iO iw ∧
        ¬ cyclicAdjacent ia ic₁ iO iw) := by
  unfold separatedPair SurplusCOMPGBank.btw at hsep
  unfold cyclicAdjacent SurplusCOMPGBank.btw
  omega

end ATailFrontierLiveClosure
end Problem97
