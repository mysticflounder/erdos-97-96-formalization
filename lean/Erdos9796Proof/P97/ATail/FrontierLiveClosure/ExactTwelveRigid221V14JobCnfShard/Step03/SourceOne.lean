/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step03.SourceRawClauseBound

/-! # Satisfaction of the second source-Sinz block -/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenV14JobCnf

open Census554.CoverCnf
open Census554.EqualityCore
open SafeCoverCnf
open ExactTwelveCarrierIngress

/-- The completed five-source fold satisfies every Sinz clause emitted for
the second source block. -/
theorem sourceSinzAssign_sat_source_one
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (σ : Nat → Bool) {c : List Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell 1) 1
      (sourceSinzBase cell 1)) :
    evalClauseD
      (sourceSinzAssign cell (blockerAssign cell blocker σ)) c = true := by
  let σb := blockerAssign cell blocker σ
  let σ0 := sinzExt σb (sourceBlockerVars cell 0) 1
    (sourceSinzBase cell 0)
  have hfilter : (sourceBlockerVars cell 1).filter σ0 =
      (sourceBlockerVars cell 1).filter σb := by
    apply List.filter_congr
    intro v hv
    exact sinzExt_sourceBlockerVar_of_lt cell σb (by decide) hv
  have hcount : ((sourceBlockerVars cell 1).filter σ0).length ≤ 1 := by
    rw [hfilter,
      sourceBlockerVars_filter_blockerAssign_length cell hadded σ 1]
  have hbelow : ∀ v ∈ sourceBlockerVars cell 1,
      v ≤ sourceSinzBase cell 1 := fun v hv =>
    sourceBlockerVars_le_sourceSinzBase cell 1 hv
  have hlocal := sinz_sat σ0 (sourceBlockerVars cell 1) 1
    (sourceSinzBase cell 1) (by decide) hcount hbelow c hc
  rw [sourceSinzAssign_eq_chain]
  rw [Census554.CoverCnf.evalClauseD_congr (σ' :=
    sinzExt σ0 (sourceBlockerVars cell 1) 1 (sourceSinzBase cell 1))]
  · exact hlocal
  · intro l hl
    have hbound := sourceSinzClause_lit_le_raw cell 1 hc hl
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _
      (hbound.trans (sourceSinzEnd_le_sourceSinzBase_of_lt cell
        (i := Fin.succ (Fin.succ 2)) (j := (1 : Fin 5)) (by decide)))]
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _
      (hbound.trans (sourceSinzEnd_le_sourceSinzBase_of_lt cell
        (i := Fin.succ 2) (j := (1 : Fin 5)) (by decide)))]
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _
      (hbound.trans (sourceSinzEnd_le_sourceSinzBase_of_lt cell
        (i := 2) (j := (1 : Fin 5)) (by decide)))]

end FrozenV14JobCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
