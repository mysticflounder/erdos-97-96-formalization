/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221FiveOmissionFiniteChecks

/-!
# Source satisfiability of the exact-twelve five-omission CNF

This module extends the canonical source-safe cover assignment with the
deleted-label, blocker, and five-center selectors used by the five-omission
CEGAR formula.  It is a source-to-CNF ingress theorem, not an UNSAT result.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FiveOmissionCnf

open Census554.CoverCnf
open Census554.EqualityCore
open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SafeCoverIndexBridge
open TerminalBankConsumer

def deletedSelectorAssign (deleted : Label) (v : Nat) : Bool :=
  decide (v = deletedVar deleted.val)

def blockerSelectorAssign (blocker : Label) (v : Nat) : Bool :=
  decide (v = blockerVar blocker.val)

/-- Install the 36 semantic selector values above the frozen base interval.
All later variables initially remain false and are filled by the three Sinz
extensions below. -/
def selectorAssign (σ : Nat → Bool) (deleted blocker : Label)
    (centers : Finset Label) (v : Nat) : Bool :=
  if v ≤ SafeCoverCnf.baseNumVars then σ v
  else if v ≤ SafeCoverCnf.baseNumVars + 12 then
    deletedSelectorAssign deleted v
  else if v ≤ SafeCoverCnf.baseNumVars + 24 then
    blockerSelectorAssign blocker v
  else if v ≤ SafeCoverCnf.baseNumVars + 36 then
    centerSelectorAssign centers v
  else false

def deletedSinzAssign (σ : Nat → Bool) (deleted blocker : Label)
    (centers : Finset Label) : Nat → Bool :=
  sinzExt (selectorAssign σ deleted blocker centers)
    deletedVars 1 deletedSinzBase

def blockerSinzAssign (σ : Nat → Bool) (deleted blocker : Label)
    (centers : Finset Label) : Nat → Bool :=
  sinzExt (deletedSinzAssign σ deleted blocker centers)
    blockerVars 1 blockerSinzBase

def fiveOmissionAssign (σ : Nat → Bool) (deleted blocker : Label)
    (centers : Finset Label) : Nat → Bool :=
  sinzExt (blockerSinzAssign σ deleted blocker centers)
    centerVars 5 centerSinzBase

theorem selectorAssign_base_low (σ : Nat → Bool) (deleted blocker : Label)
    (centers : Finset Label) {v : Nat}
    (hv : v ≤ SafeCoverCnf.baseNumVars) :
    selectorAssign σ deleted blocker centers v = σ v := by
  simp [selectorAssign, hv]

theorem fiveOmissionAssign_base_low (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label) {v : Nat}
    (hv : v ≤ SafeCoverCnf.baseNumVars) :
    fiveOmissionAssign σ deleted blocker centers v = σ v := by
  have hvCenter : v ≤ centerSinzBase :=
    hv.trans (by native_decide)
  have hvBlocker : v ≤ blockerSinzBase :=
    hv.trans (by native_decide)
  have hvDeleted : v ≤ deletedSinzBase :=
    hv.trans (by native_decide)
  rw [fiveOmissionAssign, sinzExt_le _ _ _ _ hvCenter]
  rw [blockerSinzAssign, sinzExt_le _ _ _ _ hvBlocker]
  rw [deletedSinzAssign, sinzExt_le _ _ _ _ hvDeleted]
  exact selectorAssign_base_low σ deleted blocker centers hv

theorem selectorAssign_deletedVar (σ : Nat → Bool)
    (deleted blocker p : Label) (centers : Finset Label) :
    selectorAssign σ deleted blocker centers (deletedVar p.val) =
      deletedSelectorAssign deleted (deletedVar p.val) := by
  have hbase : ¬deletedVar p.val ≤ SafeCoverCnf.baseNumVars := by
    unfold deletedVar
    omega
  have hrange : deletedVar p.val ≤ SafeCoverCnf.baseNumVars + 12 := by
    unfold deletedVar
    omega
  simp [selectorAssign, hbase, hrange]

theorem selectorAssign_blockerVar (σ : Nat → Bool)
    (deleted blocker p : Label) (centers : Finset Label) :
    selectorAssign σ deleted blocker centers (blockerVar p.val) =
      blockerSelectorAssign blocker (blockerVar p.val) := by
  have hbase : ¬blockerVar p.val ≤ SafeCoverCnf.baseNumVars := by
    unfold blockerVar
    omega
  have hdeleted : ¬blockerVar p.val ≤ SafeCoverCnf.baseNumVars + 12 := by
    unfold blockerVar
    omega
  have hrange : blockerVar p.val ≤ SafeCoverCnf.baseNumVars + 24 := by
    unfold blockerVar
    omega
  simp [selectorAssign, hbase, hdeleted, hrange]

theorem selectorAssign_centerVar (σ : Nat → Bool)
    (deleted blocker p : Label) (centers : Finset Label) :
    selectorAssign σ deleted blocker centers (centerVar p.val) =
      centerSelectorAssign centers (centerVar p.val) := by
  have hbase : ¬centerVar p.val ≤ SafeCoverCnf.baseNumVars := by
    unfold centerVar
    omega
  have hdeleted : ¬centerVar p.val ≤ SafeCoverCnf.baseNumVars + 12 := by
    unfold centerVar
    omega
  have hblocker : ¬centerVar p.val ≤ SafeCoverCnf.baseNumVars + 24 := by
    unfold centerVar
    omega
  have hrange : centerVar p.val ≤ SafeCoverCnf.baseNumVars + 36 := by
    unfold centerVar
    omega
  simp [selectorAssign, hbase, hdeleted, hblocker, hrange]

/-- The completed counter assignment agrees with the semantic assignment on
all 36 selector variables. -/
theorem fiveOmissionAssign_selector_low (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label) {v : Nat}
    (hv : v ≤ deletedSinzBase) :
    fiveOmissionAssign σ deleted blocker centers v =
      selectorAssign σ deleted blocker centers v := by
  have hvCenter : v ≤ centerSinzBase :=
    hv.trans (by native_decide)
  have hvBlocker : v ≤ blockerSinzBase :=
    hv.trans (by native_decide)
  rw [fiveOmissionAssign, sinzExt_le _ _ _ _ hvCenter]
  rw [blockerSinzAssign, sinzExt_le _ _ _ _ hvBlocker]
  exact sinzExt_le _ _ _ _ hv

set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
theorem deletedSelector_filter_length :
    ∀ deleted : Label,
      (deletedVars.filter (deletedSelectorAssign deleted)).length = 1 := by
  native_decide

set_option maxHeartbeats 0 in
set_option linter.style.nativeDecide false in
theorem blockerSelector_filter_length :
    ∀ blocker : Label,
      (blockerVars.filter (blockerSelectorAssign blocker)).length = 1 := by
  native_decide

theorem centerSelector_filter_length :
    ∀ centers : Finset Label,
      (centerVars.filter (centerSelectorAssign centers)).length =
        centers.card := by
  intro centers
  have hcenterVarInjective : Function.Injective centerVar := by
    intro p q hpq
    unfold centerVar at hpq
    omega
  have hcenterValue : ∀ p : Label,
      centerSelectorAssign centers (centerVar p.val) = decide (p ∈ centers) := by
    intro p
    have hiff :
        (∃ center ∈ centers, centerVar p.val = centerVar center.val) ↔
          p ∈ centers := by
      constructor
      · rintro ⟨center, hcenter, heq⟩
        have hval : p.val = center.val := hcenterVarInjective heq
        simpa [Fin.ext hval] using hcenter
      · intro hp
        exact ⟨p, hp, rfl⟩
    simp [centerSelectorAssign, hiff]
  have hfilteredNodup :
      (centerVars.filter (centerSelectorAssign centers)).Nodup := by
    apply List.Nodup.filter
    unfold centerVars
    exact List.nodup_range.map hcenterVarInjective
  have htoFinset :
      (centerVars.filter (centerSelectorAssign centers)).toFinset =
        centers.image fun p => centerVar p.val := by
    ext v
    simp only [List.mem_toFinset, List.mem_filter, Finset.mem_image]
    constructor
    · rintro ⟨hv, hselected⟩
      unfold centerVars at hv
      rcases List.mem_map.mp hv with ⟨p, hp, rfl⟩
      let p' : Label := ⟨p, List.mem_range.mp hp⟩
      have hp' : p' ∈ centers := by
        have hsemantic := hcenterValue p'
        simpa [p'] using hsemantic.symm.trans hselected
      exact ⟨p', hp', rfl⟩
    · rintro ⟨p, hp, rfl⟩
      constructor
      · unfold centerVars
        exact List.mem_map.mpr
          ⟨p.val, List.mem_range.mpr p.isLt, rfl⟩
      · simpa [hp] using hcenterValue p
  calc
    (centerVars.filter (centerSelectorAssign centers)).length =
        (centerVars.filter (centerSelectorAssign centers)).toFinset.card :=
      (List.toFinset_card_of_nodup hfilteredNodup).symm
    _ = (centers.image fun p => centerVar p.val).card := by rw [htoFinset]
    _ = centers.card := Finset.card_image_of_injective centers (by
      intro p q hpq
      exact Fin.ext (hcenterVarInjective hpq))

set_option linter.style.nativeDecide false in
theorem deletedSelectorAssign_deletedVar :
    ∀ deleted p : Label,
      deletedSelectorAssign deleted (deletedVar p.val) = decide (p = deleted) := by
  native_decide

set_option linter.style.nativeDecide false in
theorem blockerSelectorAssign_blockerVar :
    ∀ blocker p : Label,
      blockerSelectorAssign blocker (blockerVar p.val) = decide (p = blocker) := by
  native_decide

theorem centerSelectorAssign_centerVar :
    ∀ centers : Finset Label, ∀ p : Label,
      centerSelectorAssign centers (centerVar p.val) = decide (p ∈ centers) := by
  intro centers p
  have hiff :
      (∃ center ∈ centers, centerVar p.val = centerVar center.val) ↔
        p ∈ centers := by
    constructor
    · rintro ⟨center, hcenter, heq⟩
      have hval : p.val = center.val := by
        unfold centerVar at heq
        omega
      simpa [Fin.ext hval] using hcenter
    · intro hp
      exact ⟨p, hp, rfl⟩
  simp [centerSelectorAssign, hiff]

theorem fiveOmissionAssign_deletedVar (σ : Nat → Bool)
    (deleted blocker p : Label) (centers : Finset Label) :
    fiveOmissionAssign σ deleted blocker centers (deletedVar p.val) =
      decide (p = deleted) := by
  rw [fiveOmissionAssign_selector_low σ deleted blocker centers (by
    unfold deletedVar deletedSinzBase
    omega)]
  rw [selectorAssign_deletedVar, deletedSelectorAssign_deletedVar]

theorem fiveOmissionAssign_blockerVar (σ : Nat → Bool)
    (deleted blocker p : Label) (centers : Finset Label) :
    fiveOmissionAssign σ deleted blocker centers (blockerVar p.val) =
      decide (p = blocker) := by
  rw [fiveOmissionAssign_selector_low σ deleted blocker centers (by
    unfold blockerVar deletedSinzBase
    omega)]
  rw [selectorAssign_blockerVar, blockerSelectorAssign_blockerVar]

theorem fiveOmissionAssign_centerVar (σ : Nat → Bool)
    (deleted blocker p : Label) (centers : Finset Label) :
    fiveOmissionAssign σ deleted blocker centers (centerVar p.val) =
      decide (p ∈ centers) := by
  rw [fiveOmissionAssign_selector_low σ deleted blocker centers (by
    unfold centerVar deletedSinzBase
    omega)]
  rw [selectorAssign_centerVar, centerSelectorAssign_centerVar]

theorem selectorAssign_deleted_filter_length (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label) :
    (deletedVars.filter (selectorAssign σ deleted blocker centers)).length = 1 := by
  rw [List.filter_congr (fun v hv => ?_)]
  · exact deletedSelector_filter_length deleted
  · rcases List.mem_map.mp hv with ⟨p, hp, rfl⟩
    exact selectorAssign_deletedVar σ deleted blocker ⟨p, by
      simpa using List.mem_range.mp hp⟩ centers

theorem selectorAssign_blocker_filter_length (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label) :
    (blockerVars.filter (selectorAssign σ deleted blocker centers)).length = 1 := by
  rw [List.filter_congr (fun v hv => ?_)]
  · exact blockerSelector_filter_length blocker
  · rcases List.mem_map.mp hv with ⟨p, hp, rfl⟩
    exact selectorAssign_blockerVar σ deleted blocker ⟨p, by
      simpa using List.mem_range.mp hp⟩ centers

theorem selectorAssign_center_filter_length (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label) :
    (centerVars.filter (selectorAssign σ deleted blocker centers)).length =
      centers.card := by
  rw [List.filter_congr (fun v hv => ?_)]
  · exact centerSelector_filter_length centers
  · rcases List.mem_map.mp hv with ⟨p, hp, rfl⟩
    exact selectorAssign_centerVar σ deleted blocker ⟨p, by
      simpa using List.mem_range.mp hp⟩ centers

theorem deletedSinzAssign_selector_low (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label) {v : Nat}
    (hv : v ≤ deletedSinzBase) :
    deletedSinzAssign σ deleted blocker centers v =
      selectorAssign σ deleted blocker centers v := by
  exact sinzExt_le _ _ _ _ hv

theorem blockerSinzAssign_selector_low (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label) {v : Nat}
    (hv : v ≤ deletedSinzBase) :
    blockerSinzAssign σ deleted blocker centers v =
      selectorAssign σ deleted blocker centers v := by
  have hvBlocker : v ≤ blockerSinzBase :=
    hv.trans (by native_decide)
  rw [blockerSinzAssign, sinzExt_le _ _ _ _ hvBlocker]
  exact deletedSinzAssign_selector_low σ deleted blocker centers hv

theorem deletedSinzAssign_sat (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label) {c : List Int}
    (hc : c ∈ sinzClauses deletedVars 1 deletedSinzBase) :
    evalClauseD (fiveOmissionAssign σ deleted blocker centers) c = true := by
  have hbelow : ∀ v ∈ deletedVars, v ≤ deletedSinzBase := by
    native_decide
  have hlocal := sinz_sat
    (selectorAssign σ deleted blocker centers) deletedVars 1 deletedSinzBase
    (by decide)
    (by rw [selectorAssign_deleted_filter_length]) hbelow c hc
  calc
    evalClauseD (fiveOmissionAssign σ deleted blocker centers) c =
        evalClauseD (deletedSinzAssign σ deleted blocker centers) c := by
      apply SafeCoverCnf.evalClauseD_congr
      intro l hl
      have hbound := sinzClauses_lit_bound deletedVars 1 deletedSinzBase
        (by decide) hbelow c hc l hl
      have hblocker : l.natAbs ≤ blockerSinzBase := by
        calc
          l.natAbs ≤ deletedSinzBase + 1 * deletedVars.length := hbound
          _ = blockerSinzBase := by native_decide
      have hcenter : l.natAbs ≤ centerSinzBase :=
        hblocker.trans (by native_decide)
      rw [fiveOmissionAssign, sinzExt_le _ _ _ _ hcenter]
      exact sinzExt_le _ _ _ _ hblocker
    _ = true := hlocal

theorem blockerSinzAssign_sat (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label) {c : List Int}
    (hc : c ∈ sinzClauses blockerVars 1 blockerSinzBase) :
    evalClauseD (fiveOmissionAssign σ deleted blocker centers) c = true := by
  have hbelow : ∀ v ∈ blockerVars, v ≤ blockerSinzBase := by
    native_decide
  have hcount :
      ((blockerVars.filter
        (deletedSinzAssign σ deleted blocker centers)).length) ≤ 1 := by
    have hfilter :
        blockerVars.filter (deletedSinzAssign σ deleted blocker centers) =
          blockerVars.filter (selectorAssign σ deleted blocker centers) := by
      apply List.filter_congr
      intro v hv
      apply deletedSinzAssign_selector_low
      rcases List.mem_map.mp hv with ⟨p, hp, rfl⟩
      have hp' := List.mem_range.mp hp
      unfold blockerVar deletedSinzBase
      omega
    rw [hfilter, selectorAssign_blocker_filter_length]
  have hlocal := sinz_sat
    (deletedSinzAssign σ deleted blocker centers) blockerVars 1 blockerSinzBase
    (by decide) hcount hbelow c hc
  calc
    evalClauseD (fiveOmissionAssign σ deleted blocker centers) c =
        evalClauseD (blockerSinzAssign σ deleted blocker centers) c := by
      apply SafeCoverCnf.evalClauseD_congr
      intro l hl
      have hbound := sinzClauses_lit_bound blockerVars 1 blockerSinzBase
        (by decide) hbelow c hc l hl
      have hcenter : l.natAbs ≤ centerSinzBase := by
        calc
          l.natAbs ≤ blockerSinzBase + 1 * blockerVars.length := hbound
          _ = centerSinzBase := by native_decide
      exact sinzExt_le _ _ _ _ hcenter
    _ = true := hlocal

theorem centerSinzAssign_sat (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label)
    (hcenters : centers.card = 5) {c : List Int}
    (hc : c ∈ sinzClauses centerVars 5 centerSinzBase) :
    evalClauseD (fiveOmissionAssign σ deleted blocker centers) c = true := by
  have hbelow : ∀ v ∈ centerVars, v ≤ centerSinzBase := by
    native_decide
  have hcount :
      ((centerVars.filter
        (blockerSinzAssign σ deleted blocker centers)).length) ≤ 5 := by
    have hfilter :
        centerVars.filter (blockerSinzAssign σ deleted blocker centers) =
          centerVars.filter (selectorAssign σ deleted blocker centers) := by
      apply List.filter_congr
      intro v hv
      apply blockerSinzAssign_selector_low
      rcases List.mem_map.mp hv with ⟨p, hp, rfl⟩
      have hp' := List.mem_range.mp hp
      unfold centerVar deletedSinzBase
      omega
    rw [hfilter, selectorAssign_center_filter_length, hcenters]
  exact sinz_sat
    (blockerSinzAssign σ deleted blocker centers) centerVars 5 centerSinzBase
    (by decide) hcount hbelow c hc

theorem deletedPositiveClause_sat (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label) :
    evalClauseD (fiveOmissionAssign σ deleted blocker centers)
      (deletedVars.map Int.ofNat) = true := by
  rw [evalClauseD, List.any_eq_true]
  refine ⟨Int.ofNat (deletedVar deleted.val), ?_, ?_⟩
  · apply List.mem_map_of_mem
    exact List.mem_map_of_mem (List.mem_range.mpr deleted.isLt)
  · rw [evalLitD_pos _ (by unfold deletedVar; omega),
      fiveOmissionAssign_deletedVar]
    simp

theorem blockerPositiveClause_sat (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label) :
    evalClauseD (fiveOmissionAssign σ deleted blocker centers)
      (blockerVars.map Int.ofNat) = true := by
  rw [evalClauseD, List.any_eq_true]
  refine ⟨Int.ofNat (blockerVar blocker.val), ?_, ?_⟩
  · apply List.mem_map_of_mem
    exact List.mem_map_of_mem (List.mem_range.mpr blocker.isLt)
  · rw [evalLitD_pos _ (by unfold blockerVar; omega),
      fiveOmissionAssign_blockerVar]
    simp

theorem centerAtLeastFiveAssign_sat (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label)
    (hcenters : centers.card = 5) {c : List Int}
    (hc : c ∈ centerAtLeastFiveClauses) :
    evalClauseD (fiveOmissionAssign σ deleted blocker centers) c = true := by
  calc
    evalClauseD (fiveOmissionAssign σ deleted blocker centers) c =
        evalClauseD (centerSelectorAssign centers) c := by
      apply SafeCoverCnf.evalClauseD_congr
      intro l hl
      obtain ⟨p, rfl⟩ := centerAtLeastFive_literal_shape c hc l hl
      change fiveOmissionAssign σ deleted blocker centers (centerVar p.val) =
        centerSelectorAssign centers (centerVar p.val)
      rw [fiveOmissionAssign_centerVar, centerSelectorAssign_centerVar]
    _ = true := centerAtLeastFive_sat centers hcenters c hc

theorem roleDistinctness_sat (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label)
    (hblockerDeleted : blocker ≠ deleted)
    (hblockerCenters : blocker ∉ centers) {c : List Int}
    (hc : c ∈ roleDistinctnessClauses) :
    evalClauseD (fiveOmissionAssign σ deleted blocker centers) c = true := by
  simp only [roleDistinctnessClauses, List.mem_flatMap, List.mem_range,
    List.mem_cons, List.not_mem_nil, or_false] at hc
  rcases hc with ⟨p, hp, rfl | rfl⟩
  · let p' : Label := ⟨p, hp⟩
    simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false,
      evalLitD_negNat]
    rw [fiveOmissionAssign_deletedVar σ deleted blocker p' centers,
      fiveOmissionAssign_blockerVar σ deleted blocker p' centers]
    by_cases hpd : p' = deleted
    · simp [hpd, Ne.symm hblockerDeleted]
    · simp [hpd]
  · let p' : Label := ⟨p, hp⟩
    simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false,
      evalLitD_negNat]
    rw [fiveOmissionAssign_blockerVar σ deleted blocker p' centers,
      fiveOmissionAssign_centerVar σ deleted blocker p' centers]
    by_cases hpb : p' = blocker
    · simp [hpb, hblockerCenters]
    · simp [hpb]

theorem fiveOmissionAssign_xVar_eq_true_iff
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (deleted blocker : Label) (centers : Finset Label)
    {p i : Nat} (hp : p < 12) (hi : i < SafeCoverCnf.candCount p) :
    fiveOmissionAssign (SafeCoverCnf.finalAssign (coverIndex row))
        deleted blocker centers (SafeCoverCnf.xVar p i) = true ↔
      i = coverIndex row p := by
  have hx : SafeCoverCnf.xVar p i ≤ SafeCoverCnf.baseNumVars := by
    calc
      SafeCoverCnf.xVar p i ≤ SafeCoverCnf.nX :=
        SafeCoverCnf.xVar_le_nX hp hi
      _ ≤ SafeCoverCnf.baseNumVars := by
        rw [SafeCoverCnf.nX_eq, SafeCoverCnf.baseNumVars_eq]
        omega
  rw [fiveOmissionAssign_base_low _ deleted blocker centers hx,
    SafeCoverCnf.finalAssign_x (coverIndex row) hp hi,
    SafeCoverCnf.baseAssign_iff (coverIndex row)
      (fun _ hq => coverIndex_lt_of_safeCubeOK hrow hq) hp hi]

theorem boundaryClause_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (deleted : Label) (B : FrozenFiveOmissionBoundary row deleted)
    (d p : Label) {i : Nat} (hi : i < SafeCoverCnf.candCount p.val) :
    evalClauseD
        (fiveOmissionAssign (SafeCoverCnf.finalAssign (coverIndex row))
          deleted B.blocker B.centers)
        (boundaryClause d.val p.val i) = true := by
  let τ := fiveOmissionAssign (SafeCoverCnf.finalAssign (coverIndex row))
    deleted B.blocker B.centers
  by_cases hd : d = deleted
  · subst d
    by_cases hbit :
        ((SafeCoverCnf.candMasks p.val).getD i 0).testBit deleted.val = true
    · rw [boundaryClause, if_pos hbit]
      by_cases hpCenter : p ∈ B.centers
      · have hxfalse : τ (SafeCoverCnf.xVar p.val i) = false := by
          apply Bool.eq_false_of_not_eq_true
          intro hxtrue
          have hiEq := (fiveOmissionAssign_xVar_eq_true_iff hrow
            deleted B.blocker B.centers p.isLt hi).1 hxtrue
          subst i
          rw [coverIndex_testBit_of_safeCubeOK hrow p deleted] at hbit
          exact (B.deleted_not_mem_center_rows p hpCenter)
            (of_decide_eq_true hbit)
        simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false,
          evalLitD_negNat]
        change (!τ (deletedVar deleted.val) ||
          (!τ (centerVar p.val) ||
            !τ (SafeCoverCnf.xVar p.val i))) = true
        rw [show τ (deletedVar deleted.val) = decide (deleted = deleted) by
          exact fiveOmissionAssign_deletedVar _ deleted B.blocker deleted B.centers,
          show τ (centerVar p.val) = decide (p ∈ B.centers) by
            exact fiveOmissionAssign_centerVar _ deleted B.blocker p B.centers,
          hxfalse]
        simp [hpCenter]
      · simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false,
          evalLitD_negNat]
        change (!τ (deletedVar deleted.val) ||
          (!τ (centerVar p.val) ||
            !τ (SafeCoverCnf.xVar p.val i))) = true
        rw [show τ (deletedVar deleted.val) = decide (deleted = deleted) by
          exact fiveOmissionAssign_deletedVar _ deleted B.blocker deleted B.centers,
          show τ (centerVar p.val) = decide (p ∈ B.centers) by
            exact fiveOmissionAssign_centerVar _ deleted B.blocker p B.centers]
        simp [hpCenter]
    · rw [boundaryClause, if_neg hbit]
      by_cases hpBlocker : p = B.blocker
      · subst p
        have hxfalse : τ (SafeCoverCnf.xVar B.blocker.val i) = false := by
          apply Bool.eq_false_of_not_eq_true
          intro hxtrue
          have hiEq := (fiveOmissionAssign_xVar_eq_true_iff hrow
            deleted B.blocker B.centers B.blocker.isLt hi).1 hxtrue
          subst i
          apply hbit
          rw [coverIndex_testBit_of_safeCubeOK hrow B.blocker deleted]
          exact decide_eq_true B.deleted_mem_blocker_row
        simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false,
          evalLitD_negNat]
        change (!τ (deletedVar deleted.val) ||
          (!τ (blockerVar B.blocker.val) ||
            !τ (SafeCoverCnf.xVar B.blocker.val i))) = true
        rw [show τ (deletedVar deleted.val) = decide (deleted = deleted) by
          exact fiveOmissionAssign_deletedVar _ deleted B.blocker deleted B.centers,
          show τ (blockerVar B.blocker.val) = decide (B.blocker = B.blocker) by
            exact fiveOmissionAssign_blockerVar _ deleted B.blocker B.blocker B.centers,
          hxfalse]
        simp
      · simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false,
          evalLitD_negNat]
        change (!τ (deletedVar deleted.val) ||
          (!τ (blockerVar p.val) ||
            !τ (SafeCoverCnf.xVar p.val i))) = true
        rw [show τ (deletedVar deleted.val) = decide (deleted = deleted) by
          exact fiveOmissionAssign_deletedVar _ deleted B.blocker deleted B.centers,
          show τ (blockerVar p.val) = decide (p = B.blocker) by
            exact fiveOmissionAssign_blockerVar _ deleted B.blocker p B.centers]
        simp [hpBlocker]
  · unfold boundaryClause
    split
    · simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false,
        evalLitD_negNat]
      change (!τ (deletedVar d.val) ||
        (!τ (centerVar p.val) ||
          !τ (SafeCoverCnf.xVar p.val i))) = true
      rw [show τ (deletedVar d.val) = decide (d = deleted) by
        exact fiveOmissionAssign_deletedVar _ deleted B.blocker d B.centers]
      simp [hd]
    · simp only [evalClauseD, List.any_cons, List.any_nil, Bool.or_false,
        evalLitD_negNat]
      change (!τ (deletedVar d.val) ||
        (!τ (blockerVar p.val) ||
          !τ (SafeCoverCnf.xVar p.val i))) = true
      rw [show τ (deletedVar d.val) = decide (d = deleted) by
        exact fiveOmissionAssign_deletedVar _ deleted B.blocker d B.centers]
      simp [hd]

theorem boundaryClauses_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (deleted : Label) (B : FrozenFiveOmissionBoundary row deleted)
    {c : List Int} (hc : c ∈ boundaryClauses) :
    evalClauseD
        (fiveOmissionAssign (SafeCoverCnf.finalAssign (coverIndex row))
          deleted B.blocker B.centers) c = true := by
  simp only [boundaryClauses, List.mem_flatMap, List.mem_range,
    List.mem_map] at hc
  obtain ⟨d, hd, p, hp, i, hi, hci⟩ := hc
  rw [← hci]
  exact boundaryClause_sat hrow deleted B ⟨d, hd⟩ ⟨p, hp⟩ hi

theorem deletedSelectorClauses_sat (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label)
    {c : List Int} (hc : c ∈ deletedSelectorClauses) :
    evalClauseD (fiveOmissionAssign σ deleted blocker centers) c = true := by
  simp only [deletedSelectorClauses, List.mem_cons] at hc
  rcases hc with rfl | hc
  · exact deletedPositiveClause_sat σ deleted blocker centers
  · exact deletedSinzAssign_sat σ deleted blocker centers hc

theorem blockerSelectorClauses_sat (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label)
    {c : List Int} (hc : c ∈ blockerSelectorClauses) :
    evalClauseD (fiveOmissionAssign σ deleted blocker centers) c = true := by
  simp only [blockerSelectorClauses, List.mem_cons] at hc
  rcases hc with rfl | hc
  · exact blockerPositiveClause_sat σ deleted blocker centers
  · exact blockerSinzAssign_sat σ deleted blocker centers hc

theorem centerSelectorClauses_sat (σ : Nat → Bool)
    (deleted blocker : Label) (centers : Finset Label)
    (hcenters : centers.card = 5)
    {c : List Int} (hc : c ∈ centerSelectorClauses) :
    evalClauseD (fiveOmissionAssign σ deleted blocker centers) c = true := by
  simp only [centerSelectorClauses, List.mem_append] at hc
  rcases hc with hc | hc
  · exact centerSinzAssign_sat σ deleted blocker centers hcenters hc
  · exact centerAtLeastFiveAssign_sat σ deleted blocker centers hcenters hc

theorem baseDimacs_sat
    {row : RowPattern Label} (hrow : FrozenSafeCubeOK row)
    (deleted : Label) (B : FrozenFiveOmissionBoundary row deleted)
    {c : List Int} (hc : c ∈ SafeCoverCnf.baseDimacs) :
    evalClauseD
        (fiveOmissionAssign (SafeCoverCnf.finalAssign (coverIndex row))
          deleted B.blocker B.centers) c = true := by
  calc
    evalClauseD
        (fiveOmissionAssign (SafeCoverCnf.finalAssign (coverIndex row))
          deleted B.blocker B.centers) c =
        evalClauseD (SafeCoverCnf.finalAssign (coverIndex row)) c := by
      apply SafeCoverCnf.evalClauseD_congr
      intro l hl
      exact fiveOmissionAssign_base_low _ deleted B.blocker B.centers
        (TerminalBankConsumer.baseDimacs_lit_bound c hc l hl)
    _ = true := TerminalBankConsumer.finalAssign_sat_baseDimacs hrow c hc

/-- Learned nogood clauses mention only the base selected-row variables.
Extending the canonical cover assignment with the five-omission selector
variables therefore preserves their truth values exactly. -/
theorem evalClauseD_fiveOmissionAssign_learnedClause_eq
    {row : RowPattern Label}
    (deleted blocker : Label) (centers : Finset Label)
    (choices : List (RowChoice Label))
    (hencodable : ∀ choice ∈ choices,
      FrozenSafeCandidateAt choice.center choice.support) :
    evalClauseD
        (fiveOmissionAssign (SafeCoverCnf.finalAssign (coverIndex row))
          deleted blocker centers)
        (learnedClause choices) =
      evalClauseD (SafeCoverCnf.finalAssign (coverIndex row))
        (learnedClause choices) := by
  apply SafeCoverCnf.evalClauseD_congr
  intro l hl
  rcases List.mem_map.mp hl with ⟨choice, hchoice, rfl⟩
  have hchoiceIndex : encodedChoiceIndex choice <
      SafeCoverCnf.candCount choice.center.val :=
    coverIndexAt_lt choice.center choice.support
      (hencodable choice hchoice)
  have hx : SafeCoverCnf.xVar choice.center.val
        (encodedChoiceIndex choice) ≤ SafeCoverCnf.baseNumVars := by
    calc
      SafeCoverCnf.xVar choice.center.val (encodedChoiceIndex choice) ≤
          SafeCoverCnf.nX :=
        SafeCoverCnf.xVar_le_nX choice.center.isLt hchoiceIndex
      _ ≤ SafeCoverCnf.baseNumVars := by
        rw [SafeCoverCnf.nX_eq, SafeCoverCnf.baseNumVars_eq]
        omega
  simpa [learnedLiteral] using
    fiveOmissionAssign_base_low
      (SafeCoverCnf.finalAssign (coverIndex row)) deleted blocker centers hx

end FiveOmissionCnf
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
