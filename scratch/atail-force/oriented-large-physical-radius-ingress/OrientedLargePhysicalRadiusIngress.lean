/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# Oriented large-physical-radius ingress audit

This scratch module classifies the exact gap between the current U1 large-cap
leaf and the production robust-large-radius parent.  The classification is
exhaustive and keeps the complements needed by the already-checked protected
unique-radius adapters explicit.

The only remaining radius-level complement is a deletion-robust physical
second apex with two distinct, support-disjoint exact four-point radius
classes.  No contradiction is asserted for that residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailOrientedLargePhysicalRadiusIngressScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
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

/-- Exact input expected by the checked protected original-first-apex
small-cap adapter. -/
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

/-- Exact cap input expected by the checked fixed-surplus swap to a protected
first-apex unique-four/five frontier. -/
structure PhysicalSecondCapSmallResidual
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Prop where
  second_cap_small :
    (S.capByIndex S.oppIndex2).card = 4 ∨
      (S.capByIndex S.oppIndex2).card = 5

/-- Exact prescribed-deletion input expected by the checked swap to a
protected first-apex unique-four frontier. -/
structure PhysicalSecondApexCriticalResidual
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Type where
  source : ℝ²
  source_mem_A : source ∈ D.A
  shell : CriticalSelectedFourClass D.A source S.oppApex2
  deletion_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex2

/-- The actual production ingress fields: the physical second cap has at
least six points and one positive physical-apex radius class has at least
five points. -/
structure LargePhysicalSecondApexRadiusIngress
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : Type where
  first_cap_card_ge_six : 6 ≤ S.oppCap1.card
  second_cap_card_ge_six : 6 ≤ S.oppCap2.card
  carrier_card_ge_fourteen : 14 ≤ D.A.card
  radius : ℝ
  radius_pos : 0 < radius
  radius_class_card_ge_five :
    5 ≤ (SelectedClass D.A S.oppApex2 radius).card

/-- The sole radius-level complement to the large-radius ingress.  Both
ambient classes are exactly four, their radii differ, their selected
four-point supports are disjoint, and the physical second apex is robust
under every single deletion. -/
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

/-- Exhaustive parent-ingress classification.  The first three constructors
are exact inputs to checked protected unique-radius adapters.  The fourth is
the production robust-large-radius ingress.  The last is the only unresolved
complement. -/
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

/-- Full parent context that must be retained on the two-exact-four-radii
complement.  This prevents the next consumer from dropping global minimality,
the common critical map, no-`IsM44`, or the first-apex frontier. -/
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

/-- Parent-facing version of the exhaustive split.  The large-radius
constructor is already the exact production parent surface; only the final
coupled two-four-radii constructor lacks a terminal producer. -/
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
the exact prescribed critical shell consumed by the protected swap adapter. -/
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

/-- Full deletion robustness at the physical second apex gives either the
required five-point radius class or two distinct exact-four classes.  Unlike
the earlier coarse classification, this theorem also checks whether the
second exposed radius has cardinality at least five before retaining the
two-radius residual. -/
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

/-- Add the actual parent fields to the metric classification.  This theorem
identifies the exact final ingress gap without assuming any protected branch
is false. -/
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

/-- Specialization to the exact packet and hypotheses of
`u1_largeCap_routeB_tail_false`.  Global minimality, no-`IsM44`, and the
non-exact opposite-pair hypothesis are deliberately not needed to obtain the
classification; they remain available to the eventual branch consumers. -/
theorem nonempty_currentU1Leaf_physicalApexIngressOutcome
    {D : CounterexampleData}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card)
    (hcritical : Nonempty (CriticalShellSystem D.A)) :
    ∃ H : CriticalShellSystem D.A,
      U1LeafPhysicalApexIngressOutcome D
        (U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
          MT hCirc CP i hM hsurplus) H := by
  rcases hcritical with ⟨H⟩
  exact ⟨H, classify_physicalApexIngress D
    (U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
      MT hCirc CP i hM hsurplus) H⟩

/-- Exact specialization of the parent-facing classification to the current
U1 leaf signature. -/
theorem currentU1Leaf_largeRadiusParentOutcome
    {D : CounterexampleData}
    (hmin : D.Minimal)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i : Fin 3)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hsurplus : 4 < (CP.capAt i).card) :
    ∃ H : CriticalShellSystem D.A,
      U1LeafLargeRadiusParentOutcome D
        (U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
          MT hCirc CP i hM hsurplus) H := by
  rcases hcritical with ⟨H⟩
  exact ⟨H, classify_largeRadiusParent D
    (U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket
      MT hCirc CP i hM hsurplus) H hmin hNoM44⟩

#print axioms oppositeCaps_card_ge_four
#print axioms carrier_card_ge_fourteen_of_both_opposite_caps_ge_six
#print axioms nonempty_physicalSecondApexCriticalResidual_of_not_robust
#print axioms largePhysicalRadius_or_exactTwoFourRadii_of_robust
#print axioms classify_physicalApexIngress
#print axioms classify_largeRadiusParent
#print axioms nonempty_currentU1Leaf_physicalApexIngressOutcome
#print axioms currentU1Leaf_largeRadiusParentOutcome

end

end ATailOrientedLargePhysicalRadiusIngressScratch
end Problem97
