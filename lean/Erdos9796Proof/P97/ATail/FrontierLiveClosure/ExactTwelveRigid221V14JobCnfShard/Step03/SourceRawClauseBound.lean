/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step_02

/-! # Symbolic literal ceilings for source-Sinz blocks -/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenV14JobCnf

open Census554.CoverCnf

/-- Every literal emitted by source block `i` lies no later than the symbolic
end of that source's auxiliary interval. -/
theorem sourceSinzClause_lit_le_raw
    (cell : FrozenV14JobCoordinate) (i : Fin 5) {c : List Int} {l : Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell i) 1
      (sourceSinzBase cell i)) (hl : l ∈ c) :
    l.natAbs ≤ sourceSinzBase cell i + (sourceBlockerVars cell i).length := by
  simpa only [one_mul] using
    (Census554.CoverCnf.sinzClauses_lit_bound
      (sourceBlockerVars cell i) 1 (sourceSinzBase cell i) (by decide)
      (fun v hv => sourceBlockerVars_le_sourceSinzBase cell i hv)
      c hc l hl)

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
