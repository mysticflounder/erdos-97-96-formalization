/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CapFiveApexRigidity
import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Small-cap reduction of the ATAIL critical-pair frontier

This scratch module records exactly what the cap-four/five apex-radius
rigidity lemmas consume from `CriticalPairFrontier`.

The production frontier currently forgets that the first-apex radius chosen
by `exists_criticalPairFrontier_of_K4` carries four points.  That field is
required to rule out the robust first-apex double-deletion arm.  By contrast,
the exact-eight second-apex arm itself supplies two distinct full K4 radii and
is therefore impossible as soon as the second opposite cap has size four or
five.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSmallCapFrontierReductionScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier
open ATailFullGeometryProducerScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex1_eq_oppositeVertex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem oppApex2_eq_oppositeVertex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem selectedClass_mono
    {A B : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (hBA : B ⊆ A) :
    SelectedClass B center radius ⊆ SelectedClass A center radius := by
  intro x hx
  rcases mem_selectedClass.mp hx with ⟨hxB, hxdist⟩
  exact mem_selectedClass.mpr ⟨hBA hxB, hxdist⟩

/-- Restoring the dropped `r`-is-a-K4-radius field lets small-cap rigidity
exclude the robust first-apex arm. -/
theorem not_firstApex_double_erase_of_small_opposite_cap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 r).card)
    (hcap : (S.capByIndex S.oppIndex1).card = 4 ∨
      (S.capByIndex S.oppIndex1).card = 5) :
    ¬ HasNEquidistantPointsAt 4
      ((D.A.erase P.q).erase P.w) S.oppApex1 := by
  intro hdouble
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 :=
    oppApex1_eq_oppositeVertex_oppIndex1 S
  have hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = r := by
    intro rho hrho hfourRho
    have hfourRho' : 4 ≤
        (SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex1) rho).card := by
      simpa only [← hcenter] using hfourRho
    have hfour' : 4 ≤
        (SelectedClass D.A
          (S.oppositeVertexByIndex S.oppIndex1) r).card := by
      simpa only [← hcenter] using hfour
    exact oppositeVertex_K4_radius_unique_of_capInterior_card_le_three
      S D.convex S.oppIndex1
      (by
        rcases hcap with hcap | hcap
        · rw [S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four
            S.oppIndex1 hcap]
          omega
        · rw [capInteriorByIndex_card_eq_three_of_cap_card_eq_five
            S S.oppIndex1 hcap])
      hrho hr hfourRho' hfour'
  rcases hdouble with ⟨rho, hrho, hfourDouble⟩
  have hsub : ((D.A.erase P.q).erase P.w) ⊆ D.A := by
    intro x hx
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hx).2).2
  have hfourFull : 4 ≤ (SelectedClass D.A S.oppApex1 rho).card :=
    hfourDouble.trans (Finset.card_le_card (selectedClass_mono hsub))
  have hrhoEq : rho = r := hunique rho hrho hfourFull
  have hqSelected : P.q ∈ SelectedClass D.A S.oppApex1 r := by
    rcases Finset.mem_sdiff.mp P.q_mem_marginal with ⟨hqFilter, _⟩
    rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
    exact mem_selectedClass.mpr ⟨hqA, by simpa only [dist_comm] using hqRadius⟩
  have hwSelected : P.w ∈ SelectedClass D.A S.oppApex1 r := by
    rcases Finset.mem_sdiff.mp P.w_mem_marginal with ⟨hwFilter, _⟩
    rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
    exact mem_selectedClass.mpr ⟨hwA, by simpa only [dist_comm] using hwRadius⟩
  have hwErase :
      P.w ∈ (SelectedClass D.A S.oppApex1 r).erase P.q :=
    Finset.mem_erase.mpr ⟨P.q_ne_w.symm, hwSelected⟩
  have hcapBound : (SelectedClass D.A S.oppApex1 r).card ≤ 5 := by
    rcases hcap with hcap | hcap
    · have hle := oppositeVertex_selectedClass_card_le_four_of_cap_card_eq_four
        S D.convex S.oppIndex1 hcap hr
      have hle' : (SelectedClass D.A S.oppApex1 r).card ≤ 4 := by
        simpa only [← hcenter] using hle
      omega
    · simpa [hcenter] using
        (oppositeVertex_selectedClass_card_le_five_of_cap_card_eq_five
          S D.convex S.oppIndex1 hcap hr)
  subst rho
  change 4 ≤
    (SelectedClass ((D.A.erase P.q).erase P.w) S.oppApex1 r).card at hfourDouble
  rw [selectedClass_erase_eq, selectedClass_erase_eq,
    Finset.card_erase_of_mem hwErase,
    Finset.card_erase_of_mem hqSelected] at hfourDouble
  omega

/-- The exact-eight arm supplies two distinct positive full K4 radii at the
second apex, so it is incompatible with a four- or five-point opposite cap. -/
theorem false_of_secondApex_exact_eight_of_small_opposite_cap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcap : (S.capByIndex S.oppIndex2).card = 4 ∨
      (S.capByIndex S.oppIndex2).card = 5)
    (Cq : CriticalSelectedFourClass D.A P.q S.oppApex2)
    (Cw : CriticalSelectedFourClass D.A P.w S.oppApex2)
    (hCqRadius : Cq.toCriticalFourShell.radius = dist S.oppApex2 P.q)
    (hCwRadius : Cw.toCriticalFourShell.radius = dist S.oppApex2 P.w) :
    False := by
  have hcenter :
      S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 :=
    oppApex2_eq_oppositeVertex_oppIndex2 S
  have hne : Cq.toCriticalFourShell.radius ≠
      Cw.toCriticalFourShell.radius := by
    rw [hCqRadius, hCwRadius]
    exact P.oppApex2_dist_ne
  have hqFour : 4 ≤
      (SelectedClass D.A S.oppApex2 Cq.toCriticalFourShell.radius).card := by
    have hselectedEq :
        SelectedClass D.A S.oppApex2 Cq.toCriticalFourShell.radius =
          Cq.toCriticalFourShell.support := by
      simpa [SelectedClass] using Cq.toCriticalFourShell.support_eq.symm
    rw [hselectedEq, Cq.toCriticalFourShell.support_card]
  have hwFour : 4 ≤
      (SelectedClass D.A S.oppApex2 Cw.toCriticalFourShell.radius).card := by
    have hselectedEq :
        SelectedClass D.A S.oppApex2 Cw.toCriticalFourShell.radius =
          Cw.toCriticalFourShell.support := by
      simpa [SelectedClass] using Cw.toCriticalFourShell.support_eq.symm
    rw [hselectedEq, Cw.toCriticalFourShell.support_card]
  have heq := oppositeVertex_K4_radius_unique_of_capInterior_card_le_three
    S D.convex S.oppIndex2
    (by
      rcases hcap with hcap | hcap
      · rw [S.capInteriorByIndex_card_eq_two_of_cap_card_eq_four
          S.oppIndex2 hcap]
        omega
      · rw [capInteriorByIndex_card_eq_three_of_cap_card_eq_five
          S S.oppIndex2 hcap])
    Cq.toCriticalFourShell.radius_pos Cw.toCriticalFourShell.radius_pos
    (by simpa [hcenter] using hqFour)
    (by simpa [hcenter] using hwFour)
  exact hne heq

/-- Exact matrix row for a small first opposite cap: with the restored K4
field, the production `FirstApexSplit` must take its unique-class arm. -/
theorem firstApexSplit_unique_of_small_opposite_cap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (hr : 0 < r)
    (hfour : 4 ≤ (SelectedClass D.A S.oppApex1 r).card)
    (hcap : (S.capByIndex S.oppIndex1).card = 4 ∨
      (S.capByIndex S.oppIndex1).card = 5) :
    ((SelectedClass D.A S.oppApex1 r).card = 4 ∨
        (SelectedClass D.A S.oppApex1 r).card = 5) ∧
      ∀ rho : ℝ, 0 < rho →
        4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = r := by
  rcases F.firstApexSplit with hdouble | hunique
  · exact False.elim
      (not_firstApex_double_erase_of_small_opposite_cap
        F.pair hr hfour hcap hdouble)
  · exact hunique

/-- Exact matrix row for a small second opposite cap: the production
`SecondApexSplit` must take its double-survival arm. -/
theorem secondApexSplit_survives_of_small_opposite_cap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (hcap : (S.capByIndex S.oppIndex2).card = 4 ∨
      (S.capByIndex S.oppIndex2).card = 5) :
    HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex2 := by
  rcases F.secondApexSplit with hdouble | ⟨Cq, Cw, hqRadius, hwRadius, _⟩
  · exact hdouble
  · exact False.elim
      (false_of_secondApex_exact_eight_of_small_opposite_cap
        F.pair hcap Cq Cw hqRadius hwRadius)

#print axioms not_firstApex_double_erase_of_small_opposite_cap
#print axioms false_of_secondApex_exact_eight_of_small_opposite_cap
#print axioms firstApexSplit_unique_of_small_opposite_cap
#print axioms secondApexSplit_survives_of_small_opposite_cap

end ATailSmallCapFrontierReductionScratch
end Problem97
