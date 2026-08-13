/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step02.SourceZeroPreservation
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step02.SourceZeroRawClauseBound

/-! # Literal agreement for the first source-Sinz block -/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenV14JobCnf

open Census554.CoverCnf
theorem sourceSinzAssign_agrees_local_zero_on_clause
    (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) {c : List Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell 0) 1
      (sourceSinzBase cell 0)) :
    ∀ l ∈ c,
      sourceSinzAssign cell σ l.natAbs =
        sinzExt σ (sourceBlockerVars cell 0) 1
          (sourceSinzBase cell 0) l.natAbs := by
  intro l hl
  exact sourceSinzAssign_eq_local_zero_of_le cell σ l.natAbs
    (sourceZeroSinzClause_lit_le_raw cell hc hl)

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
