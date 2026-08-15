/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14SourceJobBridge
import Erdos9796Proof.P97.Census554.SinzSat

/-!
# Exact variable layout for normalized-v14 jobs

This module mirrors the auxiliary-variable allocation performed by
`census/card_head/exact12_v14_valuation.py`.  Starting at the frozen
source-faithful base-CNF counter, the compiler allocates five blocks of ten
blocker variables and ten bound-one Sinz variables, followed by the
center-wise bound-one Sinz blocks.

The definitions below are the proof-facing variable-map contract.  They do
not yet claim that the complete emitted clause list is satisfied or that any
terminal journal covers the 648 jobs.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenV14JobCnf

open Census554.CoverCnf
open Census554.EqualityCore
open SafeCoverCnf
open ExactTwelveCarrierIngress

/-- Joint-deletion label of a frozen job. -/

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
    have hbound := Census554.CoverCnf.sinzClauses_lit_bound
      (sourceBlockerVars cell 1) 1
      (sourceSinzBase cell 1) (by decide) hbelow c hc l hl
    rw [sourceSinzBase_eq, sourceBlockerVars, List.length_map,
      blockerCenters_length] at hbound
    norm_num at hbound
    have hbound1 : l.natAbs ≤ SafeCoverCnf.baseNumVars + 40 := by
      omega
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _ (show l.natAbs ≤
        sourceSinzBase cell (Fin.succ (Fin.succ 2)) by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 40 := hbound1
        _ ≤ sourceSinzBase cell (Fin.succ (Fin.succ 2)) := by
          rw [sourceSinzBase_eq]
          norm_num)]
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _ (show l.natAbs ≤
        sourceSinzBase cell (Fin.succ 2) by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 40 := hbound1
        _ ≤ sourceSinzBase cell (Fin.succ 2) := by
          rw [sourceSinzBase_eq]
          norm_num)]
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _
      (show l.natAbs ≤ sourceSinzBase cell 2 by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 40 := hbound1
        _ ≤ sourceSinzBase cell 2 := by
          rw [sourceSinzBase_eq]
          norm_num)]

/-- The completed five-source fold satisfies every Sinz clause emitted for
the third source block. -/
theorem sourceSinzAssign_sat_source_two
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (σ : Nat → Bool) {c : List Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell 2) 1
      (sourceSinzBase cell 2)) :
    evalClauseD
      (sourceSinzAssign cell (blockerAssign cell blocker σ)) c = true := by
  let σb := blockerAssign cell blocker σ
  let σ0 := sinzExt σb (sourceBlockerVars cell 0) 1
    (sourceSinzBase cell 0)
  let σ1 := sinzExt σ0 (sourceBlockerVars cell 1) 1
    (sourceSinzBase cell 1)
  have hfilter : (sourceBlockerVars cell 2).filter σ1 =
      (sourceBlockerVars cell 2).filter σb := by
    apply List.filter_congr
    intro v hv
    change sinzExt σ0 (sourceBlockerVars cell 1) 1
      (sourceSinzBase cell 1) v = σb v
    rw [sinzExt_sourceBlockerVar_of_lt cell σ0
      (i := 2) (j := 1) (by decide) hv]
    exact sinzExt_sourceBlockerVar_of_lt cell σb
      (i := 2) (j := 0) (by decide) hv
  have hcount : ((sourceBlockerVars cell 2).filter σ1).length ≤ 1 := by
    rw [hfilter,
      sourceBlockerVars_filter_blockerAssign_length cell hadded σ 2]
  have hbelow : ∀ v ∈ sourceBlockerVars cell 2,
      v ≤ sourceSinzBase cell 2 := fun v hv =>
    sourceBlockerVars_le_sourceSinzBase cell 2 hv
  have hlocal := sinz_sat σ1 (sourceBlockerVars cell 2) 1
    (sourceSinzBase cell 2) (by decide) hcount hbelow c hc
  rw [sourceSinzAssign_eq_chain]
  rw [Census554.CoverCnf.evalClauseD_congr (σ' :=
    sinzExt σ1 (sourceBlockerVars cell 2) 1 (sourceSinzBase cell 2))]
  · exact hlocal
  · intro l hl
    have hbound := Census554.CoverCnf.sinzClauses_lit_bound
      (sourceBlockerVars cell 2) 1
      (sourceSinzBase cell 2) (by decide) hbelow c hc l hl
    rw [sourceSinzBase_eq, sourceBlockerVars, List.length_map,
      blockerCenters_length] at hbound
    norm_num at hbound
    have hbound2 : l.natAbs ≤ SafeCoverCnf.baseNumVars + 60 := by
      omega
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _ (show l.natAbs ≤
        sourceSinzBase cell (Fin.succ (Fin.succ 2)) by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 60 := hbound2
        _ ≤ sourceSinzBase cell (Fin.succ (Fin.succ 2)) := by
          rw [sourceSinzBase_eq]
          norm_num)]
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _ (show l.natAbs ≤
        sourceSinzBase cell (Fin.succ 2) by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 60 := hbound2
        _ ≤ sourceSinzBase cell (Fin.succ 2) := by
          rw [sourceSinzBase_eq]
          norm_num)]

/-- The completed five-source fold satisfies every Sinz clause emitted for
the fourth source block. -/
theorem sourceSinzAssign_sat_source_three
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (σ : Nat → Bool) {c : List Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell (Fin.succ 2)) 1
      (sourceSinzBase cell (Fin.succ 2))) :
    evalClauseD
      (sourceSinzAssign cell (blockerAssign cell blocker σ)) c = true := by
  let σb := blockerAssign cell blocker σ
  let σ0 := sinzExt σb (sourceBlockerVars cell 0) 1
    (sourceSinzBase cell 0)
  let σ1 := sinzExt σ0 (sourceBlockerVars cell 1) 1
    (sourceSinzBase cell 1)
  let σ2 := sinzExt σ1 (sourceBlockerVars cell 2) 1
    (sourceSinzBase cell 2)
  have hfilter : (sourceBlockerVars cell (Fin.succ 2)).filter σ2 =
      (sourceBlockerVars cell (Fin.succ 2)).filter σb := by
    apply List.filter_congr
    intro v hv
    change sinzExt σ1 (sourceBlockerVars cell 2) 1
      (sourceSinzBase cell 2) v = σb v
    rw [sinzExt_sourceBlockerVar_of_lt cell σ1
      (i := Fin.succ 2) (j := 2) (by decide) hv]
    change sinzExt σ0 (sourceBlockerVars cell 1) 1
      (sourceSinzBase cell 1) v = σb v
    rw [sinzExt_sourceBlockerVar_of_lt cell σ0
      (i := Fin.succ 2) (j := 1) (by decide) hv]
    exact sinzExt_sourceBlockerVar_of_lt cell σb
      (i := Fin.succ 2) (j := 0) (by decide) hv
  have hcount :
      ((sourceBlockerVars cell (Fin.succ 2)).filter σ2).length ≤ 1 := by
    rw [hfilter,
      sourceBlockerVars_filter_blockerAssign_length cell hadded σ
        (Fin.succ 2)]
  have hbelow : ∀ v ∈ sourceBlockerVars cell (Fin.succ 2),
      v ≤ sourceSinzBase cell (Fin.succ 2) := fun v hv =>
    sourceBlockerVars_le_sourceSinzBase cell (Fin.succ 2) hv
  have hlocal := sinz_sat σ2 (sourceBlockerVars cell (Fin.succ 2)) 1
    (sourceSinzBase cell (Fin.succ 2)) (by decide) hcount hbelow c hc
  rw [sourceSinzAssign_eq_chain]
  rw [Census554.CoverCnf.evalClauseD_congr (σ' :=
    sinzExt σ2 (sourceBlockerVars cell (Fin.succ 2)) 1
      (sourceSinzBase cell (Fin.succ 2)))]
  · exact hlocal
  · intro l hl
    have hbound := Census554.CoverCnf.sinzClauses_lit_bound
      (sourceBlockerVars cell (Fin.succ 2)) 1
      (sourceSinzBase cell (Fin.succ 2)) (by decide) hbelow c hc l hl
    rw [sourceSinzBase_eq, sourceBlockerVars, List.length_map,
      blockerCenters_length] at hbound
    norm_num at hbound
    have hbound3 : l.natAbs ≤ SafeCoverCnf.baseNumVars + 80 := by
      omega
    rw [Census554.CoverCnf.sinzExt_le _ _ _ _ (show l.natAbs ≤
        sourceSinzBase cell (Fin.succ (Fin.succ 2)) by
      calc
        l.natAbs ≤ SafeCoverCnf.baseNumVars + 80 := hbound3
        _ ≤ sourceSinzBase cell (Fin.succ (Fin.succ 2)) := by
          rw [sourceSinzBase_eq]
          norm_num)]

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

/-- The canonical source-Sinz assignment satisfies the clauses emitted for
any of the five physical-source counters. -/
