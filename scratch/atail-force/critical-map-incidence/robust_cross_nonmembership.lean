/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# ATAIL robust cross-nonmembership consequences

This scratch module records the exact generic consequences of the robust
critical-map branch for a relocated survivor pair.  At the chosen blocker for
`q`, deleting `w` preserves K4 exactly when the chosen exact shell omits `w`.
Reciprocal omission forces distinct blocker centers, after which the ordinary
two-circle theorem bounds the two selected-shell overlap by two.

These facts do not produce a positive cross-incidence or a shared pair.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCriticalMapIncidence

open ATAILStageOnePrescribedApexDichotomy

attribute [local instance] Classical.propDecidable

/-- At the blocker chosen for source `q`, deletion of `w` preserves K4 if
and only if the exact selected shell sourced at `q` omits `w`. -/
theorem cross_deletion_survives_iff_cross_nonmembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A) ↔
      P.w ∉
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support := by
  constructor
  · rintro ⟨rho, hrho, hcard⟩ hwShell
    let C := (H.selectedAt P.q P.q_mem_A).toCriticalFourShell
    have hcardSelected :
        4 ≤ (SelectedClass (D.A.erase P.w)
          (H.centerAt P.q P.q_mem_A) rho).card := by
      simpa [SelectedClass] using hcard
    have hcardFull :
        4 ≤ (SelectedClass D.A (H.centerAt P.q P.q_mem_A) rho).card := by
      refine le_trans hcardSelected (Finset.card_le_card ?_)
      intro z hz
      rcases mem_selectedClass.mp hz with ⟨hzErase, hzDist⟩
      exact mem_selectedClass.mpr
        ⟨(Finset.mem_erase.mp hzErase).2, hzDist⟩
    have hqFull :
        P.q ∈ SelectedClass D.A (H.centerAt P.q P.q_mem_A) rho := by
      by_contra hqNot
      apply H.no_qfree_at P.q P.q_mem_A
      refine ⟨rho, hrho, ?_⟩
      have hcardEraseQ :
          4 ≤ (SelectedClass (D.A.erase P.q)
            (H.centerAt P.q P.q_mem_A) rho).card := by
        rw [selectedClass_erase_card_eq_of_not_mem hqNot]
        exact hcardFull
      simpa [SelectedClass] using hcardEraseQ
    have hrhoC : rho = C.radius := by
      calc
        rho = dist (H.centerAt P.q P.q_mem_A) P.q :=
          (mem_selectedClass.mp hqFull).2.symm
        _ = C.radius := C.support_eq_radius P.q C.q_mem_support
    have hwFull :
        P.w ∈ SelectedClass D.A (H.centerAt P.q P.q_mem_A) rho := by
      rw [hrhoC]
      simpa only [SelectedClass, ← C.support_eq] using hwShell
    have hfullCard :
        (SelectedClass D.A (H.centerAt P.q P.q_mem_A) rho).card = 4 := by
      rw [hrhoC]
      simpa only [SelectedClass, ← C.support_eq] using C.support_card
    have herasedCard :
        (SelectedClass (D.A.erase P.w)
          (H.centerAt P.q P.q_mem_A) rho).card = 3 := by
      rw [selectedClass_erase_eq, Finset.card_erase_of_mem hwFull,
        hfullCard]
    omega
  · intro hwOutside
    let C := (H.selectedAt P.q P.q_mem_A).toCriticalFourShell
    refine ⟨C.radius, C.radius_pos, ?_⟩
    have hsubset :
        C.support ⊆
          (D.A.erase P.w).filter
            (fun z => dist (H.centerAt P.q P.q_mem_A) z = C.radius) := by
      intro z hz
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr
            ⟨fun hzw => hwOutside (by simpa [hzw] using hz),
              C.support_subset_A hz⟩,
          C.support_eq_radius z hz⟩
    calc
      4 = C.support.card := C.support_card.symm
      _ ≤ ((D.A.erase P.w).filter
          (fun z => dist (H.centerAt P.q P.q_mem_A) z = C.radius)).card :=
        Finset.card_le_card hsubset

/-- Reciprocal cross omission prevents the two chosen blocker centers from
coinciding.  If they coincided, the exact shell sourced at `w` would survive
deleting `q`, contradicting criticality at the blocker chosen for `q`. -/
theorem blocker_centers_ne_of_cross_nonmembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hqOutside :
      P.q ∉
        (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support) :
    H.centerAt P.q P.q_mem_A ≠ H.centerAt P.w P.w_mem_A := by
  intro hcenters
  let Cw := (H.selectedAt P.w P.w_mem_A).toCriticalFourShell
  apply H.no_qfree_at P.q P.q_mem_A
  refine ⟨Cw.radius, Cw.radius_pos, ?_⟩
  have hsubset :
      Cw.support ⊆
        (D.A.erase P.q).filter
          (fun z => dist (H.centerAt P.q P.q_mem_A) z = Cw.radius) := by
    intro z hz
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_erase.mpr
          ⟨fun hzq => hqOutside (by simpa [hzq] using hz),
            Cw.support_subset_A hz⟩,
        by
          rw [hcenters]
          exact Cw.support_eq_radius z hz⟩
  calc
    4 = Cw.support.card := Cw.support_card.symm
    _ ≤ ((D.A.erase P.q).filter
        (fun z => dist (H.centerAt P.q P.q_mem_A) z = Cw.radius)).card :=
      Finset.card_le_card hsubset

/-- Reciprocal cross omission leaves at most a two-point overlap between the
two exact selected shells.  In particular it yields an upper bound, not the
positive shared-pair incidence needed by the banked separation consumers. -/
theorem selected_support_inter_card_le_two_of_reciprocal_cross_nonmembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcross :
      P.w ∉
          (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∧
        P.q ∉
          (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support) :
    (((H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∩
      (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support).card ≤ 2) := by
  exact SelectedFourClass.inter_card_le_two
    (H.selectedAt P.q P.q_mem_A).toSelectedFourClass
    (H.selectedAt P.w P.w_mem_A).toSelectedFourClass
    (blocker_centers_ne_of_cross_nonmembership P hcross.2)

end ATailCriticalMapIncidence
end Problem97

#print axioms
  Problem97.ATailCriticalMapIncidence.cross_deletion_survives_iff_cross_nonmembership
#print axioms
  Problem97.ATailCriticalMapIncidence.blocker_centers_ne_of_cross_nonmembership
#print axioms
  Problem97.ATailCriticalMapIncidence.selected_support_inter_card_le_two_of_reciprocal_cross_nonmembership
