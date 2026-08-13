/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step03.SourceRawClauseBound

/-! # Satisfaction of the fifth source-Sinz block -/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenV14JobCnf

open Census554.CoverCnf
open Census554.EqualityCore
open SafeCoverCnf
open ExactTwelveCarrierIngress

/-- The completed five-source fold satisfies every Sinz clause emitted for
the fifth source block. -/
theorem sourceSinzAssign_sat_source_four
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (σ : Nat → Bool) {c : List Int}
    (hc : c ∈ sinzClauses
      (sourceBlockerVars cell (Fin.succ (Fin.succ 2))) 1
      (sourceSinzBase cell (Fin.succ (Fin.succ 2)))) :
    evalClauseD
      (sourceSinzAssign cell (blockerAssign cell blocker σ)) c = true := by
  let σb := blockerAssign cell blocker σ
  let σ0 := sinzExt σb (sourceBlockerVars cell 0) 1
    (sourceSinzBase cell 0)
  let σ1 := sinzExt σ0 (sourceBlockerVars cell 1) 1
    (sourceSinzBase cell 1)
  let σ2 := sinzExt σ1 (sourceBlockerVars cell 2) 1
    (sourceSinzBase cell 2)
  let σ3 := sinzExt σ2 (sourceBlockerVars cell (Fin.succ 2)) 1
    (sourceSinzBase cell (Fin.succ 2))
  have hfilter :
      (sourceBlockerVars cell (Fin.succ (Fin.succ 2))).filter σ3 =
        (sourceBlockerVars cell (Fin.succ (Fin.succ 2))).filter σb := by
    apply List.filter_congr
    intro v hv
    change sinzExt σ2 (sourceBlockerVars cell (Fin.succ 2)) 1
      (sourceSinzBase cell (Fin.succ 2)) v = σb v
    rw [sinzExt_sourceBlockerVar_of_lt cell σ2
      (i := Fin.succ (Fin.succ 2)) (j := Fin.succ 2) (by decide) hv]
    change sinzExt σ1 (sourceBlockerVars cell 2) 1
      (sourceSinzBase cell 2) v = σb v
    rw [sinzExt_sourceBlockerVar_of_lt cell σ1
      (i := Fin.succ (Fin.succ 2)) (j := 2) (by decide) hv]
    change sinzExt σ0 (sourceBlockerVars cell 1) 1
      (sourceSinzBase cell 1) v = σb v
    rw [sinzExt_sourceBlockerVar_of_lt cell σ0
      (i := Fin.succ (Fin.succ 2)) (j := 1) (by decide) hv]
    exact sinzExt_sourceBlockerVar_of_lt cell σb
      (i := Fin.succ (Fin.succ 2)) (j := 0) (by decide) hv
  have hcount :
      ((sourceBlockerVars cell (Fin.succ (Fin.succ 2))).filter σ3).length ≤ 1 := by
    rw [hfilter,
      sourceBlockerVars_filter_blockerAssign_length cell hadded σ
        (Fin.succ (Fin.succ 2))]
  have hbelow :
      ∀ v ∈ sourceBlockerVars cell (Fin.succ (Fin.succ 2)),
        v ≤ sourceSinzBase cell (Fin.succ (Fin.succ 2)) := fun v hv =>
    sourceBlockerVars_le_sourceSinzBase cell (Fin.succ (Fin.succ 2)) hv
  have hlocal := sinz_sat σ3
    (sourceBlockerVars cell (Fin.succ (Fin.succ 2))) 1
    (sourceSinzBase cell (Fin.succ (Fin.succ 2))) (by decide)
    hcount hbelow c hc
  rw [sourceSinzAssign_eq_chain]
  exact hlocal

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
