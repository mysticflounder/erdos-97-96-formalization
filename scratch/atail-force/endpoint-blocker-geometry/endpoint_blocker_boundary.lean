/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Endpoint-blocker boundary on the live critical-pair surface

This scratch file separates the two possible first-apex cardinalities.

* At cardinality five, both chosen source blockers differ from both endpoints
  of the surplus cap.
* At cardinality four, the first endpoint is a genuine deletion blocker for
  both sources.  Pointwise override can choose it for both sources in one
  valid `CriticalShellSystem`, even in the presence of all ambient geometry.

Thus endpoint equality is eliminated in the card-five arm but cannot be
eliminated uniformly from an arbitrary chosen critical-shell system.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailEndpointBlockerGeometry

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

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

private theorem q_mem_firstApexClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    P.q ∈ SelectedClass D.A S.oppApex1 r := by
  rcases Finset.mem_sdiff.mp P.q_mem_marginal with ⟨hqFilter, _⟩
  rcases Finset.mem_filter.mp hqFilter with ⟨hqA, hqRadius⟩
  exact mem_selectedClass.mpr ⟨hqA, by simpa [dist_comm] using hqRadius⟩

private theorem w_mem_firstApexClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) :
    P.w ∈ SelectedClass D.A S.oppApex1 r := by
  rcases Finset.mem_sdiff.mp P.w_mem_marginal with ⟨hwFilter, _⟩
  rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
  exact mem_selectedClass.mpr ⟨hwA, by simpa [dist_comm] using hwRadius⟩

private theorem blocker_ne_firstApex_of_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A} {source : ℝ²}
    (hsourceA : source ∈ D.A)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    H.centerAt source hsourceA ≠ S.oppApex1 := by
  have hfourErase :
      4 ≤ (SelectedClass (D.A.erase source) S.oppApex1 r).card :=
    selectedClass_erase_card_ge_of_succ_le (by omega)
  have hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex1 :=
    ⟨r, hr, by simpa [SelectedClass] using hfourErase⟩
  exact actual_blocker_ne_of_deletion_survives H hsourceA hsurvives

/-- In the exact card-five branch, neither selected blocker can be either
endpoint of the surplus cap. -/
theorem card_five_blockers_ne_both_surplus_endpoints
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    H.centerAt P.q P.q_mem_A ≠ S.oppApex1 ∧
    H.centerAt P.q P.q_mem_A ≠ S.oppApex2 ∧
    H.centerAt P.w P.w_mem_A ≠ S.oppApex1 ∧
    H.centerAt P.w P.w_mem_A ≠ S.oppApex2 := by
  exact ⟨
    blocker_ne_firstApex_of_card_five P.q_mem_A
      hr hcard,
    P.q_blocker_ne_oppApex2,
    blocker_ne_firstApex_of_card_five P.w_mem_A
      hr hcard,
    P.w_blocker_ne_oppApex2⟩

private theorem firstApex_no_qfree_of_unique_card_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 4)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = r) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase P.q) S.oppApex1 := by
  rintro ⟨rho, hrho, hfour⟩
  have hfourErase :
      4 ≤ (SelectedClass (D.A.erase P.q) S.oppApex1 rho).card := by
    simpa [SelectedClass] using hfour
  have hfourAmbient :
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card := by
    rw [selectedClass_erase_eq] at hfourErase
    exact le_trans hfourErase
      (Finset.card_le_card (Finset.erase_subset _ _))
  have hrho : rho = r := hunique rho hrho hfourAmbient
  subst rho
  have hqClass := q_mem_firstApexClass P
  rw [selectedClass_erase_eq,
    Finset.card_erase_of_mem hqClass, hcard] at hfourErase
  omega

private theorem firstApex_no_wfree_of_unique_card_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 4)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = r) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase P.w) S.oppApex1 := by
  rintro ⟨rho, hrho, hfour⟩
  have hfourErase :
      4 ≤ (SelectedClass (D.A.erase P.w) S.oppApex1 rho).card := by
    simpa [SelectedClass] using hfour
  have hfourAmbient :
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card := by
    rw [selectedClass_erase_eq] at hfourErase
    exact le_trans hfourErase
      (Finset.card_le_card (Finset.erase_subset _ _))
  have hrho : rho = r := hunique rho hrho hfourAmbient
  subst rho
  have hwClass := w_mem_firstApexClass P
  rw [selectedClass_erase_eq,
    Finset.card_erase_of_mem hwClass, hcard] at hfourErase
  omega

/-- Card four makes the first endpoint a certified exact critical blocker for
both selected sources. -/
theorem card_four_first_endpoint_critical_shells
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 4) :
    Nonempty (CriticalSelectedFourClass D.A P.q S.oppApex1) ∧
    Nonempty (CriticalSelectedFourClass D.A P.w S.oppApex1) := by
  exact ⟨
    CriticalSelectedFourClass.exists_of_exactSelectedClass
      (oppApex1_mem_A S) hr hcard (q_mem_firstApexClass P),
    CriticalSelectedFourClass.exists_of_exactSelectedClass
      (oppApex1_mem_A S) hr hcard (w_mem_firstApexClass P)⟩

/-- If the already-chosen `q` blocker lands at the first endpoint in the
card-four branch, its exact selected support is precisely the first-apex
four-class.  In particular it contains the other selected source. -/
theorem card_four_q_endpoint_landing_support_eq_and_cross_hit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 4)
    (hcenter : H.centerAt P.q P.q_mem_A = S.oppApex1) :
    (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support =
        SelectedClass D.A S.oppApex1 r ∧
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support := by
  have hcardAtBlocker :
      (SelectedClass D.A (H.centerAt P.q P.q_mem_A) r).card = 4 := by
    simpa [hcenter] using hcard
  let K : SelectedFourClass D.A (H.centerAt P.q P.q_mem_A) :=
    SelectedFourClass.ofSelectedClass hr hcardAtBlocker
  have hsupport :=
    H.selectedFourClass_support_eq_shell P.q P.q_mem_A K
  change SelectedClass D.A (H.centerAt P.q P.q_mem_A) r =
    (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support at hsupport
  have hsupport' :
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support =
        SelectedClass D.A S.oppApex1 r := by
    simpa [hcenter] using hsupport.symm
  exact ⟨hsupport', hsupport' ▸ w_mem_firstApexClass P⟩

/-- Symmetric normalization for endpoint landing at `w`'s chosen blocker. -/
theorem card_four_w_endpoint_landing_support_eq_and_cross_hit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 4)
    (hcenter : H.centerAt P.w P.w_mem_A = S.oppApex1) :
    (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support =
        SelectedClass D.A S.oppApex1 r ∧
      P.q ∈ (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support := by
  have hcardAtBlocker :
      (SelectedClass D.A (H.centerAt P.w P.w_mem_A) r).card = 4 := by
    simpa [hcenter] using hcard
  let K : SelectedFourClass D.A (H.centerAt P.w P.w_mem_A) :=
    SelectedFourClass.ofSelectedClass hr hcardAtBlocker
  have hsupport :=
    H.selectedFourClass_support_eq_shell P.w P.w_mem_A K
  change SelectedClass D.A (H.centerAt P.w P.w_mem_A) r =
    (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support at hsupport
  have hsupport' :
      (H.selectedAt P.w P.w_mem_A).toCriticalFourShell.support =
        SelectedClass D.A S.oppApex1 r := by
    simpa [hcenter] using hsupport.symm
  exact ⟨hsupport', hsupport' ▸ q_mem_firstApexClass P⟩

/-- Selector-dependence is genuine in the card-four branch: starting from any
valid system, pointwise override constructs another valid system which sends
both selected sources to the first surplus-cap endpoint.  The full ambient
MEC, convexity, and K4 data are already present in `D` and `S`; `hNoM44` does
not affect this choice operation. -/
theorem exists_card_four_system_with_both_blockers_at_first_endpoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    (H0 : CriticalShellSystem D.A)
    (P : SurvivorPairRelocationPacket D S r H0)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 4)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = r)
    (_hNoM44 : ¬ (∃ T : SurplusCapPacket D.A, T.IsM44)) :
    ∃ H1 : CriticalShellSystem D.A,
      H1.centerAt P.q P.q_mem_A = S.oppApex1 ∧
      H1.centerAt P.w P.w_mem_A = S.oppApex1 := by
  rcases card_four_first_endpoint_critical_shells P hr hcard with
    ⟨⟨Cq⟩, ⟨Cw⟩⟩
  have hqBlocked :=
    firstApex_no_qfree_of_unique_card_four P hcard hunique
  have hwBlocked :=
    firstApex_no_wfree_of_unique_card_four P hcard hunique
  let Hq := H0.overrideAt Cq hqBlocked
  let H1 := Hq.overrideAt Cw hwBlocked
  refine ⟨H1, ?_, ?_⟩
  · calc
      H1.centerAt P.q P.q_mem_A = Hq.centerAt P.q P.q_mem_A := by
        exact Hq.overrideAt_centerAt_of_ne Cw hwBlocked
          P.q_mem_A P.q_ne_w
      _ = S.oppApex1 := H0.overrideAt_centerAt Cq hqBlocked P.q_mem_A
  · exact Hq.overrideAt_centerAt Cw hwBlocked P.w_mem_A

/-- The resulting first-endpoint choice remains distinct from the other
surplus-cap endpoint. -/
theorem card_four_first_endpoint_choice_respects_second_endpoint_separation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    (H0 : CriticalShellSystem D.A)
    (P : SurvivorPairRelocationPacket D S r H0)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 4)
    (hunique : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = r)
    (hNoM44 : ¬ (∃ T : SurplusCapPacket D.A, T.IsM44)) :
    ∃ H1 : CriticalShellSystem D.A,
      H1.centerAt P.q P.q_mem_A = S.oppApex1 ∧
      H1.centerAt P.w P.w_mem_A = S.oppApex1 ∧
      H1.centerAt P.q P.q_mem_A ≠ S.oppApex2 ∧
      H1.centerAt P.w P.w_mem_A ≠ S.oppApex2 := by
  rcases exists_card_four_system_with_both_blockers_at_first_endpoint
      H0 P hr hcard hunique hNoM44 with ⟨H1, hq, hw⟩
  exact ⟨H1, hq, hw, hq ▸ oppApex1_ne_oppApex2 S,
    hw ▸ oppApex1_ne_oppApex2 S⟩

#print axioms card_five_blockers_ne_both_surplus_endpoints
#print axioms card_four_first_endpoint_critical_shells
#print axioms card_four_q_endpoint_landing_support_eq_and_cross_hit
#print axioms card_four_w_endpoint_landing_support_eq_and_cross_hit
#print axioms exists_card_four_system_with_both_blockers_at_first_endpoint
#print axioms card_four_first_endpoint_choice_respects_second_endpoint_separation

end ATailEndpointBlockerGeometry
end Problem97
