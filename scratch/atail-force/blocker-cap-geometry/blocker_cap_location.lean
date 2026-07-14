/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# ATAIL blocker-cap location boundary

This scratch module records the strongest unconditional cap localization of
the actual blocker in the robust card-five branch.  Once the blocker is known
to differ from both opposite Moser apices, it is either the surplus Moser
apex itself or a strict interior point of exactly one of the three caps.

The exact algebraic countermodel in the same directory realizes the
opposite-cap-interior alternative, so this disjunction cannot be narrowed to
the surplus cap from the three-center local packet alone.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerCapGeometryScratch

open ATAILStageOnePrescribedApexDichotomy

attribute [local instance] Classical.propDecidable

/-- A carrier point separated from the two endpoints of the surplus cap is
either its opposite Moser apex or a strict interior point of one cap. -/
theorem surplusApex_or_exists_capInterior_of_ne_oppositeApices
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hxA : x ∈ A)
    (hx1 : x ≠ S.oppApex1)
    (hx2 : x ≠ S.oppApex2) :
    x = S.surplusApex ∨
      ∃ i : Fin 3, x ∈ S.capInteriorByIndex i := by
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hxA with
    hxMoser | hxInterior
  · left
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    simp only [MoserTriangle.verts, Finset.mem_insert,
      Finset.mem_singleton] at hxMoser
    interval_cases i
    · rcases hxMoser with h | h | h
      · simpa [SurplusCapPacket.surplusApex, hi] using h
      · exact False.elim (hx1 (by
          simpa [SurplusCapPacket.oppApex1, hi] using h))
      · exact False.elim (hx2 (by
          simpa [SurplusCapPacket.oppApex2, hi] using h))
    · rcases hxMoser with h | h | h
      · exact False.elim (hx2 (by
          simpa [SurplusCapPacket.oppApex2, hi] using h))
      · simpa [SurplusCapPacket.surplusApex, hi] using h
      · exact False.elim (hx1 (by
          simpa [SurplusCapPacket.oppApex1, hi] using h))
    · rcases hxMoser with h | h | h
      · exact False.elim (hx1 (by
          simpa [SurplusCapPacket.oppApex1, hi] using h))
      · exact False.elim (hx2 (by
          simpa [SurplusCapPacket.oppApex2, hi] using h))
      · simpa [SurplusCapPacket.surplusApex, hi] using h
  · exact Or.inr hxInterior

private theorem blocker_mem_A
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q : ℝ²} (hq : q ∈ A) :
    H.centerAt q hq ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt q hq).toCriticalFourShell.center_mem).2

private theorem blocker_ne_oppApex1_of_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    H.centerAt P.q P.q_mem_A ≠ S.oppApex1 := by
  have hqSelected : P.q ∈ SelectedClass D.A S.oppApex1 r := by
    rcases Finset.mem_sdiff.mp P.q_mem_marginal with ⟨hqFilter, _⟩
    rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
    exact mem_selectedClass.mpr ⟨hqA, by simpa [dist_comm] using hqRadius⟩
  have hfive : 5 ≤ (SelectedClass D.A S.oppApex1 r).card := by
    omega
  have hfourErase :
      4 ≤ (SelectedClass (D.A.erase P.q) S.oppApex1 r).card :=
    selectedClass_erase_card_ge_of_succ_le hfive
  have hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex1 :=
    ⟨r, hr, by simpa [SelectedClass] using hfourErase⟩
  exact actual_blocker_ne_of_deletion_survives H P.q_mem_A hsurvives

/-- Exact blocker-location split for a card-five survivor pair.  The public
packet already separates the blocker from the second apex; card five
separates it from the first apex. -/
theorem card_five_blocker_location
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    H.centerAt P.q P.q_mem_A = S.surplusApex ∨
      ∃ i : Fin 3,
        H.centerAt P.q P.q_mem_A ∈ S.capInteriorByIndex i := by
  exact surplusApex_or_exists_capInterior_of_ne_oppositeApices
    S (blocker_mem_A H P.q_mem_A)
      (blocker_ne_oppApex1_of_card_five P hr hcard)
      P.q_blocker_ne_oppApex2

#print axioms surplusApex_or_exists_capInterior_of_ne_oppositeApices
#print axioms card_five_blocker_location

end ATailBlockerCapGeometryScratch
end Problem97
