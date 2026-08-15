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

theorem sourceSinzAssign_sat_source
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (σ : Nat → Bool) (i : Fin 5) {c : List Int}
    (hc : c ∈ sinzClauses (sourceBlockerVars cell i) 1
      (sourceSinzBase cell i)) :
    evalClauseD
      (sourceSinzAssign cell (blockerAssign cell blocker σ)) c = true := by
  fin_cases i
  · exact sourceSinzAssign_sat_source_zero cell hadded σ hc
  · exact sourceSinzAssign_sat_source_one cell hadded σ hc
  · exact sourceSinzAssign_sat_source_two cell hadded σ hc
  · exact sourceSinzAssign_sat_source_three cell hadded σ hc
  · exact sourceSinzAssign_sat_source_four cell hadded σ hc

/-- One source-wise Sinz extension leaves every source blocker input
unchanged, whether that input belongs to an earlier, current, or later source
block. -/
theorem sinzExt_sourceBlockerVar (cell : FrozenV14JobCoordinate)
    (σ : Nat → Bool) (i j : Fin 5) {v : Nat}
    (hv : v ∈ sourceBlockerVars cell i) :
    sinzExt σ (sourceBlockerVars cell j) 1 (sourceSinzBase cell j) v = σ v := by
  rcases lt_trichotomy j.val i.val with hji | hji | hij
  · exact sinzExt_sourceBlockerVar_of_lt cell σ hji hv
  · have hfin : j = i := Fin.ext hji
    subst j
    exact Census554.CoverCnf.sinzExt_le σ (sourceBlockerVars cell i) 1
      (sourceSinzBase cell i) (sourceBlockerVars_le_sourceSinzBase cell i hv)
  · simp only [sourceBlockerVars, List.mem_map] at hv
    obtain ⟨center, hcenter, rfl⟩ := hv
    apply Census554.CoverCnf.sinzExt_le
    have hbounds := (blockerVar_bounds_of_mem cell i hcenter).2
    rw [sourceSinzBase_eq]
    omega

/-- The complete source-wise Sinz fold leaves every blocker input unchanged. -/
theorem sourceSinzAssign_sourceBlockerVar (cell : FrozenV14JobCoordinate)
    (σ : Nat → Bool) (i : Fin 5) {v : Nat}
    (hv : v ∈ sourceBlockerVars cell i) :
    sourceSinzAssign cell σ v = σ v := by
  unfold sourceSinzAssign
  induction List.finRange 5 generalizing σ with
  | nil => rfl
  | cons j js ih =>
      rw [List.foldl_cons, ih]
      exact sinzExt_sourceBlockerVar cell σ i j hv

/-- Every center-wise input is a source blocker input and therefore survives
the complete source-wise Sinz fold. -/
theorem sourceSinzAssign_centerBlockerVar (cell : FrozenV14JobCoordinate)
    (σ : Nat → Bool) (center : Nat) {v : Nat}
    (hv : v ∈ centerBlockerVars cell center) :
    sourceSinzAssign cell σ v = σ v := by
  unfold centerBlockerVars at hv
  rw [List.mem_filterMap] at hv
  obtain ⟨i, _hi, hiOption⟩ := hv
  split at hiOption
  next hcenter =>
    simp only [Option.some.injEq] at hiOption
    subst v
    apply sourceSinzAssign_sourceBlockerVar cell σ i
    exact List.mem_map.mpr ⟨center, hcenter, rfl⟩
  next => simp at hiOption

/-- The source-Sinz assignment and blocker assignment select the same inputs
inside every center-wise counter. -/
theorem centerBlockerVars_filter_sourceSinzAssign
    (cell : FrozenV14JobCoordinate) (blocker : Fin 5 → Label)
    (σ : Nat → Bool) (center : Nat) :
    (centerBlockerVars cell center).filter
        (sourceSinzAssign cell (blockerAssign cell blocker σ)) =
      (centerBlockerVars cell center).filter
        (blockerAssign cell blocker σ) := by
  apply List.filter_congr
  intro v hv
  exact sourceSinzAssign_centerBlockerVar cell
    (blockerAssign cell blocker σ) center hv

/-- Every blocker input lies before the end of the five source blocks. -/
theorem blockerVar_le_sourceBlocksEnd (cell : FrozenV14JobCoordinate)
    (i : Fin 5) {center : Nat}
    (hcenter : center ∈
      blockerCenters ((physicalSources cell).getD i.val 0)) :
    blockerVar cell i center ≤ sourceBlocksEnd cell := by
  have hbounds := (blockerVar_bounds_of_mem cell i hcenter).2
  rw [sourceBlocksEnd]
  have hsum :
      ((List.finRange 5).map fun j => sourceBlockWidth cell j).sum = 100 := by
    norm_num [List.finRange, sourceBlockWidth_eq]
  rw [hsum]
  omega

/-- Every center-wise blocker input lies before the center-counter region. -/
theorem centerBlockerVars_le_sourceBlocksEnd (cell : FrozenV14JobCoordinate)
    (center : Nat) {v : Nat} (hv : v ∈ centerBlockerVars cell center) :
    v ≤ sourceBlocksEnd cell := by
  unfold centerBlockerVars at hv
  rw [List.mem_filterMap] at hv
  obtain ⟨i, _hi, hiOption⟩ := hv
  split at hiOption
  next hcenter =>
    simp only [Option.some.injEq] at hiOption
    subst v
    exact blockerVar_le_sourceBlocksEnd cell i hcenter
  next => simp at hiOption

/-- Every center-wise input lies below that center's auxiliary base. -/
theorem centerBlockerVars_le_centerSinzBase (cell : FrozenV14JobCoordinate)
    (center : Nat) {v : Nat} (hv : v ∈ centerBlockerVars cell center) :
    v ≤ centerSinzBase cell center := by
  unfold centerBlockerVars at hv
  rw [List.mem_filterMap] at hv
  obtain ⟨i, _hi, hiOption⟩ := hv
  split at hiOption
  next hcenter =>
    simp only [Option.some.injEq] at hiOption
    subst v
    have hsource := blockerVar_le_sourceBlocksEnd cell i hcenter
    simp only [centerSinzBase]
    omega
  next => simp at hiOption

/-- Extend through the twelve center-wise bound-one Sinz blocks, in increasing
center order. -/
def centerSinzAssign (cell : FrozenV14JobCoordinate) (σ : Nat → Bool) :
    Nat → Bool :=
  (List.range 12).foldl
    (fun acc center =>
      sinzExt acc (centerBlockerVars cell center) 1
        (centerSinzBase cell center)) σ

/-- The center-Sinz accumulator immediately before center `center`. -/
def centerSinzAcc (cell : FrozenV14JobCoordinate) (σ : Nat → Bool)
    (center : Nat) : Nat → Bool :=
  ((List.range 12).take center).foldl
    (fun acc q =>
      sinzExt acc (centerBlockerVars cell q) 1
        (centerSinzBase cell q)) σ

/-- The next center auxiliary base is the current base plus the current Sinz
variable count. -/
theorem centerSinzBase_succ (cell : FrozenV14JobCoordinate) (center : Nat) :
    centerSinzBase cell (center + 1) =
      centerSinzBase cell center +
        sinzVarCount (centerBlockerVars cell center).length 1 := by
  simp [centerSinzBase, List.range_succ,
    List.map_append, List.sum_append, Nat.add_assoc]

/-- Center auxiliary bases are monotone in the center index. -/
theorem centerSinzBase_mono (cell : FrozenV14JobCoordinate) {a b : Nat}
    (hab : a ≤ b) : centerSinzBase cell a ≤ centerSinzBase cell b := by
  have hsum :
      ∀ {a b : Nat}, a ≤ b →
        ((List.range a).map fun c =>
          sinzVarCount (centerBlockerVars cell c).length 1).sum ≤
        ((List.range b).map fun c =>
          sinzVarCount (centerBlockerVars cell c).length 1).sum := by
    intro a b hab
    induction hab with
    | refl => exact le_rfl
    | @step b _ ih =>
        simp only [Nat.succ_eq_add_one, List.range_succ,
          List.map_append, List.sum_append]
        omega
  simp only [centerSinzBase]
  exact Nat.add_le_add_left (hsum hab) _

/-- On variables in or before the next center base, the full center fold is
exactly its prefix accumulator followed by the current center extension. -/
theorem centerSinzAssign_block (cell : FrozenV14JobCoordinate)
    (σ : Nat → Bool) {center v : Nat} (hcenter : center < 12)
    (hv : v ≤ centerSinzBase cell (center + 1)) :
    centerSinzAssign cell σ v =
      sinzExt (centerSinzAcc cell σ center)
        (centerBlockerVars cell center) 1
        (centerSinzBase cell center) v := by
  have hp12 : center < (List.range 12).length := by
    rw [List.length_range]
    exact hcenter
  have htake :
      (List.range 12).take (center + 1) =
        (List.range 12).take center ++ [center] := by
    rw [List.take_add_one, List.getElem?_eq_getElem hp12]
    simp [List.getElem_range]
  simp only [centerSinzAssign, centerSinzAcc]
  conv_lhs =>
    rw [← List.take_append_drop (center + 1) (List.range 12)]
  rw [List.foldl_append, htake, List.foldl_append, List.foldl_cons,
    List.foldl_nil]
  refine SafeCoverCnf.foldl_sinzExt_low
    ((List.range 12).drop (center + 1))
    (fun q => centerBlockerVars cell q) (fun _ => 1)
    (fun q => centerSinzBase cell q) _ ?_
  intro q hq
  rw [List.range_eq_range', List.drop_range', List.mem_range'] at hq
  exact le_trans hv (centerSinzBase_mono cell (by omega))

/-- The completed center-wise Sinz fold satisfies every clause emitted for
each of the twelve center counters. -/
theorem centerSinzAssign_sat_center
    {row : RowPattern Label} {blocker : Fin 5 → Label}
    (cell : FrozenV14JobCoordinate)
    (hadded : FrozenPhysicalCycleCnfAddedConstraintsHold row blocker
      (cell.1.1 : Label × Label).1 (cell.1.1 : Label × Label).2)
    (σ : Nat → Bool) {center : Nat} (hcenter : center < 12)
    {c : List Int}
    (hc : c ∈ sinzClauses (centerBlockerVars cell center) 1
      (centerSinzBase cell center)) :
    evalClauseD
      (centerSinzAssign cell
        (sourceSinzAssign cell (blockerAssign cell blocker σ))) c = true := by
  let σb := blockerAssign cell blocker σ
  let τ := sourceSinzAssign cell σb
  let xs := centerBlockerVars cell center
  let base := centerSinzBase cell center
  let pre := centerSinzAcc cell τ center
  by_cases hm : xs.length ≤ 1
  · have hm' : (centerBlockerVars cell center).length ≤ 1 := by
      simpa [xs] using hm
    unfold sinzClauses at hc
    rw [if_pos hm'] at hc
    simp at hc
  · have hbelow : ∀ v ∈ xs, v ≤ base := fun v hv =>
      centerBlockerVars_le_centerSinzBase cell center hv
    have hpre : ∀ v ∈ xs, pre v = τ v := by
      intro v hv
      unfold pre centerSinzAcc
      apply SafeCoverCnf.foldl_sinzExt_low
      intro q hq
      exact le_trans (centerBlockerVars_le_sourceBlocksEnd cell center hv)
        (by simp only [centerSinzBase]; omega)
    have hcount : (xs.filter pre).length ≤ 1 := by
      calc
        (xs.filter pre).length = (xs.filter τ).length := by
          congr 1
          apply List.filter_congr
          intro v hv
          exact hpre v hv
        _ = (xs.filter σb).length := by
          simpa [τ, σb, xs] using congrArg List.length
            (centerBlockerVars_filter_sourceSinzAssign cell blocker σ center)
        _ ≤ 1 := by
          simpa [σb, xs] using
            centerBlockerVars_filter_blockerAssign_length_le_one
              cell hadded σ center
    have hlocal := Census554.CoverCnf.sinz_sat pre xs 1 base
      (by decide) hcount hbelow c hc
    rw [Census554.CoverCnf.evalClauseD_congr (σ' :=
      sinzExt pre xs 1 base)]
    · exact hlocal
    · intro l hl
      have hbound := Census554.CoverCnf.sinzClauses_lit_bound
        xs 1 base (by decide) hbelow c hc l hl
      have hlit : l.natAbs ≤ centerSinzBase cell (center + 1) := by
        have hm' : ¬ (centerBlockerVars cell center).length ≤ 1 := by
          simpa [xs] using hm
        rw [centerSinzBase_succ]
        simp only [sinzVarCount, if_neg hm']
        simpa [xs, base] using hbound
      exact centerSinzAssign_block cell τ hcenter hlit

/-- Canonical valuation proposed for one semantic normalized-v14 job: the
source-faithful base witness, its five selected blockers, and both layers of
Sinz auxiliaries. -/
def v14Assign (cell : FrozenV14JobCoordinate) (blocker : Fin 5 → Label)
    (idx : Nat → Nat) : Nat → Bool :=
  centerSinzAssign cell <|
    sourceSinzAssign cell <|
      blockerAssign cell blocker (SafeCoverCnf.finalAssign idx)

/-- Every blocker input is strictly above the source-faithful base CNF. -/
theorem baseNumVars_lt_blockerVar (cell : FrozenV14JobCoordinate) (i : Fin 5)
    (center : Nat) :
    SafeCoverCnf.baseNumVars < blockerVar cell i center := by
  simp only [blockerVar, sourceBlockBase]
  omega

/-- Installing blocker inputs leaves the complete source-faithful assignment
unchanged on its original variable interval. -/
