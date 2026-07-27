/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds
import Erdos9796Proof.P97.ATail.ExactFourPhysicalConsumer
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization

/-!
# Post-card-eleven robust exact-four expansion

The robust constructor of the exact-four physical consumer cannot retain the
least cap profile once the carrier has at least twelve points.  This module
records the resulting cap growth together with the complete radius
classification forced by deletion robustness at the physical second apex.

This is a source-faithful production refinement, not a contradiction theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFourRobustCapExpansion

open ATAILStageOnePrescribedApexDichotomy
open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailSurvivalCover
open ATailTwoCenterCapLocalization
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- Trim a positive-radius class of cardinality at least four to a selected
four-class at the same radius. -/
private theorem exists_selectedFourClass_at_radius
    {A : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass A center radius).card) :
    ∃ K : SelectedFourClass A center, K.radius = radius := by
  classical
  obtain ⟨T, hTC, hTcard⟩ := Finset.exists_subset_card_eq hfour
  let K : SelectedFourClass A center :=
    { support := T
      support_subset_A := by
        intro x hx
        exact (mem_selectedClass.mp (hTC hx)).1
      support_card := hTcard
      radius := radius
      radius_pos := hradius
      support_eq_radius := by
        intro x hx
        exact (mem_selectedClass.mp (hTC hx)).2
      center_not_mem := by
        intro hcenter
        have hdist := (mem_selectedClass.mp (hTC hcenter)).2
        have hzero : (0 : ℝ) = radius := by simpa using hdist
        linarith }
  exact ⟨K, rfl⟩

/-- A four-point subset can be selected while retaining a prescribed member. -/
private theorem exists_subset_card_four_mem
    {α : Type*} {C : Finset α} {z : α}
    (hz : z ∈ C) (hfour : 4 ≤ C.card) :
    ∃ T : Finset α, T ⊆ C ∧ T.card = 4 ∧ z ∈ T := by
  classical
  have herase : 3 ≤ (C.erase z).card := by
    rw [Finset.card_erase_of_mem hz]
    omega
  obtain ⟨U, hUC, hUcard⟩ :=
    Finset.exists_subset_card_eq herase
  have hzU : z ∉ U := by
    intro hzU
    exact (Finset.mem_erase.mp (hUC hzU)).1 rfl
  refine ⟨Finset.cons z U hzU, ?_, ?_, Finset.mem_cons_self z U⟩
  · intro x hx
    rcases Finset.mem_cons.mp hx with rfl | hxU
    · exact hz
    · exact Finset.erase_subset _ _ (hUC hxU)
  · rw [Finset.card_cons]
    omega

/-- Trim a positive-radius class to four points while retaining a prescribed
point of that class. -/
private theorem exists_selectedFourClass_at_radius_mem
    {A : Finset ℝ²} {center z : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hz : z ∈ SelectedClass A center radius)
    (hfour : 4 ≤ (SelectedClass A center radius).card) :
    ∃ K : SelectedFourClass A center,
      K.radius = radius ∧ z ∈ K.support := by
  classical
  obtain ⟨T, hTC, hTcard, hzT⟩ :=
    exists_subset_card_four_mem hz hfour
  let K : SelectedFourClass A center :=
    { support := T
      support_subset_A := by
        intro x hx
        exact (mem_selectedClass.mp (hTC hx)).1
      support_card := hTcard
      radius := radius
      radius_pos := hradius
      support_eq_radius := by
        intro x hx
        exact (mem_selectedClass.mp (hTC hx)).2
      center_not_mem := by
        intro hcenter
        have hdist := (mem_selectedClass.mp (hTC hcenter)).2
        have hzero : (0 : ℝ) = radius := by simpa using hdist
        linarith }
  exact ⟨K, rfl, by simpa [K] using hzT⟩

/-- Exact radius-level alternatives forced by full singleton-deletion
robustness at a carrier center. -/
inductive DeletionRobustRadiusClassification
    (D : CounterexampleData) (center : ℝ²) : Prop
  | fivePointRadius
      (radius : ℝ)
      (radius_pos : 0 < radius)
      (class_card_ge_five :
        5 ≤ (SelectedClass D.A center radius).card)
  | twoDistinctRadii
      (radius otherRadius : ℝ)
      (radius_pos : 0 < radius)
      (otherRadius_pos : 0 < otherRadius)
      (first_class_card_ge_four :
        4 ≤ (SelectedClass D.A center radius).card)
      (second_class_card_ge_four :
        4 ≤ (SelectedClass D.A center otherRadius).card)
      (radii_ne : otherRadius ≠ radius)
      (all_positive_radius_class_card_lt_five :
        ∀ candidateRadius : ℝ, 0 < candidateRadius →
          (SelectedClass D.A center candidateRadius).card < 5)
      (firstRow secondRow : SelectedFourClass D.A center)
      (firstRow_radius : firstRow.radius = radius)
      (secondRow_radius : secondRow.radius = otherRadius)
      (supports_disjoint : Disjoint firstRow.support secondRow.support)

/-- Full singleton-deletion robustness at a carrier center supplies the exact
radius classification above. -/
theorem fullyDeletionRobustAt_radiusClassification
    {D : CounterexampleData} {center : ℝ²}
    (hcenter : center ∈ D.A)
    (R : FullyDeletionRobustAt D center) :
    DeletionRobustRadiusClassification D center := by
  by_cases hfive :
      ∃ radius : ℝ, 0 < radius ∧
        5 ≤ (SelectedClass D.A center radius).card
  · rcases hfive with ⟨radius, hradius, hfive⟩
    exact .fivePointRadius radius hradius hfive
  · have hnoFive :
        ∀ candidateRadius : ℝ, 0 < candidateRadius →
          (SelectedClass D.A center candidateRadius).card < 5 := by
      intro candidateRadius hcandidate
      have hnotFive :
          ¬ 5 ≤ (SelectedClass D.A center candidateRadius).card := by
        intro hfiveCandidate
        exact hfive ⟨candidateRadius, hcandidate, hfiveCandidate⟩
      omega
    obtain ⟨radius, hradius, hfour⟩ :=
      exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
        (D.K4 center hcenter)
    have hcard : (SelectedClass D.A center radius).card = 4 := by
      have hlt := hnoFive radius hradius
      omega
    have hnonempty : (SelectedClass D.A center radius).Nonempty :=
      Finset.card_pos.mp (by omega)
    rcases hnonempty with ⟨z, hzClass⟩
    have hzA : z ∈ D.A := (mem_selectedClass.mp hzClass).1
    obtain ⟨otherRadius, hotherRadius, hfourErase⟩ :=
      exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
        (R.survives z hzA)
    have hfourOther :
        4 ≤ (SelectedClass D.A center otherRadius).card := by
      rw [selectedClass_erase_eq] at hfourErase
      exact hfourErase.trans
        (Finset.card_le_card (Finset.erase_subset _ _))
    have hradii : otherRadius ≠ radius := by
      intro hsame
      subst otherRadius
      rw [selectedClass_erase_eq,
        Finset.card_erase_of_mem hzClass, hcard] at hfourErase
      omega
    obtain ⟨firstRow, hfirstRadius⟩ :=
      exists_selectedFourClass_at_radius hradius hfour
    obtain ⟨secondRow, hsecondRadius⟩ :=
      exists_selectedFourClass_at_radius hotherRadius hfourOther
    have hdisjoint : Disjoint firstRow.support secondRow.support := by
      rw [Finset.disjoint_left]
      intro x hxFirst hxSecond
      apply hradii
      calc
        otherRadius = secondRow.radius := hsecondRadius.symm
        _ = dist center x :=
          (secondRow.support_eq_radius x hxSecond).symm
        _ = firstRow.radius := firstRow.support_eq_radius x hxFirst
        _ = radius := hfirstRadius
    exact .twoDistinctRadii
      radius otherRadius hradius hotherRadius hfour hfourOther hradii hnoFive
      firstRow secondRow hfirstRadius hsecondRadius hdisjoint

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

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

private theorem oppApex1_ne_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ≠ S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v23_ne
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v13_ne.symm
  · simpa [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hi] using S.triangle.v12_ne

/-- Arithmetic retained when the first opposite cap grows beyond the least
robust exact-four profile. -/
structure ExactFourFirstOppositeCapGrowth
    {D : CounterexampleData} (S : SurplusCapPacket D.A) : Prop where
  surplusCap_card_eq_five : S.surplusCap.card = 5
  firstOppCap_card_ge_five : 5 ≤ S.oppCap1.card
  oppositeCaps_card_add_two_eq_carrier :
    S.oppCap1.card + S.oppCap2.card + 2 = D.A.card

/-- Arithmetic retained when the second opposite cap grows beyond the least
robust exact-four profile. -/
structure ExactFourSecondOppositeCapGrowth
    {D : CounterexampleData} (S : SurplusCapPacket D.A) : Prop where
  surplusCap_card_eq_five : S.surplusCap.card = 5
  firstOppCap_card_eq_four : S.oppCap1.card = 4
  secondOppCap_card_ge_six : 6 ≤ S.oppCap2.card
  secondOppCap_card_add_six_eq_carrier :
    S.oppCap2.card + 6 = D.A.card

/-- The cap which grows beyond the least robust exact-four profile
`(surplus, first opposite, second opposite) = (5, 4, 5)`. -/
inductive ExactFourRobustCapGrowth
    {D : CounterexampleData} (S : SurplusCapPacket D.A) : Prop
  | surplus
      (surplusCap_card_ge_six : 6 ≤ S.surplusCap.card)
  | firstOpposite
      (profile : ExactFourFirstOppositeCapGrowth S)
  | secondOpposite
      (profile : ExactFourSecondOppositeCapGrowth S)

/-- Strongest uniform source packet currently available on the robust
exact-four constructor after the card-eleven certificate. -/
structure ExactFourPostCardElevenRobustSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type where
  ingress : ExactFourPhysicalCommonDeletionIngress R
  secondApex_robust : FullyDeletionRobustAt D S.oppApex2
  firstOppCap_card_ge_four : 4 ≤ S.oppCap1.card
  secondOppCap_card_ge_five : 5 ≤ S.oppCap2.card
  radiusClassification :
    DeletionRobustRadiusClassification D S.oppApex2
  capGrowth : ExactFourRobustCapGrowth S

/-- The actual late row of a strict second-cap source contains at most two
points from the source's physical second-apex radius class.  If it contained
another such point, the two centers would localize the late blocker to the
second cap; the ordered-cap row bound then rules out a third hit. -/
theorem actualLateRow_secondClassInterior_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (source : CarrierVertex D.A)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex2) :
    ((((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex2 rho ∩
          S.capInteriorByIndex S.oppIndex2)).card ≤ 2) := by
  classical
  let K :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell
  let T :=
    K.support ∩
      (SelectedClass D.A S.oppApex2 rho ∩
        S.capInteriorByIndex S.oppIndex2)
  have hsourceK : source.1 ∈ K.support := by
    simpa [K] using
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.q_mem_support
  have hsourceT : source.1 ∈ T := by
    exact Finset.mem_inter.mpr
      ⟨hsourceK, Finset.mem_inter.mpr
        ⟨hsourceClass, hsourceInterior⟩⟩
  by_contra hnot
  have hTnot : ¬ T.card ≤ 2 := by
    simpa [T, K] using hnot
  have hTlarge : 1 < T.card := by omega
  obtain ⟨x, hxT, hx_ne_source⟩ :=
    Finset.exists_mem_ne hTlarge source.1
  have hxData := Finset.mem_inter.mp hxT
  have hxPhysical := Finset.mem_inter.mp hxData.2
  have hcenterA :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hcenterNe :
      (lateFirstApexSystem R).centerAt
        source.1 source.2 ≠ S.oppApex2 :=
    surface.secondApex_robust.centerAt_ne
      (lateFirstApexSystem R) source.1 source.2
  have hcenterEq :
      dist ((lateFirstApexSystem R).centerAt source.1 source.2)
          source.1 =
        dist ((lateFirstApexSystem R).centerAt source.1 source.2) x :=
    (K.support_eq_radius source.1 hsourceK).trans
      (K.support_eq_radius x hxData.1).symm
  have hphysicalEq :
      dist S.oppApex2 source.1 = dist S.oppApex2 x :=
    ((mem_selectedClass.mp hsourceClass).2).trans
      ((mem_selectedClass.mp hxPhysical.1).2).symm
  have hcenterInterior :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior
      hcenterA hcenterNe hsourceInterior hxPhysical.2
      hx_ne_source.symm hcenterEq hphysicalEq
  have hcenterCap :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hcenterInterior
  have hsubset :
      T ⊆ K.support ∩ S.capByIndex S.oppIndex2 := by
    intro z hz
    have hzData := Finset.mem_inter.mp hz
    exact Finset.mem_inter.mpr
      ⟨hzData.1,
        S.capInteriorByIndex_subset_capByIndex S.oppIndex2
          (Finset.mem_inter.mp hzData.2).2⟩
  have htwo :
      (K.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 := by
    simpa [K] using
      CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
        S D.convex S.oppIndex2 K.toSelectedFourClass hcenterCap
  have hTtwo : T.card ≤ 2 :=
    le_trans (Finset.card_le_card hsubset) htwo
  exact hTnot hTtwo

/-- Every actual late row meets a fixed physical second-apex radius class in
at most two points.  Full deletion robustness at the physical apex keeps it
distinct from every actual late blocker, so this is the generic two-circle
intersection bound with no cap-interior restriction. -/
theorem actualLateRow_secondClass_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (source : CarrierVertex D.A) :
    ((((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 rho).card ≤ 2) := by
  exact
    criticalFourShell_inter_selectedClass_card_le_two
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell
      (surface.secondApex_robust.centerAt_ne
        (lateFirstApexSystem R) source.1 source.2)

/-- An outside source is interior-pair bad when deleting either member of the
source-valid strict first-cap pair destroys K4 at its actual late blocker. -/
noncomputable def interiorPairBadOutsideSources
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    Finset (CarrierVertex D.A) :=
  let Hlate := lateFirstApexSystem R
  (outsideFirstApexFiber R).filter fun source =>
    ¬ HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
        (Hlate.centerAt source.1 source.2) ∧
      ¬ HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
        (Hlate.centerAt source.1 source.2)

private theorem interiorPairBad_source_pair_mem_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : CarrierVertex D.A}
    (hsource : source ∈ interiorPairBadOutsideSources R) :
    R.interior_q ∈
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∧
      R.interior_w ∈
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support := by
  have hbad := (Finset.mem_filter.mp hsource).2
  exact ⟨source_mem_critical_support_of_no_qfree
      ((lateFirstApexSystem R).selectedAt source.1 source.2) hbad.1,
    source_mem_critical_support_of_no_qfree
      ((lateFirstApexSystem R).selectedAt source.1 source.2) hbad.2⟩

private theorem centerAt_ne_firstApex_of_mem_outsideFirstApexFiber
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : CarrierVertex D.A}
    (hsource : source ∈ outsideFirstApexFiber R) :
    (lateFirstApexSystem R).centerAt source.1 source.2 ≠
      S.oppApex1 := by
  intro hcenter
  have hsourceFiber :
      source ∈ actualBlockerFiber (lateFirstApexSystem R)
        ⟨F.pair.q, F.pair.q_mem_A⟩ := by
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ _, Subtype.ext ?_⟩
    simpa only [CriticalShellSystem.blockerVertex, hcenter] using
      (lateFirstApexSystem_centerAt_eq R F.pair.q_mem_A
        (frontier_pair_q_mem_firstApexClass F)).symm
  exact (Finset.mem_sdiff.mp hsource).2 hsourceFiber

/-- All outside sources which block both source-valid interior-pair deletions
share one actual late blocker. -/
theorem interiorPairBad_source_blockers_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source₁ source₂ : CarrierVertex D.A}
    (hsource₁ : source₁ ∈ interiorPairBadOutsideSources R)
    (hsource₂ : source₂ ∈ interiorPairBadOutsideSources R) :
    (lateFirstApexSystem R).centerAt source₁.1 source₁.2 =
      (lateFirstApexSystem R).centerAt source₂.1 source₂.2 := by
  let Hlate := lateFirstApexSystem R
  let c₁ := Hlate.centerAt source₁.1 source₁.2
  let c₂ := Hlate.centerAt source₂.1 source₂.2
  let o := S.oppApex1
  have hpair₁ := interiorPairBad_source_pair_mem_support R hsource₁
  have hpair₂ := interiorPairBad_source_pair_mem_support R hsource₂
  have hqA : R.interior_q ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_q_mem).1).1
  have hwA : R.interior_w ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_w_mem).1).1
  have hoA : o ∈ D.A := by
    simpa [o] using oppApex1_mem_A S
  have hc₁A : c₁ ∈ D.A :=
    (Finset.mem_erase.mp
      (Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell.center_mem).2
  have hc₂A : c₂ ∈ D.A :=
    (Finset.mem_erase.mp
      (Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell.center_mem).2
  have houtside₁ : source₁ ∈ outsideFirstApexFiber R :=
    (Finset.mem_filter.mp hsource₁).1
  have houtside₂ : source₂ ∈ outsideFirstApexFiber R :=
    (Finset.mem_filter.mp hsource₂).1
  have hc₁_ne_o : c₁ ≠ o := by
    simpa [c₁, o, Hlate] using
      centerAt_ne_firstApex_of_mem_outsideFirstApexFiber R houtside₁
  have hc₂_ne_o : c₂ ≠ o := by
    simpa [c₂, o, Hlate] using
      centerAt_ne_firstApex_of_mem_outsideFirstApexFiber R houtside₂
  have hoEq :
      dist o R.interior_q = dist o R.interior_w := by
    have hq :=
      (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_q_mem).1).2
    have hw :=
      (mem_selectedClass.mp (Finset.mem_inter.mp R.interior_w_mem).1).2
    simpa [o] using hq.trans hw.symm
  have hc₁Eq :
      dist c₁ R.interior_q = dist c₁ R.interior_w :=
    ((Hlate.selectedAt source₁.1 source₁.2).toCriticalFourShell.support_eq_radius
      R.interior_q hpair₁.1).trans
      (((Hlate.selectedAt source₁.1
        source₁.2).toCriticalFourShell.support_eq_radius
          R.interior_w hpair₁.2).symm)
  have hc₂Eq :
      dist c₂ R.interior_q = dist c₂ R.interior_w :=
    ((Hlate.selectedAt source₂.1 source₂.2).toCriticalFourShell.support_eq_radius
      R.interior_q hpair₂.1).trans
      (((Hlate.selectedAt source₂.1
        source₂.2).toCriticalFourShell.support_eq_radius
          R.interior_w hpair₂.2).symm)
  by_contra hc₁c₂
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex
    hqA hwA R.interior_q_ne_w
  have hoFilter :
      o ∈ D.A.filter
        (fun z => dist z R.interior_q = dist z R.interior_w) :=
    Finset.mem_filter.mpr ⟨hoA, hoEq⟩
  have hc₁Filter :
      c₁ ∈ D.A.filter
        (fun z => dist z R.interior_q = dist z R.interior_w) :=
    Finset.mem_filter.mpr ⟨hc₁A, hc₁Eq⟩
  have hc₂Filter :
      c₂ ∈ D.A.filter
        (fun z => dist z R.interior_q = dist z R.interior_w) :=
    Finset.mem_filter.mpr ⟨hc₂A, hc₂Eq⟩
  have hthree :
      2 < (D.A.filter
        (fun z => dist z R.interior_q = dist z R.interior_w)).card := by
    rw [Finset.two_lt_card]
    exact ⟨o, hoFilter, c₁, hc₁Filter, c₂, hc₂Filter,
      hc₁_ne_o.symm, hc₂_ne_o.symm, hc₁c₂⟩
  omega

/-- At one second-apex radius, at most one strict second-cap-interior source
can block both source-valid interior-pair deletions at its late blocker. -/
theorem interiorPairBad_secondClassInterior_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hrobust : FullyDeletionRobustAt D S.oppApex2) :
    ((interiorPairBadOutsideSources R).filter fun source =>
      source.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
        source.1 ∈ S.capInteriorByIndex S.oppIndex2).card ≤ 1 := by
  apply Finset.card_le_one.mpr
  intro source₁ hsource₁ source₂ hsource₂
  have hdata₁ := (Finset.mem_filter.mp hsource₁).2
  have hdata₂ := (Finset.mem_filter.mp hsource₂).2
  have hbad₁ := (Finset.mem_filter.mp hsource₁).1
  have hbad₂ := (Finset.mem_filter.mp hsource₂).1
  have hcenters := interiorPairBad_source_blockers_eq R hbad₁ hbad₂
  let c :=
    (lateFirstApexSystem R).centerAt source₁.1 source₁.2
  have hcA : c ∈ D.A :=
    (Finset.mem_erase.mp
      ((lateFirstApexSystem R).selectedAt
        source₁.1 source₁.2).toCriticalFourShell.center_mem).2
  have hc_ne_first : c ≠ S.oppApex1 := by
    simpa [c] using
      centerAt_ne_firstApex_of_mem_outsideFirstApexFiber R
        (Finset.mem_filter.mp hbad₁).1
  have hc_ne_second : c ≠ S.oppApex2 := by
    simpa [c] using
      hrobust.centerAt_ne
        (lateFirstApexSystem R) source₁.1 source₁.2
  have hsupports :=
    selectedSupports_eq_of_actualBlockers_eq
      (lateFirstApexSystem R) source₁.2 source₂.2 hcenters
  have hsource₁Support :
      source₁.1 ∈
        ((lateFirstApexSystem R).selectedAt
          source₁.1 source₁.2).toCriticalFourShell.support :=
    ((lateFirstApexSystem R).selectedAt
      source₁.1 source₁.2).toCriticalFourShell.q_mem_support
  have hsource₂Support :
      source₂.1 ∈
        ((lateFirstApexSystem R).selectedAt
          source₁.1 source₁.2).toCriticalFourShell.support := by
    rw [hsupports]
    exact ((lateFirstApexSystem R).selectedAt
      source₂.1 source₂.2).toCriticalFourShell.q_mem_support
  have hcEq :
      dist c source₁.1 = dist c source₂.1 := by
    exact
      (((lateFirstApexSystem R).selectedAt
        source₁.1 source₁.2).toCriticalFourShell.support_eq_radius
          source₁.1 hsource₁Support).trans
      ((((lateFirstApexSystem R).selectedAt
        source₁.1 source₁.2).toCriticalFourShell.support_eq_radius
          source₂.1 hsource₂Support).symm)
  have hphysicalEq :
      dist S.oppApex2 source₁.1 =
        dist S.oppApex2 source₂.1 :=
    ((mem_selectedClass.mp hdata₁.1).2).trans
      ((mem_selectedClass.mp hdata₂.1).2).symm
  by_contra hsources
  have hsource_ne : source₁.1 ≠ source₂.1 := by
    intro h
    apply hsources
    exact Subtype.ext h
  have hcFirst :
      c ∈ S.capInteriorByIndex S.oppIndex1 :=
    R.bisector_center_mem_interior c hcA hc_ne_first
      (by
        simpa [c] using
          ((interiorPairBad_source_pair_mem_support R hbad₁).1
            |> fun hq =>
              (((lateFirstApexSystem R).selectedAt
                source₁.1 source₁.2).toCriticalFourShell.support_eq_radius
                  R.interior_q hq).trans
                ((((lateFirstApexSystem R).selectedAt
                  source₁.1 source₁.2).toCriticalFourShell.support_eq_radius
                    R.interior_w
                    (interiorPairBad_source_pair_mem_support R hbad₁).2).symm)))
  have hcSecond :
      c ∈ S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior
      hcA hc_ne_second hdata₁.2 hdata₂.2 hsource_ne hcEq hphysicalEq
  have hc_not_secondCap :
      c ∉ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_not_mem_capByIndex_of_ne
      hcFirst S.oppIndex1_ne_oppIndex2
  exact hc_not_secondCap
    (S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hcSecond)

private theorem mem_outsideFirstApexFiber_of_not_mem_firstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : CarrierVertex D.A}
    (hnot :
      source.1 ∉ SelectedClass D.A S.oppApex1 radius) :
    source ∈ outsideFirstApexFiber R := by
  apply Finset.mem_sdiff.mpr
  refine ⟨Finset.mem_univ _, ?_⟩
  intro hsourceFiber
  have hblockers := (Finset.mem_filter.mp hsourceFiber).2
  apply hnot
  apply
    (lateFirstApexSystem_centerAt_eq_iff_mem_class R source.2).mp
  calc
    (lateFirstApexSystem R).centerAt source.1 source.2 =
        (lateFirstApexSystem R).centerAt
          F.pair.q F.pair.q_mem_A :=
      congrArg Subtype.val hblockers
    _ = S.oppApex1 :=
      lateFirstApexSystem_centerAt_eq R F.pair.q_mem_A
        (frontier_pair_q_mem_firstApexClass F)

private theorem firstSecondClass_inter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    ((SelectedClass D.A S.oppApex1 radius) ∩
      (SelectedClass D.A S.oppApex2 rho)).card ≤ 2 := by
  let K :=
    ((lateFirstApexSystem R).selectedAt
      F.pair.q F.pair.q_mem_A).toCriticalFourShell
  have hcenterEq :=
    lateFirstApexSystem_centerAt_eq R F.pair.q_mem_A
      (frontier_pair_q_mem_firstApexClass F)
  have hcenters :
      (lateFirstApexSystem R).centerAt
          F.pair.q F.pair.q_mem_A ≠ S.oppApex2 := by
    simpa [hcenterEq] using oppApex1_ne_oppApex2 S
  have hbound :=
    criticalFourShell_inter_selectedClass_card_le_two
      (radius := rho) K hcenters
  have hsupport :=
    lateFirstApexSystem_support_eq_class R F.pair.q_mem_A
      (frontier_pair_q_mem_firstApexClass F)
  simpa [K, hsupport] using hbound

private theorem exists_mem_not_mem_pair_of_card_gt
    {α : Type*} (T X Y : Finset α)
    (hcard : X.card + Y.card < T.card) :
    ∃ z ∈ T, z ∉ X ∧ z ∉ Y := by
  classical
  by_contra hnone
  have hsubset : T ⊆ X ∪ Y := by
    intro z hz
    rw [Finset.mem_union]
    by_contra hxy
    push_neg at hxy
    exact hnone ⟨z, hz, hxy⟩
  have hle := Finset.card_le_card hsubset
  have hunion := Finset.card_union_le X Y
  omega

private theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

private theorem secondInterior_not_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.oppIndex2) :
    x ∉ S.surplusCap := by
  have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hx
    S.surplusIdx_ne_oppIndex2.symm
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simpa [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi] using hnot

/-- A five-point positive class at the second physical apex contains a strict
second-cap source outside the first-apex fiber for which at least one member
of the source-valid strict first-cap pair can be deleted without destroying
the source's actual late four-point row. -/
theorem exists_interiorPairGoodOutsideSource_mem_secondClassInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hrobust : FullyDeletionRobustAt D S.oppApex2)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card) :
    ∃ source : CarrierVertex D.A,
      source.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
      source.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      source ∈ outsideFirstApexFiber R ∧
      (HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2)) := by
  let secondInterior :=
    SelectedClass D.A S.oppApex2 rho ∩
      S.capInteriorByIndex S.oppIndex2
  let firstHit :=
    secondInterior.filter fun z =>
      z ∈ SelectedClass D.A S.oppApex1 radius
  let badSources :=
    (interiorPairBadOutsideSources R).filter fun source =>
      source.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
        source.1 ∈ S.capInteriorByIndex S.oppIndex2
  let badPoints := badSources.image fun source => source.1
  have hinterior :
      (SelectedClass D.A S.oppApex2 rho).card - 2 ≤
        secondInterior.card := by
    have hbound :=
      S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
        D.convex S.oppIndex2 hrho
    rw [← oppApex2_eq_oppositeVertex_oppIndex2 S] at hbound
    simpa [secondInterior] using hbound
  have hthree : 3 ≤ secondInterior.card := by omega
  have hfirstHit : firstHit.card ≤ 1 := by
    have hsubset :
        firstHit ⊆
          (((D.A.filter fun x => dist x S.oppApex1 = radius) \
              S.surplusCap).filter fun x =>
            x ∈ SelectedClass D.A S.oppApex2 rho) := by
      intro x hx
      rcases Finset.mem_filter.mp hx with ⟨hxInterior, hxFirst⟩
      rcases Finset.mem_inter.mp hxInterior with ⟨hxSecond, hxCapInterior⟩
      rcases mem_selectedClass.mp hxFirst with ⟨hxA, hxRadius⟩
      exact Finset.mem_filter.mpr ⟨
        Finset.mem_sdiff.mpr ⟨
          Finset.mem_filter.mpr
            ⟨hxA, by simpa only [dist_comm] using hxRadius⟩,
          secondInterior_not_mem_surplusCap S hxCapInterior⟩,
        hxSecond⟩
    exact le_trans (Finset.card_le_card hsubset)
      (firstApex_marginal_inter_secondClass_card_le_one
        D S radius rho)
  have hbadPoints : badPoints.card ≤ 1 := by
    calc
      badPoints.card = badSources.card :=
        Finset.card_image_of_injective _ Subtype.val_injective
      _ ≤ 1 := by
        simpa [badSources] using
          interiorPairBad_secondClassInterior_card_le_one
            R hrobust (rho := rho)
  have hsmall :
      firstHit.card + badPoints.card < secondInterior.card := by
    omega
  obtain ⟨z, hzInterior, hzFirstHit, hzBad⟩ :=
    exists_mem_not_mem_pair_of_card_gt
      secondInterior firstHit badPoints hsmall
  rcases Finset.mem_inter.mp hzInterior with
    ⟨hzSecond, hzCapInterior⟩
  have hzFirst :
      z ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hzFirst
    exact hzFirstHit
      (Finset.mem_filter.mpr ⟨hzInterior, hzFirst⟩)
  have hzA : z ∈ D.A := (mem_selectedClass.mp hzSecond).1
  let source : CarrierVertex D.A := ⟨z, hzA⟩
  have houtside : source ∈ outsideFirstApexFiber R :=
    mem_outsideFirstApexFiber_of_not_mem_firstClass R
      (by simpa [source] using hzFirst)
  have hnotBad :
      source ∉ interiorPairBadOutsideSources R := by
    intro hsourceBad
    apply hzBad
    apply Finset.mem_image.mpr
    refine ⟨source, ?_, rfl⟩
    exact Finset.mem_filter.mpr ⟨hsourceBad,
      by simpa [source] using And.intro hzSecond hzCapInterior⟩
  have hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt source.1 source.2) := by
    by_contra hnone
    push_neg at hnone
    exact hnotBad
      (Finset.mem_filter.mpr ⟨houtside, hnone⟩)
  exact ⟨source, by simpa [source] using hzSecond,
    by simpa [source] using hzCapInterior, houtside, hsurvives⟩

/-- A five-point physical radius class supplies another strict second-cap
source outside the active source's actual late row once that row has the
checked two-hit bound.  The omitted peer necessarily has a distinct actual
late blocker. -/
theorem exists_omittedSecondClassInteriorPeer
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (source : CarrierVertex D.A)
    (hrho : 0 < rho)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hlateCross :
      ((((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support ∩
          (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2)).card ≤ 2)) :
    ∃ other : CarrierVertex D.A,
      other ≠ source ∧
      other.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
      other.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      other.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∧
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt other.1 other.2 := by
  classical
  let secondInterior :=
    SelectedClass D.A S.oppApex2 rho ∩
      S.capInteriorByIndex S.oppIndex2
  let lateHit :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell.support ∩ secondInterior
  have hinterior :
      (SelectedClass D.A S.oppApex2 rho).card - 2 ≤
        secondInterior.card := by
    have hbound :=
      S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
        D.convex S.oppIndex2 hrho
    rw [← oppApex2_eq_oppositeVertex_oppIndex2 S] at hbound
    simpa [secondInterior] using hbound
  have hthree : 3 ≤ secondInterior.card := by omega
  have hlateHit : lateHit.card ≤ 2 := by
    simpa [lateHit, secondInterior] using hlateCross
  have hlt : lateHit.card < secondInterior.card := by omega
  obtain ⟨z, hzInterior, hzNotLateHit⟩ :=
    Finset.exists_mem_notMem_of_card_lt_card hlt
  have hzData := Finset.mem_inter.mp hzInterior
  have hzA : z ∈ D.A := (mem_selectedClass.mp hzData.1).1
  let other : CarrierVertex D.A := ⟨z, hzA⟩
  have hzNotSourceRow :
      other.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support := by
    intro hzRow
    apply hzNotLateHit
    exact Finset.mem_inter.mpr
      ⟨by simpa [other] using hzRow,
        by simpa [other, secondInterior] using hzInterior⟩
  have hotherNe : other ≠ source := by
    intro h
    apply hzNotSourceRow
    rw [h]
    exact
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.q_mem_support
  have hblockersNe :
      (lateFirstApexSystem R).centerAt source.1 source.2 ≠
        (lateFirstApexSystem R).centerAt other.1 other.2 := by
    intro hcenters
    have hsupports :=
      selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem R) source.2 other.2 hcenters
    apply hzNotSourceRow
    rw [hsupports]
    exact
      ((lateFirstApexSystem R).selectedAt
        other.1 other.2).toCriticalFourShell.q_mem_support
  exact ⟨other, hotherNe,
    by simpa [other] using hzData.1,
    by simpa [other] using hzData.2,
    hzNotSourceRow, hblockersNe⟩

private theorem not_mem_of_card_le_two_of_two_mem
    {α : Type*} {T : Finset α} {x y z : α}
    (hT : T.card ≤ 2) (hx : x ∈ T) (hy : y ∈ T)
    (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z) :
    z ∉ T := by
  classical
  intro hz
  have hcardErase : (T.erase x).card ≤ 1 := by
    rw [Finset.card_erase_of_mem hx]
    omega
  have hyErase : y ∈ T.erase x :=
    Finset.mem_erase.mpr ⟨Ne.symm hxy, hy⟩
  have hzErase : z ∈ T.erase x :=
    Finset.mem_erase.mpr ⟨Ne.symm hxz, hz⟩
  exact
    hyz ((Finset.card_le_one.mp hcardErase) y hyErase z hzErase)

/-- Five points in one physical second-apex radius class force two sources
that are mutually absent from one another's actual late rows.

For the active source, the whole-class row bound leaves at least two omitted
peers.  If the first peer omits the source, they form the required pair.
Otherwise its two possible class hits are already itself and the source, so it
omits the second peer.  The second peer then either omits the first, or its two
hits force it to omit the source. -/
theorem exists_mutuallyOmittedSecondClassPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius rho : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (source : CarrierVertex D.A)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hsourceClass :
      source.1 ∈ SelectedClass D.A S.oppApex2 rho) :
    ∃ u v : CarrierVertex D.A,
      u ≠ v ∧
      u.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
      v.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∧
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support ∧
      source.1 ∈
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∧
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∧
      (u = source ∨
        u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            source.1 source.2).toCriticalFourShell.support) := by
  classical
  let C := SelectedClass D.A S.oppApex2 rho
  let rowAt : CarrierVertex D.A → Finset ℝ² := fun x =>
    ((lateFirstApexSystem R).selectedAt
      x.1 x.2).toCriticalFourShell.support
  let omitted := C \ rowAt source
  have hsourceBound : (rowAt source ∩ C).card ≤ 2 := by
    simpa [rowAt, C] using
      actualLateRow_secondClass_card_le_two R surface source
  have hinter : (C ∩ rowAt source).card ≤ 2 := by
    simpa [Finset.inter_comm] using hsourceBound
  have hsplit :
      omitted.card + (C ∩ rowAt source).card = C.card := by
    simpa [omitted] using
      Finset.card_sdiff_add_card_inter C (rowAt source)
  have homitted : 3 ≤ omitted.card := by
    have hC : 5 ≤ C.card := by
      simpa [C] using hfive
    omega
  obtain ⟨a, haOmitted, b, hbOmitted, hab⟩ :=
    Finset.one_lt_card.mp (show 1 < omitted.card by omega)
  have haData := Finset.mem_sdiff.mp haOmitted
  have hbData := Finset.mem_sdiff.mp hbOmitted
  have haA : a ∈ D.A := (mem_selectedClass.mp haData.1).1
  have hbA : b ∈ D.A := (mem_selectedClass.mp hbData.1).1
  let sa : CarrierVertex D.A := ⟨a, haA⟩
  let sb : CarrierVertex D.A := ⟨b, hbA⟩
  have hsourceOwn : source.1 ∈ rowAt source := by
    exact
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.q_mem_support
  have haNeSourceVal : a ≠ source.1 := by
    intro h
    apply haData.2
    simpa [rowAt, h] using hsourceOwn
  have hbNeSourceVal : b ≠ source.1 := by
    intro h
    apply hbData.2
    simpa [rowAt, h] using hsourceOwn
  have hsaNeSource : sa ≠ source := by
    intro h
    exact haNeSourceVal (congrArg Subtype.val h)
  have hsbNeSource : sb ≠ source := by
    intro h
    exact hbNeSourceVal (congrArg Subtype.val h)
  have hsaNeSb : sa ≠ sb := by
    intro h
    exact hab (congrArg Subtype.val h)
  have hsaOwn : sa.1 ∈ rowAt sa := by
    exact
      ((lateFirstApexSystem R).selectedAt
        sa.1 sa.2).toCriticalFourShell.q_mem_support
  have hsbOwn : sb.1 ∈ rowAt sb := by
    exact
      ((lateFirstApexSystem R).selectedAt
        sb.1 sb.2).toCriticalFourShell.q_mem_support
  by_cases hsourceNotSa : source.1 ∉ rowAt sa
  · exact ⟨source, sa, Ne.symm hsaNeSource,
      by simpa [C] using hsourceClass,
      by simpa [sa, C] using haData.1,
      by simpa [sa, rowAt] using haData.2,
      by simpa [rowAt] using hsourceNotSa,
      by simpa [rowAt] using hsourceOwn,
      by simpa [sa, rowAt] using haData.2,
      Or.inl rfl⟩
  · have hsourceInSa : source.1 ∈ rowAt sa :=
      not_not.mp hsourceNotSa
    have hsaBound : (rowAt sa ∩ C).card ≤ 2 := by
      simpa [rowAt, C] using
        actualLateRow_secondClass_card_le_two R surface sa
    have hsaOwnI : sa.1 ∈ rowAt sa ∩ C := by
      exact Finset.mem_inter.mpr
        ⟨hsaOwn, by simpa [sa, C] using haData.1⟩
    have hsourceInSaI : source.1 ∈ rowAt sa ∩ C := by
      exact Finset.mem_inter.mpr
        ⟨hsourceInSa, by simpa [C] using hsourceClass⟩
    have hsbNotSa : sb.1 ∉ rowAt sa := by
      intro hsbIn
      have hsbInI : sb.1 ∈ rowAt sa ∩ C :=
        Finset.mem_inter.mpr
          ⟨hsbIn, by simpa [sb, C] using hbData.1⟩
      exact
        not_mem_of_card_le_two_of_two_mem
          hsaBound hsaOwnI hsourceInSaI
          (by simpa [sa] using haNeSourceVal)
          (by simpa [sa, sb] using hab)
          (by simpa [sb] using Ne.symm hbNeSourceVal)
          hsbInI
    by_cases hsaNotSb : sa.1 ∉ rowAt sb
    · exact ⟨sa, sb, hsaNeSb,
        by simpa [sa, C] using haData.1,
        by simpa [sb, C] using hbData.1,
        by simpa [rowAt] using hsbNotSa,
        by simpa [rowAt] using hsaNotSb,
        by simpa [rowAt] using hsourceInSa,
        by simpa [sb, rowAt] using hbData.2,
        Or.inr (by simpa [sa, rowAt] using haData.2)⟩
    · have hsaInSb : sa.1 ∈ rowAt sb :=
        not_not.mp hsaNotSb
      have hsbBound : (rowAt sb ∩ C).card ≤ 2 := by
        simpa [rowAt, C] using
          actualLateRow_secondClass_card_le_two R surface sb
      have hsbOwnI : sb.1 ∈ rowAt sb ∩ C := by
        exact Finset.mem_inter.mpr
          ⟨hsbOwn, by simpa [sb, C] using hbData.1⟩
      have hsaInSbI : sa.1 ∈ rowAt sb ∩ C := by
        exact Finset.mem_inter.mpr
          ⟨hsaInSb, by simpa [sa, C] using haData.1⟩
      have hsourceNotSb : source.1 ∉ rowAt sb := by
        intro hsourceIn
        have hsourceInI : source.1 ∈ rowAt sb ∩ C :=
          Finset.mem_inter.mpr
            ⟨hsourceIn, by simpa [C] using hsourceClass⟩
        exact
          not_mem_of_card_le_two_of_two_mem
            hsbBound hsbOwnI hsaInSbI
            (by simpa [sa, sb] using Ne.symm hab)
            (by simpa [sb] using hbNeSourceVal)
            (by simpa [sa] using haNeSourceVal)
            hsourceInI
      exact ⟨source, sb, Ne.symm hsbNeSource,
        by simpa [C] using hsourceClass,
        by simpa [sb, C] using hbData.1,
        by simpa [sb, rowAt] using hbData.2,
        by simpa [rowAt] using hsourceNotSb,
        by simpa [rowAt] using hsourceOwn,
        by simpa [sb, rowAt] using hbData.2,
        Or.inl rfl⟩

/-- Source-faithful normal form for the complete second-apex radius
classification.  The five-point arm now carries an actual strict-cap source
and one surviving source-valid interior deletion.  The only remaining arm has
two disjoint exact four-point rows, and each radius class has at least two
strict second-cap members. -/
theorem interiorPairGood_or_twoDistinctExactFourInteriorRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R) :
    (∃ (rho : ℝ) (source : CarrierVertex D.A),
        0 < rho ∧
          5 ≤ (SelectedClass D.A S.oppApex2 rho).card ∧
          source.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
          source.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
          source ∈ outsideFirstApexFiber R ∧
          (HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
              ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
            HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
              ((lateFirstApexSystem R).centerAt source.1 source.2))) ∨
      ∃ (rho otherRadius : ℝ)
          (firstRow secondRow : SelectedFourClass D.A S.oppApex2),
        0 < rho ∧
          0 < otherRadius ∧
          otherRadius ≠ rho ∧
          (∀ candidateRadius : ℝ, 0 < candidateRadius →
            (SelectedClass D.A S.oppApex2 candidateRadius).card < 5) ∧
          (SelectedClass D.A S.oppApex2 rho).card = 4 ∧
          (SelectedClass D.A S.oppApex2 otherRadius).card = 4 ∧
          firstRow.radius = rho ∧
          secondRow.radius = otherRadius ∧
          Disjoint firstRow.support secondRow.support ∧
          2 ≤ (SelectedClass D.A S.oppApex2 rho ∩
            S.capInteriorByIndex S.oppIndex2).card ∧
          2 ≤ (SelectedClass D.A S.oppApex2 otherRadius ∩
            S.capInteriorByIndex S.oppIndex2).card := by
  rcases surface.radiusClassification with
    ⟨rho, hrho, hfive⟩ |
      ⟨rho, otherRadius, hrho, hother, hfour, hfourOther,
        hradii, hnoFive, firstRow, secondRow,
        hfirstRadius, hsecondRadius, hdisjoint⟩
  · left
    rcases
        exists_interiorPairGoodOutsideSource_mem_secondClassInterior
          R surface.secondApex_robust hrho hfive with
      ⟨source, hsourceClass, hsourceInterior, hsourceOutside,
        hsurvives⟩
    exact ⟨rho, source, hrho, hfive, hsourceClass, hsourceInterior,
      hsourceOutside, hsurvives⟩
  · right
    have hcard : (SelectedClass D.A S.oppApex2 rho).card = 4 := by
      have hlt := hnoFive rho hrho
      omega
    have hcardOther :
        (SelectedClass D.A S.oppApex2 otherRadius).card = 4 := by
      have hlt := hnoFive otherRadius hother
      omega
    have hinterior :
        2 ≤ (SelectedClass D.A S.oppApex2 rho ∩
          S.capInteriorByIndex S.oppIndex2).card := by
      have hbound :=
        S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
          D.convex S.oppIndex2 hrho
      rw [← oppApex2_eq_oppositeVertex_oppIndex2 S] at hbound
      omega
    have hinteriorOther :
        2 ≤ (SelectedClass D.A S.oppApex2 otherRadius ∩
          S.capInteriorByIndex S.oppIndex2).card := by
      have hbound :=
        S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
          D.convex S.oppIndex2 hother
      rw [← oppApex2_eq_oppositeVertex_oppIndex2 S] at hbound
      omega
    exact ⟨rho, otherRadius, firstRow, secondRow,
      hrho, hother, hradii, hnoFive, hcard, hcardOther,
      hfirstRadius, hsecondRadius, hdisjoint,
      hinterior, hinteriorOther⟩

private theorem exists_goodOutsideSource_of_fivePointRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hrobust : FullyDeletionRobustAt D S.oppApex2)
    (hfive :
      5 ≤ (SelectedClass D.A S.oppApex2 rho).card) :
    ∃ source : CarrierVertex D.A,
      source.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
      source ∈ goodOutsideSources R ∧
      (lateFirstApexSystem R).centerAt
        source.1 source.2 ≠ S.oppApex2 := by
  let firstClass := SelectedClass D.A S.oppApex1 radius
  let secondClass := SelectedClass D.A S.oppApex2 rho
  let shared := firstClass ∩ secondClass
  let badPoints :=
    (badOutsideSources R).image fun source => source.1
  have hshared : shared.card ≤ 2 := by
    simpa [shared, firstClass, secondClass] using
      firstSecondClass_inter_card_le_two (rho := rho) R
  have hbad : badPoints.card ≤ 2 := by
    calc
      badPoints.card = (badOutsideSources R).card :=
        Finset.card_image_of_injective _ Subtype.val_injective
      _ ≤ 2 := badOutsideSources_card_le_two R
  have hsmall :
      shared.card + badPoints.card < secondClass.card := by
    dsimp only [secondClass]
    omega
  obtain ⟨z, hzSecond, hzShared, hzBad⟩ :=
    exists_mem_not_mem_pair_of_card_gt
      secondClass shared badPoints hsmall
  have hzFirst : z ∉ firstClass := by
    intro hz
    exact hzShared (Finset.mem_inter.mpr ⟨hz, hzSecond⟩)
  have hzA : z ∈ D.A := (mem_selectedClass.mp hzSecond).1
  let source : CarrierVertex D.A := ⟨z, hzA⟩
  have houtside : source ∈ outsideFirstApexFiber R :=
    mem_outsideFirstApexFiber_of_not_mem_firstClass R
      (by simpa [source, firstClass] using hzFirst)
  have hnotBad : source ∉ badOutsideSources R := by
    intro hsourceBad
    apply hzBad
    exact Finset.mem_image.mpr ⟨source, hsourceBad, rfl⟩
  refine ⟨source, ?_,
    Finset.mem_sdiff.mpr ⟨houtside, hnotBad⟩, ?_⟩
  · simpa [source, secondClass] using hzSecond
  · exact
      hrobust.centerAt_ne
        (lateFirstApexSystem R) source.1 source.2

private theorem exists_goodOutsideSource_of_twoDistinctRadii
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho otherRadius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (hrobust : FullyDeletionRobustAt D S.oppApex2)
    (hrho : 0 < rho) (hother : 0 < otherRadius)
    (hfour :
      4 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (hfourOther :
      4 ≤ (SelectedClass D.A S.oppApex2 otherRadius).card)
    (hradii : otherRadius ≠ rho) :
    ∃ chosenRadius source,
      0 < chosenRadius ∧
      4 ≤ (SelectedClass D.A S.oppApex2 chosenRadius).card ∧
      source.1 ∈
        SelectedClass D.A S.oppApex2 chosenRadius ∧
      source ∈ goodOutsideSources R ∧
      (lateFirstApexSystem R).centerAt
        source.1 source.2 ≠ S.oppApex2 := by
  let firstClass := SelectedClass D.A S.oppApex1 radius
  let classOne := SelectedClass D.A S.oppApex2 rho
  let classTwo :=
    SelectedClass D.A S.oppApex2 otherRadius
  let candidates := classOne ∪ classTwo
  let shared :=
    (firstClass ∩ classOne) ∪ (firstClass ∩ classTwo)
  let badPoints :=
    (badOutsideSources R).image fun source => source.1
  have hclassesDisjoint : Disjoint classOne classTwo := by
    rw [Finset.disjoint_left]
    intro z hzOne hzTwo
    apply hradii
    exact ((mem_selectedClass.mp hzTwo).2).symm.trans
      (mem_selectedClass.mp hzOne).2
  have hcandidates : 8 ≤ candidates.card := by
    rw [Finset.card_union_of_disjoint hclassesDisjoint]
    dsimp only [classOne, classTwo]
    omega
  have hshared : shared.card ≤ 4 := by
    have hOne : (firstClass ∩ classOne).card ≤ 2 := by
      simpa [firstClass, classOne] using
        firstSecondClass_inter_card_le_two (rho := rho) R
    have hTwo : (firstClass ∩ classTwo).card ≤ 2 := by
      simpa [firstClass, classTwo] using
        firstSecondClass_inter_card_le_two
          (rho := otherRadius) R
    have hunion :=
      Finset.card_union_le
        (firstClass ∩ classOne) (firstClass ∩ classTwo)
    dsimp only [shared]
    omega
  have hbad : badPoints.card ≤ 2 := by
    calc
      badPoints.card = (badOutsideSources R).card :=
        Finset.card_image_of_injective _ Subtype.val_injective
      _ ≤ 2 := badOutsideSources_card_le_two R
  have hsmall :
      shared.card + badPoints.card < candidates.card := by
    omega
  obtain ⟨z, hzCandidates, hzShared, hzBad⟩ :=
    exists_mem_not_mem_pair_of_card_gt
      candidates shared badPoints hsmall
  have hzCases : z ∈ classOne ∨ z ∈ classTwo :=
    Finset.mem_union.mp hzCandidates
  have hzFirst : z ∉ firstClass := by
    intro hz
    apply hzShared
    rcases hzCases with hzOne | hzTwo
    · exact Finset.mem_union_left _
        (Finset.mem_inter.mpr ⟨hz, hzOne⟩)
    · exact Finset.mem_union_right _
        (Finset.mem_inter.mpr ⟨hz, hzTwo⟩)
  have hzA : z ∈ D.A := by
    rcases hzCases with hzOne | hzTwo
    · exact (mem_selectedClass.mp hzOne).1
    · exact (mem_selectedClass.mp hzTwo).1
  let source : CarrierVertex D.A := ⟨z, hzA⟩
  have houtside : source ∈ outsideFirstApexFiber R :=
    mem_outsideFirstApexFiber_of_not_mem_firstClass R
      (by simpa [source, firstClass] using hzFirst)
  have hnotBad : source ∉ badOutsideSources R := by
    intro hsourceBad
    apply hzBad
    exact Finset.mem_image.mpr ⟨source, hsourceBad, rfl⟩
  have hgood : source ∈ goodOutsideSources R :=
    Finset.mem_sdiff.mpr ⟨houtside, hnotBad⟩
  have hcenterNe :=
    hrobust.centerAt_ne
      (lateFirstApexSystem R) source.1 source.2
  rcases hzCases with hzOne | hzTwo
  · exact ⟨rho, source, hrho, hfour,
      by simpa [source, classOne] using hzOne,
      hgood, hcenterNe⟩
  · exact ⟨otherRadius, source, hother, hfourOther,
      by simpa [source, classTwo] using hzTwo,
      hgood, hcenterNe⟩

/-- The robust radius classification can be made source-faithful: one
positive second-apex radius contains a good source for the late first-apex
system, and full deletion robustness keeps its actual blocker distinct from
the second apex. -/
theorem exists_goodOutsideSource_mem_secondApex_positiveClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R) :
    ∃ rho source,
      0 < rho ∧
      4 ≤ (SelectedClass D.A S.oppApex2 rho).card ∧
      source.1 ∈ SelectedClass D.A S.oppApex2 rho ∧
      source ∈ goodOutsideSources R ∧
      (lateFirstApexSystem R).centerAt
        source.1 source.2 ≠ S.oppApex2 := by
  rcases surface.radiusClassification with
    ⟨rho, hrho, hfive⟩ |
      ⟨rho, otherRadius, hrho, hother, hfour, hfourOther,
        hradii, _, _, _, _, _, _⟩
  · rcases exists_goodOutsideSource_of_fivePointRadius
      R surface.secondApex_robust hfive with
      ⟨source, hsourceClass, hsourceGood, hcenterNe⟩
    exact ⟨rho, source, hrho, by omega, hsourceClass,
      hsourceGood, hcenterNe⟩
  · exact
      exists_goodOutsideSource_of_twoDistinctRadii
        R surface.secondApex_robust hrho hother
          hfour hfourOther hradii

/-- Promote the radius-anchored good source without changing it to the full
physical common-deletion ingress.  This retains the second-apex radius
membership which the previous existential ingress forgot. -/
theorem nonempty_radiusAnchoredPhysicalCommonDeletionIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R) :
    ∃ (rho : ℝ) (ingress : ExactFourPhysicalCommonDeletionIngress R),
      0 < rho ∧
      ingress.source.1 ∈
        SelectedClass D.A S.oppApex2 rho := by
  rcases
      exists_goodOutsideSource_mem_secondApex_positiveClass R surface with
    ⟨rho, source, hrho, _hfour, hsourceClass,
      hsourceGood, hcenterNe⟩
  rcases
      nonempty_exactFourPhysicalCommonDeletionIngress_of_source
        R hsourceGood hcenterNe with
    ⟨ingress, hsource⟩
  refine ⟨rho, ingress, hrho, ?_⟩
  rw [hsource]
  exact hsourceClass

/-- The radius-anchored physical ingress supplies two selected four-point
rows at distinct centers which contain the same named carrier source.  This
is the first positive cross-incidence retained by the robust exact-four
surface. -/
theorem nonempty_radiusAnchoredPhysicalRowCrossHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R) :
    ∃ (rho : ℝ) (source : CarrierVertex D.A)
        (ingress : ExactFourPhysicalCommonDeletionIngress R)
        (lateRow : SelectedFourClass D.A
          ((lateFirstApexSystem R).centerAt source.1 source.2))
        (secondRow : SelectedFourClass D.A S.oppApex2),
      0 < rho ∧
      ingress.source = source ∧
      secondRow.radius = rho ∧
      (lateFirstApexSystem R).centerAt
        source.1 source.2 ≠ S.oppApex2 ∧
      source.1 ∈ lateRow.support ∧
      source.1 ∈ secondRow.support := by
  rcases
      exists_goodOutsideSource_mem_secondApex_positiveClass R surface with
    ⟨rho, source, hrho, hfour, hsourceClass,
      hsourceGood, hcenterNe⟩
  rcases
      nonempty_exactFourPhysicalCommonDeletionIngress_of_source
        R hsourceGood hcenterNe with
    ⟨ingress, hsource⟩
  rcases
      exists_selectedFourClass_at_radius_mem
        hrho hsourceClass hfour with
    ⟨secondRow, hsecondRadius, hsourceSecond⟩
  let lateShell :=
    ((lateFirstApexSystem R).selectedAt
      source.1 source.2).toCriticalFourShell
  let lateRow := lateShell.toSelectedFourClass
  have hsourceLate : source.1 ∈ lateRow.support := by
    simpa [lateRow, lateShell, CriticalFourShell.toSelectedFourClass] using
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.q_mem_support
  exact ⟨rho, source, ingress, lateRow, secondRow,
    hrho, hsource, hsecondRadius, hcenterNe,
    hsourceLate, hsourceSecond⟩

/-- At cardinality at least twelve, the least robust exact-four cap profile
cannot persist. -/
theorem robust_capGrowth_of_card_ge_twelve
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (hcard : 12 ≤ D.A.card)
    (hsecondRobust : FullyDeletionRobustAt D S.oppApex2) :
    ExactFourRobustCapGrowth S := by
  have hopposite := oppositeCaps_card_ge_four D S
  have hfirst : 4 ≤ S.oppCap1.card := by
    simpa only [← capByIndex_oppIndex1_eq_oppCap1] using hopposite.1
  have hsecond : 5 ≤ S.oppCap2.card :=
    second_oppCap_card_ge_five hsecondRobust
  have hsurplusRaw := S.surplus_card_gt_four
  have hsurplus : 5 ≤ S.surplusCap.card := by
    omega
  by_cases hsurplusSix : 6 ≤ S.surplusCap.card
  · exact .surplus hsurplusSix
  by_cases hfirstFive : 5 ≤ S.oppCap1.card
  · exact .firstOpposite {
      surplusCap_card_eq_five := by omega
      firstOppCap_card_ge_five := hfirstFive
      oppositeCaps_card_add_two_eq_carrier := by
        have hsum := S.capSum
        omega }
  by_cases hsecondSix : 6 ≤ S.oppCap2.card
  · exact .secondOpposite {
      surplusCap_card_eq_five := by omega
      firstOppCap_card_eq_four := by omega
      secondOppCap_card_ge_six := hsecondSix
      secondOppCap_card_add_six_eq_carrier := by
        have hsum := S.capSum
        omega }
  have hsum := S.capSum
  exfalso
  omega

/-- Refine the robust constructor of the exact-four physical consumer to the
radius-level and cap-growth surfaces needed by a terminal. -/
theorem nonempty_postCardElevenRobustSurface_of_robust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (hcard : 12 ≤ D.A.card)
    (ingress : ExactFourPhysicalCommonDeletionIngress R)
    (hsecondRobust : FullyDeletionRobustAt D S.oppApex2) :
    Nonempty (ExactFourPostCardElevenRobustSurface R) := by
  have hopposite := oppositeCaps_card_ge_four D S
  exact ⟨{
    ingress := ingress
    secondApex_robust := hsecondRobust
    firstOppCap_card_ge_four := by
      simpa only [← capByIndex_oppIndex1_eq_oppCap1] using hopposite.1
    secondOppCap_card_ge_five :=
      second_oppCap_card_ge_five hsecondRobust
    radiusClassification :=
      fullyDeletionRobustAt_radiusClassification
        (oppApex2_mem_A S) hsecondRobust
    capGrowth := robust_capGrowth_of_card_ge_twelve hcard hsecondRobust }⟩

end ATailExactFourRobustCapExpansion
end Problem97
