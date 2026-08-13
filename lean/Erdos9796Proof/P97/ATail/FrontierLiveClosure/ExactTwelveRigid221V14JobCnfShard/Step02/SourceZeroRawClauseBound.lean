/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step02.Part_02

/-! # Raw literal ceiling for the first source-Sinz block -/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenV14JobCnf

open Census554.CoverCnf

/-- The generic Sinz literal ceiling, specialized to the first source block
without reducing the concrete block layout.  Keeping this result opaque avoids
combining the generic clause proof with the finite-layout normalization. -/
theorem sourceZeroSinzClause_lit_le_raw
    (cell : FrozenV14JobCoordinate) {c : List Int} {l : Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell 0) 1
      (sourceSinzBase cell 0)) (hl : l ∈ c) :
    l.natAbs ≤ sourceSinzBase cell 0 +
      (sourceBlockerVars cell 0).length := by
  apply Census554.CoverCnf.sinzClauses_lit_bound
      (sourceBlockerVars cell 0) 1 (sourceSinzBase cell 0) (by decide)
      (fun v hv => sourceBlockerVars_le_sourceSinzBase cell 0 hv)
      c hc l hl

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
