/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFourPhysicalConsumer
import Erdos9796Proof.P97.ATail.SurvivalCover
import Erdos9796Proof.P97.ATail.ThreeCenterCommonDeletion

/-!
# Seven good sources and a common frontier deletion

This module gives the finite-fiber classifier needed by the card-13 exact-four
route.  It keeps source identities, actual blockers, the named common frontier
deletion, and the selected supports.  The classifier is deliberately a
producer: it does not silently turn the source rows into a contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSevenGoodSourceDistinctBlockerCommonDeletion

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailSurvivalCover
open ATailThreeCenterCommonDeletion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/- A purely finite form of the two-color pigeonhole argument. -/
theorem exists_distinct_blockers_common_color_of_seven
    {α β : Type*} [DecidableEq α] [DecidableEq β]
    (T : Finset α) (blocker : α → β)
    (survivesQ survivesW : α → Prop)
    (hseven : 7 ≤ T.card)
    (hcover : ∀ s ∈ T, survivesQ s ∨ survivesW s)
    (hfiber : ∀ c : β,
      (T.filter (fun s => blocker s = c)).card ≤ 4)
    (hcap : ∀ (cQ cW : β), cQ ≠ cW →
      (∀ s ∈ T.filter survivesQ, blocker s = cQ) →
      (∀ s ∈ T.filter survivesW, blocker s = cW) →
      (T.filter survivesQ).card ≤ 3 ∧
      (T.filter survivesW).card ≤ 3) :
    ∃ s ∈ T, ∃ t ∈ T, blocker s ≠ blocker t ∧
      ((survivesQ s ∧ survivesQ t) ∨ (survivesW s ∧ survivesW t)) := by
  classical
  by_contra hnone
  have hTnonempty : T.Nonempty := Finset.card_pos.mp (by omega)
  by_cases hQempty : T.filter survivesQ = ∅
  · rcases hTnonempty with ⟨anchor, hanchor⟩
    have hanchorW : survivesW anchor := by
      rcases hcover anchor hanchor with hq | hw
      · exact False.elim (by simpa [hQempty] using
          (Finset.mem_filter.mpr ⟨hanchor, hq⟩))
      · exact hw
    have hsubset : T ⊆ T.filter (fun s => blocker s = blocker anchor) := by
      intro s hs
      have hsW : survivesW s := by
        rcases hcover s hs with hq | hw
        · exact False.elim (by simpa [hQempty] using
            (Finset.mem_filter.mpr ⟨hs, hq⟩))
        · exact hw
      have hsame : blocker s = blocker anchor := by
        by_contra hne
        exact hnone ⟨s, hs, anchor, hanchor, hne,
          Or.inr ⟨hsW, hanchorW⟩⟩
      exact Finset.mem_filter.mpr ⟨hs, hsame⟩
    have hle := Finset.card_le_card hsubset
    have hf := hfiber (blocker anchor)
    omega
  by_cases hWempty : T.filter survivesW = ∅
  · rcases hTnonempty with ⟨anchor, hanchor⟩
    have hanchorQ : survivesQ anchor := by
      rcases hcover anchor hanchor with hq | hw
      · exact hq
      · exact False.elim (by simpa [hWempty] using
          (Finset.mem_filter.mpr ⟨hanchor, hw⟩))
    have hsubset : T ⊆ T.filter (fun s => blocker s = blocker anchor) := by
      intro s hs
      have hsQ : survivesQ s := by
        rcases hcover s hs with hq | hw
        · exact hq
        · exact False.elim (by simpa [hWempty] using
            (Finset.mem_filter.mpr ⟨hs, hw⟩))
      have hsame : blocker s = blocker anchor := by
        by_contra hne
        exact hnone ⟨s, hs, anchor, hanchor, hne,
          Or.inl ⟨hsQ, hanchorQ⟩⟩
      exact Finset.mem_filter.mpr ⟨hs, hsame⟩
    have hle := Finset.card_le_card hsubset
    have hf := hfiber (blocker anchor)
    omega
  · rcases Finset.nonempty_iff_ne_empty.mpr hQempty with ⟨qsource, hqsource⟩
    rcases Finset.nonempty_iff_ne_empty.mpr hWempty with ⟨wsource, hwsource⟩
    have hQsame : ∀ s ∈ T.filter survivesQ,
        blocker s = blocker qsource := by
      intro s hs
      have hsT := (Finset.mem_filter.mp hs).1
      have hsQ := (Finset.mem_filter.mp hs).2
      have hqQ := (Finset.mem_filter.mp hqsource).2
      by_contra hne
      exact hnone ⟨s, hsT, qsource, (Finset.mem_filter.mp hqsource).1,
        hne, Or.inl ⟨hsQ, hqQ⟩⟩
    have hWsame : ∀ s ∈ T.filter survivesW,
        blocker s = blocker wsource := by
      intro s hs
      have hsT := (Finset.mem_filter.mp hs).1
      have hsW := (Finset.mem_filter.mp hs).2
      have hwW := (Finset.mem_filter.mp hwsource).2
      by_contra hne
      exact hnone ⟨s, hsT, wsource, (Finset.mem_filter.mp hwsource).1,
        hne, Or.inr ⟨hsW, hwW⟩⟩
    by_cases hsame : blocker qsource = blocker wsource
    · have hsubset : T ⊆ T.filter (fun s => blocker s = blocker qsource) := by
        intro s hs
        rcases hcover s hs with hsQ | hsW
        · exact Finset.mem_filter.mpr ⟨hs, hQsame s
            (Finset.mem_filter.mpr ⟨hs, hsQ⟩)⟩
        · exact Finset.mem_filter.mpr ⟨hs, (hWsame s
            (Finset.mem_filter.mpr ⟨hs, hsW⟩)).trans hsame.symm⟩
      have hle := Finset.card_le_card hsubset
      have hf := hfiber (blocker qsource)
      omega
    · have hcaps := hcap (blocker qsource) (blocker wsource) hsame
        hQsame hWsame
      let Q := T.filter survivesQ
      let W := T.filter survivesW
      have hsubset : T ⊆ Q ∪ W := by
        intro s hs
        rcases hcover s hs with hsQ | hsW
        · exact Finset.mem_union.mpr (Or.inl (Finset.mem_filter.mpr ⟨hs, hsQ⟩))
        · exact Finset.mem_union.mpr (Or.inr (Finset.mem_filter.mpr ⟨hs, hsW⟩))
      have hle := Finset.card_le_card hsubset
      have hunion := Finset.card_union_le Q W
      have hQcap : Q.card ≤ 3 := by simpa [Q] using hcaps.1
      have hWcap : W.card ≤ 3 := by simpa [W] using hcaps.2
      omega

/- The source-local copy of the private survival helper. -/
private theorem good_source_survives_one_local
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : CarrierVertex D.A}
    (hsource : source ∈ goodOutsideSources R) :
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
        ((lateFirstApexSystem R).centerAt source.1 source.2) := by
  have houtside := (Finset.mem_sdiff.mp hsource).1
  have hnotBad := (Finset.mem_sdiff.mp hsource).2
  by_cases hq : HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
      ((lateFirstApexSystem R).centerAt source.1 source.2)
  · exact Or.inl hq
  · right
    by_contra hw
    exact hnotBad (Finset.mem_filter.mpr ⟨houtside, hq, hw⟩)

private theorem source_not_mem_firstClass_of_mem_outside_local
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : CarrierVertex D.A}
    (hsource : source ∈ outsideFirstApexFiber R) :
    source.1 ∉ SelectedClass D.A S.oppApex1 radius := by
  intro hclass
  have hqClass := frontier_pair_q_mem_firstApexClass F
  have hcenters :
      (lateFirstApexSystem R).blockerVertex source =
        (lateFirstApexSystem R).blockerVertex
          ⟨F.pair.q, F.pair.q_mem_A⟩ := by
    apply Subtype.ext
    exact (lateFirstApexSystem_centerAt_eq R source.2 hclass).trans
      (lateFirstApexSystem_centerAt_eq R F.pair.q_mem_A hqClass).symm
  exact (Finset.mem_sdiff.mp hsource).2
    (Finset.mem_filter.mpr ⟨Finset.mem_univ _, hcenters⟩)

private theorem good_source_ne_q
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : CarrierVertex D.A}
    (hsource : source ∈ goodOutsideSources R) :
    source.1 ≠ F.pair.q := by
  intro hq
  apply source_not_mem_firstClass_of_mem_outside_local R
    (Finset.mem_sdiff.mp hsource).1
  rw [hq]
  exact frontier_pair_q_mem_firstApexClass F

private theorem good_source_ne_w
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : CarrierVertex D.A}
    (hsource : source ∈ goodOutsideSources R) :
    source.1 ≠ F.pair.w := by
  intro hw
  apply source_not_mem_firstClass_of_mem_outside_local R
    (Finset.mem_sdiff.mp hsource).1
  rw [hw]
  exact frontier_pair_w_mem_firstApexClass F

/- Every named actual blocker fiber has at most four good sources. -/
private theorem good_source_fiber_card_le_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (c : ℝ²) :
    ((goodOutsideSources R).filter fun source =>
      (lateFirstApexSystem R).centerAt source.1 source.2 = c).card ≤ 4 := by
  classical
  let T := (goodOutsideSources R).filter fun source =>
    (lateFirstApexSystem R).centerAt source.1 source.2 = c
  by_cases hempty : T = ∅
  · simp [T, hempty]
  · rcases Finset.nonempty_iff_ne_empty.mpr hempty with ⟨anchor, hanchor⟩
    have hsubset : T ⊆ actualBlockerFiber (lateFirstApexSystem R) anchor := by
      intro source hsource
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_univ _, ?_⟩
      apply Subtype.ext
      exact (Finset.mem_filter.mp hsource).2.trans
        (Finset.mem_filter.mp hanchor).2.symm
    have hle := Finset.card_le_card hsubset
    have hfiber := actualBlockerFiber_card_le_four
      (lateFirstApexSystem R) anchor
    simpa [T] using (show T.card ≤ 4 by omega)

/- If two color classes have distinct common blockers, each class loses the
frontier point which the other color retains.  The remaining three support
points inject the class into a four-shell with one named point erased. -/
private theorem good_source_color_cap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (cQ cW : ℝ²) (hcenters : cQ ≠ cW)
    (hQ : ∀ source ∈ (goodOutsideSources R).filter fun source =>
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        ((lateFirstApexSystem R).centerAt source.1 source.2),
      (lateFirstApexSystem R).centerAt source.1 source.2 = cQ)
    (hW : ∀ source ∈ (goodOutsideSources R).filter fun source =>
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
        ((lateFirstApexSystem R).centerAt source.1 source.2),
      (lateFirstApexSystem R).centerAt source.1 source.2 = cW) :
    ((goodOutsideSources R).filter fun source =>
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        ((lateFirstApexSystem R).centerAt source.1 source.2)).card ≤ 3 ∧
    ((goodOutsideSources R).filter fun source =>
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
        ((lateFirstApexSystem R).centerAt source.1 source.2)).card ≤ 3 := by
  classical
  let T := goodOutsideSources R
  let Q := T.filter fun source =>
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
      ((lateFirstApexSystem R).centerAt source.1 source.2)
  let W := T.filter fun source =>
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
      ((lateFirstApexSystem R).centerAt source.1 source.2)
  have hQcap : Q.card ≤ 3 := by
    by_cases hempty : Q = ∅
    · simp [hempty]
    · rcases Finset.nonempty_iff_ne_empty.mpr hempty with ⟨anchor, hanchor⟩
      let K := (lateFirstApexSystem R).selectedAt anchor.1 anchor.2
        |>.toCriticalFourShell
      have hanchorW : ¬ HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
          ((lateFirstApexSystem R).centerAt anchor.1 anchor.2) := by
        intro hsurvive
        have hQanchor := hQ anchor (Finset.mem_filter.mpr ⟨
          (Finset.mem_filter.mp hanchor).1, (Finset.mem_filter.mp hanchor).2⟩)
        have hWanchor := hW anchor (Finset.mem_filter.mpr ⟨
          (Finset.mem_filter.mp hanchor).1, hsurvive⟩)
        exact hcenters (hQanchor.symm.trans hWanchor)
      have hwK : F.pair.w ∈ K.support := by
        by_contra hnot
        exact hanchorW ((cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) anchor.2).mpr hnot)
      let points : Finset ℝ² := Q.image fun source => source.1
      have hpointsSubset : points ⊆ K.support.erase F.pair.w := by
        intro z hz
        rcases Finset.mem_image.mp hz with ⟨source, hsource, rfl⟩
        have hsourceGood : source ∈ T := (Finset.mem_filter.mp hsource).1
        have hsourceQ := (Finset.mem_filter.mp hsource).2
        have hcenter :
            (lateFirstApexSystem R).centerAt source.1 source.2 =
              (lateFirstApexSystem R).centerAt anchor.1 anchor.2 := by
          exact (hQ source hsource).trans (hQ anchor hanchor).symm
        have hsupports := selectedSupports_eq_of_actualBlockers_eq
          (lateFirstApexSystem R) source.2 anchor.2 hcenter
        have hsourceSupport :=
          (lateFirstApexSystem R).selectedAt source.1 source.2
            |>.toCriticalFourShell.q_mem_support
        rw [hsupports] at hsourceSupport
        exact Finset.mem_erase.mpr ⟨good_source_ne_w R hsourceGood, hsourceSupport⟩
      have hpointsCard : points.card = Q.card :=
        Finset.card_image_of_injective _ Subtype.val_injective
      have hKcard : K.support.card = 4 := by
        simpa [K] using (lateFirstApexSystem R).selectedAt anchor.1 anchor.2
          |>.toCriticalFourShell.support_card
      have hErase : (K.support.erase F.pair.w).card = 3 := by
        rw [Finset.card_erase_of_mem hwK, hKcard]
      have hle := Finset.card_le_card hpointsSubset
      omega
  have hWcap : W.card ≤ 3 := by
    by_cases hempty : W = ∅
    · simp [hempty]
    · rcases Finset.nonempty_iff_ne_empty.mpr hempty with ⟨anchor, hanchor⟩
      let K := (lateFirstApexSystem R).selectedAt anchor.1 anchor.2
        |>.toCriticalFourShell
      have hanchorQ : ¬ HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
          ((lateFirstApexSystem R).centerAt anchor.1 anchor.2) := by
        intro hsurvive
        have hWanchor := hW anchor (Finset.mem_filter.mpr ⟨
          (Finset.mem_filter.mp hanchor).1, (Finset.mem_filter.mp hanchor).2⟩)
        have hQanchor := hQ anchor (Finset.mem_filter.mpr ⟨
          (Finset.mem_filter.mp hanchor).1, hsurvive⟩)
        exact hcenters (hQanchor.symm.trans hWanchor)
      have hqK : F.pair.q ∈ K.support := by
        by_contra hnot
        exact hanchorQ ((cross_deletion_survives_iff_not_mem_selected_support
          (lateFirstApexSystem R) anchor.2).mpr hnot)
      let points : Finset ℝ² := W.image fun source => source.1
      have hpointsSubset : points ⊆ K.support.erase F.pair.q := by
        intro z hz
        rcases Finset.mem_image.mp hz with ⟨source, hsource, rfl⟩
        have hsourceGood : source ∈ T := (Finset.mem_filter.mp hsource).1
        have hsourceW := (Finset.mem_filter.mp hsource).2
        have hcenter :
            (lateFirstApexSystem R).centerAt source.1 source.2 =
              (lateFirstApexSystem R).centerAt anchor.1 anchor.2 := by
          exact (hW source hsource).trans (hW anchor hanchor).symm
        have hsupports := selectedSupports_eq_of_actualBlockers_eq
          (lateFirstApexSystem R) source.2 anchor.2 hcenter
        have hsourceSupport :=
          (lateFirstApexSystem R).selectedAt source.1 source.2
            |>.toCriticalFourShell.q_mem_support
        rw [hsupports] at hsourceSupport
        exact Finset.mem_erase.mpr ⟨good_source_ne_q R hsourceGood, hsourceSupport⟩
      have hpointsCard : points.card = W.card :=
        Finset.card_image_of_injective _ Subtype.val_injective
      have hKcard : K.support.card = 4 := by
        simpa [K] using (lateFirstApexSystem R).selectedAt anchor.1 anchor.2
          |>.toCriticalFourShell.support_card
      have hErase : (K.support.erase F.pair.q).card = 3 := by
        rw [Finset.card_erase_of_mem hqK, hKcard]
      have hle := Finset.card_le_card hpointsSubset
      omega
  simpa [Q, W, T] using And.intro hQcap hWcap

/-- Two source identities, their distinct actual blockers, and the selected
rows which omit one common retained frontier point. -/
structure GoodSourceDistinctBlockerCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type where
  source₁ : CarrierVertex D.A
  source₂ : CarrierVertex D.A
  source₁_mem_good : source₁ ∈ goodOutsideSources R
  source₂_mem_good : source₂ ∈ goodOutsideSources R
  sources_ne : source₁ ≠ source₂
  blockers_ne :
    (lateFirstApexSystem R).centerAt source₁.1 source₁.2 ≠
      (lateFirstApexSystem R).centerAt source₂.1 source₂.2
  deleted : ℝ²
  deleted_is_frontier : deleted = F.pair.q ∨ deleted = F.pair.w
  source₁_survives :
    HasNEquidistantPointsAt 4 (D.A.erase deleted)
      ((lateFirstApexSystem R).centerAt source₁.1 source₁.2)
  source₂_survives :
    HasNEquidistantPointsAt 4 (D.A.erase deleted)
      ((lateFirstApexSystem R).centerAt source₂.1 source₂.2)
  row₁ : SelectedFourClass D.A
      ((lateFirstApexSystem R).centerAt source₁.1 source₁.2)
  row₂ : SelectedFourClass D.A
      ((lateFirstApexSystem R).centerAt source₂.1 source₂.2)
  deleted_not_mem_row₁ : deleted ∉ row₁.support
  deleted_not_mem_row₂ : deleted ∉ row₂.support

private noncomputable def selected_row_of_source
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) (source : CarrierVertex D.A) :
    SelectedFourClass D.A ((lateFirstApexSystem R).centerAt source.1 source.2) :=
  (lateFirstApexSystem R).selectedAt source.1 source.2 |>.toSelectedFourClass

private theorem selected_row_omits_of_survives
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) {source : CarrierVertex D.A}
    {deleted : ℝ²} (hdeleted : deleted = F.pair.q ∨ deleted = F.pair.w)
    (hsurvives : HasNEquidistantPointsAt 4 (D.A.erase deleted)
      ((lateFirstApexSystem R).centerAt source.1 source.2)) :
    deleted ∉ (selected_row_of_source R source).support := by
  rcases hdeleted with rfl | rfl
  · simpa [selected_row_of_source, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using
      (cross_deletion_survives_iff_not_mem_selected_support
        (lateFirstApexSystem R) source.2).mp hsurvives
  · simpa [selected_row_of_source, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using
      (cross_deletion_survives_iff_not_mem_selected_support
        (lateFirstApexSystem R) source.2).mp hsurvives

/-- The card-13 exact-four surface has two good sources with distinct actual
blockers retaining one common named frontier deletion. -/
theorem exists_good_sources_distinctBlockers_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hcard : 12 < D.A.card) :
    Nonempty (GoodSourceDistinctBlockerCommonDeletion R) := by
  let Hlate := lateFirstApexSystem R
  let T := goodOutsideSources R
  let survivesQ := fun source : CarrierVertex D.A =>
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
      (Hlate.centerAt source.1 source.2)
  let survivesW := fun source : CarrierVertex D.A =>
    HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
      (Hlate.centerAt source.1 source.2)
  have hseven : 7 ≤ T.card := by
    simpa [T] using seven_le_goodOutsideSources_card_of_card_gt_twelve R hcard
  have hcover : ∀ source ∈ T, survivesQ source ∨ survivesW source := by
    intro source hsource
    simpa [T, survivesQ, survivesW, Hlate] using
      good_source_survives_one_local R hsource
  have hfiber : ∀ c : ℝ²,
      (T.filter (fun source => Hlate.centerAt source.1 source.2 = c)).card ≤ 4 := by
    intro c
    simpa [T, Hlate] using good_source_fiber_card_le_four R c
  have hcap : ∀ (cQ cW : ℝ²), cQ ≠ cW →
      (∀ source ∈ T.filter survivesQ, Hlate.centerAt source.1 source.2 = cQ) →
      (∀ source ∈ T.filter survivesW, Hlate.centerAt source.1 source.2 = cW) →
      (T.filter survivesQ).card ≤ 3 ∧ (T.filter survivesW).card ≤ 3 := by
    intro cQ cW hcenters hQ hW
    simpa [T, Hlate, survivesQ, survivesW] using
      good_source_color_cap R cQ cW hcenters (by
        simpa [T, Hlate, survivesQ] using hQ) (by
        simpa [T, Hlate, survivesW] using hW)
  rcases exists_distinct_blockers_common_color_of_seven
      T (fun source => Hlate.centerAt source.1 source.2)
      survivesQ survivesW hseven hcover hfiber hcap with
    ⟨source₁, hsource₁, source₂, hsource₂, hblockers, hcommon⟩
  have hdeleted : ∃ deleted : ℝ²,
      (deleted = F.pair.q ∨ deleted = F.pair.w) ∧
        HasNEquidistantPointsAt 4 (D.A.erase deleted)
          (Hlate.centerAt source₁.1 source₁.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase deleted)
          (Hlate.centerAt source₂.1 source₂.2) := by
    rcases hcommon with hq | hw
    · exact ⟨F.pair.q, Or.inl rfl, hq.1, hq.2⟩
    · exact ⟨F.pair.w, Or.inr rfl, hw.1, hw.2⟩
  rcases hdeleted with ⟨deleted, hdeleted, hsource₁_survives, hsource₂_survives⟩
  let row₁ := selected_row_of_source R source₁
  let row₂ := selected_row_of_source R source₂
  have hsource₁_ne_source₂ : source₁ ≠ source₂ := by
    intro heq
    apply hblockers
    simp [heq]
  have hrow₁ : deleted ∉ row₁.support := by
    simpa [row₁] using selected_row_omits_of_survives R hdeleted hsource₁_survives
  have hrow₂ : deleted ∉ row₂.support := by
    simpa [row₂] using selected_row_omits_of_survives R hdeleted hsource₂_survives
  exact ⟨{
    source₁ := source₁
    source₂ := source₂
    source₁_mem_good := by simpa [T] using hsource₁
    source₂_mem_good := by simpa [T] using hsource₂
    sources_ne := hsource₁_ne_source₂
    blockers_ne := by simpa [Hlate] using hblockers
    deleted := deleted
    deleted_is_frontier := hdeleted
    source₁_survives := by simpa [Hlate] using hsource₁_survives
    source₂_survives := by simpa [Hlate] using hsource₂_survives
    row₁ := row₁
    row₂ := row₂
    deleted_not_mem_row₁ := hrow₁
    deleted_not_mem_row₂ := hrow₂ }⟩

/-- If a third pairwise-distinct center and selected row are supplied, the
two source rows lift directly to the existing three-center packet. -/
theorem nonempty_threeCenterCommonDeletionExactRows_of_goodSourceWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (W : GoodSourceDistinctBlockerCommonDeletion R)
    {center₂ : ℝ²} (hcenter₂A : center₂ ∈ D.A)
    (thirdRow : SelectedFourClass D.A center₂)
    (hcenter₁_ne :
      (lateFirstApexSystem R).centerAt W.source₁.1 W.source₁.2 ≠ center₂)
    (hcenter₂_ne :
      (lateFirstApexSystem R).centerAt W.source₂.1 W.source₂.2 ≠ center₂)
    (hthird_omits : W.deleted ∉ thirdRow.support) :
    Nonempty (ThreeCenterCommonDeletionExactRows D W.deleted
      ((lateFirstApexSystem R).centerAt W.source₁.1 W.source₁.2)
      ((lateFirstApexSystem R).centerAt W.source₂.1 W.source₂.2)
      center₂ W.row₁.support W.row₂.support thirdRow.support) := by
  have hblocker₁A :
      (lateFirstApexSystem R).centerAt W.source₁.1 W.source₁.2 ∈ D.A :=
    (Finset.mem_erase.mp
      ((lateFirstApexSystem R).selectedAt W.source₁.1 W.source₁.2
        |>.toCriticalFourShell.center_mem)).2
  have hblocker₂A :
      (lateFirstApexSystem R).centerAt W.source₂.1 W.source₂.2 ∈ D.A :=
    (Finset.mem_erase.mp
      ((lateFirstApexSystem R).selectedAt W.source₂.1 W.source₂.2
        |>.toCriticalFourShell.center_mem)).2
  rcases W.deleted_is_frontier with hq | hw
  · rw [hq]
    apply nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses
      (F.pair.q_mem_A) hblocker₁A hblocker₂A hcenter₂A
      W.blockers_ne hcenter₁_ne hcenter₂_ne W.row₁ W.row₂ thirdRow
    · simpa [hq] using W.deleted_not_mem_row₁
    · simpa [hq] using W.deleted_not_mem_row₂
    · simpa [hq] using hthird_omits
  · rw [hw]
    apply nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses
      (F.pair.w_mem_A) hblocker₁A hblocker₂A hcenter₂A
      W.blockers_ne hcenter₁_ne hcenter₂_ne W.row₁ W.row₂ thirdRow
    · simpa [hw] using W.deleted_not_mem_row₁
    · simpa [hw] using W.deleted_not_mem_row₂
    · simpa [hw] using hthird_omits

end ATailSevenGoodSourceDistinctBlockerCommonDeletion
end Problem97
