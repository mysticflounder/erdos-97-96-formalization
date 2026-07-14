/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# ATAIL robust-survival bridge

This scratch module audits the surviving arm of the rank-1 critical-pair
normal form.  It proves that survival after deleting the opposite source is
exactly avoidance of the chosen critical shell, and records the strongest
single-deletion packet available in the exact card-five first-apex branch.

The cumulative deletion does not preserve the blocker recurrence: it is
formally ruled out by the source's `no_qfree_at` field.  Moreover, deleting
any source of a `CriticalShellSystem` cannot preserve the global K4 property,
so the resulting smaller carrier is not a new `CounterexampleData`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustSurvivalBridgeScratch

open ATAILStageOnePrescribedApexDichotomy

attribute [local instance] Classical.propDecidable

private theorem equidistant_mono
    {n : ℕ} {S T : Finset ℝ²} {p : ℝ²}
    (hsub : S ⊆ T)
    (h : HasNEquidistantPointsAt n S p) :
    HasNEquidistantPointsAt n T p := by
  rcases h with ⟨radius, hradius, hcard⟩
  refine ⟨radius, hradius, le_trans hcard (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzS, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hsub hzS, hzdist⟩

/-- Adding a second deletion cannot restore K4 at the blocker already killed
by deleting its source. -/
theorem cumulative_deletion_blocked_at_source_blocker
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q w : ℝ²} (hq : q ∈ A) :
    ¬ HasNEquidistantPointsAt 4 ((A.erase w).erase q)
      (H.centerAt q hq) := by
  intro hdouble
  apply H.no_qfree_at q hq
  apply equidistant_mono
    (T := A.erase q) (p := H.centerAt q hq) _ hdouble
  intro z hz
  rcases Finset.mem_erase.mp hz with ⟨hzq, hzAw⟩
  exact Finset.mem_erase.mpr ⟨hzq, (Finset.mem_erase.mp hzAw).2⟩

/-- A critical-shell system witnesses that no single source deletion can
retain the global K4 property.  This is the exact obstruction to turning a
rank-1 survival arm into a smaller `CounterexampleData`. -/
theorem source_deletion_not_global_K4
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {w : ℝ²} (hw : w ∈ A) :
    ¬ HasNEquidistantProperty 4 (A.erase w) := by
  intro hglobal
  apply H.no_qfree_at w hw
  exact hglobal (H.centerAt w hw)
    (H.selectedAt w hw).toCriticalFourShell.center_mem

/-- At a source blocker, K4 after deleting a distinct point `w` survives if
and only if `w` avoids the chosen exact critical shell.

The forward implication uses the full exactness of the chosen shell.  Any K4
class surviving deletion of `w` must contain `q`, since otherwise it would
also survive deletion of `q`, contradicting `no_qfree_at`.  Its radius is
therefore the chosen shell radius; if `w` lay on that exact four-shell, only
three points at that radius would remain. -/
theorem cross_deletion_survives_iff_not_mem_selected_support
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q w : ℝ²} (hq : q ∈ A) :
    HasNEquidistantPointsAt 4 (A.erase w) (H.centerAt q hq) ↔
      w ∉ (H.selectedAt q hq).toCriticalFourShell.support := by
  let K := (H.selectedAt q hq).toCriticalFourShell
  constructor
  · rintro ⟨rho, hrho, hfour⟩ hwK
    have hqClass : q ∈ SelectedClass (A.erase w) (H.centerAt q hq) rho := by
      by_contra hqNot
      have hdouble :
          HasNEquidistantPointsAt 4 ((A.erase w).erase q)
            (H.centerAt q hq) := by
        refine ⟨rho, hrho, ?_⟩
        have hsame := selectedClass_erase_card_eq_of_not_mem
          (A := A.erase w) (x := q) (s := H.centerAt q hq)
          (d := rho) hqNot
        simpa [SelectedClass] using hfour.trans_eq hsame.symm
      exact cumulative_deletion_blocked_at_source_blocker H hq hdouble
    have hrho : rho = K.radius := by
      calc
        rho = dist (H.centerAt q hq) q :=
          (mem_selectedClass.mp hqClass).2.symm
        _ = K.radius := K.support_eq_radius q K.q_mem_support
    have hfourK :
        4 ≤ (SelectedClass (A.erase w) (H.centerAt q hq) K.radius).card := by
      simpa [hrho] using hfour
    have hselectedEq :
        SelectedClass A (H.centerAt q hq) K.radius = K.support := by
      simpa [SelectedClass] using K.support_eq.symm
    rw [selectedClass_erase_eq, hselectedEq,
      Finset.card_erase_of_mem hwK, K.support_card] at hfourK
    omega
  · intro hwK
    refine ⟨K.radius, K.radius_pos, ?_⟩
    have hselectedEq :
        SelectedClass A (H.centerAt q hq) K.radius = K.support := by
      simpa [SelectedClass] using K.support_eq.symm
    have hcard :
        (SelectedClass (A.erase w) (H.centerAt q hq) K.radius).card = 4 := by
      rw [selectedClass_erase_eq, hselectedEq,
        Finset.erase_eq_self.mpr hwK, K.support_card]
    have hfour :
        4 ≤ (SelectedClass (A.erase w) (H.centerAt q hq) K.radius).card := by
      omega
    simpa [SelectedClass] using hfour

/-- Survival of the cross deletion forces the two source points onto
different radii about `q`'s blocker. -/
theorem blocker_dist_ne_of_cross_deletion_survives
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A)) :
    dist (H.centerAt P.q P.q_mem_A) P.w ≠
      dist (H.centerAt P.q P.q_mem_A) P.q := by
  have hwNot :
      P.w ∉ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H P.q_mem_A).mp hsurvives
  intro hdist
  apply hwNot
  apply (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.off_row_named_label_forbidden
    P.w_mem_A
  exact hdist.trans
    ((H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support_eq_radius
      P.q
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.q_mem_support)

/-- The surviving K4 row at `q`'s blocker is not a new row.  It is exactly
the original chosen critical shell, now viewed in `A.erase w`, and it is the
unique positive radius carrying four points there. -/
theorem cross_survival_unique_radius_and_exact_support
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q w : ℝ²} (hq : q ∈ A)
    (hsurvives :
      HasNEquidistantPointsAt 4 (A.erase w) (H.centerAt q hq)) :
    SelectedClass (A.erase w) (H.centerAt q hq)
        (H.selectedAt q hq).toCriticalFourShell.radius =
      (H.selectedAt q hq).toCriticalFourShell.support ∧
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass (A.erase w) (H.centerAt q hq) rho).card →
      rho = (H.selectedAt q hq).toCriticalFourShell.radius := by
  let K := (H.selectedAt q hq).toCriticalFourShell
  have hwNot : w ∉ K.support :=
    (cross_deletion_survives_iff_not_mem_selected_support H hq).mp hsurvives
  have hselectedEq :
      SelectedClass A (H.centerAt q hq) K.radius = K.support := by
    simpa [SelectedClass] using K.support_eq.symm
  constructor
  · rw [selectedClass_erase_eq, hselectedEq,
      Finset.erase_eq_self.mpr hwNot]
  · intro rho hrho hfour
    have hqClass : q ∈ SelectedClass (A.erase w) (H.centerAt q hq) rho := by
      by_contra hqNot
      have hdouble :
          HasNEquidistantPointsAt 4 ((A.erase w).erase q)
            (H.centerAt q hq) := by
        refine ⟨rho, hrho, ?_⟩
        have hsame := selectedClass_erase_card_eq_of_not_mem
          (A := A.erase w) (x := q) (s := H.centerAt q hq)
          (d := rho) hqNot
        simpa [SelectedClass] using hfour.trans_eq hsame.symm
      exact cumulative_deletion_blocked_at_source_blocker H hq hdouble
    calc
      rho = dist (H.centerAt q hq) q :=
        (mem_selectedClass.mp hqClass).2.symm
      _ = K.radius := K.support_eq_radius q K.q_mem_support

/-- Exact first-apex four-class left after deleting one member of an ambient
card-five selected class. -/
theorem firstApex_exact_four_after_erasing_w_of_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    (SelectedClass (D.A.erase P.w) S.oppApex1 r).card = 4 := by
  have hwSelected : P.w ∈ SelectedClass D.A S.oppApex1 r := by
    rcases Finset.mem_sdiff.mp P.w_mem_marginal with ⟨hwFilter, _⟩
    rcases Finset.mem_filter.mp hwFilter with ⟨hwA, hwRadius⟩
    exact mem_selectedClass.mpr ⟨hwA, by simpa [dist_comm] using hwRadius⟩
  rw [selectedClass_erase_eq, Finset.card_erase_of_mem hwSelected, hcard]

/-- The maximal honest packet on the smaller carrier `D.A.erase P.w` in the
card-five cross-survival branch.

It retains three local K4 witnesses: an exact four-class at the first apex,
a K4 class at the second apex, and a K4 class at `q`'s blocker.  It also
records the two non-negotiable failures: deleting `q` as well kills the
blocker witness, and the smaller carrier does not have the global K4
property. -/
structure CardFiveCrossSurvivalPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ)
    (H : CriticalShellSystem D.A)
    (P : SurvivorPairRelocationPacket D S r H) : Prop where
  firstApex_exact_four :
    (SelectedClass (D.A.erase P.w) S.oppApex1 r).card = 4
  secondApex_survives :
    HasNEquidistantPointsAt 4 (D.A.erase P.w) S.oppApex2
  qBlocker_survives :
    HasNEquidistantPointsAt 4 (D.A.erase P.w)
      (H.centerAt P.q P.q_mem_A)
  qBlocker_exact_support :
    SelectedClass (D.A.erase P.w) (H.centerAt P.q P.q_mem_A)
        (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.radius =
      (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support
  qBlocker_unique_radius :
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A) rho).card →
      rho = (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.radius
  qBlocker_distinct_radius :
    dist (H.centerAt P.q P.q_mem_A) P.w ≠
      dist (H.centerAt P.q P.q_mem_A) P.q
  qBlocker_cumulative_blocked :
    ¬ HasNEquidistantPointsAt 4 ((D.A.erase P.w).erase P.q)
      (H.centerAt P.q P.q_mem_A)
  ownBlocker_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase P.w)
      (H.centerAt P.w P.w_mem_A)
  carrier_not_global_K4 :
    ¬ HasNEquidistantProperty 4 (D.A.erase P.w)

/-- The rank-1 survival arm supplies the complete local packet above, but no
smaller counterexample carrier. -/
theorem card_five_cross_survival_packet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase P.w)
        (H.centerAt P.q P.q_mem_A)) :
    CardFiveCrossSurvivalPacket D S r H P where
  firstApex_exact_four :=
    firstApex_exact_four_after_erasing_w_of_card_five P hcard
  secondApex_survives := P.w_survives
  qBlocker_survives := hsurvives
  qBlocker_exact_support :=
    (cross_survival_unique_radius_and_exact_support
      H P.q_mem_A hsurvives).1
  qBlocker_unique_radius :=
    (cross_survival_unique_radius_and_exact_support
      H P.q_mem_A hsurvives).2
  qBlocker_distinct_radius :=
    blocker_dist_ne_of_cross_deletion_survives P hsurvives
  qBlocker_cumulative_blocked :=
    cumulative_deletion_blocked_at_source_blocker H P.q_mem_A
  ownBlocker_blocked := H.no_qfree_at P.w P.w_mem_A
  carrier_not_global_K4 := source_deletion_not_global_K4 H P.w_mem_A

/-- Refinement of the production card-five rank-1 normal form.  The surviving
arm is upgraded to the maximal local packet; the other arm is the production
cross-incidence/opposite-side output. -/
theorem card_five_robust_survival_or_cross_oppositeSide
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hr : 0 < r)
    (hcard : (SelectedClass D.A S.oppApex1 r).card = 5) :
    CardFiveCrossSurvivalPacket D S r H P ∨
      (P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support ∧
        signedArea2 P.w S.oppApex1 (H.centerAt P.q P.q_mem_A) *
          signedArea2 P.q S.oppApex1 (H.centerAt P.q P.q_mem_A) < 0) := by
  rcases ATailCriticalPairFrontier.card_five_cross_deletion_survives_or_cross_oppositeSide
      P hr hcard with hsurvives | hcross
  · exact Or.inl (card_five_cross_survival_packet P hcard hsurvives)
  · exact Or.inr hcross

#print axioms cumulative_deletion_blocked_at_source_blocker
#print axioms source_deletion_not_global_K4
#print axioms cross_deletion_survives_iff_not_mem_selected_support
#print axioms blocker_dist_ne_of_cross_deletion_survives
#print axioms cross_survival_unique_radius_and_exact_support
#print axioms firstApex_exact_four_after_erasing_w_of_card_five
#print axioms card_five_cross_survival_packet
#print axioms card_five_robust_survival_or_cross_oppositeSide

end ATailRobustSurvivalBridgeScratch
end Problem97
