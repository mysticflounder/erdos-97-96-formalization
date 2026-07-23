/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ExactFourSurvivalCover
import BiapexContinuationGrid

/-!
# Coupling the original and swapped exact-four frontiers

The swapped output of the exact-four physical-second-apex consumer is not
treated as a fresh copy of the original obligation.  This file keeps the
original exact-four residual and the common-deletion ingress, and proves the
complete two-apex exact-class coupling that follows:

* the selected physical-second-apex row in the ingress is exactly the
  swapped first-apex ambient class;
* the original retained pair avoids that swapped exact class; and
* the swapped retained pair avoids the original exact class.

The resulting two exact four-classes have at most two common points.  This is
the strongest source-level coupling currently derivable before a genuinely
global occurrence or cap-order terminal.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourSwappedTerminalScratch

open ATailCriticalPairFrontier
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch
open ATailUniqueFourSourceCloserScratch
open BiapexContinuationGridScratch

attribute [local instance] Classical.propDecidable

private noncomputable def withPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    CounterexampleData := {
  A := D.A
  nonempty := D.nonempty
  convex := D.convex
  K4 := D.K4
  packet := S }

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

/-- If a center has one unique K4 radius and that complete class has exactly
four points, survival after deleting a point forces that point outside the
class. -/
theorem not_mem_uniqueExactFourClass_of_erase_survives
    {A : Finset ℝ²} {center x : ℝ²} {radius : ℝ}
    (hcard : (SelectedClass A center radius).card = 4)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass A center rho).card → rho = radius)
    (hsurvives : HasNEquidistantPointsAt 4 (A.erase x) center) :
    x ∉ SelectedClass A center radius := by
  intro hx
  rcases hsurvives with ⟨rho, hrho, hfour⟩
  have hfourErase :
      4 ≤ (SelectedClass (A.erase x) center rho).card := by
    simpa [SelectedClass] using hfour
  rw [selectedClass_erase_eq] at hfourErase
  have hfourAmbient :
      4 ≤ (SelectedClass A center rho).card :=
    hfourErase.trans (Finset.card_le_card (Finset.erase_subset _ _))
  have hrhoEq := hunique rho hrho hfourAmbient
  subst rho
  rw [Finset.card_erase_of_mem hx, hcard] at hfourErase
  omega

/-- The original complete first-apex exact class. -/
noncomputable def originalFirstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    SelectedFourClass D.A S.oppApex1 :=
  SelectedFourClass.ofSelectedClass (frontier_radius_pos F)
    R.class_card_eq_four

/-- The swapped exact class, expressed at the physical second apex of the
original packet. -/
noncomputable def swappedPhysicalSecondClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (X : SwappedFirstApexUniqueFourFrontier D S H) :
    SelectedFourClass D.A S.oppApex2 :=
  SelectedFourClass.ofSelectedClass X.radius_pos (by
    simpa only [X.firstApex_eq] using X.firstClass_card_eq_four)

@[simp] theorem originalFirstClass_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    (originalFirstClass R).support =
      SelectedClass D.A S.oppApex1 radius := rfl

@[simp] theorem swappedPhysicalSecondClass_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (X : SwappedFirstApexUniqueFourFrontier D S H) :
    (swappedPhysicalSecondClass X).support =
      SelectedClass D.A S.oppApex2 X.radius := rfl

/-- The original exact class has two points in the strict first opposite-cap
part used by the continuation bank. -/
theorem originalFirstClass_strictOppCap1_card_ge_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) :
    2 ≤ ((originalFirstClass R).support ∩
      (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))).card := by
  let K : SelectedFourClass (withPacket D S).A
      (withPacket D S).packet.oppApex1 :=
    originalFirstClass (D := D) (S := S) (F := F) R
  simpa [withPacket] using
    firstApex_support_strictInterior_card_ge_two
      (withPacket D S) K

/-- The swapped exact class has two points in the strict second
opposite-cap part used by the continuation bank. -/
theorem swappedPhysicalSecondClass_strictOppCap2_card_ge_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (X : SwappedFirstApexUniqueFourFrontier D S H) :
    2 ≤ ((swappedPhysicalSecondClass X).support ∩
      (S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))).card := by
  let K : SelectedFourClass (withPacket D S).A
      (withPacket D S).packet.oppApex2 :=
    swappedPhysicalSecondClass (D := D) (S := S) (H := H) X
  simpa [withPacket] using
    secondApex_support_strictInterior_card_ge_two
      (withPacket D S) K

/-- The selected physical-second-apex row in the retained ingress is the
whole swapped exact four-class, not merely an unrelated selected subset. -/
theorem ingress_secondRow_eq_swappedPhysicalSecondClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (ingress : ExactFourPhysicalCommonDeletionIngress R)
    (X : SwappedFirstApexUniqueFourFrontier D S (lateFirstApexSystem R)) :
    ingress.packet.B₂ = (swappedPhysicalSecondClass X).support := by
  let K : SelectedFourClass D.A S.oppApex2 :=
    secondRowSelectedFourClass ingress.packet
  have hsubset :
      K.support ⊆ SelectedClass D.A S.oppApex2 K.radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨K.support_subset_A hz, K.support_eq_radius z hz⟩
  have hfour :
      4 ≤ (SelectedClass D.A S.oppApex2 K.radius).card := by
    simpa [K.support_card] using Finset.card_le_card hsubset
  have hradius : K.radius = X.radius := by
    exact X.firstClass_unique_radius K.radius K.radius_pos (by
      simpa only [X.firstApex_eq] using hfour)
  have hsubset' :
      K.support ⊆ (swappedPhysicalSecondClass X).support := by
    simpa [hradius] using hsubset
  apply Finset.eq_of_subset_of_card_le hsubset'
  rw [K.support_card, (swappedPhysicalSecondClass X).support_card]

/-- The original retained pair is disjoint from the swapped exact class.
This uses the original frontier's double-deletion survival at the physical
second apex and the swapped class's uniqueness. -/
theorem originalPair_not_mem_swappedPhysicalSecondClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (_ingress : ExactFourPhysicalCommonDeletionIngress R)
    (X : SwappedFirstApexUniqueFourFrontier D S (lateFirstApexSystem R)) :
    F.pair.q ∉ (swappedPhysicalSecondClass X).support ∧
      F.pair.w ∉ (swappedPhysicalSecondClass X).support := by
  have hqSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.q) S.oppApex2 :=
    equidistant_mono (Finset.erase_subset _ _) F.secondApexDouble
  have hdoubleSym :
      HasNEquidistantPointsAt 4
        ((D.A.erase F.pair.w).erase F.pair.q) S.oppApex2 := by
    simpa [Finset.erase_right_comm] using F.secondApexDouble
  have hwSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase F.pair.w) S.oppApex2 :=
    equidistant_mono (Finset.erase_subset _ _) hdoubleSym
  constructor
  · exact not_mem_uniqueExactFourClass_of_erase_survives
      (by
        simpa only [X.firstApex_eq] using X.firstClass_card_eq_four)
      (fun rho hrho hfour ↦ X.firstClass_unique_radius rho hrho (by
        simpa only [X.firstApex_eq] using hfour))
      hqSurvives
  · exact not_mem_uniqueExactFourClass_of_erase_survives
      (by
        simpa only [X.firstApex_eq] using X.firstClass_card_eq_four)
      (fun rho hrho hfour ↦ X.firstClass_unique_radius rho hrho (by
        simpa only [X.firstApex_eq] using hfour))
      hwSurvives

/-- The swapped retained pair is disjoint from the original exact class.
This is the reciprocal use of the swapped frontier's double-deletion
survival at the old first apex. -/
theorem swappedPair_not_mem_originalFirstClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (_ingress : ExactFourPhysicalCommonDeletionIngress R)
    (X : SwappedFirstApexUniqueFourFrontier D S (lateFirstApexSystem R)) :
    X.frontier.pair.q ∉ (originalFirstClass R).support ∧
      X.frontier.pair.w ∉ (originalFirstClass R).support := by
  have hdouble :
      HasNEquidistantPointsAt 4
        ((D.A.erase X.frontier.pair.q).erase X.frontier.pair.w)
          S.oppApex1 := by
    simpa only [X.secondApex_eq] using X.frontier.secondApexDouble
  have hqSurvives :
      HasNEquidistantPointsAt 4
        (D.A.erase X.frontier.pair.q) S.oppApex1 :=
    equidistant_mono (Finset.erase_subset _ _) hdouble
  have hdoubleSym :
      HasNEquidistantPointsAt 4
        ((D.A.erase X.frontier.pair.w).erase X.frontier.pair.q)
          S.oppApex1 := by
    simpa [Finset.erase_right_comm] using hdouble
  have hwSurvives :
      HasNEquidistantPointsAt 4
        (D.A.erase X.frontier.pair.w) S.oppApex1 :=
    equidistant_mono (Finset.erase_subset _ _) hdoubleSym
  constructor
  · exact not_mem_uniqueExactFourClass_of_erase_survives
      R.class_card_eq_four R.unique_K4_radius hqSurvives
  · exact not_mem_uniqueExactFourClass_of_erase_survives
      R.class_card_eq_four R.unique_K4_radius hwSurvives

/-- The two retained frontier pairs are disjoint as point sets.  Each pair
lies in its own exact apex class, while the reciprocal double-deletion facts
put it outside the other class. -/
theorem originalPair_disjoint_swappedPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (ingress : ExactFourPhysicalCommonDeletionIngress R)
    (X : SwappedFirstApexUniqueFourFrontier D S (lateFirstApexSystem R)) :
    Disjoint ({F.pair.q, F.pair.w} : Finset ℝ²)
      ({X.frontier.pair.q, X.frontier.pair.w} : Finset ℝ²) := by
  have horiginalAvoids :=
    originalPair_not_mem_swappedPhysicalSecondClass ingress X
  have hswappedQ :
      X.frontier.pair.q ∈ (swappedPhysicalSecondClass X).support := by
    simpa only [swappedPhysicalSecondClass_support, X.firstApex_eq] using
      frontier_pair_q_mem_firstApexClass X.frontier
  have hswappedW :
      X.frontier.pair.w ∈ (swappedPhysicalSecondClass X).support := by
    simpa only [swappedPhysicalSecondClass_support, X.firstApex_eq] using
      frontier_pair_w_mem_firstApexClass X.frontier
  rw [Finset.disjoint_left]
  intro z hzOriginal hzSwapped
  simp only [Finset.mem_insert, Finset.mem_singleton] at hzOriginal hzSwapped
  rcases hzOriginal with rfl | rfl
  · rcases hzSwapped with hq | hw
    · exact horiginalAvoids.1 (hq ▸ hswappedQ)
    · exact horiginalAvoids.1 (hw ▸ hswappedW)
  · rcases hzSwapped with hq | hw
    · exact horiginalAvoids.2 (hq ▸ hswappedQ)
    · exact horiginalAvoids.2 (hw ▸ hswappedW)

/-- The original and swapped retained pairs therefore contribute four
distinct carrier points. -/
theorem originalPair_union_swappedPair_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (ingress : ExactFourPhysicalCommonDeletionIngress R)
    (X : SwappedFirstApexUniqueFourFrontier D S (lateFirstApexSystem R)) :
    (({F.pair.q, F.pair.w} : Finset ℝ²) ∪
      {X.frontier.pair.q, X.frontier.pair.w}).card = 4 := by
  rw [Finset.card_union_of_disjoint
    (originalPair_disjoint_swappedPair R ingress X)]
  simp [F.pair.q_ne_w, X.frontier.pair.q_ne_w]

/-- The ingress's fresh row center is different from the original exact
first apex.  This consumes the late-system provenance: the deleted point is
one of the original exact-class pair, hence its actual late blocker is the
first apex, while the common-deletion packet excludes that blocker as its
first row center. -/
theorem ingressCenter_ne_firstApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (ingress : ExactFourPhysicalCommonDeletionIngress R) :
    (lateFirstApexSystem R).centerAt ingress.source.1 ingress.source.2 ≠
      S.oppApex1 := by
  have hdeletedClass :
      ingress.deleted ∈ SelectedClass D.A S.oppApex1 radius := by
    rcases ingress.deleted_is_pair with hq | hw
    · simpa only [hq] using frontier_pair_q_mem_firstApexClass F
    · simpa only [hw] using frontier_pair_w_mem_firstApexClass F
  have hdeletedCenter :
      (lateFirstApexSystem R).centerAt ingress.deleted
          ingress.packet.q_mem_A = S.oppApex1 :=
    lateFirstApexSystem_centerAt_eq R ingress.packet.q_mem_A hdeletedClass
  intro hcenter
  exact ingress.packet.actual_blocker_ne_center₁
    (hdeletedCenter.trans hcenter.symm)

private theorem physical_apices_ne
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

/-- The full source-proved coupling retained on the swapped constructor.
No cyclic occurrence or terminal contradiction is included. -/
structure CoupledSwappedExactFourSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F) : Type where
  ingress : ExactFourPhysicalCommonDeletionIngress R
  swapped :
    SwappedFirstApexUniqueFourFrontier D S (lateFirstApexSystem R)
  ingress_secondRow_eq :
    ingress.packet.B₂ = (swappedPhysicalSecondClass swapped).support
  originalPair_avoids_swapped :
    F.pair.q ∉ (swappedPhysicalSecondClass swapped).support ∧
      F.pair.w ∉ (swappedPhysicalSecondClass swapped).support
  swappedPair_avoids_original :
    swapped.frontier.pair.q ∉ (originalFirstClass R).support ∧
      swapped.frontier.pair.w ∉ (originalFirstClass R).support
  retainedPairs_disjoint :
    Disjoint ({F.pair.q, F.pair.w} : Finset ℝ²)
      ({swapped.frontier.pair.q, swapped.frontier.pair.w} : Finset ℝ²)
  ingressCenter_ne_firstApex :
    (lateFirstApexSystem R).centerAt ingress.source.1 ingress.source.2 ≠
      S.oppApex1
  ingressCenter_ne_secondApex :
    (lateFirstApexSystem R).centerAt ingress.source.1 ingress.source.2 ≠
      S.oppApex2
  originalClass_strictOppCap1_card_ge_two :
    2 ≤ ((originalFirstClass R).support ∩
      (S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))).card
  swappedClass_strictOppCap2_card_ge_two :
    2 ≤ ((swappedPhysicalSecondClass swapped).support ∩
      (S.oppCap2 \ (S.surplusCap ∪ S.oppCap1))).card
  class_inter_card_le_two :
    ((originalFirstClass R).support ∩
      (swappedPhysicalSecondClass swapped).support).card ≤ 2

/-- Extract the complete two-apex exact-four coupling from the swapped
consumer arm while retaining the original residual and ingress. -/
theorem nonempty_coupledSwappedExactFourSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (ingress : ExactFourPhysicalCommonDeletionIngress R)
    (X : SwappedFirstApexUniqueFourFrontier D S (lateFirstApexSystem R)) :
    Nonempty (CoupledSwappedExactFourSurface R) := by
  exact ⟨{
    ingress := ingress
    swapped := X
    ingress_secondRow_eq :=
      ingress_secondRow_eq_swappedPhysicalSecondClass ingress X
    originalPair_avoids_swapped :=
      originalPair_not_mem_swappedPhysicalSecondClass ingress X
    swappedPair_avoids_original :=
      swappedPair_not_mem_originalFirstClass R ingress X
    retainedPairs_disjoint :=
      originalPair_disjoint_swappedPair R ingress X
    ingressCenter_ne_firstApex :=
      ingressCenter_ne_firstApex ingress
    ingressCenter_ne_secondApex :=
      ingress.blocker_ne_secondApex
    originalClass_strictOppCap1_card_ge_two :=
      originalFirstClass_strictOppCap1_card_ge_two R
    swappedClass_strictOppCap2_card_ge_two :=
      swappedPhysicalSecondClass_strictOppCap2_card_ge_two X
    class_inter_card_le_two :=
      SelectedFourClass.inter_card_le_two
        (originalFirstClass R) (swappedPhysicalSecondClass X)
        (physical_apices_ne S) }⟩

#print axioms not_mem_uniqueExactFourClass_of_erase_survives
#print axioms ingress_secondRow_eq_swappedPhysicalSecondClass
#print axioms originalFirstClass_strictOppCap1_card_ge_two
#print axioms swappedPhysicalSecondClass_strictOppCap2_card_ge_two
#print axioms originalPair_not_mem_swappedPhysicalSecondClass
#print axioms swappedPair_not_mem_originalFirstClass
#print axioms originalPair_disjoint_swappedPair
#print axioms originalPair_union_swappedPair_card
#print axioms ingressCenter_ne_firstApex
#print axioms nonempty_coupledSwappedExactFourSurface

end ATailUniqueFourSwappedTerminalScratch
end Problem97
