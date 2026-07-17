/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1OppositeCapLowerBounds
import Erdos9796Proof.P97.ATail.DeletionRobustness
import Erdos9796Proof.P97.ATail.RobustLargeRadius

/-!
# Oriented physical-apex ingress

This module classifies the exact gap between a live surplus packet and the
robust large-physical-radius parent. Small-cap and prescribed-critical cases
are retained as the exact inputs to the protected unique-radius adapters. The
only remaining radius-level complement is a deletion-robust physical second
apex with two distinct support-disjoint exact four-point radius classes.

No contradiction is asserted for any residual in this module.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailOrientedPhysicalApexIngress

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailRobustLargeRadius

attribute [local instance] Classical.propDecidable

noncomputable section

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

private theorem equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hAB : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨r, hr, hcard⟩
  exact ⟨r, hr, le_trans hcard (Finset.card_le_card (by
    intro z hz
    rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
    exact Finset.mem_filter.mpr ⟨hAB hzA, hzdist⟩))⟩

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- Both closed caps opposite the chosen surplus cap have at least four
points on the live MEC/convex/K4 surface. -/
theorem oppositeCaps_card_ge_four
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    4 ≤ (S.capByIndex S.oppIndex1).card ∧
      4 ≤ (S.capByIndex S.oppIndex2).card := by
  have hlower :
      4 ≤ S.partition.C1.card ∧
        4 ≤ S.partition.C2.card ∧
          4 ≤ S.partition.C3.card :=
    U1OppositeCapLowerBounds.capTriple_caps_card_ge_four
      S.partition D.convex S.hncol D.K4
        (CircumscribedMECPacket.ofNonObtuse S.triangleNonObtuse S.hCirc)
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.capByIndex, hi] using ⟨hlower.2.1, hlower.2.2⟩
  · simpa [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.capByIndex, hi] using ⟨hlower.2.2, hlower.1⟩
  · simpa [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.capByIndex, hi] using ⟨hlower.1, hlower.2.1⟩

/-- If both non-surplus closed caps have at least six points, the carrier has
at least fourteen points. -/
theorem carrier_card_ge_fourteen_of_both_opposite_caps_ge_six
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (hfirst : 6 ≤ S.oppCap1.card)
    (hsecond : 6 ≤ S.oppCap2.card) :
    14 ≤ D.A.card := by
  have hsum := S.capSum
  have hsurplus := S.surplus_card_gt_four
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hi] at hsum hsurplus hfirst hsecond <;>
    omega

/-- Exact input expected by the protected original-first-apex small-cap
adapter. -/
structure OriginalFirstApexSmallCapResidual
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Type where
  radius : ℝ
  radius_pos : 0 < radius
  radius_class_card_ge_four :
    4 ≤ (SelectedClass D.A S.oppApex1 radius).card
  frontier : CriticalPairFrontier D S radius H
  first_cap_small :
    (S.capByIndex S.oppIndex1).card = 4 ∨
      (S.capByIndex S.oppIndex1).card = 5

/-- Exact cap input expected by the fixed-surplus swap to a protected
first-apex unique-four/five frontier. -/
structure PhysicalSecondCapSmallResidual
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Prop where
  second_cap_small :
    (S.capByIndex S.oppIndex2).card = 4 ∨
      (S.capByIndex S.oppIndex2).card = 5

/-- Exact prescribed-deletion input expected by the swap to a protected
first-apex unique-four frontier. -/
structure PhysicalSecondApexCriticalResidual
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Type where
  source : ℝ²
  source_mem_A : source ∈ D.A
  shell : CriticalSelectedFourClass D.A source S.oppApex2
  deletion_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex2

/-- The actual robust-large-radius ingress fields. -/
structure LargePhysicalSecondApexRadiusIngress
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Type where
  first_cap_card_ge_six : 6 ≤ S.oppCap1.card
  second_cap_card_ge_six : 6 ≤ S.oppCap2.card
  carrier_card_ge_fourteen : 14 ≤ D.A.card
  radius : ℝ
  radius_pos : 0 < radius
  radius_class_card_ge_five :
    5 ≤ (SelectedClass D.A S.oppApex2 radius).card

/-- The sole radius-level complement to large-radius ingress. -/
structure PhysicalSecondApexExactTwoFourRadiusResidual
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Type where
  first_cap_card_ge_six : 6 ≤ S.oppCap1.card
  second_cap_card_ge_six : 6 ≤ S.oppCap2.card
  carrier_card_ge_fourteen : 14 ≤ D.A.card
  robust : FullyDeletionRobustAt D S.oppApex2
  radius : ℝ
  otherRadius : ℝ
  radius_pos : 0 < radius
  otherRadius_pos : 0 < otherRadius
  radii_ne : otherRadius ≠ radius
  first_class_card_eq_four :
    (SelectedClass D.A S.oppApex2 radius).card = 4
  second_class_card_eq_four :
    (SelectedClass D.A S.oppApex2 otherRadius).card = 4
  firstRow : SelectedFourClass D.A S.oppApex2
  secondRow : SelectedFourClass D.A S.oppApex2
  firstRow_radius : firstRow.radius = radius
  secondRow_radius : secondRow.radius = otherRadius
  supports_disjoint : Disjoint firstRow.support secondRow.support

/-- Exhaustive physical-apex ingress classification. -/
inductive U1LeafPhysicalApexIngressOutcome
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Prop
  | originalFirstSmall
      (residual : OriginalFirstApexSmallCapResidual D S H)
  | physicalSecondSmall
      (residual : PhysicalSecondCapSmallResidual D S)
  | physicalSecondCritical
      (residual : PhysicalSecondApexCriticalResidual D S)
  | largePhysicalRadius
      (ingress : LargePhysicalSecondApexRadiusIngress D S)
  | exactTwoFourRadii
      (residual : PhysicalSecondApexExactTwoFourRadiusResidual D S)

/-- Full parent context retained on the two-exact-four-radii complement. -/
structure FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Type where
  minimal : D.Minimal
  noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
  physical : PhysicalSecondApexExactTwoFourRadiusResidual D S
  frontierRadius : ℝ
  frontierRadius_pos : 0 < frontierRadius
  frontierRadius_class_card_ge_four :
    4 ≤ (SelectedClass D.A S.oppApex1 frontierRadius).card
  frontier : CriticalPairFrontier D S frontierRadius H

/-- The protected original first-apex unique-radius arm. -/
def OriginalFrontierUniqueRadiusArm
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (_F : CriticalPairFrontier D S radius H) : Prop :=
  ((SelectedClass D.A S.oppApex1 radius).card = 4 ∨
      (SelectedClass D.A S.oppApex1 radius).card = 5) ∧
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius

/-- The source-faithful common-deletion sibling of a first-apex frontier.
The deleted point is the frontier's actual first source and the two centers
are the two prescribed opposite Moser apices. The originating first-apex
double-deletion witness is retained as proof data. -/
structure FrontierCommonDeletionResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) : Type where
  firstApexDouble :
    HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1
  packet : CommonDeletionTwoCenterPacket
    D H F.pair.q S.oppApex1 S.oppApex2

/-- Parent-facing common-deletion residual. The global minimality and
no-`IsM44` hypotheses are retained rather than reconstructed downstream. -/
structure FrontierCommonDeletionParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) : Type where
  minimal : D.Minimal
  noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44
  carrier_card_gt_nine : 9 < D.A.card
  common : FrontierCommonDeletionResidual F

/-- Every first-apex frontier is already either a protected unique-radius arm
or a source-faithful common deletion at the two opposite Moser apices. -/
theorem CriticalPairFrontier.originalUnique_or_commonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    OriginalFrontierUniqueRadiusArm F ∨
      Nonempty (FrontierCommonDeletionResidual F) := by
  rcases F.firstApexSplit with hdouble | hunique
  · have hfirst :
        HasNEquidistantPointsAt 4
          (D.A.erase F.pair.q) S.oppApex1 :=
      equidistant_mono (Finset.erase_subset _ _) hdouble
    have hsecond :
        HasNEquidistantPointsAt 4
          (D.A.erase F.pair.q) S.oppApex2 :=
      equidistant_mono (Finset.erase_subset _ _) F.secondApexDouble
    rcases nonempty_commonDeletionTwoCenterPacket H
        F.pair.q_mem_A (oppApex1_mem_A S) (oppApex2_mem_A S)
        (oppApex1_ne_oppApex2 S) hfirst hsecond with ⟨packet⟩
    exact Or.inr ⟨⟨hdouble, packet⟩⟩
  · exact Or.inl hunique

/-- Parent-facing direct split, retaining minimality, the carrier lower bound,
and no-`IsM44` on the common-deletion branch. -/
theorem CriticalPairFrontier.originalUnique_or_commonDeletionParent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card) :
    OriginalFrontierUniqueRadiusArm F ∨
      Nonempty (FrontierCommonDeletionParentResidual F) := by
  rcases CriticalPairFrontier.originalUnique_or_commonDeletion F with
    hunique | hcommon
  · exact Or.inl hunique
  · exact Or.inr ⟨{
      minimal := hmin
      noM44 := hNoM44
      carrier_card_gt_nine := hcard
      common := hcommon.some }⟩

/-- Direct frontier assembler. Once the protected unique arm and the full
source-faithful common-deletion parent residual have consumers, no physical
radius ingress or LIVE row split is needed. -/
theorem CriticalPairFrontier.false_of_parentResidualConsumers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (uniqueFalse : OriginalFrontierUniqueRadiusArm F → False)
    (commonFalse : FrontierCommonDeletionParentResidual F → False) :
    False := by
  rcases
      CriticalPairFrontier.originalUnique_or_commonDeletionParent
        F hmin hNoM44 hcard with
    hunique | hcommon
  · exact uniqueFalse hunique
  · exact commonFalse hcommon.some

/-- Parent-facing exhaustive split. The final coupled two-four-radii
constructor is the only ingress outcome without a checked downstream route. -/
inductive U1LeafLargeRadiusParentOutcome
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Prop
  | originalFirstSmall
      (residual : OriginalFirstApexSmallCapResidual D S H)
  | physicalSecondSmall
      (residual : PhysicalSecondCapSmallResidual D S)
  | physicalSecondCritical
      (residual : PhysicalSecondApexCriticalResidual D S)
  | largePhysicalRadius
      (parent : RobustLargeRadiusParentSurface D S)
  | exactTwoFourRadii
      (residual :
        FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual D S H)

/-- A critical deletion at the physical second apex can be strengthened to
the exact prescribed critical shell consumed by the swap adapter. -/
theorem nonempty_physicalSecondApexCriticalResidual_of_not_robust
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (hnotRobust : ¬ FullyDeletionRobustAt D S.oppApex2) :
    Nonempty (PhysicalSecondApexCriticalResidual D S) := by
  rcases
      hasCriticalDeletionAt_iff_not_fullyDeletionRobustAt.mpr hnotRobust with
    ⟨source, hsourceA, hblocked⟩
  rcases erase_survives_or_criticalSelectedFourClass_at
      (q := source) D.K4 (oppApex2_mem_A S) with
    hsurvives | ⟨shell, hblocked'⟩
  · exact False.elim (hblocked hsurvives)
  · exact ⟨{
      source := source
      source_mem_A := hsourceA
      shell := shell
      deletion_blocked := hblocked' }⟩

/-- Full deletion robustness at the physical second apex gives either a
five-point radius class or two distinct exact-four classes. -/
theorem largePhysicalRadius_or_exactTwoFourRadii_of_robust
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (hfirstCap : 6 ≤ S.oppCap1.card)
    (hsecondCap : 6 ≤ S.oppCap2.card)
    (R : FullyDeletionRobustAt D S.oppApex2) :
    Nonempty (LargePhysicalSecondApexRadiusIngress D S) ∨
      Nonempty (PhysicalSecondApexExactTwoFourRadiusResidual D S) := by
  obtain ⟨radius, hradius, hfour⟩ :=
    exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      (D.K4 S.oppApex2 (oppApex2_mem_A S))
  by_cases hfive :
      5 ≤ (SelectedClass D.A S.oppApex2 radius).card
  · exact Or.inl ⟨{
      first_cap_card_ge_six := hfirstCap
      second_cap_card_ge_six := hsecondCap
      carrier_card_ge_fourteen :=
        carrier_card_ge_fourteen_of_both_opposite_caps_ge_six
          D S hfirstCap hsecondCap
      radius := radius
      radius_pos := hradius
      radius_class_card_ge_five := hfive }⟩
  · have hcard :
        (SelectedClass D.A S.oppApex2 radius).card = 4 := by
      omega
    have hnonempty :
        (SelectedClass D.A S.oppApex2 radius).Nonempty :=
      Finset.card_pos.mp (by omega)
    rcases hnonempty with ⟨source, hsourceClass⟩
    have hsourceA : source ∈ D.A :=
      (mem_selectedClass.mp hsourceClass).1
    obtain ⟨otherRadius, hotherRadius, hfourErase⟩ :=
      exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
        (R.survives source hsourceA)
    have hfourOther :
        4 ≤ (SelectedClass D.A S.oppApex2 otherRadius).card := by
      rw [selectedClass_erase_eq] at hfourErase
      exact hfourErase.trans
        (Finset.card_le_card (Finset.erase_subset _ _))
    by_cases hfiveOther :
        5 ≤ (SelectedClass D.A S.oppApex2 otherRadius).card
    · exact Or.inl ⟨{
        first_cap_card_ge_six := hfirstCap
        second_cap_card_ge_six := hsecondCap
        carrier_card_ge_fourteen :=
          carrier_card_ge_fourteen_of_both_opposite_caps_ge_six
            D S hfirstCap hsecondCap
        radius := otherRadius
        radius_pos := hotherRadius
        radius_class_card_ge_five := hfiveOther }⟩
    · have hcardOther :
          (SelectedClass D.A S.oppApex2 otherRadius).card = 4 := by
        omega
      have hradii : otherRadius ≠ radius := by
        intro hsame
        subst otherRadius
        rw [selectedClass_erase_eq,
          Finset.card_erase_of_mem hsourceClass, hcard] at hfourErase
        omega
      let firstRow : SelectedFourClass D.A S.oppApex2 :=
        SelectedFourClass.ofSelectedClass hradius hcard
      let secondRow : SelectedFourClass D.A S.oppApex2 :=
        SelectedFourClass.ofSelectedClass hotherRadius hcardOther
      have hfirstRadius : firstRow.radius = radius := rfl
      have hsecondRadius : secondRow.radius = otherRadius := rfl
      have hdisjoint : Disjoint firstRow.support secondRow.support := by
        rw [Finset.disjoint_left]
        intro x hxFirst hxSecond
        apply hradii
        calc
          otherRadius = secondRow.radius := hsecondRadius.symm
          _ = dist S.oppApex2 x :=
            (secondRow.support_eq_radius x hxSecond).symm
          _ = firstRow.radius := firstRow.support_eq_radius x hxFirst
          _ = radius := hfirstRadius
      exact Or.inr ⟨{
        first_cap_card_ge_six := hfirstCap
        second_cap_card_ge_six := hsecondCap
        carrier_card_ge_fourteen :=
          carrier_card_ge_fourteen_of_both_opposite_caps_ge_six
            D S hfirstCap hsecondCap
        robust := R
        radius := radius
        otherRadius := otherRadius
        radius_pos := hradius
        otherRadius_pos := hotherRadius
        radii_ne := hradii
        first_class_card_eq_four := hcard
        second_class_card_eq_four := hcardOther
        firstRow := firstRow
        secondRow := secondRow
        firstRow_radius := hfirstRadius
        secondRow_radius := hsecondRadius
        supports_disjoint := hdisjoint }⟩

/-- Complete classification for an arbitrary live surplus packet and one
concrete critical-shell system. -/
theorem classify_physicalApexIngress
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) :
    U1LeafPhysicalApexIngressOutcome D S H := by
  rcases oppositeCaps_card_ge_four D S with ⟨hfirstFour, hsecondFour⟩
  by_cases hfirstSix : 6 ≤ (S.capByIndex S.oppIndex1).card
  · by_cases hsecondSix : 6 ≤ (S.capByIndex S.oppIndex2).card
    · have hcap : 6 ≤ S.oppCap2.card := by
        simpa only [capByIndex_oppIndex2_eq_oppCap2] using hsecondSix
      have hfirstCap : 6 ≤ S.oppCap1.card := by
        simpa only [capByIndex_oppIndex1_eq_oppCap1] using hfirstSix
      by_cases hrobust : FullyDeletionRobustAt D S.oppApex2
      · rcases largePhysicalRadius_or_exactTwoFourRadii_of_robust
            hfirstCap hcap hrobust with hingress | hresidual
        · exact U1LeafPhysicalApexIngressOutcome.largePhysicalRadius
            hingress.some
        · exact U1LeafPhysicalApexIngressOutcome.exactTwoFourRadii
            hresidual.some
      · exact U1LeafPhysicalApexIngressOutcome.physicalSecondCritical
          (nonempty_physicalSecondApexCriticalResidual_of_not_robust
            hrobust).some
    · have hsmall :
          (S.capByIndex S.oppIndex2).card = 4 ∨
            (S.capByIndex S.oppIndex2).card = 5 := by
        omega
      exact U1LeafPhysicalApexIngressOutcome.physicalSecondSmall
        ⟨hsmall⟩
  · have hsmall :
        (S.capByIndex S.oppIndex1).card = 4 ∨
          (S.capByIndex S.oppIndex1).card = 5 := by
      omega
    obtain ⟨radius, hradius, hfour, ⟨frontier⟩⟩ :=
      exists_criticalPairFrontier_of_K4 D S H
    exact U1LeafPhysicalApexIngressOutcome.originalFirstSmall
      {
        radius := radius
        radius_pos := hradius
        radius_class_card_ge_four := hfour
        frontier := frontier
        first_cap_small := hsmall
      }

/-- Add the actual parent fields to the metric classification. -/
theorem classify_largeRadiusParent
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44) :
    U1LeafLargeRadiusParentOutcome D S H := by
  rcases classify_physicalApexIngress D S H with
    hfirst | hsecond | hcritical | hingress | hexact
  · exact U1LeafLargeRadiusParentOutcome.originalFirstSmall hfirst
  · exact U1LeafLargeRadiusParentOutcome.physicalSecondSmall hsecond
  · exact U1LeafLargeRadiusParentOutcome.physicalSecondCritical hcritical
  · exact U1LeafLargeRadiusParentOutcome.largePhysicalRadius {
      minimal := hmin
      noM44 := hNoM44
      oppCap2_card_ge_six := hingress.second_cap_card_ge_six
      radius := hingress.radius
      radius_pos := hingress.radius_pos
      radius_class_card_ge_five := hingress.radius_class_card_ge_five }
  · obtain ⟨frontierRadius, hradius, hfour, ⟨frontier⟩⟩ :=
      exists_criticalPairFrontier_of_K4 D S H
    exact U1LeafLargeRadiusParentOutcome.exactTwoFourRadii {
      minimal := hmin
      noM44 := hNoM44
      physical := hexact
      frontierRadius := frontierRadius
      frontierRadius_pos := hradius
      frontierRadius_class_card_ge_four := hfour
      frontier := frontier }

end

end ATailOrientedPhysicalApexIngress
end Problem97
