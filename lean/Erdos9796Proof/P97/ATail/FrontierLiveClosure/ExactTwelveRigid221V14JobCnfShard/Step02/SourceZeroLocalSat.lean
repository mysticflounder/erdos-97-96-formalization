/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step02.Part_02

/-! # Local satisfaction of the first source-Sinz block -/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenV14JobCnf

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress

theorem localSourceZeroSinz_sat
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (σ : Nat → Bool) {c : List Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell 0) 1
      (sourceSinzBase cell 0)) :
    evalClauseD
      (sinzExt (blockerAssign cell blocker σ) (sourceBlockerVars cell 0) 1
        (sourceSinzBase cell 0)) c = true := by
  let σb := blockerAssign cell blocker σ
  have hcount : ((sourceBlockerVars cell 0).filter σb).length ≤ 1 := by
    rw [sourceBlockerVars_filter_blockerAssign_length cell hadded σ 0]
  have hbelow : ∀ v ∈ sourceBlockerVars cell 0,
      v ≤ sourceSinzBase cell 0 := fun v hv =>
    sourceBlockerVars_le_sourceSinzBase cell 0 hv
  exact sinz_sat σb (sourceBlockerVars cell 0) 1
    (sourceSinzBase cell 0) (by decide) hcount hbelow c hc

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
