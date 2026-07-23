/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourLateChoiceTerminal
import UniqueFourCardinalityBoundary
import Erdos9796Proof.P97.ATail.PhysicalSecondApexSwap

/-!
# Exact-four source-faithful survival cover

After choosing the first physical apex late as the blocker for the complete
exact four-class, consider sources outside that blocker fiber.  A source is
`bad` when deleting either retained frontier point destroys K4 at its actual
blocker.

The two deleted points then both belong to the source's complete critical
support.  Convexity forces all bad sources to have the same blocker (three
distinct carrier centers cannot lie on one perpendicular bisector), and the
common critical support has only two points outside the exact first-apex
class.  Hence there are at most two bad sources.

This file is a producer audit.  It does not claim that the resulting
physical-second-apex robust/critical split is itself contradictory.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourSourceCloserScratch

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailSurvivalCover
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch
open ATailUniqueFourUniformRouteAuditScratch

attribute [local instance] Classical.propDecidable

abbrev CarrierVertex (A : Finset ℝ²) :=
  CriticalShellSystem.CarrierVertex A

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem oppApex1_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

private theorem equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hAB : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨r, hr, hcard⟩
  refine ⟨r, hr, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hAB hzA, hzdist⟩

/-- Sources outside the exact first-apex blocker fiber. -/
noncomputable def outsideFirstApexFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    Finset (CarrierVertex D.A) :=
  let Hlate := lateFirstApexSystem R
  Finset.univ \ actualBlockerFiber Hlate
    ⟨F.pair.q, F.pair.q_mem_A⟩

/-- An outside source is bad when neither retained singleton deletion
preserves K4 at its actual late blocker. -/
noncomputable def badOutsideSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    Finset (CarrierVertex D.A) :=
  let Hlate := lateFirstApexSystem R
  (outsideFirstApexFiber R).filter fun source =>
    ¬ HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        (Hlate.centerAt source.1 source.2) ∧
      ¬ HasNEquidistantPointsAt 4 (D.A.erase F.pair.w)
        (Hlate.centerAt source.1 source.2)

/-- Outside sources at which at least one retained singleton deletion
survives at the actual late blocker. -/
noncomputable def goodOutsideSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    Finset (CarrierVertex D.A) :=
  outsideFirstApexFiber R \ badOutsideSources R

private theorem source_not_mem_firstClass_of_mem_outside
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

private theorem bad_source_pair_mem_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : CarrierVertex D.A}
    (hsource : source ∈ badOutsideSources R) :
    F.pair.q ∈ ((lateFirstApexSystem R).selectedAt source.1 source.2).toCriticalFourShell.support ∧
      F.pair.w ∈ ((lateFirstApexSystem R).selectedAt source.1 source.2).toCriticalFourShell.support := by
  have hbad := (Finset.mem_filter.mp hsource).2
  constructor
  · by_contra hq
    exact hbad.1
      ((cross_deletion_survives_iff_not_mem_selected_support
        (lateFirstApexSystem R) source.2).mpr hq)
  · by_contra hw
    exact hbad.2
      ((cross_deletion_survives_iff_not_mem_selected_support
        (lateFirstApexSystem R) source.2).mpr hw)

/-- All bad outside sources share one actual blocker. -/
theorem bad_source_blockers_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source₁ source₂ : CarrierVertex D.A}
    (hsource₁ : source₁ ∈ badOutsideSources R)
    (hsource₂ : source₂ ∈ badOutsideSources R) :
    (lateFirstApexSystem R).centerAt source₁.1 source₁.2 =
      (lateFirstApexSystem R).centerAt source₂.1 source₂.2 := by
  let Hlate := lateFirstApexSystem R
  let c₁ := Hlate.centerAt source₁.1 source₁.2
  let c₂ := Hlate.centerAt source₂.1 source₂.2
  let o := S.oppApex1
  have hpair₁ := bad_source_pair_mem_support R hsource₁
  have hpair₂ := bad_source_pair_mem_support R hsource₂
  have hoA : o ∈ D.A := by
    simpa [o] using oppApex1_mem_A S
  have hc₁A : c₁ ∈ D.A := by
    exact (Finset.mem_erase.mp
      (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell.center_mem).2
  have hc₂A : c₂ ∈ D.A := by
    exact (Finset.mem_erase.mp
      (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell.center_mem).2
  have houtside₁ :
      source₁ ∈ outsideFirstApexFiber R :=
    (Finset.mem_filter.mp hsource₁).1
  have houtside₂ :
      source₂ ∈ outsideFirstApexFiber R :=
    (Finset.mem_filter.mp hsource₂).1
  have hc₁_ne_o : c₁ ≠ o := by
    simpa [c₁, o, Hlate] using
      (lateFirstApexSystem_centerAt_eq_iff_mem_class R source₁.2).not.mpr
        (source_not_mem_firstClass_of_mem_outside R houtside₁)
  have hc₂_ne_o : c₂ ≠ o := by
    simpa [c₂, o, Hlate] using
      (lateFirstApexSystem_centerAt_eq_iff_mem_class R source₂.2).not.mpr
        (source_not_mem_firstClass_of_mem_outside R houtside₂)
  have hoEq : dist o F.pair.q = dist o F.pair.w := by
    have hq := (mem_selectedClass.mp
      (frontier_pair_q_mem_firstApexClass F)).2
    have hw := (mem_selectedClass.mp
      (frontier_pair_w_mem_firstApexClass F)).2
    simpa [o] using hq.trans hw.symm
  have hc₁Eq : dist c₁ F.pair.q = dist c₁ F.pair.w := by
    exact
      ((Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell.support_eq_radius
        F.pair.q hpair₁.1).trans
      (((Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell.support_eq_radius
        F.pair.w hpair₁.2).symm)
  have hc₂Eq : dist c₂ F.pair.q = dist c₂ F.pair.w := by
    exact
      ((Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell.support_eq_radius
        F.pair.q hpair₂.1).trans
      (((Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell.support_eq_radius
        F.pair.w hpair₂.2).symm)
  by_contra hc₁c₂
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    F.pair.q_mem_A F.pair.w_mem_A F.pair.q_ne_w
  have hoFilter :
      o ∈ D.A.filter (fun z => dist z F.pair.q = dist z F.pair.w) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have hc₁Filter :
      c₁ ∈ D.A.filter (fun z => dist z F.pair.q = dist z F.pair.w) :=
    Finset.mem_filter.mpr ⟨hc₁A, hc₁Eq⟩
  have hc₂Filter :
      c₂ ∈ D.A.filter (fun z => dist z F.pair.q = dist z F.pair.w) :=
    Finset.mem_filter.mpr ⟨hc₂A, hc₂Eq⟩
  have hthree :
      2 < (D.A.filter
        (fun z => dist z F.pair.q = dist z F.pair.w)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, c₁, hc₁Filter, c₂, hc₂Filter,
      hc₁_ne_o.symm, hc₂_ne_o.symm, hc₁c₂⟩
  omega

/-- There are at most two bad outside sources.  This is the exact-four
strengthening over the generic four-source blocker-fiber bound. -/
theorem badOutsideSources_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    (badOutsideSources R).card ≤ 2 := by
  classical
  by_cases hempty : badOutsideSources R = ∅
  · simp [hempty]
  have hnonempty : (badOutsideSources R).Nonempty :=
    Finset.nonempty_iff_ne_empty.mpr hempty
  rcases hnonempty with ⟨anchor, hanchorBad⟩
  let Hlate := lateFirstApexSystem R
  let K := (Hlate.selectedAt anchor.1 anchor.2).toSelectedFourClass
  let C : SelectedFourClass D.A S.oppApex1 :=
    SelectedFourClass.ofSelectedClass (frontier_radius_pos F)
      R.class_card_eq_four
  have hanchorOutside :
      anchor ∈ outsideFirstApexFiber R :=
    (Finset.mem_filter.mp hanchorBad).1
  have hcenterNe :
      Hlate.centerAt anchor.1 anchor.2 ≠ S.oppApex1 := by
    exact
      (lateFirstApexSystem_centerAt_eq_iff_mem_class R anchor.2).not.mpr
        (source_not_mem_firstClass_of_mem_outside R hanchorOutside)
  have hinterLe : (K.support ∩ C.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two K C hcenterNe
  have hpairAnchor := bad_source_pair_mem_support R hanchorBad
  have hqC : F.pair.q ∈ C.support := by
    simpa [C, SelectedFourClass.ofSelectedClass] using
      frontier_pair_q_mem_firstApexClass F
  have hwC : F.pair.w ∈ C.support := by
    simpa [C, SelectedFourClass.ofSelectedClass] using
      frontier_pair_w_mem_firstApexClass F
  have hqInter : F.pair.q ∈ K.support ∩ C.support :=
    Finset.mem_inter.mpr ⟨by simpa [K, Hlate] using hpairAnchor.1, hqC⟩
  have hwInter : F.pair.w ∈ K.support ∩ C.support :=
    Finset.mem_inter.mpr ⟨by simpa [K, Hlate] using hpairAnchor.2, hwC⟩
  have hinterGe : 2 ≤ (K.support ∩ C.support).card := by
    have hsubset :
        ({F.pair.q, F.pair.w} : Finset ℝ²) ⊆ K.support ∩ C.support := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact hqInter
      · exact hwInter
    have hcard := Finset.card_le_card hsubset
    simpa [F.pair.q_ne_w] using hcard
  have hinterEq : (K.support ∩ C.support).card = 2 := by omega
  have hsplit := Finset.card_sdiff_add_card_inter K.support C.support
  have hdiffEq : (K.support \ C.support).card = 2 := by
    rw [K.support_card, hinterEq] at hsplit
    omega
  let points : Finset ℝ² :=
    (badOutsideSources R).image fun source => source.1
  have hpointsSubset : points ⊆ K.support \ C.support := by
    intro z hz
    rcases Finset.mem_image.mp hz with ⟨source, hsourceBad, rfl⟩
    have hcenters :
        Hlate.centerAt source.1 source.2 =
          Hlate.centerAt anchor.1 anchor.2 := by
      simpa [Hlate] using bad_source_blockers_eq R hsourceBad hanchorBad
    have hsupports :=
      selectedSupports_eq_of_actualBlockers_eq Hlate source.2 anchor.2 hcenters
    have hsourceSupport :=
      (Hlate.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support
    have hsourceK : source.1 ∈ K.support := by
      rw [hsupports] at hsourceSupport
      simpa [K] using hsourceSupport
    have hsourceOutside :
        source ∈ outsideFirstApexFiber R :=
      (Finset.mem_filter.mp hsourceBad).1
    have hsourceNotC : source.1 ∉ C.support := by
      simpa [C, SelectedFourClass.ofSelectedClass] using
        source_not_mem_firstClass_of_mem_outside R hsourceOutside
    exact Finset.mem_sdiff.mpr ⟨hsourceK, hsourceNotC⟩
  calc
    (badOutsideSources R).card = points.card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ ≤ (K.support \ C.support).card :=
      Finset.card_le_card hpointsSubset
    _ = 2 := hdiffEq

/-- The complement of the late first-apex fiber has at least seven sources. -/
theorem seven_le_outsideFirstApexFiber_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    7 ≤ (outsideFirstApexFiber R).card := by
  let Hlate := lateFirstApexSystem R
  let anchor : CarrierVertex D.A := ⟨F.pair.q, F.pair.q_mem_A⟩
  let fiber := actualBlockerFiber Hlate anchor
  have hqClass := frontier_pair_q_mem_firstApexClass F
  have hfiber : fiber.card = 4 := by
    simpa [fiber, Hlate, anchor] using
      lateFirstApex_actualBlockerFiber_card_eq_four R hqClass
  have hsplit :=
    Finset.card_sdiff_add_card_inter
      (Finset.univ : Finset (CarrierVertex D.A)) fiber
  have hinter : (Finset.univ ∩ fiber : Finset (CarrierVertex D.A)) = fiber :=
    Finset.inter_eq_right.mpr (Finset.subset_univ _)
  have huniv :
      (Finset.univ : Finset (CarrierVertex D.A)).card = D.A.card := by
    simp
  have houtside :
      outsideFirstApexFiber R =
        (Finset.univ : Finset (CarrierVertex D.A)) \ fiber := by
    rfl
  rw [hinter, huniv, hfiber] at hsplit
  rw [houtside]
  have hcard := carrier_card_ge_eleven R
  omega

/-- At least five outside sources preserve one of the two retained
singleton deletions at their actual late blocker. -/
theorem five_le_goodOutsideSources_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    5 ≤ (goodOutsideSources R).card := by
  have hbadSubset :
      badOutsideSources R ⊆ outsideFirstApexFiber R := by
    intro source hsource
    exact (Finset.mem_filter.mp hsource).1
  have hinter :
      outsideFirstApexFiber R ∩ badOutsideSources R =
        badOutsideSources R :=
    Finset.inter_eq_right.mpr hbadSubset
  have hsplit :=
    Finset.card_sdiff_add_card_inter
      (outsideFirstApexFiber R) (badOutsideSources R)
  rw [hinter] at hsplit
  change
    (goodOutsideSources R).card + (badOutsideSources R).card =
      (outsideFirstApexFiber R).card at hsplit
  have houtside := seven_le_outsideFirstApexFiber_card R
  have hbad := badOutsideSources_card_le_two R
  omega

private theorem good_source_survives_one
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
  by_cases hq :
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.q)
        ((lateFirstApexSystem R).centerAt source.1 source.2)
  · exact Or.inl hq
  · right
    by_contra hw
    exact hnotBad
      (Finset.mem_filter.mpr ⟨houtside, hq, hw⟩)

/-- Full source-faithful common-deletion ingress produced by exact four.
The original residual remains an index, while the packet records a late
actual blocker distinct from the physical second apex. -/
structure ExactFourPhysicalCommonDeletionIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type where
  deleted : ℝ²
  deleted_is_pair : deleted = F.pair.q ∨ deleted = F.pair.w
  source : CarrierVertex D.A
  source_mem_good : source ∈ goodOutsideSources R
  blocker_ne_secondApex :
    (lateFirstApexSystem R).centerAt source.1 source.2 ≠ S.oppApex2
  packet : CommonDeletionTwoCenterPacket D (lateFirstApexSystem R)
    deleted
    ((lateFirstApexSystem R).centerAt source.1 source.2)
    S.oppApex2

/-- Exact four unconditionally supplies a common deletion at one actual
late blocker and the physical second apex. -/
theorem nonempty_exactFourPhysicalCommonDeletionIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    Nonempty (ExactFourPhysicalCommonDeletionIngress R) := by
  let Hlate := lateFirstApexSystem R
  have hfive := five_le_goodOutsideSources_card R
  rcases exists_pair_distinct_actualBlockers_of_five_le_card
      Hlate (goodOutsideSources R) hfive with
    ⟨source₁, hsource₁, source₂, hsource₂, hcenters⟩
  have hchoose :
      ∃ source ∈ goodOutsideSources R,
        Hlate.centerAt source.1 source.2 ≠ S.oppApex2 := by
    by_cases hfirst : Hlate.centerAt source₁.1 source₁.2 ≠ S.oppApex2
    · exact ⟨source₁, hsource₁, hfirst⟩
    · have hfirstEq : Hlate.centerAt source₁.1 source₁.2 = S.oppApex2 :=
        not_ne_iff.mp hfirst
      refine ⟨source₂, hsource₂, ?_⟩
      intro hsecondEq
      exact hcenters (hfirstEq.trans hsecondEq.symm)
  rcases hchoose with ⟨source, hsourceGood, hcenterNe⟩
  have hcenterA :
      Hlate.centerAt source.1 source.2 ∈ D.A :=
    (Finset.mem_erase.mp
      (Hlate.selectedAt source.1 source.2).toCriticalFourShell.center_mem).2
  have happ2A : S.oppApex2 ∈ D.A := oppApex2_mem_A S
  rcases good_source_survives_one R hsourceGood with hq | hw
  · have happ2Survives :
        HasNEquidistantPointsAt 4 (D.A.erase F.pair.q) S.oppApex2 :=
      equidistant_mono (Finset.erase_subset _ _) F.secondApexDouble
    rcases nonempty_commonDeletionTwoCenterPacket Hlate F.pair.q_mem_A
        hcenterA happ2A hcenterNe hq happ2Survives with ⟨packet⟩
    exact ⟨{
      deleted := F.pair.q
      deleted_is_pair := Or.inl rfl
      source := source
      source_mem_good := hsourceGood
      blocker_ne_secondApex := hcenterNe
      packet := packet }⟩
  · have hdoubleSym :
        HasNEquidistantPointsAt 4
          ((D.A.erase F.pair.w).erase F.pair.q) S.oppApex2 := by
      simpa [Finset.erase_right_comm] using F.secondApexDouble
    have happ2Survives :
        HasNEquidistantPointsAt 4 (D.A.erase F.pair.w) S.oppApex2 :=
      equidistant_mono (Finset.erase_subset _ _) hdoubleSym
    rcases nonempty_commonDeletionTwoCenterPacket Hlate F.pair.w_mem_A
        hcenterA happ2A hcenterNe hw happ2Survives with ⟨packet⟩
    exact ⟨{
      deleted := F.pair.w
      deleted_is_pair := Or.inr rfl
      source := source
      source_mem_good := hsourceGood
      blocker_ne_secondApex := hcenterNe
      packet := packet }⟩

/-- The exact output of the existing physical-second-apex consumer, with
both the original exact-four residual and the newly produced common-deletion
packet retained on either arm. -/
inductive ExactFourPhysicalConsumerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type
  | robust
      (ingress : ExactFourPhysicalCommonDeletionIngress R)
      (secondApex_robust : FullyDeletionRobustAt D S.oppApex2)
  | swappedUniqueFour
      (ingress : ExactFourPhysicalCommonDeletionIngress R)
      (swapped : SwappedFirstApexUniqueFourFrontier
        D S (lateFirstApexSystem R))

/-- Kernel-checked audit boundary: exact four reaches either a robust
physical second apex or a swapped protected exact-four frontier.  This is
not a contradiction theorem; the swapped arm is a recursive return unless
the retained original residual and ingress are consumed together. -/
theorem nonempty_exactFourPhysicalConsumerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    Nonempty (ExactFourPhysicalConsumerOutcome R) := by
  rcases nonempty_exactFourPhysicalCommonDeletionIngress R with ⟨ingress⟩
  rcases physicalSecondApex_commonDeletion_robust_or_critical
      ingress.packet with hrobust | hcritical
  · exact ⟨ExactFourPhysicalConsumerOutcome.robust
      ingress hrobust.some⟩
  · rcases physicalSecondCritical_reorients_to_swappedUniqueFour
      (H := lateFirstApexSystem R)
      hcritical.some.shell hcritical.some.deletion_blocked with ⟨swapped⟩
    exact ⟨ExactFourPhysicalConsumerOutcome.swappedUniqueFour
      ingress swapped⟩

#print axioms bad_source_blockers_eq
#print axioms badOutsideSources_card_le_two
#print axioms seven_le_outsideFirstApexFiber_card
#print axioms five_le_goodOutsideSources_card
#print axioms nonempty_exactFourPhysicalCommonDeletionIngress
#print axioms nonempty_exactFourPhysicalConsumerOutcome

end ATailUniqueFourSourceCloserScratch
end Problem97
